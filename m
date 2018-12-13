From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 08:00:32 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-12
Message-ID: <20181213070032.DC43D2079D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   3 |   0 |  22 |
   2018.11.x |  24 |   2 |   0 |  26 |
   2018.08.x |  28 |   0 |   0 |  28 |
      master | 106 | 165 |   0 | 271 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.3.6 | 1 
          motion-release-4.1.1 | 1 
neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/c68b641c1d679e1f4d526c53eb9979938b7e1c76 |     
     powerpc |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/6976ebe5f3a1180f91a97b283884fe7e34e218d6 |     
         arc | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/6971ce73b2aa51e76a322694fd4e7d49486020b0 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 
                  udisks-1.0.5 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/c8729c1b8a3777e829fcd91228b259806d09eae7 | ORPH
         arm |                   udisks-1.0.5 | NOK | http://autobuild.buildroot.net/results/c21bb170b6fb69ff7f5631ecea23c94ec88b90a1 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 acsccid-1.1.4 | 31
                   ccid-1.4.29 | 25
             bluez5_utils-5.50 | 24
        glib-networking-2.50.0 | 19
                      iwd-0.11 | 9 
                   libva-2.3.0 | 5 
                   netsurf-3.8 | 5 
                  ffmpeg-3.4.5 | 4 
             host-grpc-v1.16.1 | 4 
                 mesa3d-18.3.0 | 4 
        xapp_beforelight-1.0.5 | 4 
    azure-iot-sdk-c-2018-03-16 | 2 
              drbd-utils-9.2.0 | 2 
                  libssh-0.8.4 | 2 
                  linuxptp-2.0 | 2 
                openobex-1.7.2 | 2 
                   trinity-1.8 | 2 
            xapp_editres-1.0.7 | 2 
                clamav-0.100.2 | 1 
                 dmalloc-5.5.2 | 1 
                     gdb-8.1.1 | 1 
                gnuchess-6.2.4 | 1 
                       kmod-25 | 1 
                  libftdi1-1.4 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                 libv4l-1.16.2 | 1 
      libva-intel-driver-2.2.0 | 1 
                    php-7.2.13 | 1 
           python-numpy-1.15.1 | 1 
                qt5base-5.11.3 | 1 
             stress-ng-0.09.47 | 1 
            xapp_viewres-1.0.5 | 1 
         xapp_xclipboard-1.1.3 | 1 
    xfont_font-bh-100dpi-1.0.3 | 1 
  xfont_font-misc-meltho-1.0.3 | 1 


Detail of failures
------------------

         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/55dc71b95cd82ef137bd4f8264fef7dbd00a5806 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/a47e5780d8a0536a253d2943f0086135098ac877 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/12c35630f275cd974bacbea78933957a1e4c7098 |     
      mipsel |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/9dc76478d81ea2469900a4b4aab0e31fee9c4032 |     
         sh4 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/9f7322a2d9ee71d386897c926f7ab824a3b6d16d |     
      x86_64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/b1a5d306691af8c5486713f81cb766289914aaa2 |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/5330b1ad081826fb7ef276a1b9037392e2823754 |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/2ab62c961e810dc28002f2013b8682ec43b99428 |     
     powerpc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/356ec0d7bd9ced0832bc0f5f2034325bc9679f2e |     
      mipsel |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/85141347f1f3dc5ee5bf3fa8e7bdffb2d4d65518 |     
       sparc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/e7690a850c53b0f388db5314c836c9256c4d1efc |     
       nios2 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/2f41e7870a050c19efb2217304817199a3ff419b |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/bc99eb3e2745ebb11ff368a984e2eca8a23ec8c4 |     
        i586 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/f02ab34b18c2cec363e3fd6dc2060c91fdc58047 |     
       nios2 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/5dbd70b6914b290b48c22f23e02b8ef8a57fe75f |     
     powerpc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/677a23271660ee04e6c85b961e9f7a771280d802 |     
       nios2 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/41224fd3af447ab2e814a79bf999c0711b6a953a |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/6fe770c3abff0c83d8aea0990523a4d72eb8de18 |     
        m68k |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/15b0dadc127fea30e2d821c6ec9b9816f284356c |     
  aarch64_be |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/fcb8689a1f6b5f571838d72135111d4a09ad035d |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/cbe8a7421bdcaf44bce7f1d722846504539f4ee2 |     
        m68k |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/72636a01260d99fda7d7722b11314f9f41a65ef4 |     
     powerpc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/2d976a02296bcf59719cae90cebb6c37e0a4b232 |     
      mipsel |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/93bbb728cdf8f8a8d9259c3c86f05bd56fe4be04 |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/f9479eda927a102c8e8ead2118de19e5b6724d7a |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/053a24b6b2df8c9ebe5d37a203fc65fcd7cd48fa |     
       nios2 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/fde6be79fcf829ba52e5a9cd3cf71e41250d8b67 |     
       sparc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/ffa878ab22d316c86a730b0c125ae03887a5320c |     
        or1k |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/f09c5fa2632e517247259e89bbccf518f958a47e |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/c81fe9e98804b69fc89038e8e36900ac5fe9c72f |     
     riscv64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/871fc350c970551cf1e99e10c3625fd2dcf214dc |     
         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/1c8e1d3a2a7d7ada5935026f635a89c3ff8eb30b |     
         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/41b591786c8fb7c10717d7fd88c2c2711d3c4318 |     
      x86_64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/4f7a7e112b1ecb5f9f9f1109607741735c78c717 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/1d578e6f6bbd889895ed91680f75b93e80283927 |     
     sparc64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/a30f927e31f18cd4091612ae36d0d179e9b8c1d3 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/2eee9bf47f4d61124a883654488f8b5faf764fb2 |     
       nios2 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/9bf9fe7c1c1c7272f67fafd88f698b3600a0d01d |     
 powerpc64le |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/9388348a99f24680b0b6c51aa231c13a17486cce |     
