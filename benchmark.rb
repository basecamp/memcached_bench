require 'benchmark'
require 'rubygems'
require 'memcache'
require 'memcached'
require 'dalli'
require 'rails'
require 'active_support/cache/dalli_store'
require 'active_support/cache/memcached_store'

servers = ['localhost:11211']
iterations = 10_000
ruby_clients = { 
  memcache_client: MemCache.new(servers), 
  memcached: Memcached.new(servers),
  memcached_disable_binary: Memcached.new(servers, binary_protocol: false),
  memcached_rails: Memcached::Rails.new(servers),
  memcached_rails_disable_binary: Memcached::Rails.new(servers, binary_protocol: false),
  dalli: Dalli::Client.new(servers)
}

rails_clients = {
  memcached_store: ActiveSupport::Cache::MemcachedStore.new(servers),
  mem_cache_store: ActiveSupport::Cache::MemCacheStore.new(servers),
  mem_cache_store_disable_binary: ActiveSupport::Cache::MemCacheStore.new(servers, binary_protocol: false),
  dalli_store: ActiveSupport::Cache::DalliStore.new(servers)
}

puts "Testing with Rails #{Rails.version} on #{RUBY_DESCRIPTION}"

@key1 = "Short"
@key2 = "Sym1-2-3::45"*8
@key3 = "Long"*40
@key4 = "Medium"*8
# 5 and 6 are only used for multiget miss test
@key5 = "Medium2"*8
@key6 = "Long3"*40
@counter = 'counter'

@value = []
@marshalled = Marshal.dump(@value)

ruby_clients.each do |name, client|
  puts "\n================== " + name.to_s + " =================="
  
  Benchmark.bm(75) {|bm|
    bm.report("#{name}:set") {
      iterations.times { 
        client.set @key1, @value
        client.set @key2, @value
        client.set @key3, @value
      }
    }
    bm.report("#{name}:set:plain") {
      keys = [@key1, @key2, @key3, @key1, @key2, @key3]
      iterations.times { 
        client.set @key1, @marshalled, 0, :raw => true
        client.set @key2, @marshalled, 0, :raw => true
        client.set @key3, @marshalled, 0, :raw => true
        client.set @key1, @marshalled, 0, :raw => true
        client.set @key2, @marshalled, 0, :raw => true
        client.set @key3, @marshalled, 0, :raw => true
      }
    }
    bm.report("#{name}:get") {
      iterations.times { 
        client.get @key1
        client.get @key2
        client.get @key3
      }
    }
    bm.report("#{name}:get:plain") {
      iterations.times { 
        client.get @key1, :raw => true
        client.get @key2, :raw => true
        client.get @key3, :raw => true
        client.get @key1, :raw => true
        client.get @key2, :raw => true
        client.get @key3, :raw => true
      }
    }
    bm.report("#{name}:multiget") {
      keys = [@key1, @key2, @key3, @key4, @key5, @key6]
      if name.to_s == "memcached" || name.to_s == "memcached_disable_binary"
        iterations.times {
          client.get keys
        }
      else
        iterations.times {
          client.get_multi keys
        }
      end
    }
    bm.report("#{name}:missing") {
      iterations.times { 
        begin client.delete @key1; rescue; end
        begin client.get @key1; rescue; end
        begin client.delete @key2; rescue; end
        begin client.get @key2; rescue; end
        begin client.delete @key3; rescue; end
        begin client.get @key3; rescue; end
      }
    }
    bm.report("#{name}:mixed") {
      iterations.times { 
        client.set @key1, @value
        client.set @key2, @value
        client.set @key3, @value
        client.get @key1
        client.get @key2
        client.get @key3
        client.set @key1, @value
        client.get @key1
        client.set @key2, @value
        client.get @key2
        client.set @key3, @value
        client.get @key3
      }
    }
  }
end

rails_clients.each do |name, client|
  puts "\n================== " + name.to_s + " =================="
  sizeable_data = "<marquee>some view partial data</marquee>" * 50
  [@key1, @key2, @key3, @key4, @key5, @key6].each do |key|
    client.write("#{key}_#{name}_long", sizeable_data)
  end
  
  Benchmark.bm(75) {|bm|
    bm.report("#{name}:mixed") {
      iterations.times { 
        client.read @key1
        client.write @key2, @value
        client.fetch(@key3) { @value }
        client.fetch(@key2) { @value }
        client.fetch(@key1) { @value }
        client.write @key2, @value, :unless_exists => true
        client.delete @key2
        client.increment @counter, 1, :initial => 100
        client.increment @counter, 1, :expires_in => 12
        client.decrement @counter, 1
      }
    }
    bm.report("#{name}:mixed:rails-localcache") {
      iterations.times { 
        client.with_local_cache do
          client.read @key1
          client.write @key2, @value
          client.fetch(@key3) { @value }
          client.fetch(@key2) { @value }
          client.fetch(@key1) { @value }
          client.write @key2, @value, :unless_exists => true
          client.delete @key2
          client.increment @counter, 1, :initial => 100
          client.increment @counter, 1, :expires_in => 12
          client.decrement @counter, 1
        end
      }
    }
    bm.report("#{name}:set") {
      iterations.times { 
        client.write @key1, @value
        client.write @key2, @value
        client.write @key3, @value
      }
    }
    bm.report("#{name}:set:rails-localcache") {
      iterations.times { 
        client.with_local_cache do
          client.write @key1, @value
          client.write @key2, @value
          client.write @key3, @value
        end
      }
    }
    bm.report("#{name}:get") {
      iterations.times { 
        client.fetch @key1
        client.fetch @key2
        client.fetch @key3
      }
    }
    bm.report("#{name}:get:rails-localcache") {
      iterations.times {
        client.with_local_cache do
          client.fetch @key1
          client.fetch @key2
          client.fetch @key3
        end
      }
    }
    bm.report("#{name}:big_read_multi") {
      iterations.times { 
        client.read_multi "#{@key1}_#{name}_long", "#{@key2}_#{name}_long", "#{@key3}_#{name}_long", "#{@key4}_#{name}_long"
        client.read "#{@key1}_#{name}_long"
        client.read "#{@key2}_#{name}_long"
        client.read "#{@key3}_#{name}_long"
        client.read "#{@key4}_#{name}_long"
        client.read "#{@key1}_#{name}_long"
        client.read "#{@key2}_#{name}_long"
        client.read "#{@key3}_#{name}_long"
        client.read_multi "#{@key1}_#{name}_long", "#{@key2}_#{name}_long", "#{@key3}_#{name}_long"
      }
    }
    bm.report("#{name}:big_read_multi:rails-localcache") {
      iterations.times {
        client.with_local_cache do
          client.read_multi "#{@key1}_#{name}_long", "#{@key2}_#{name}_long", "#{@key3}_#{name}_long", "#{@key4}_#{name}_long"
          client.read "#{@key1}_#{name}_long"
          client.read "#{@key2}_#{name}_long"
          client.read "#{@key3}_#{name}_long"
          client.read "#{@key4}_#{name}_long"
          client.read "#{@key1}_#{name}_long"
          client.read "#{@key2}_#{name}_long"
          client.read "#{@key3}_#{name}_long"
          client.read_multi "#{@key1}_#{name}_long", "#{@key2}_#{name}_long", "#{@key3}_#{name}_long"
        end
      }
    }
  }
end