From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Dec 2016 08:29:58 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-23
Message-ID: <20161224072958.29EE620717@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-23
================================

      successes : 184
       failures : 225
       timeouts : 0  
          TOTAL : 409

Classification of failures by reason
====================================

               util-linux-2.29 | 102
          host-util-linux-2.29 | 77
                busybox-1.26.0 | 14
               sdl2_ttf-2.0.14 | 7 
                libcurl-7.52.1 | 3 
                    sdl2-2.0.5 | 2 
               trousers-0.3.13 | 2 
               wireshark-2.2.3 | 2 
                xfsprogs-4.8.0 | 2 
             berkeleydb-5.3.28 | 1 
                    gdb-7.11.1 | 1 
             host-nodejs-6.9.2 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
           libmemcached-1.0.18 | 1 
                 libnss-3.27.1 | 1 
                 libraw-0.17.1 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.0 | 1 
                   mpd-0.19.21 | 1 
               qt5webkit-5.6.2 | 1 
                  stunnel-5.36 | 1 
                 synergy-1.3.1 | 1 
         systemd-bootchart-230 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/13f9bed806b5e1c9d9f0f95c584f0439bc675cf7
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/807ebf7b46bf8de400d430bb2d408a8aa40a125e
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/4c699440d08b66b3ff1b873b35a2ba7aa7079bb8
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/df2826822c8e116eca6159d838c5abe9cfcb5cd3
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/56556827db9071d47cae920be03c670fff1a9318
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/5d5733eaae948f2cc6151686ccd4eaeaf28387e8
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/48dd8fb33f98036c09ec90f470973269a8ba3a34
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/616d5ce72e6994353a56b52cfb7523bfa3270101
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/d15fba7b40be6969c5445d1358914a6bd9900bd4
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/5e826c41ce424c01490e1dd82f72210711a06a41
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/628c7e8883b51e612ee4a1e07582d50f046eaf3c
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/fc4efa7223133e856bd14ef375d1dcc7cea5aeca
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/976556791dc86bd07dbff326c6d9b61d8f012953
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/3ade1d7d2700d0d73dbd68dcbd2e727ff93c52d4
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/cdf163e534127fab8c4840331512c7991685bc0d
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/484b10c5a66d43a22a11962ab997184aa0503971
        i686 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/06633bdbda5e6aa57c4ce300449ac9a1565f591e
       sparc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/00df574240a0bf356d1827987f3cfa4bbc71be1c
        m68k |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/de88fa6ec88ee7475f14d2eca075c4312752439a
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/32c3a7c255e09f606ef1d6762d83cbcd421b43c0
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/dbbabea52f47783941f8f4c8f39af456a02e7e20
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1849bb255339b008bd0cd9431c364f88105d0936
microblazeel |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1ac568f28191800a7274ca7ae1b7c5ca0001cfab
         arc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ffc901572686bf430b1b820e303b873e372860f0
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/bf079b073930e654da09f2a72f65bce810373b85
 powerpc64le |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/eb39bb41cce0850370977159ba2bde9e2d88bd3f
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4191b6a33902cf3435471c727b1ef39a88b04a39
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2dc49efea5d2bae9f2dc59bddd279571a148db4f
        i586 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b3168e2615b764ba29fe55b9a2c1b2d8a2d8aa23
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ea58a6af16304a899216a6c145cf2115c9af383f
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b3e1f81b2ee7cc7737272b34baa65aed4ead3dd5
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8a70f55329019d064e3819e3ceaf481332c74532
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/001ca839b550e91cc406b2973d558d602bd8f058
 powerpc64le |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b84a0953c033aafb3964d6a07de1981fa913dcb3
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/5b3f8aa43716206b59e74c500bd0d0c4eb157088
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/bb569b8f08a2627283da5e432da75bd80239ee05
        mips |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/965d422a25f18bc4ccbabb8e99b424ca9f5ddb04
   powerpc64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9c84f26d0e7580c2926e3197ba35951130ca288e
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/3467a040a8d93dfd6d67b3ac1e358e98293db302
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e7cf60247e3ec3f04cfdb7af724a0507470cf8d9
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2b84e114ff84d417c5dd75178d3d35fd55179b5c
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b0440c1995b0376ca7382e31e6b5894097ceb946
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c30143278ca8a61679929dfb76ee755c31d52d01
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/51dfc1eb24e7bc7d0d22b756977619bf9d470f8d
        sh4a |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/879a54e86e972239fbb9b76c4ec77a84656414fb
       sparc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/5b949e16de4943111706630be9cf930db3df5c4e
        sh4a |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/16ff21c633988a9ca3b6c18e322e41f12df2bb0b
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/257c7f9a441bc9d6b49d1dab8ea80fa8739c0a71
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c8f6b538320d14f05bcfa09a62e60fd8f547e2d0
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/3fd01f678a87e483f20308a113c25b62829af1b0
       nios2 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a07329a8ddf1407142210af402e506bbbcdee99a
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/14a4906162dda7fb8ad10a673e50fb69b1e8352e
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/63874a9985ed128ca64e78ef0a296800ff9a947b
      mipsel |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a5c2a215698ae46fec4e5a4ab61cc0a35a7b25e5
      xtensa |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0fcdb94a044816c070101d13964d6d6adf90e280
      xtensa |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2239f776efec8ffe507415f9a28b3eab089e2b3b
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4d3e355ef2858d9dddd131917556910bc864afa4
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/49f35d9a602786502cd9c49e74e85c864d7a8b84
        bfin |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d554f584be8c3ad6419361d7b1f0bf15ad1ae175
       nios2 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d1a2546eb8bed3ab1142c917c11be263dbdaade1
        bfin |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/6f44b0194e29bb2f22f72b38aa75fa00824a4ae9
     sparc64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2fc27bcd88b2ad8b2c2e32d4f6cf264b5f07ec93
         sh4 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/6ce54af3c7ba45f0ba1d556b0aff9b909a0d26bb
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/dc1501b8e0286bddfb867e045a3fb0e8715587bd
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9a2a1985a21caaa7de4e9a0894aab6d8bb60ffb6
         arc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/801e6b3dfb46fd03222ad564afa4632f3ab85413
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c4d8576ee999a3ae33be4c15ec8af1ea19051d55
     sparc64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/20033ee307a8e7f1706e5cca2b36057c7444041b
       nios2 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/43f6ca25de78b849dc56dfc450a929e16ea16262
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/462ba6f6013629ae916a1fcf16b803e478c1e3e2
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/daa06d00a80283ca86efa43bb95dee334f23dd78
       sparc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/bc966afc48b3b5edc7be89fa9f47d5607c75e2c5
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9e2c13e2f7c3d99d330f426d29953384591438b3
     aarch64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1124707270a49ec7d1744fe717888846d2560f30
        i586 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/46aebb52fce34d150bf7c168c8b6589a92997a17
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/085253cc24022d50c031e0d93a2494663c6a0fe1
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/347bbd3111baed71ca63b27f7c43f218e7216c7f
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ad9f7051624786e52c81d7b1045d8226f79292de
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/dd8fe6ab2b4dca37174dddb0dbf59e3840337729
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/de2ca653dca49902ccd6e24283c05d48b929c724
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2beff9b60efbb3fcb0101ecdd9611f53e14bd5f6
microblazeel |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/65595aa787498087a9a85c9cd19135396b246afb
         arc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/6dd2b3f19571c5fd759b80b1e5bba1ade3656dd9
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/bbd3f556377b802427eb9f77cecf9ad8523a917e
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/88ba65d0349729889ea8fd338def367543c53d93
   powerpc64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/bbf063d46bfcdd2911acb050b9fd813c00de8b9b
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d6fa673b2b277c992e9b618189c752225773a30d
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/3f3e79f4754f47e5e65266730df7e948279277c4
      xtensa |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/7eb0c01a39726751a249d213e90e73b96e73348a
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/436802322be927ae5d76761722b37bb3c2ee9f01
        m68k |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/088f1fd213106ea1796d2072697ccff4a331bb05
         arc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e9623d0f43699cbc0b6dc890b406776554f21b7a
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/392bb35077ae2324dbddb43ab2e0ab5cbec30616
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/489a26067f4a112c7dda708c3fc963022366651c
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/9903055ca466f2cc34e9d7aae5883977df7b5a31
       nios2 |                 libcurl-7.52.1 | NOK | http://autobuild.buildroot.net/results/db2ede8f6fa1709bac203d45edb5b19840bcee04
        i586 |                 libcurl-7.52.1 | NOK | http://autobuild.buildroot.net/results/e6c868b4d2b4a06f8fe72747eb28f66d7c777df6
        m68k |                 libcurl-7.52.1 | NOK | http://autobuild.buildroot.net/results/c464671db0b7bc4c03268a8bc8336317f5f44ddd
      x86_64 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/dfa2d6fea6fe9313fcf3b5642eb5674ba64e0657
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/36f2deafeb4a966b9857dd8938adfc2c2e3949b6
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/fb29dae8da3e2acf994a2c82c28775bcaf9cd7f6
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/915194fdd5049c62b556f79ba3040d6580872dff
        i686 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/525673416fccdfb4c649a566966430a9ea72d675
      xtensa |                    mpd-0.19.21 | NOK | http://autobuild.buildroot.net/results/494cd417eb375cf7089eac5390e09bbc46da82ed
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/d2dcc1d7461abc417a9519732e381b1072e10221
   powerpc64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/3dcecc13fc78f7fb6aa1d5edb35b93a375f1e8a8
     powerpc |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/54c575d95cbae72063eb3f5ceb408e6152ec8eb5
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/b86bd8e23d3f2a2ac4f123962ae503f3c038c574
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/8f2ae402eb9be614725c8e9ca0863c2bd3601ac8
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f02c342accbf2f29baeaaa8d2a6e007c22073323
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f1499cbd230ea733dda0059dde7ad301c12318ae
     aarch64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/29d8bba290af99e1d463dcc818e79c247d8562e9
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a7086b20c9fbf1020b3c59939341c55a9564fc98
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2acec9c76f7c394032b90eed3d4d6863c15e9941
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/dfe7c82c7976912378e33e03ea4c677bee6a778d
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/5215bdbe8852356478bdd1d543929ee04975ed57
         arm |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/aca210de7d3f2eda54e5630206e9ff80d72d85c5
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/01f947b8f3da93fb8e2d2f2e7dc62c0289d9ac68
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f871ad8798b2adb416d35f17b9392fec6170eb79
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f7aed49d05faa12d75131950c38db126309a65f7
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/52a4322da54eed2d95d473ef222a44ce7869643d
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e903a50afcfcbb920cd941e2f1e7c62b41210954
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e9779d5e3d0d1264928c88e71885457d515cd875
        mips |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/41eb00811462ff6b2037bda21cd92bc4058ebfd2
        mips |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/fb32739ff08466f8715919b77e08f51af5749e6c
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/269206656688641fc2cb8b1773109de08f050fa2
        bfin |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4743c754eef229adc6ef31cbcc7c156d6fadd9c3
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/7a7d68c2e3e54085d32a078bb1de8279fef1e1dd
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b1b1b09ef38a6144949dbc8dd7267cb5caa269f2
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/349b7511ea1596478e6f6db87d6df6a53a64d0f2
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ad7c4e2fe68d12911bfd902cdf48f6e64bc63965
        i586 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/73d2a91a702bc99fe83826badadc002a73318b4e
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b9977fe6d4387d244539d5545bf05d9427e8e8ab
       sparc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e1d58f005d2f28d457e0bb1cdf5e3d1c4dbc64a7
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/19de2a0b12380ddc86dbba0dae3a3877b25f83ff
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/66104f5c0c28e5029bfe11a080e2de997fa1b281
         sh4 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/16232ef290acf25ac6cce35d418921fd9e590919
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/3319350a0be246bd9b812095952b71d7be720ffa
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/fb247719147b179ea594bee9041b1e39fdc32802
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/df7866934fb4db5db65db398358afd650db0c250
       nios2 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d6d8705fcb1ba4b66d9fc7b67b033276a7bcb72a
         arc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/fd131cc20e212cfaf4e69dbeb9cea283c91254cc
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/56857140f2e8aa5f2bcf3c223715ed40fdee8f26
        sh4a |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a79ad5810871ffbe431c9de3e942622b4bd07bb0
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/03ef14477b98d798555bcb12a59c3a47efdef472
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0a435e4a239fce962e3f1f76cfb3b5ba2b3331f6
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/23cb3b9558fec5fe76bdf748a8ef16e8e53ced02
        sh4a |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/398863348e0feda09fc2e7006d2b0456a78de549
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/67077402e534599fd3129b2af41defb15d6b1e61
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/665816d4b70214ae088713945c59a7c373602413
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/507dcd7b7e4a663e870cc956d48429b80397b622
microblazeel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/cb934c70d3ff54762ce495dc38e3d064b022f20a
        mips |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/512cd09fbbcf8821ae1f886d3dac47d9dc3a4303
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9794a601a6eea722465c87bc3c2817dc4ce79c59
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/6ef5a564d1e832e6daed2031fdc4841b90fa4c24
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b3a5a57034d6bc63da8c9e78dc0f4827914e72b0
        mips |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/5e102eb4291881f7344b644f57db79e64f93f4ac
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/df9d3bf13bb80fa4ff35c56e0217fbf018a33bc4
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4d307016c326f016e9a3deb70c373b6ae2b074dc
        m68k |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/261d81f76ba6e6a018194430ba6f154dca3a85b2
