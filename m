From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Jan 2019 08:01:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-15
Message-ID: <20190116070118.025A020AA4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   1 |   0 |  23 |
   2018.11.x |  25 |   0 |   0 |  25 |
      master | 155 |  56 |   1 | 212 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/ae38a9cff3665da7056ac4f4033fab0926256815 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 8 
        glib-networking-2.56.1 | 5 
                  ffmpeg-3.4.5 | 4 
                   netsurf-3.8 | 4 
                civetweb-v1.11 | 3 
                 gnu-efi-3.0.9 | 3 
       gst1-plugins-bad-1.14.4 | 3 
                  libssh-0.8.6 | 3 
   libtorrent-rasterbar-1.1.11 | 3 
zbar-006b465a267ad3c6c754b8... | 3 
                 dmalloc-5.5.2 | 2 
                  libftdi1-1.4 | 2 
              libserial-v1.0.0 | 2 
odhcp6c-7533a6243dc3ac5a747... | 2 
               skalibs-2.6.4.0 | 2 
             host-grpc-v1.16.1 | 1 
                        jasper | 1 
                  libnfc-1.7.1 | 1 
               mono-5.14.0.177 | 1 
             stress-ng-0.09.47 | 1 
              swupdate-2018.11 | 1 
           tesseract-ocr-4.0.0 | 1 
                wolfssl-3.15.5 | 1 


Detail of failures
------------------

     riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/e39e2fa277b3ef814dca4b3125fc1c8f9c21ff13 |     
     riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/34fcfbb57ff222da35fa5ee21c6187f4c6e46685 |     
     riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/cf83e848b91839c15665dfa8de829adf32cc13fc |     
      x86_64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/233b5ef042ef180675f0bf978e19c2eb71538f0b | ORPH
      x86_64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/8f7ec5eb7cefcdbd59ceec48e59db788e9a75520 | ORPH
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ec4bb0e7acfe3db99bd6f21c8694b8a5b08efe35 |     
        mips |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/0473903d63e5fdde4337dc94d1d5475e37f76ac1 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/6f7fa13fd8bd2f1b05ff915690aa63691b9b138f |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f0e7ad42e80605667233918dea8fb442de0cd48b |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/04a1610ec86cb00bdc5c7914030b690fe2d1ae3b |     
        or1k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/09d1a6089f95a68d766f71f4883af4d6726b3560 |     
        m68k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/e667c4ed4547b96aa253f5f0bcf4ad282155a6be |     
        mips |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c152efcd3309a2645473653fd5cfe6fce9025a9d |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/80c06210e297fed82c2089bea8bbca71076d4105 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/27874f75f01291b6689a2a80e19573eaff7252b1 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/dba771a75dc24ccaa1565e5a8addbf349688fda7 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/47308956172ac93b680b4cbaafa8b36c3a4a2790 |     
        i686 |        gst1-plugins-bad-1.14.4 | NOK | http://autobuild.buildroot.net/results/21d4d4d41a3e014daeb79ab75b06bcada1b27a11 |     
     aarch64 |        gst1-plugins-bad-1.14.4 | NOK | http://autobuild.buildroot.net/results/39fe37a2a87f15570470602f4079385e97f54b35 |     
      mipsel |        gst1-plugins-bad-1.14.4 | NOK | http://autobuild.buildroot.net/results/edca961f2c4d1946385ac86a756308caaf22d79d |     
     sparc64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/73436e39aa3108b3bd849112d186cd32d216de6a |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/d8abd9238262c6816f3b6a4d26785a78326aeb34 |     
    mips64el |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/51e8faf7614c483d508c702dfd619e250f743296 |     
         arm |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/b44c255d0ff1d0c96f71d9bafac9554b74be8062 |     
     riscv32 |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/89d4104856901296ce755e4c92f193bd4deb39df |     
     sparc64 |               libserial-v1.0.0 | NOK | http://autobuild.buildroot.net/results/63ba95b6786464fa8e75af64593010df84530079 |     
     sparc64 |               libserial-v1.0.0 | NOK | http://autobuild.buildroot.net/results/95e67ea0883a0f6beceae6550ee94a7b44db3346 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/ea2df0fec4e4c29b19278fb70a9f6c3147c539e3 |     
        mips |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/9e5d04c57a2be33ce91b1408305eb3aac4ded8a5 |     
       nios2 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/1e153cc7bf4e6f6a644820905e092c1f1f55b5ed |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/b3d227a78562255ee7bbcda9680f893c7a61201e |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e88437cf79dcd820c1c261ec8ef54c7fc00be34a |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/a1849ff58801191a59a4bce785bc94d882d7ab2e |     
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/a9192aeef0122f503d18fb8efdd282854367cd4c |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/32ae0ab92d09c767ce86a32bf9e33c3b954ad2c5 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e329e918b1a4b8b81a7100bf320c7917c0ac9d71 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/771af284516d41d52952e83e55f8625bfd18d013 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/532c30dd11936c712d406adf30817e4cb4d8c6ce |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/5a0dd4a4b0b2b97cb712b870b356b7e392106760 |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/6247c92cffe9a5846cde3aa7a5f8353b7cb89546 |     
         sh4 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ae261e564a8de66f715e5984f0b31e09036ed6d4 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/055b20b3317ec92b79492eee197ad8953f675691 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/31fcf0efaa91d60b6580bc17174c174ce4a10f66 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/9c0c4240138c1ce0fbf63bbcf5459a50a329db58 | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/40f44a7f40e52682009c1cb51d58599b5255062f | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/469aaf5827b74a259d0197b1081b5305d3e58c06 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/736d8df64ad6160d8097683a2f6626fdd3b3dc4c | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ca99c56818e0b62709a0a572710e5efe815b1dff | ORPH
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/8ef2096229a71ddc68b2ce1fc3fd504a18fd42a2 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/b8a5b6ff52f0abe18817a65f19a9e565ca12a1dc |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/568a0d2830ae07cc3e2719dd65a7c409b31a63e9 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/497720128a76057865f5746e8d8e258395b03dfd |     
    mips64el |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/43ea2202cc22e5538866fce8ce9fad35fec3c972 |     
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/0dfd3ab11325ed6bdbd9d0280c10d3d2c5b7725c |     
     powerpc | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/039d4e39854e2b8a8cd6083cbd343c5388e16fe1 |     
    mips64el | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/6f6c725a0d4e436ee66aba122961be26119d5ba5 |     
    mips64el | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/8fdffbe77a8379466be63eeec2af5888e93fff50 |     


-- 
http://autobuild.buildroot.net
