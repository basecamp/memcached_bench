# Memcached Client Benchmarking

## What clients?

- [memcache-client](https://github.com/mperham/memcache-client)
- [memcached](https://github.com/evan/memcached)
- [dalli](https://github.com/mperham/dalli)
- mem_cache_store
- [memcached_store](https://github.com/Shopify/memcached_store)
- dalli_store

## How?
Download and Bundle
```
git clone git@github.com:basecamp/memcached_bench.git && cd memcached_bench
bundle install
```
Start local memcached instance:
```
memcached -vv -m 64
```
Run benchmarks:
```
./memcached_bench
```

## Example Results
<!-- results_table -->
```
================== mem_cache ==================
                                                                                  user     system      total        real
mem_cache:set                                                                 0.690000   0.560000   1.250000 (  1.566902)
mem_cache:set:plain                                                           1.170000   0.890000   2.060000 (  2.518609)
mem_cache:get                                                                 0.860000   0.540000   1.400000 (  1.605586)
mem_cache:get:plain                                                           1.660000   0.990000   2.650000 (  3.035554)
mem_cache:multiget                                                            0.760000   0.190000   0.950000 (  1.033933)
mem_cache:missing                                                             1.030000   0.890000   1.920000 (  2.300002)
mem_cache:mixed                                                               3.160000   2.230000   5.390000 (  6.328147)

================== memcached ==================
                                                                                  user     system      total        real
memcached:set                                                                 0.210000   0.500000   0.710000 (  1.080529)
memcached:set:plain                                                           0.420000   1.050000   1.470000 (  2.210615)
memcached:get                                                                 0.150000   0.480000   0.630000 (  0.933164)
memcached:get:plain                                                           0.350000   0.940000   1.290000 (  1.923732)
memcached:multiget                                                            0.220000   0.110000   0.330000 (  0.431736)
memcached:missing                                                             0.410000   1.050000   1.460000 (  2.104200)
memcached:mixed                                                               0.730000   1.760000   2.490000 (  3.751664)

================== memcached_disable_binary ==================
                                                                                  user     system      total        real
memcached_disable_binary:set                                                  0.160000   0.500000   0.660000 (  1.062788)
memcached_disable_binary:set:plain                                            0.330000   0.830000   1.160000 (  1.755439)
memcached_disable_binary:get                                                  0.190000   0.380000   0.570000 (  0.815461)
memcached_disable_binary:get:plain                                            0.400000   0.760000   1.160000 (  1.637381)
memcached_disable_binary:multiget                                             0.160000   0.150000   0.310000 (  0.398592)
memcached_disable_binary:missing                                              0.370000   0.810000   1.180000 (  1.652973)
memcached_disable_binary:mixed                                                0.710000   1.770000   2.480000 (  3.695247)

================== memcached_rails ==================
                                                                                  user     system      total        real
memcached_rails:set                                                           0.160000   0.440000   0.600000 (  0.879200)
memcached_rails:set:plain                                                     0.240000   0.840000   1.080000 (  1.698515)
memcached_rails:get                                                           0.230000   0.380000   0.610000 (  0.876225)
memcached_rails:get:plain                                                     0.260000   0.830000   1.090000 (  1.600114)
memcached_rails:multiget                                                      0.180000   0.130000   0.310000 (  0.412759)
memcached_rails:missing                                                       0.500000   0.750000   1.250000 (  1.774416)
memcached_rails:mixed                                                         0.730000   1.690000   2.420000 (  3.606503)

================== memcached_rails_disable_binary ==================
                                                                                  user     system      total        real
memcached_rails_disable_binary:set                                            0.180000   0.430000   0.610000 (  0.957584)
memcached_rails_disable_binary:set:plain                                      0.200000   0.820000   1.020000 (  1.589274)
memcached_rails_disable_binary:get                                            0.150000   0.440000   0.590000 (  0.840608)
memcached_rails_disable_binary:get:plain                                      0.260000   0.790000   1.050000 (  1.546953)
memcached_rails_disable_binary:multiget                                       0.170000   0.160000   0.330000 (  0.437723)
memcached_rails_disable_binary:missing                                        0.360000   0.900000   1.260000 (  1.803954)
memcached_rails_disable_binary:mixed                                          0.780000   1.890000   2.670000 (  3.961260)

================== dalli ==================
                                                                                  user     system      total        real
dalli:set                                                                     0.810000   0.470000   1.280000 (  1.513184)
dalli:set:plain                                                               1.480000   0.870000   2.350000 (  2.825754)
dalli:get                                                                     0.570000   0.490000   1.060000 (  1.260931)
dalli:get:plain                                                               1.260000   1.020000   2.280000 (  2.741987)
dalli:multiget                                                                0.810000   0.190000   1.000000 (  1.024101)
dalli:missing                                                                 1.010000   1.150000   2.160000 (  2.686668)
dalli:mixed                                                                   3.170000   2.180000   5.350000 (  6.438044)
================== mem_cache_store ==================
                                                                                  user     system      total        real
mem_cache_store:mixed                                                         5.120000   1.840000   6.960000 (  7.721013)
mem_cache_store:mixed:rails-localcache                                        4.580000   1.420000   6.000000 (  6.620695)
mem_cache_store:set                                                           1.650000   0.520000   2.170000 (  2.415938)
mem_cache_store:set:rails-localcache                                          1.650000   0.530000   2.180000 (  2.433452)
mem_cache_store:get                                                           1.650000   0.560000   2.210000 (  2.434524)
mem_cache_store:get:rails-localcache                                          1.750000   0.610000   2.360000 (  2.545674)
mem_cache_store:big_read_multi                                                7.480000   2.460000   9.940000 ( 10.488975)
mem_cache_store:big_read_multi:rails-localcache                               6.320000   1.680000   8.000000 (  8.341611)
================== memcached_store ==================
                                                                                  user     system      total        real
memcached_store:mixed                                                         2.670000   1.830000   4.500000 (  5.612633)
memcached_store:mixed:rails-localcache                                        2.700000   1.550000   4.250000 (  5.318062)
memcached_store:set                                                           0.690000   0.700000   1.390000 (  1.800386)
memcached_store:set:rails-localcache                                          0.830000   0.620000   1.450000 (  1.902786)
memcached_store:get                                                           0.670000   0.610000   1.280000 (  1.672157)
memcached_store:get:rails-localcache                                          0.780000   0.610000   1.390000 (  1.799348)
memcached_store:big_read_multi                                                3.370000   2.030000   5.400000 (  6.646846)
memcached_store:big_read_multi:rails-localcache                               2.820000   1.120000   3.940000 (  4.478452)
================== memcached_store_disable_binary ==================
                                                                                  user     system      total        real
memcached_store_disable_binary:mixed                                          2.650000   1.710000   4.360000 (  5.377096)
memcached_store_disable_binary:mixed:rails-localcache                         2.700000   1.290000   3.990000 (  4.723915)
memcached_store_disable_binary:set                                            0.830000   0.490000   1.320000 (  1.618545)
memcached_store_disable_binary:set:rails-localcache                           0.860000   0.550000   1.410000 (  1.714713)
memcached_store_disable_binary:get                                            0.660000   0.500000   1.160000 (  1.402798)
memcached_store_disable_binary:get:rails-localcache                           0.740000   0.550000   1.290000 (  1.564280)
memcached_store_disable_binary:big_read_multi                                 3.360000   1.840000   5.200000 (  6.107043)
memcached_store_disable_binary:big_read_multi:rails-localcache                2.970000   1.060000   4.030000 (  4.587783)
================== dalli_store ==================
                                                                                  user     system      total        real
dalli_store:mixed                                                             4.120000   1.490000   5.610000 (  6.195297)
dalli_store:mixed:rails-localcache                                            4.180000   1.400000   5.580000 (  6.239185)
dalli_store:set                                                               1.180000   0.610000   1.790000 (  2.066554)
dalli_store:set:rails-localcache                                              1.380000   0.470000   1.850000 (  2.025899)
dalli_store:get                                                               1.180000   0.570000   1.750000 (  2.006289)
dalli_store:get:rails-localcache                                              1.300000   0.600000   1.900000 (  2.162146)
dalli_store:big_read_multi                                                    5.800000   2.430000   8.230000 (  8.942591)
dalli_store:big_read_multi:rails-localcache                                   2.090000   0.400000   2.490000 (  2.580207)
```
<!-- result_table_end -->

Test Server:

- Ubuntu 16.04.2 LTS, Intel(R) Xeon(R) CPU @ 2.50GHz, 30GB 1600 MHz DDR3.
- Rails 5.0.2 on ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]

## Inspiration
Much of this test suite is based off of https://github.com/mperham/dalli/blob/master/test/benchmark_test.rb