microblazeel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ef2e8313e4c1ab9637c9f0facbab004c1029bfc5
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/5afb3a884521d2c79b4f39301428517f1d6ed98f
     aarch64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/577ec319bdcea28d69b90d89b1f1bd22a68520be
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/24c627564d404e1ab70ba6c450a02142d889d59d
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e926a26ca44df93db570d2e367a4f1bc3ba1fb04
 powerpc64le |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f273ccf6d2de3d7ea236b049d81d94beff001487
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d1c04e01a41a26d40cf7b1f2736fadfcab2b423a
         sh4 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b59cafc7d210940350dfd7ca891a7d33b38fed51
        m68k |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b268414865336ce09b9272253c5ea5241f83915f
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/10fb6a7ca3623fdd49728a8f63c21ed8836a0abb
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/fbe6ac6aba37fb3db9e41196f98e56c1d87532f7
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/219ddcb798d44dedb1ec036e885430b1c37e4e0a
       nios2 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/024ee33875660320cf4f52073a0bf3d66f3ffe23
         arc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c39d5400775a572a950c7751c36a2d727882d907
         arc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0c1be52d81053bfb00639ac17fb39f8e2b3bf9ad
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/93b9685de6965eec4a120ad1a52218d411a09281
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/283953e58e7921a44e7da85689e547714cb38e85
         sh4 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9b382a6ee3fd08ee8ddf2a7b2a4dc7e7d4ff01b7
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f22385dc9a24732d353e27ae7b749c468ddd1431
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/bf23be0f7ae46b8a6072f8965519abff77959ad3
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4099d54bbe771ab4e8c13cea9e65d4c42941245a
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/166149177c8411ddb63f1a74a2640a513d479ff6
        sh4a |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8d3adfbc976472eaafb1f6de84fbd5cc385eaa18
         sh4 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/21aea37ff13fc2f0d21865c427dd0b1833878563
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c4d7dfe0ea0703c47c7cae4abb4138d784a7df9a
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/52cd71e80fa0d0baf321e3a0b67238202a7708a6
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/42917373d7c82197c79a822fae64219fd24c1d56
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ab9e3da99b4fa4ed519c30fb84aeea9843a82c13
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9fc85432c0a06a5cd03f1219b4bb1d3d8a762f75
     aarch64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/3f80e61856fa7493141aa9c499a63c33ef960939
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/284773d8b7f7c0e61f7ddca0697a5ac257fddc62
         arc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0d6066aa05872b8b239e1e4d452b3e4fcbbea33f
