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
mem_cache:set                                                                10.980000   2.870000  13.850000 ( 14.132883)
mem_cache:set:plain                                                          21.400000   5.540000  26.940000 ( 27.874981)
mem_cache:get                                                                14.750000   3.140000  17.890000 ( 18.560097)
mem_cache:get:plain                                                          27.990000   5.590000  33.580000 ( 34.132347)
mem_cache:multiget                                                           10.920000   1.210000  12.130000 ( 12.966398)
mem_cache:missing                                                            19.210000   5.100000  24.310000 ( 24.732993)
mem_cache:mixed                                                              51.500000  11.990000  63.490000 ( 67.428857)

================== memcached ==================
                                                                                  user     system      total        real
memcached:set                                                                 2.190000   2.240000   4.430000 (  7.033878)
memcached:set:plain                                                           5.300000   4.640000   9.940000 ( 15.634232)
memcached:get                                                                 2.370000   2.500000   4.870000 (  7.365692)
memcached:get:plain                                                           4.910000   4.620000   9.530000 ( 13.649757)
memcached:multiget                                                            2.110000   0.890000   3.000000 (  3.815322)
memcached:missing                                                             4.820000   4.420000   9.240000 ( 13.097224)
memcached:mixed                                                               9.840000   9.290000  19.130000 ( 29.674597)

================== memcached_disable_binary ==================
                                                                                  user     system      total        real
memcached_disable_binary:set                                                  2.300000   2.240000   4.540000 (  7.152427)
memcached_disable_binary:set:plain                                            5.150000   4.490000   9.640000 ( 14.895139)
memcached_disable_binary:get                                                  2.240000   2.260000   4.500000 (  6.543922)
memcached_disable_binary:get:plain                                            4.970000   4.550000   9.520000 ( 13.651242)
memcached_disable_binary:multiget                                             2.090000   0.840000   2.930000 (  3.729093)
memcached_disable_binary:missing                                              5.080000   4.910000   9.990000 ( 14.865630)
memcached_disable_binary:mixed                                                9.690000   8.730000  18.420000 ( 27.877978)

================== memcached_rails ==================
                                                                                  user     system      total        real
memcached_rails:set                                                           2.490000   2.240000   4.730000 (  7.301725)
memcached_rails:set:plain                                                     3.190000   4.080000   7.270000 ( 12.413401)
memcached_rails:get                                                           2.700000   2.590000   5.290000 (  8.321690)
memcached_rails:get:plain                                                     3.640000   4.360000   8.000000 ( 12.045570)
memcached_rails:multiget                                                      2.110000   0.850000   2.960000 (  3.762575)
memcached_rails:missing                                                       4.880000   4.730000   9.610000 ( 13.521457)
memcached_rails:mixed                                                         9.660000   9.250000  18.910000 ( 29.741724)

================== memcached_rails_disable_binary ==================
                                                                                  user     system      total        real
memcached_rails_disable_binary:set                                            2.470000   2.420000   4.890000 (  7.782162)
memcached_rails_disable_binary:set:plain                                      2.880000   4.380000   7.260000 ( 12.438628)
memcached_rails_disable_binary:get                                            2.340000   2.230000   4.570000 (  6.586173)
memcached_rails_disable_binary:get:plain                                      3.520000   4.490000   8.010000 ( 12.082949)
memcached_rails_disable_binary:multiget                                       2.070000   0.850000   2.920000 (  3.759513)
memcached_rails_disable_binary:missing                                        5.050000   4.760000   9.810000 ( 14.108435)
memcached_rails_disable_binary:mixed                                          9.660000   9.430000  19.090000 ( 28.927891)

================== dalli ==================
                                                                                  user     system      total        real
dalli:set                                                                     8.550000   2.890000  11.440000 ( 12.619461)
dalli:set:plain                                                              15.990000   5.930000  21.920000 ( 25.304116)
dalli:get                                                                     7.380000   2.800000  10.180000 ( 11.152937)
dalli:get:plain                                                              15.180000   5.710000  20.890000 ( 22.846440)
dalli:multiget                                                                8.690000   1.680000  10.370000 ( 10.569437)
dalli:missing                                                                13.430000   5.580000  19.010000 ( 21.773104)
dalli:mixed                                                                  34.120000  11.390000  45.510000 ( 50.975886)

