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
mem_cache:set                                                                 1.160000   0.280000   1.440000 (  1.463249)
mem_cache:set:plain                                                           2.140000   0.580000   2.720000 (  2.780642)
mem_cache:get                                                                 1.410000   0.320000   1.730000 (  1.756619)
mem_cache:get:plain                                                           2.770000   0.620000   3.390000 (  3.451330)
mem_cache:multiget                                                            1.060000   0.090000   1.150000 (  1.164813)
mem_cache:missing                                                             1.930000   0.540000   2.470000 (  2.512572)
mem_cache:mixed                                                               5.140000   1.180000   6.320000 (  6.421799)

================== memcached ==================
                                                                                  user     system      total        real
memcached:set                                                                 0.220000   0.220000   0.440000 (  0.702720)
memcached:set:plain                                                           0.480000   0.430000   0.910000 (  1.408405)
memcached:get                                                                 0.250000   0.190000   0.440000 (  0.660413)
memcached:get:plain                                                           0.430000   0.450000   0.880000 (  1.279175)
memcached:multiget                                                            0.230000   0.060000   0.290000 (  0.365968)
memcached:missing                                                             0.460000   0.520000   0.980000 (  1.420940)
memcached:mixed                                                               0.960000   0.790000   1.750000 (  2.668685)

================== memcached_disable_binary ==================
                                                                                  user     system      total        real
memcached_disable_binary:set                                                  0.280000   0.170000   0.450000 (  0.707164)
memcached_disable_binary:set:plain                                            0.420000   0.480000   0.900000 (  1.414783)
memcached_disable_binary:get                                                  0.240000   0.210000   0.450000 (  0.667521)
memcached_disable_binary:get:plain                                            0.480000   0.430000   0.910000 (  1.316484)
memcached_disable_binary:multiget                                             0.200000   0.080000   0.280000 (  0.354720)
memcached_disable_binary:missing                                              0.550000   0.390000   0.940000 (  1.323871)
memcached_disable_binary:mixed                                                0.860000   0.870000   1.730000 (  2.662431)

================== memcached_rails ==================
                                                                                  user     system      total        real
memcached_rails:set                                                           0.260000   0.200000   0.460000 (  0.716207)
memcached_rails:set:plain                                                     0.310000   0.520000   0.830000 (  1.693508)
memcached_rails:get                                                           0.260000   0.320000   0.580000 (  1.032739)
memcached_rails:get:plain                                                     0.470000   0.580000   1.050000 (  1.776318)
memcached_rails:multiget                                                      0.220000   0.080000   0.300000 (  0.414793)
memcached_rails:missing                                                       0.600000   0.490000   1.090000 (  1.619777)
memcached_rails:mixed                                                         0.880000   0.920000   1.800000 (  2.747018)

================== memcached_rails_disable_binary ==================
                                                                                  user     system      total        real
memcached_rails_disable_binary:set                                            0.260000   0.210000   0.470000 (  0.744760)
memcached_rails_disable_binary:set:plain                                      0.350000   0.400000   0.750000 (  1.264912)
memcached_rails_disable_binary:get                                            0.230000   0.210000   0.440000 (  0.638570)
memcached_rails_disable_binary:get:plain                                      0.340000   0.400000   0.740000 (  1.140283)
memcached_rails_disable_binary:multiget                                       0.190000   0.120000   0.310000 (  0.394131)
memcached_rails_disable_binary:missing                                        0.520000   0.440000   0.960000 (  1.344471)
memcached_rails_disable_binary:mixed                                          0.870000   0.920000   1.790000 (  2.746256)

================== dalli ==================
                                                                                  user     system      total        real
dalli:set                                                                     0.880000   0.280000   1.160000 (  1.263827)
dalli:set:plain                                                               1.530000   0.570000   2.100000 (  2.338174)
dalli:get                                                                     0.790000   0.250000   1.040000 (  1.136878)
dalli:get:plain                                                               1.510000   0.610000   2.120000 (  2.292976)
dalli:multiget                                                                0.900000   0.220000   1.120000 (  1.134238)
dalli:missing                                                                 1.350000   0.470000   1.820000 (  1.998903)
dalli:mixed                                                                   3.380000   1.150000   4.530000 (  4.964549)