microblazeel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0fe0617ffd01d8966fcf4fecff546fe06c7f0621
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/3c38cd2f7595709237f41d9f60a27acc134de74a
 powerpc64le |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/42191cb44cd4418e94cd36d2f14b1ef4700836db
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/5ec7861da2bf3d0d7358b749b06e43d9dabde995
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/da16f25b9745838d98baca0df52303de433d1cff
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/36873fe3ca975d72a516a2d169ba9fc1613fb471
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f9612d1841c7de40e7df0cf051d731cc8d9ab9df
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d9a4c2dac9ba5ee912f6d6c8864a47e971120b37
     sparc64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ddef9cc7986f187187f708227dc5d49f44d5d4ce
        m68k |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/711347f4f9f136afae2cba327f4cc54d47d2545e
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c409120874714ab1869254529a1926ea8e45b654
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/bbfe67d1d4731ff6aaf70ed5aa042e5778152ebd
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1b2f6600999153598e1d49fa7da9014c95776c16
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f3a62e021e79a5f7852d97e6d5a56a6520dc39a7
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4158496f4974faea3d5711ac116c9a1e9668e99b
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/bc3f8bff900b692b2a21be1c93470a1391e975e0
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f4ae5d8cfcc28fa4ba564076153a27c315e8c72e
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/27964d2a25ce441d89cd6084fa71ce4b4eded318
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ed410841c789e7e262d937673df0d782d2a50a93
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f44aa31b794cb75358cdea2920feecb70bce9324
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/76162e2e0ddf4cc88aff3ead16b5e79317a9f41e
         sh4 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8647902e6daac7844294973e99ad7c2c69baef89
        m68k |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/190ca5c79199bb329d3ee4925ea3fa97fb23da40
         arc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/27114e5e4029593eae548c06e3c5a95c638f1476
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/567946336e77238845fcaea9d84669da1fd785be
        i586 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c409917b541a14882c85a4e85b083508b8001151
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/89cb170dce70b8edd75f372a86a8642184118e00
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c15ea3116fdf90f4fc7201c18655a4de7f8bf8e9
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a13994307bea096befaba603956ea33e2b76ea39
      x86_64 |                wireshark-2.2.3 | NOK | http://autobuild.buildroot.net/results/4afe968e698f62c6bdbec35e53d35c361c5e852b
      x86_64 |                wireshark-2.2.3 | NOK | http://autobuild.buildroot.net/results/81a5fe1d6fbc8cfef47a74480da55c679f30529d
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/c6cd42da1abe2936872da1f9db093ffc72be3c15
      x86_64 |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/1c817124dc7ab458b0995efc1da94c4a97f3b06c

-- 
http://autobuild.buildroot.net
