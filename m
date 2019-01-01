From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  1 Jan 2019 08:00:29 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-31
Message-ID: <20190101070029.EFF1B2075E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-31
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  14 |   0 |   0 |  14 |
   2018.11.x |  23 |   0 |   0 |  23 |
      master | 121 |  47 |   2 | 170 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 14
                  linuxptp-2.0 | 4 
                  ffmpeg-3.4.5 | 3 
                  libssh-0.8.5 | 3 
   libtorrent-rasterbar-1.1.11 | 3 
                   netsurf-3.8 | 3 
                  grpc-v1.16.1 | 2 
    json-for-modern-cpp-v3.5.0 | 2 
                wolfssl-3.15.5 | 2 
                collectd-5.7.1 | 1 
                 dmalloc-5.5.2 | 1 
                     efivar-34 | 1 
             keepalived-2.0.10 | 1 
         libcpprestsdk-v2.10.8 | 1 
                          opus | 1 
                php-amqp-1.9.3 | 1 
                 php-zmq-1.1.3 | 1 
                    postgresql | 1 
                   strace-4.25 | 1 
             stress-ng-0.09.47 | 1 
                   systemd-240 | 1 
toolchain-external-linaro-a... | 1 


Detail of failures
------------------

         arc |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/6b021ab0e555a39d323942a2fce035c77aa1b63b | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/4d53c9601ee5cb8c97fa8a0471c323e08f71e443 | ORPH
     aarch64 |                      efivar-34 | NOK | http://autobuild.buildroot.net/results/6952b99eb0b0e85b2f5408accdca2b4dd17d14c0 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/09a364ed24089534bf5ffb18375e3a91d4e90e94 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/97bf27c5f17a432d1e5be4eecb6bb58b3d99568f |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f2216865277329c85a5cc6083bb78fec79fbd57a |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d3df761ea9c981352c0fc1f90682bb8e1576981e |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/f2a04ec34e7cc4e9b705d43c6c175f55efe91463 |     
        i586 |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/1f893d8bc7df3bfefd31df69aba918e2121cfaf7 |     
       sparc |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/8ac9d64188276f206fc060c1e91c8908749e09ca |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/446354b66019bb2915cd33bf8bfcdda82a4d2f46 |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/85c538fe84f3cfb0f93717f71be676940d8788e1 |     
    mips64el |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/36cfe731926110e724a4ddc6226bf1a65ea8b37b |     
   powerpc64 |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/afdda40817f6ba9bed7c48c4518afb8d8d5e5eb0 |     
      x86_64 |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/fc0c9df61461b6ee74bf418ef85c84028e80a34e |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/6f3d9873e53916378b699f4049507d86cbb9c991 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/cebc9a89e5cfcd6c780cdbfb42c7502948a13925 |     
         arc |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/16f99ef4f86bd7040d5f55e0968f6a11d7634a8c |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/2c60bcd3b6d9d3a2246372254c3d33292147d982 |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/8782d652a9f5b62bf652dc31e038f2c3447b6568 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/2cb2fa47c5a4d91ab8b3cf849cf42cd3baf0dad7 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/0aa6a54b390d59fa6029fc1ffd43c03f2e513cc4 |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c1f5c5f54ecf2732cff37f9cd51716bb961d44ae |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b602676c44613aa499aab2dcbdca0bf9b656b3fa |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4028c15b09b7e744dadcd03e09bc9587fd4f66f5 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/1c7a1c5a27e9f2ba5c43c73b37513889edd17d13 |     
        i586 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2e502eb2635fe72359448fcff43599083b309b17 | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ccf6b6402eabaaec09bfacb1e06d5a30d45b24ac | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/eec25ac360cb21e043e12a5d4e4e0f392ccd8c9a | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ee4eb3f33d3aff263017e9d2270420678c1d164b | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c2ec4fbf537993b190456e4cdfb08b4df73fefaa | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/b58840e5c1ff3ffc1f0687db9145c0413f318526 | ORPH
   powerpc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2006f2c9e980facccbeb0355b222337c7136ea96 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/6d5066003f235eb33bcf924ff7f874c3dc53367a | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/356ea2c2c246bc60a4e4cea4bf49a784b1afee38 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ea7878d7cdc45109ca07e7fa0505a0ee60268578 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/750d09fe632dd55c7c4f57edcbd8bcd944d12af0 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/d23086db948e5bb8a84039d1e7e393375e672b85 | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/0aabf0ac766178fafd4e1caab0db1b530260df14 | ORPH
      mipsel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/108aa791d3c14040c7ca74c40c409a7c363a64c8 | ORPH
       sparc |                 php-amqp-1.9.3 | NOK | http://autobuild.buildroot.net/results/e645fda4bac3c5125f332d5c418fe056c85d5865 |     
        i686 |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/3f258fbc7352c3d7205bc6402145be1102d69683 | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/daf2ee88ae2d500df42cc272a7e1e9e5cd64f2cf |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/dc01c428b24481333b2d8073e7e0d5122f1b78ea |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/6def1bba8e7ec05682e74c4edc3a35c8c118d28b |     
     powerpc |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/f9fccd025e40fde3145a8052eb50cb2228896533 |     
         arm | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/83762e109d8f6e41027c14d8293231c960fdbcfc | ORPH
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/20d8cb50d3e226fc2306c7d1b02301efda2402e5 |     
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/7a5703b10ebfadf33f9424f6fe88f2f0b7649d08 |     


-- 
http://autobuild.buildroot.net