microblazeel |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/4449bb76cf35c823f96c32c1390b36c8d7ee355c |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/a72b6b37dfd113f04c5c4659a1dc66727fc990d7 |     
     riscv64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/8785466e32acff9daad98803f17688d355f76e6b |     
microblazeel |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/d63e836a3665efee7c00ba4384cc9ee150392109 |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/fbe5cbd261814ff627b77de98d80281d17e62002 |     
      x86_64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/db8a676f9a3dc67f7f153b51a6b3018b045ac57a |     
         arc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/c36426151b52bec07e1421a867cb30a1462a1218 |     
      xtensa |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/db7fd5a7661b944f48da6f2713fb5c8cc1febc61 |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/1340be0ba1df2675aea02988ba8a723936d04ba1 |     
         arc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/7a7d300c63c68e3d9b04238755a7b3801bf31859 |     
 powerpc64le |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/40039c333669c9e065d1118f54fe0eef1226ba19 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/c2defabad760ec80316bfa010842cddd30dfe086 |     
  aarch64_be |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/498e7e368fbb3d69c2f311e3e5bc213e507b8023 |     
     sparc64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/00a4f126b56c30d41750a8c33e1d387f230909df |     
     aarch64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/a1b559e51116ecdd816a105c3b15dab99107a563 |     
     powerpc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/6e87520e76c8d499f907e21e8b944946d4ef418d |     
        i586 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/0cd52314a0182ea003a1191a17668277de1a1ff7 |     
        i686 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/63f414cd1b04dfd785b59b79fc3b0b640acca69c |     
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/c5edc9e99efe826cff86c4653c599afe22336c4c | ORPH
microblazeel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/ac22722b8f54e178b863e65a6344d5c49796990b | ORPH
     riscv64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/64101d083561f0d1f49f328877bca81181ff496e | ORPH