================== mem_cache_store ==================
                                                                                  user     system      total        real
mem_cache_store:mixed                                                        50.560000   9.640000  60.200000 ( 65.236109)
mem_cache_store:mixed:rails-localcache                                       44.500000   8.080000  52.580000 ( 56.402804)
mem_cache_store:set                                                          15.220000   3.190000  18.410000 ( 19.790836)
mem_cache_store:set:rails-localcache                                         15.780000   3.240000  19.020000 ( 20.381800)
mem_cache_store:get                                                          16.700000   3.060000  19.760000 ( 21.476411)
mem_cache_store:get:rails-localcache                                         16.850000   2.960000  19.810000 ( 20.688119)
mem_cache_store:big_read_multi                                               79.530000  14.540000  94.070000 ( 99.758591)
mem_cache_store:big_read_multi:rails-localcache                              66.250000  10.370000  76.620000 ( 81.315423)

================== memcached_store ==================
                                                                                  user     system      total        real
memcached_store:mixed                                                        28.520000   9.840000  38.360000 ( 46.949240)
memcached_store:mixed:rails-localcache                                       28.250000   7.890000  36.140000 ( 43.047112)
memcached_store:set                                                           9.390000   3.080000  12.470000 ( 15.641645)
memcached_store:set:rails-localcache                                          9.810000   3.010000  12.820000 ( 15.605396)
memcached_store:get                                                           7.970000   3.020000  10.990000 ( 13.082962)
memcached_store:get:rails-localcache                                          8.900000   3.060000  11.960000 ( 14.257227)
memcached_store:big_read_multi                                               35.850000  12.070000  47.920000 ( 56.068037)
memcached_store:big_read_multi:rails-localcache                              29.940000   9.050000  38.990000 ( 45.142524)

================== memcached_store_disable_binary ==================
                                                                                  user     system      total        real
memcached_store_disable_binary:mixed                                         30.180000  10.030000  40.210000 ( 49.672475)
memcached_store_disable_binary:mixed:rails-localcache                        29.690000   8.000000  37.690000 ( 45.133441)
memcached_store_disable_binary:set                                            9.610000   2.810000  12.420000 ( 15.252278)
memcached_store_disable_binary:set:rails-localcache                          10.310000   2.830000  13.140000 ( 15.977240)
memcached_store_disable_binary:get                                            8.690000   2.930000  11.620000 ( 14.066607)
memcached_store_disable_binary:get:rails-localcache                           9.680000   3.150000  12.830000 ( 15.615923)
memcached_store_disable_binary:big_read_multi                                36.910000  12.760000  49.670000 ( 57.974890)
memcached_store_disable_binary:big_read_multi:rails-localcache               31.150000   8.690000  39.840000 ( 45.472823)

================== dalli_store ==================
                                                                                  user     system      total        real
dalli_store:mixed                                                            43.910000  10.100000  54.010000 ( 58.234206)
dalli_store:mixed:rails-localcache                                           44.180000   8.280000  52.460000 ( 57.710744)
dalli_store:set                                                              14.710000   3.230000  17.940000 ( 20.882298)
dalli_store:set:rails-localcache                                             14.850000   3.190000  18.040000 ( 19.756844)
dalli_store:get                                                              12.250000   2.830000  15.080000 ( 15.868066)
dalli_store:get:rails-localcache                                             13.950000   3.190000  17.140000 ( 18.888504)
dalli_store:big_read_multi                                                   62.020000  14.860000  76.880000 ( 81.133482)
dalli_store:big_read_multi:rails-localcache                                  27.600000   3.000000  30.600000 ( 31.914885)
```
<!-- result_table_end -->

Test Server:

- Ubuntu 12.04.4 LTS, Intel(R) Xeon(R) CPU E3-1270 V2 @ 3.50GHz, 32GB 1600 MHz DDR3.
- Rails 4.2.0 on ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-linux]

## Inspiration
Much of this test suite is based off of https://github.com/mperham/dalli/blob/master/test/benchmark_test.rb
