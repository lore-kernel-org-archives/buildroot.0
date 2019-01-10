From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 08:01:00 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-09
Message-ID: <20190110070100.F13E720A0D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   3 |   0 |  30 |
   2018.11.x |  19 |   1 |   0 |  20 |
      master | 216 |  68 |   0 | 284 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
       host-libunistring-0.9.7 | 1 
neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/541bdd2593d039bf82630886a7c649c09f62a660 |     
      x86_64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/a4c7bdbd66be3d16a2a8e45c9fb8a6a4e287d024 |     
         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/db78c6850904ffe5960fefb02d6a5e73e7afaa4a |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

             qt5location-5.6.3 | 1 


Detail of failures
------------------

     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/6b6a4cad0ad013c41ca8eded17c0238a9e09dca4 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 19
        glib-networking-2.56.1 | 9 
                 dmalloc-5.5.2 | 4 
         libcpprestsdk-v2.10.8 | 4 
                  libssh-0.8.6 | 4 
                    atk-2.30.0 | 3 
             host-grpc-v1.16.1 | 2 
odhcp6c-7533a6243dc3ac5a747... | 2 
                     pcre-8.42 | 2 
           php-memcached-3.0.3 | 2 
                php-ssh2-1.1.2 | 2 
             stress-ng-0.09.47 | 2 
                   systemd-240 | 2 
                  brotli-1.0.7 | 1 
                libmad-0.15.1b | 1 
   libtorrent-rasterbar-1.1.11 | 1 
               mono-5.14.0.177 | 1 
                   netsurf-3.8 | 1 
                      qt-4.8.7 | 1 
                   strace-4.26 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
                supertux-0.6.0 | 1 
              swupdate-2018.11 | 1 
               wireshark-2.6.5 | 1 