microblazeel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/c5aa73c45d61a6d953e4dc222c5102441a41c4a1 | ORPH
         sh4 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/51b20a60b3f7fdfe3d309e74d3c9222dfdae750b | ORPH
     aarch64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/1643567e2cba4616e66960493c7e07c7938d08f0 | ORPH
     sparc64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/786cad7996c8604edfeaab843102e520bc4f31af | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/c6373316c96bc00a9aaf7a789aa544fa1dff7f0b | ORPH
         arc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/d19afc94783fcf64b42839e42d3ddc7f787e2547 | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/fd66b66ea71d7d4b33c6745c4c549e66d6d6ddf6 | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/f92ddc5ae2409005f4eddcd2905cd1a1e721a186 | ORPH
     powerpc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/7ab77ec78ed821e0005fd4830fef1539d3dd1830 | ORPH
     aarch64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/258d91ab145897c574d3affce9861c208a2b49ef | ORPH
     aarch64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/7a7fd8f284c3e74e45dbeb38b1204edcdf26aba9 | ORPH
        or1k |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/b1bf7cad69bab52b3fd2ac4490dac0f728234e39 | ORPH
         sh4 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/16ff730bc17af0778bbe94a59bf74effc2693360 | ORPH
      x86_64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/ec8fa5ab19f1057f633a82d0a39af8822c5d6acc | ORPH
  aarch64_be |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/7a5b53f16ff8639476d1f8716d5282b7ebfa077a | ORPH
     powerpc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/f46462fa2391e2d6d200075255f358cc67bdd12b | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/cc1bec3a695408fa844838959bf0cd278469fa40 | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/16f3e262c230d3218cfb3bca28b8a006ff5b8480 | ORPH
     powerpc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/8e67aa6fccc7ece3f1c4468d04b0d506980a4984 | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/98d0cd72721c5cf796b183a6cacb18e572d34e5f | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/7cb7d840426a06e7c9a0f842413838e80511680d | ORPH
      mipsel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/ee3821c30d6ca7b17d92ac84678220bf03a2f3ed | ORPH
     powerpc |                 clamav-0.100.2 | NOK | http://autobuild.buildroot.net/results/fe526c60542527112e6441e453b4df5de49242d9 |     
     aarch64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/45d0afd3c84db6bc42927d2604c9cf2ab659cf45 | ORPH
      xtensa |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/0010b457bcad7eb72be8ffcb978745b7ab1796cf |     
    mips64el |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/5eeb4a27b81ce7f83a61188acc91bd694cf63cfb |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/38fbfa5b2bd14e762e1c8d87e81d55b8fd8b69fd |     
      xtensa |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/13eb630cf50ae35c5df552a7a40eb4e3f2d1300a |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/b98b61e2d1ab6fb1f0d5742d83f013411d171318 |     
      x86_64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/fa0e56c62d380d931fa4824a767e47c739a4e6b2 |     
      x86_64 |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/f733771eaa939cda7709e932ccece0bc1b9468c4 | ORPH
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9c30c0add06b4f2d95bfb6e1695a931b3149993d |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/fa6fa3bcef85bfffc9da7ec7cc5e694bbe812afc |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7076088bb041d80fa5d6d78d59c5948f64813f93 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/799ae30649b83e8d646b2d9b4bc6436c36a94c5e |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9ba1a6547b4d479946219068b5649575d02f40cd |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d2230fe9e335a0c5b1c72b8cebb8788c513cfd07 |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ba8a4d74fced3309eaddf4e9227cb1dd2cb30500 |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/36e70ce794ff4f66c409ad5391fd2b851289cc2f |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8c933e6656e0f32a4ef07b87073523931058c17c |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5a269bfa840cc3f9212e082f05de375ce1446b08 |     
microblazeel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/086a1a517cf6c05190d22fcf1f81295885840b03 |     
microblazeel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d9e35cbf158b5db0f6de696e2cb569dc43b8247a |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/95eddc1e22774b5f71733bb450ff8999670ceb69 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d42eff49c917aa35abf8e540e49d9fa766daa197 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/95383fbdc6d3a61afd7040493e7e8bddbe62fcdf |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/312e5547c583c940f32dea69edaf53c263c379c6 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e09043c78ea32edbf606e2eee1db7669136c5ecb |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/3c7afa91f4dc75fdfbaacface3b7d0bd4dc601e4 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1524bea9b31079a792bacf66b1b9eca7d5a5ccd7 |     
         arm |                 gnuchess-6.2.4 | NOK | http://autobuild.buildroot.net/results/12d67c1ca46f069e60312d19f579a723f391db67 | ORPH
       nios2 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d206980c75c8d0076955da4784d1a6c05aa71cc7 |     
        or1k |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a9620eea71e57dc96cdac9f688167c7662d12d6e |     
  aarch64_be |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/3fe2aede971bc482ade870a764d93e3ac5e72578 |     
         sh4 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/3f7a8b458e58f9ad9cfbac42c6c553e95f871f38 |     
      xtensa |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/d14ea27004fecda834f9dc713d4728477c72025e |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/4f931b37e5c25bb82588ee6e673ae1a62aad4f31 |     
     aarch64 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/3598a84829f1d7092f0241ac383d8b7987a7ff4a |     
  aarch64_be |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/11c3c6f74e52fcf8a3b3432e772b6a40ba33fb56 |     
    mips64el |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/166aa0c2c3de8e0efe93c50c87d45289ef71aac2 |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/b78ee74bc0b4afe5af2294242cde246acdc8b0d0 |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/2b9e28264248f073cc9973bd4c7a89363ec9c0c3 |     
         sh4 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/2c604d23a147283cc157099b770e1696721d1634 |     
     powerpc |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/1112109c213402cb15812228df4681778a4a2c7c |     
     sparc64 |                        kmod-25 | NOK | http://autobuild.buildroot.net/results/ebb857eb60ca3e9a0eeebaa2565260bb71fb16ba |     
         arm |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/6dbd04c1b89f47f0a3cbbc4affd12012b9dddf4d |     
         arm |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/c1e12eedf43a438cda5027955ece7cf681bd9869 |     
 powerpc64le |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/0654c7e3a4af93c67e1f50527ebe3bd62b807829 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e86ba05188a1a77e1e56ef9f8d9a2ff69e2e7114 |     
 powerpc64le |                  libv4l-1.16.2 | NOK | http://autobuild.buildroot.net/results/597cd814225c2af9b896a1f25f98cdff33fd810a |     
     aarch64 |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/2568b25ec1d36ba2cf4beb5044485f92b2eb69df |     
         arc |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/15ceb939d861945ecadf1764d5d0cdc81a8d83f8 |     
        m68k |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/35360cd0bd0a460109400143840b51ccdc882a04 |     
         arm |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/c770b02b9d685df2bcc6e2f9624d973cc0092157 |     
         arm |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/5864a18ac1c4e6834527b91b48ac459f549ebf3f |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/aed878686eb217bac1a43eda81a09aba6f24109c |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/63b3d894a4d1a6ae250a96645d77f664d9e097fd |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/50e154655ff1174ca85a561970b3614e25271751 |     
        i586 |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/916b37b82c148b8164c929c09131b58de648fa53 |     
    mips64el |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/659207735b553f1e914c4f7b12388161bdeced76 |     
         arm |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/1a3e8bf66efa0ecfe731bb23a18e59f38a4c9aed |     
      x86_64 |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/392e686255d90048eaf16b262e50dfd9b6bf06d3 |     
    mips64el |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bc8642f2635b8be2f755dc18fabbe6cc3d6a6b40 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/126947666e40853bd581803f5ac3c61f10b72f74 |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7afe29bfdbbccd94926f89aa77c837f480319297 |     
     aarch64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b0c7b3b88cd3adf808b77013ef4193d90281a217 |     
       sparc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1cde577ad645ba7c42f4b9bb1ef0a3d5ca676cbb |     
      mipsel |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/c5266a2157508e98d2545e66e8bdd79192f1d7f9 |     
         arm |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/a427f31dcb35c3d1f0dad4600f59d196d709a0c5 |     
         arm |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/a46c1f90c5bf015f9916189becacbc53157a665f | ORPH
     aarch64 |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/8e1b8fcc006dcfda53864886465084225cba1a23 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/4bbfb731b1bf59d6efbe874631e48d6de640e7c6 |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/55f629a5dc4eaefdc57686aac38c0bc1824b82c6 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/96deb94e5f959c844060d449fae5668c5f3c5571 |     
     powerpc |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/b30993de10c909602ec2e9098a91e400fa9c91f6 |     
