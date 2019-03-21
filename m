From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Mar 2019 07:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-20
Message-ID: <20190321070043.3390386D73@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   3 |   0 |  33 |
   2018.11.x |  39 |   0 |   0 |  39 |
   2019.02.x |  33 |   3 |   1 |  37 |
      master | 226 |  66 |   2 | 294 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
                 mplayer-1.3.0 | 1 
             qt5location-5.6.3 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/97de444eae5e8baf191b05e31f07ca00558bfda8 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1bb0c4f70b84664874dbb3011a409670a87fb0a2 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/9bdd11e68000136cee646e78a8702cb798493163 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           at-spi2-core-2.28.0 | 13
      host-uboot-tools-2019.01 | 9 
            optee-client-3.4.0 | 9 
        glib-networking-2.58.0 | 3 
           uboot-tools-2019.01 | 3 
                cutelyst-2.7.0 | 2 
             libmpdclient-2.16 | 2 
                  linuxptp-2.0 | 2 
                   mimic-1.1.0 | 2 
                   netsnmp-5.8 | 2 
                   qjson-0.9.0 | 2 
                qt5base-5.12.2 | 2 
                   systemd-241 | 2 
          wpebackend-fdo-1.0.1 | 2 
dawgdic-16ac537ba9883ff01b6... | 1 
                gerbera-v1.3.0 | 1 
                   glm-0.9.8.4 | 1 
                 haproxy-1.9.1 | 1 
              host-cmake-3.8.2 | 1 
                host-go-1.12.1 | 1 
                  monkey-1.6.9 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
                    postgresql | 1 
              qt5enginio-1.6.3 | 1 
      qt5webkit-examples-5.9.1 | 1 
                    uftp-4.9.9 | 1 