================== mem_cache_store ==================
                                                                                  user     system      total        real
mem_cache_store:mixed                                                         4.990000   0.870000   5.860000 (  6.142565)
mem_cache_store:mixed:rails-localcache                                        4.350000   0.800000   5.150000 (  5.450127)
mem_cache_store:set                                                           1.510000   0.310000   1.820000 (  1.947190)
mem_cache_store:set:rails-localcache                                          1.660000   0.290000   1.950000 (  2.133841)
mem_cache_store:get                                                           1.670000   0.260000   1.930000 (  1.997019)
mem_cache_store:get:rails-localcache                                          1.720000   0.290000   2.010000 (  2.095898)
mem_cache_store:big_read_multi                                                7.780000   1.530000   9.310000 ( 10.110451)
mem_cache_store:big_read_multi:rails-localcache                               7.070000   1.000000   8.070000 (  8.840837)

================== memcached_store ==================
                                                                                  user     system      total        real
memcached_store:mixed                                                         2.780000   0.980000   3.760000 (  4.551252)
memcached_store:mixed:rails-localcache                                        2.860000   0.700000   3.560000 (  4.187399)
memcached_store:set                                                           0.930000   0.280000   1.210000 (  1.503208)
memcached_store:set:rails-localcache                                          0.990000   0.270000   1.260000 (  1.530528)
memcached_store:get                                                           0.800000   0.290000   1.090000 (  1.297880)
memcached_store:get:rails-localcache                                          0.910000   0.290000   1.200000 (  1.434191)
memcached_store:big_read_multi                                                3.560000   1.200000   4.760000 (  5.485074)
memcached_store:big_read_multi:rails-localcache                               2.940000   0.870000   3.810000 (  4.297155)

================== memcached_store_disable_binary ==================
                                                                                  user     system      total        real
memcached_store_disable_binary:mixed                                          2.940000   0.970000   3.910000 (  4.689338)
memcached_store_disable_binary:mixed:rails-localcache                         2.940000   0.720000   3.660000 (  4.294590)
memcached_store_disable_binary:set                                            0.980000   0.270000   1.250000 (  1.535586)
memcached_store_disable_binary:set:rails-localcache                           1.060000   0.300000   1.360000 (  1.666404)
memcached_store_disable_binary:get                                            0.900000   0.240000   1.140000 (  1.351099)
memcached_store_disable_binary:get:rails-localcache                           1.000000   0.250000   1.250000 (  1.466146)
memcached_store_disable_binary:big_read_multi                                 3.720000   1.160000   4.880000 (  5.612295)
memcached_store_disable_binary:big_read_multi:rails-localcache                3.130000   0.930000   4.060000 (  4.845301)

================== dalli_store ==================
                                                                                  user     system      total        real
dalli_store:mixed                                                             4.970000   1.080000   6.050000 (  7.068584)
dalli_store:mixed:rails-localcache                                            4.080000   0.890000   4.970000 (  5.288698)
dalli_store:set                                                               1.340000   0.310000   1.650000 (  1.767724)
dalli_store:set:rails-localcache                                              1.380000   0.330000   1.710000 (  1.820832)
dalli_store:get                                                               1.240000   0.300000   1.540000 (  1.619246)
dalli_store:get:rails-localcache                                              1.370000   0.260000   1.630000 (  1.691986)
dalli_store:big_read_multi                                                    6.100000   1.470000   7.570000 (  7.936526)
dalli_store:big_read_multi:rails-localcache                                   2.780000   0.250000   3.030000 (  3.110808)
```
<!-- result_table_end -->

Test Server:

- Ubuntu 12.04.4 LTS, Intel(R) Xeon(R) CPU E3-1270 V2 @ 3.50GHz, 32GB 1600 MHz DDR3.
- Rails 4.2.0 on ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-linux]

## Inspiration
Much of this test suite is based off of https://github.com/mperham/dalli/blob/master/test/benchmark_test.rb