microblazeel |         xapp_beforelight-1.0.5 | NOK | http://autobuild.buildroot.net/results/192048bedd32faca90e1732590954296892be55c |     
      xtensa |         xapp_beforelight-1.0.5 | NOK | http://autobuild.buildroot.net/results/b10a2ff4b2087bf3d7f587616c66209c3d860555 |     
microblazeel |         xapp_beforelight-1.0.5 | NOK | http://autobuild.buildroot.net/results/164bb80f261f48525de508b5f74321f2fec91cce |     
         arm |         xapp_beforelight-1.0.5 | NOK | http://autobuild.buildroot.net/results/4659c556e258a6fe4d0e5ce868dc3a0ed02904ab |     
       nios2 |             xapp_editres-1.0.7 | NOK | http://autobuild.buildroot.net/results/ceef4c05ff625077bbf989956b02a106621c0633 |     
    mips64el |             xapp_editres-1.0.7 | NOK | http://autobuild.buildroot.net/results/938a91641c277c905e77779afe2d0e2ce92ed76d |     
     powerpc |             xapp_viewres-1.0.5 | NOK | http://autobuild.buildroot.net/results/71b5fb2b5df30e25dacdef71f7aaddbecbf8bde6 |     
    mips64el |          xapp_xclipboard-1.1.3 | NOK | http://autobuild.buildroot.net/results/bbca1f77fc5beb1878c43b1abcad64b8e35a77e6 |     
      x86_64 |     xfont_font-bh-100dpi-1.0.3 | NOK | http://autobuild.buildroot.net/results/c873138bb277a9030490966d698667f1f85928cf |     
        m68k |   xfont_font-misc-meltho-1.0.3 | NOK | http://autobuild.buildroot.net/results/f07ebc7bdfba5a8927836561785fbd553fc3576e |     


-- 
http://autobuild.buildroot.net