Detail of failures
------------------

         arm |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/38becd041b3836ee6b555c83560bc4316e12ca82 |     
      x86_64 |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/4f67cf0d7e4bb7d327a36a6ea3c553cde8d51b7e |     
         arc |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/6ef2713bb926dc1414168e1b659255a6bc78b6d4 |     
    mips64el |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/13dbc82c42c90e99d967e6ba2934b4318a9fa8d5 |     
         arc |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/51c307f5e6a805d3dca9de63247a6c8c564f4c02 |     
         arc |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/de583c931151f8451d5309fb53c1c2f534d1bed9 |     
         arm |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/08352a628044d60ecb998574a10a6e2bbf9ef11b |     
      x86_64 |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/58e9d09f050b770456721b9e69d5964a296aad93 |     
      x86_64 |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/88c949e0c1ad9d8a9cf260888f45294890bd470a |     
         arm |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/d4add1115f499e651a937cdac584e5aeb3c6b4f1 |     
         arc |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/6a94e6a583ca88d2089e7968a4afa4dffc660935 |     
      x86_64 |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/eb085166f2746124faad65dc3640318beb0afbb0 |     
       nios2 |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/71ed26c71017348f525a0276b4311104ae1bb5ad |     
     riscv64 |                 cutelyst-2.7.0 | NOK | http://autobuild.buildroot.net/results/49aede24fe249804ee6d012dafa66e4c7f83822c |     
      x86_64 |                 cutelyst-2.7.0 | NOK | http://autobuild.buildroot.net/results/04390762b6d9aebf605e8ab3f76b8580f438884a |     
         arc | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/21e5d62d3bca1204ef4abd92e2d243ad549cbbe7 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/95e410e5ab34c6d4626a58f97c0d2d5e6829a300 |     
         arm |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/031aee7cf12ad882727eb2da5e953fd8813b52e2 |     
         arm |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/eaeac509887cb3b4ffb7ef50dcc844541b9cf1f4 |     
         arm |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/1d698b5c9701bda28ba4e34fb0b6de12e5cb4f89 |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/11ff6a7430766cc010b62615df7f836886745808 | ORPH
       nios2 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/ae5ca8d79eeef0e636ccd7a673725d4ac5c650ec |     
         sh4 |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/0fb8a0fa0ee6f6aea83233b43072f7782dbe9c99 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/ca0e4a3d54359ef87c23f11c949a3a9950f0de2f |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c1247778561453c4b0a85bd63038e82e11d647a0 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f336dcecad8867fa1f05d99a6f4eac3bc4185a50 |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/94b5f22d96d4f01dcfa51e5a2bacc5231ce739f8 |     
       sparc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/8e469797ae1787d3a7f0cd1fbfe3497e6690a72e |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/fb148d3b51c352f76b264f0c77e9fdede27fdb3f |     
     riscv64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e3c8bbdb02b9b0b3901d19a9434cec5a65504504 |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d956751760fd396057114aae9bbe54943d448429 |     
        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5d7e84d944f613ff828d66bbf973c2134189a8ad |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c5dc0f63bf0b172ae87e41d7b01074ef33936809 |     
         arm |              libmpdclient-2.16 | NOK | http://autobuild.buildroot.net/results/e828c7925d9247e14d8a8694febfee8ce6c86e81 |     
         arm |              libmpdclient-2.16 | NOK | http://autobuild.buildroot.net/results/ca02a545d6d2fbacd0100788b4f660b336385736 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/8cb95fb5d0708f038189dc160b338fc24a40052b |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/590e86f595efb2f015c30cb3f3c97a8f51fbf93b |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/8f8c3b4ad1fd106d8e6837e198396bed0e0e5a11 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/f825e2f358137f724f25fca2c06d9c537517e9a9 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/b851543f2c47e2816e649f54408620beb21132e1 |     
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/6a01f1574ff5ab25092181afaf7ba4a0deaff77d | ORPH
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/4a4ac68d313d946022d1566eb6301bc029d35f45 | ORPH
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/9e827524a8aea1dc6d4a30f0ac68617089dd5159 |     
        i686 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/de420fd1733a74c9652149f46c282a15f9808bdf |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1f2f130bdf917b8466b3956ccc80a60468a98e26 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d87847439349210966200b7167c3168ec0bea224 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4e4c290956381c5cccd62fdd6b5358d0b88a075b |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/2170d8c228e4c8e11bceaae5d4f1e047b0661d60 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/420c12805acd33cce76ab1c841ba726b6ea1bc2b |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/a2f902221a3c747a9caf5d2bd22ae909b3b2fa02 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/34176ead0cffe581de0beeeef8b612ef2fe479f5 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/c47eb68fb67945d5a4d9e52f06094171ee940b23 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/c89b6a27d1ea0f7da6a1a1d029bda9953979de58 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/8c2faac64dc9c98f7b5efed748a5694f2ee0b64d |     
      x86_64 |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/042144b4b6122f206e834d0efe171d68b0c8e5df |     
        i586 |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/6fb17d7de75fc7939d2d7aad88be1a692626a5f3 |     
      mipsel |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/5f1aab37561f8e31c8250b5325b6df8d15e43530 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/beaa3bf1666720ff91c4e43861127b21b5126181 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/9ab1e6cfe133dd3b24b284198ad716658db55582 |     
         arm |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/b2ba83ccb5ea1254a61b13e916920c4983afc41f |     
         arm |                    systemd-241 | NOK | http://autobuild.buildroot.net/results/b41523bc2b5582ce47b91ca048b8e4c608c5837f |     
         arm |                    systemd-241 | NOK | http://autobuild.buildroot.net/results/9eae2181fb3fcfe12481e5496b7d87c0dcd109eb |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/8fab2c9a9532cda7166723ac6b58f8f09257c717 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/112bdb1f01b1d476332916eafefbb831de163ab7 |     
        i586 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5d75653c31e8eea61403f746abd3559631a6feee |     
  aarch64_be |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/a733ba2cfef54e2cee9e18ae65e45c088de2850d |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/77571d7ea2914638e30f017e8a4965eb89960802 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/2520e6d94a82669b5d8e1aabeb10884fd43f1912 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                gerbera-v1.3.0 | 1 
                        glibmm | 1 
                   glm-0.9.8.4 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/2b99fabd798db84a0fce26ad696c58e54c6ff626 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/412f8114cc626464fcc6e66ee019104a1c6341bb |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/5846a75dd21dae47504c5223d5c32aaaae5db211 | ORPH
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/6dfc3dae39eed6b8fd34f21cd19ec7ccf0d49d75 |     


-- 
http://autobuild.buildroot.net