Detail of failures
------------------

         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/347a37dd2585974bdbf3bf99158e8ee9127d1202 | ORPH
        or1k |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/aa9b321fcaccb22a3855b6d253e413d4564f33e2 | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/c64fe9681568bafe6d5623b1f94ada498067f9ac | ORPH
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/013b255a4684969632591e301284b070e8711aa2 |     
      x86_64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/ec91c00832a7ed16c6ed30b173300b1eb56be97d | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/087193310b1dc4ce7c763ec459d1d1058c1a9c52 | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/9e93f2979671ceaf3d126ad586384d40bf5750d4 | ORPH
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/799fe793fea0d1a05359b76f516abf3234bf06ad | ORPH
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/ac161ebbf495ee1e17a3f3570601062d59ad047e |     
      mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a80273464a6bf428a345d774e76b2c33a4a2b4c9 |     
         arc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/1c6b9b3ad8407027656270b3ff1ea56a6c66e9d4 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/e169e0c574c3f1f79b1817d882a2b666c918f840 |     
     powerpc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/b9c3a4d963cf8ba331deee473983c99a3db1ff94 |     
         sh4 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/5538841be4414c1cccdad598db3f0613b67a5d4f |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/fafe88a2280d5501060a62f077f60f4e6f8909f6 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c0e59320ca984aed87b6a35ea3773a2d9834b069 |     
     sparc64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a1454575d0b434e69fb47884c7494ea9a898f635 |     
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/14f67a74719967bc8a5b10f289fe9a30ae71ae24 |     
      mipsel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/af96d799db31725589712e45f0d2558c144a1d60 |     
        i686 |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/e786610337d6e8fc1974c8202828f33d7ce2424f |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/3a26382456f0fc8061c0b0641d9d413ddafbf893 |     
        i686 |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/4f9efd31613ffe1432373f3e5c23a9b54d7aca88 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/4c9b2311d67539990498653671f17c5dd4c1bc97 |     
     riscv64 |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/54b861fc110bd8342665c2439ae7a88ad59659a2 | ORPH
       sparc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/0cb070713f7851ceec238f2bee6b791ecdffb424 |     
     sparc64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/fabbd501ad19ce501097301df457db1a35b25a68 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/beedf44f5bae35d24232065fcfb8dbb3f40c525e |     
        i686 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/d83efe5d5413a85b37483c8a7e6f6c8ae2e5ccb2 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/60c70a6645ce45a0003ae0ddf466dfba79058e7a |     
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/fa0aa7d222cd8ae8a52b2b271053960d45d8e69a |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/157b09685398041f5a703893d0bb60bed9fa93b5 |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/162a65edc4e505d4c06f2f7069405d6b81126742 |     
     aarch64 | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/53926104a5ea9aa965c8aff6dc27e16f6878c9d3 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/2cce6c4162ad08af9c4d01b38fc2e28701e34870 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/7b8d5f1417ee4201040a619fe54f20a7f315641f | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/373f1e4bf955a3967ea784f929fd340a8a0d0e67 | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/93ab0afdcb407bfb36614f4447c9a71c16cdd606 | ORPH
        i586 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/000886ed840e71df89c68c2fcf96e9b44506f97e | ORPH
        i686 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/029213cb4c41567743d6c7a157de4066aeb337ff | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/4738751a8bcd49913db52b20a2057fd85465bf95 | ORPH
       sparc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7946f2ef6a87bf48992bca5c8f69cd5207fdf612 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/33678cfbba0d48efb5dbade03a609fc1dfbf5b18 | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3e866e528c61233e69ccd6568cb2667818496b45 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/46871831d75f874d10dadc4ce576e55985665e2d | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/9e757b8a18e9cda07531c5ab7382b82635601e45 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/cf8f2bcff097b702325c17bee32bb341d13bf977 | ORPH
       sparc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/925cd577624f2c96c2eb3b5c61dedac9e23b6cc1 | ORPH
        i586 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2240ba3a8ca2a59da5442f3e956400d2a1822222 | ORPH
  aarch64_be |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c1101700b6002a4b94786e4bb16f73aaad941496 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/9359be73b37ea643e0984672b0b658388c099467 | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7dbe65b316255983a261fce37af6950c1b79c78a | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/024e368dc737ac333d542a39b0b20624719e28b5 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/000c78c1a4e2e2104ac8dbb33f57e3726c7fb544 | ORPH
        i686 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/68ee496c04779ca601af89e67969eea54d60fbce | ORPH
         arm |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/98c797e7da659854d73df88511906169c7c7f9da | ORPH
     powerpc |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/a0f7162dbf226a03e3217667f6de84a91f5c0c63 | ORPH
     riscv64 |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/d179b9f3fcb63a0fc39bd23066d0fc1ba7c79f99 | ORPH
    mips64el |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/fd542dfaaaf09daf78d7dd2ada8008f68c0cf30e | ORPH
 powerpc64le |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/90bff243ef8243dd078d113c96b695a8849cbfe6 | ORPH
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/306ab95ea759f03e1a437ccd848aaf6d0b0024dd |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/8150ecef88bd8a98f8436fdbd89e192e6b6d760c |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/2fad44f051219f550df9f98213894ace004981af |     
         arm | sunxi-cedarx-b8f52d913f7372... | NOK | http://autobuild.buildroot.net/results/c17062e1558f26c2db837883a0c33ef39dd031a2 | ORPH
    mips64el |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/2764ca1e41d96d0c4f5402df7ed4c42216e4f8ef |     
microblazeel |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/07391b074a2fb16d2925320e16535e177a923089 |     
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/1075dd959477661966cc18af4679ddb14cc9e2e6 |     
     powerpc |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/980c5adf3d21c778672e0a0d19611babe92b4468 |     
     powerpc |                wireshark-2.6.5 | NOK | http://autobuild.buildroot.net/results/ce1b6e7ec80ce9ccf256b5639c0eeb80d2e614cf | ORPH


-- 
http://autobuild.buildroot.net
