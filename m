From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Dec 2016 08:29:58 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-22
Message-ID: <20161223072958.3EB8C2070E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-22
================================

      successes : 181
       failures : 238
       timeouts : 1  
          TOTAL : 420

Classification of failures by reason
====================================

               util-linux-2.29 | 111
          host-util-linux-2.29 | 74
            host-python-2.7.13 | 15
                busybox-1.26.0 | 12
                    sdl2-2.0.5 | 4 
                 libnss-3.27.1 | 3 
             berkeleydb-5.3.28 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
             libsidplay2-2.1.1 | 2 
            lttng-libust-2.9.0 | 2 
          janus-gateway-v0.1.0 | 1 
                   lite-0.8.10 | 1 
             lttng-tools-2.9.0 | 1 
make[1]: *** wait: No child... | 1 
                   open2300-12 | 1 
                 openssh-7.4p1 | 1 
                 perl-uri-1.71 | 1 
               polarssl-1.2.19 | 1 
             qt5location-5.6.2 | 1 
                  stunnel-5.36 | 1 
                       unknown | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/936cff01b7175b083183215b540e802ce0a4206a
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1ecb434946978551939b23ca88ac7da02cd9793e
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/990d4887ffb5837f7d74e1330f48dcdad87ce341
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/203c7256d37c31fe16267411c0e9f2c720a36634
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/74592e108185228ae46eff591fec57020b03257a
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/1601467373f7e91ccd7046042550fc75f55191a0
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/07ca362490ac5ef5c36021143a420e99cf54c6e3
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/62679b385b1db9c4a1e02f40a84d024b0243b98d
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/d63053178446a70aff8376be51361b16c91c7d81
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/2173e09affd1950159c23dc5f75d2e35c8204e9a
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/d39f78e5b96b6e953562493822f453e66b8d7531
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/84ced035eb7e392beb9551e416729d13bbd1a714
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/45d17f6a1d707d688b9ab8c8d47ecaee9ed6b9ae
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/32c470323eb8bb85a2a26b1fc0fa32c459d83c00
         arm |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/f544947a4dabb7214e3ba2d37cd7cc26bb1bff73
      mipsel |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/5a32b81affc978abb833c3449066d738c8badc63
      xtensa |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/499b8e9c715a66d20698381fdf2f4e355be00150
      mipsel |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/3697117ee9503bf6d78983100e51baf3acc3879f
         arc |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/2ee7ccfb1b97b303c6d72dd477f575539506c0f9
       nios2 |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/f8a42e30b29ba718919600bc5cd6962a3b488d57
      x86_64 |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/62ca038b0dca84457f992a20c75ab76d89ffa45f
         arm |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/f483fc702e17511d34e7ed1c781ac05494b0d657
        i686 |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/2c8fb29c66cdfdfe66a37665940ccc47e7707b8c
         arm |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/9c1dbdc4f4698c6bc717b0b730accab0664e519f
      xtensa |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/57a5be6b79ca1648ba1a89e9bbaa67f4406bdf53
       nios2 |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/6cec2e253a6c66cf1f561d878ef9c6d3160caa64
     aarch64 |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/5b50d49a65217f658edb43976670c6989a48774f
        m68k |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/f0390b7b1490c79a20d109fc454e78628b977894
         sh4 |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/685c6e9e15f6e4e5e51eb8d90fb0406d297ca4f4
microblazeel |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c87cf93472e3d8fbc6b9a9f1e2eb8752e8785d06
       nios2 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/7696ea33bd61e55e11e1b63a3e3aebdb80e542a8
 powerpc64le |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e81c045c5cb70c947425da48407cb1f8745a5075
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/aa6d3aa2761706ba4f33f3a71108d5304378d6ff
     sparc64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/40fbbeefa88b8a40f88e33459ff2714c1602accc
     sparc64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8af575071334224ee293bb4f43c723430e18d76c
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/dfa6c29cc534bc5ed4ee4f793a6bab72961109dc
        m68k |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/898b1565d7a84d3031f693a30654733a10013996
        i586 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/277b7615c5cb34cfbb1013d4afc8e4e4efac45a4
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f777d9042a01aa1d2f6cdb1b02515210b39eeaa2
        bfin |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/177da9a517b77bca52559229f7a315d754303149
       sparc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/55a89e35d3f0a3eda2c2f7d5df438bc749817652
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c550962d903b7b6af5592c68fb9127cd4c5b53b3
microblazeel |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/87d7469e1899120a7a2455db90bac8aef6658976
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/045edf5ec771ee621a23889d405d38223e82515c
         arc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/922cc0b2088dc678cfbeecd10957ceb2736aa2e4
      xtensa |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/af99d17125430a41ceeaa52aaee2ff4a34694a26
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/6c0c0df26a361ccc959091de759475b749c12e8e
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/863d818242b16bab128352e8dfa64f0330b04ce9
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/471b35c0b1bb400935107f4d6a5dfe870ca070dc
microblazeel |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/650dda88e223ae0efa2e9cc31025863ebc9f1de0
        bfin |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f1bdce827db68c3b6d213fd4809ca4f781d2e800
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e2a440d5c1b19c5728049e00b881e8f8e0772907
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a2332cd8f1ffbcf78729fc039a4b2e99135de933
         arc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c468b9731ffd4c00801e8c0d9a9383be4561adaa
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/3f8dba363c3385a9b47d9d1d8f1f16b4e232f448
       nios2 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/505631972ec101cdaf99f09c4cca7ea17b97eab0
         arc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/50be48f5e85b96eb0f7de0354c073785025cf8ad
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/660bdd565dc2925b6b1188fee9ea5c1cca4005e9
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/5c56235884f785c2bc8e99db6b73c739ca280222
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b3efaf5ca66432dc2d547e50e16f173fcdf4f17e
       nios2 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/abe381e05e82a3359c8de903d0344501bb9f4245
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c8041779590173e5936636b122c402dd16e99852
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2eb7fe89d06cd7267a42dff86c5bb050847b0579
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/22d380b82a18467e3cb2bcce7b0bec3d94cd2466
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ec1f9bb3612a30022ec9eb05f2445567486ed154
        bfin |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/984160d67ea8c0377754ee6681f086c786232094
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f5a4e7cdf5813183d0deb3290fd0babe09d0d8e2
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/90906ddbb4c2d0e3a514983dc59d0b8457fa4ed0
    mips64el |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/6367a7d77668c67d466efe0c6536513def472d2c
         sh4 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9a15599d83a4bdcc014cf81c0a5a870179f7baaf
microblazeel |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b3d4e1e6c7ea81c9eec3fd75744267286c4e4d29
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/294eb5afe8dd61b0028877d358c0c07b38fdfffd
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a5c52ae3f5bda246b9d867b0d3104105912ec157
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ad7cb21a0d491df5caaad7b9fd1864240f5b4ee3
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b7e1e544672f7746e7c9fc7ca172f383a1d6c9f4
       sparc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/5fc5a6f55c1183cafb8c2ed2961be763b6e85c8e
         arc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b25962c4b73845a8b9414a918ff63c004122635e
        bfin |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/df9ada7d715583b1ceb9c3141039cfa1cbe7ad85
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4889bc1d754abbf2d621256cb6f8610014f907b3
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1cbf47163baa430108077cd7edef80cac5dc4022
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a5bc58fc9dec918772effffb3c77845e3bb741b5
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4af379a1ca5ec539cab1498f4848a3fa0473a036
      xtensa |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2c4307e69ade463b1c8a89fe56dc228a024373c1
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/dbe3d69fbd36af2822cb90473516525ca2adbca1
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/26333951681483db949498081503e60aca687626
        i686 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1d666a209cb318bcef6c8e3e8160e238d32e0ab9
       sparc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/605ec4528b0eb3946320793d5856363caff3b43f
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8fe6b00244745238a3d4f59d3bf47d181fac1a64
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/29e58efeb001dd3a533b41005e126127c4457357
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/24a1b7ac3828ffe3cb5acef7b7f989399c3e71d2
 powerpc64le |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b1d4981d32980a405f564d2e20e31bb9e7769d18
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/be56fde78f41a5fb69515e54b0d750634bba9e59
       sparc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/fff61be475a3417402fd0979cdb7a4e9cff04109
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/78cefe30357b8f841072a503560c341373cce5d2
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8b8bb806c30b09204c38c4cffbe1c37dc0125d02
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ca6b6e1b8c845d112a54be39fc14c0b4259fc68d
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/be701d74e24023d76a819732b4906a33eadd5db7
      x86_64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1106a76f7b19d28376b9a38035a955eaf3ba4bf7
     powerpc |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/42711abfe850e16f44e72557888b1c1c23c6f244
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ae0a84cc84f50f82baecc65a400f87956bfaaa5c
         arm |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ed4e150e5b269f491f3c8cd2e5b720b7a313121f
     aarch64 |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/fdbb0533e22ee10eb87eafbccb8cec32e9a92787
      xtensa |           host-util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a8aa01f489e77d1e84635b073268966fc3b05e25
       sparc |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/e411f506ca5c84572f766fff43a8f85c876638e9
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/a5371e4677ee1e762aa395895d7ab4d76fdc27be
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/6868cb027bffc9d6dbd752870f22ca0bb8491bc5
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/88a2f9750004855c3e11d9bec496ac21f85f8efd
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/662f3aeae2127aab8de134de96e8f4cb4fe5bd5c
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/0c720ae23a730ac0ade62788875d91cecf3c9411
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/ae2643ab90713a9b1a1c706be3c44a647046addd
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/0b1aa03fba6637dc328d7448fd0d05303f00d1ae
     powerpc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/d04f49790fd3830bddd1042d630c457afea1af29
     powerpc |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/4fac9984eb2da784fdcb529282b8f179b9c3b376
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/dd6cd2ee428bb07bdbb4aad387de3d47a56fbf1a
         arm |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/de1874e1ecd1844787b98f4a3a13e334d4a31cab
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/b86f9c6a5295230d2f338ab34a37df3c997adaa5
        bfin |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/d462ff00b5c7f9d0b2e98db7405c198a30e29c2d
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/081040653a11346f3d553ff9ed4cb181f2256c9f
      xtensa |                  perl-uri-1.71 | NOK | http://autobuild.buildroot.net/results/c24bc4a7788c7c4f5b29bfa46898a15e85591b5b
      xtensa |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/40b2251405d26f13a74bae7666d481f0570e33d5
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/f0a4a58bea5986ad705f43a6d7fd72c288f893b4
 powerpc64le |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/fe147ed8b3f3355154b12fe3a162db864781de71
   powerpc64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/e2e63750d3fa86c6ddc426ad8684a668f59744a0
 powerpc64le |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/312624df395f21d3a9793b252e20da504efc1cc7
     powerpc |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/20dcff9a327dfda5ab24b314f8f4df18014d08e1
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/48cb55428613e91abfe8e71456182082d9eabb75
      xtensa |                        unknown | TIM | http://autobuild.buildroot.net/results/3969db24e212ad6bc638374f0a966b65c610d062
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/faa8ef7e28c87eb0a78cabfbd55a21bc6ed4f622
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8afcda9ee32e3a39d75e130b89288cb31ffaf830
        sh4a |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9f2447e873bfaa5b7e27793b2f8766e4368416b3
        m68k |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/88d6b16e01b58dc23f4435702cb49adcf53eea56
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4d68632477e35295846ee1e4d5e01a37981eb93a
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ed8de413bd7b2f959fbc38288a8bb5c96d772565
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/632431a24dfdbf9bc5db939bcec0c4d7fbd15bf6
   powerpc64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/51efa3d9c0c39ca09912f849ddb8fba309cd2c4e
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/15e7bed0190f9e73b9d54c220e3ac4e87a87a1fd
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ed827b774c864b5c1840b66e838ae05dc9b47443
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9addf6cb7805514f5d5c095d2d61f29f3d0de50d
       sparc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/49e1fc6565dffa43773746fe1b8a2d79c02d1728
         arc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a5dc7bd2e056f610d69398ef0588b1f12ac3010e
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c14611d4ec525412a96b732ea0c39884e0181658
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9674fa866e70599d39750164303d74c6d61ba06d
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e5d703df760c90011db3ffd3a46dd15542e74ded
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4a25fb0d4546391d5dbbaa6cde17c45aeddb3549
   powerpc64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c4623ee074bc3fc6a6e3d4669768c87f9870d4e8
 powerpc64le |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/5600f0f299be05a20bdaf315db0415fb86e37461
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/85c60ab7287f0c661ba68e6635e231de4313cb3c
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e0080b553feeeeb82e58de20041bb922e9b5cd33
       nios2 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f1b11ddc09a3dbca5c10f6cc8f81d3dd1c138508
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1a8143f02630758c592c0cee960d7cfde1cfe747
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/95805a3dffb87006a3b236eec37c6b58cd68d381
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/4464fd4c44a294b95f2aa3a558a4e747df24d996
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1e387e8b6b8488e0f9f9d7886b06606362fe56a4
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/118811f5d499e6415ffa653b75a5364c300fa88c
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c2f766a4025e1aa73b5e65100021c941ffc45f46
       nios2 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0ad90bd135158f8e92585d61615c9679cd693868
        sh4a |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8cd721fa35702f632e13c7cdc1c2c1ec3ffa805b
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8e4e6b0cef943babba4461772e36a2aff6225abb
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/cebb26cd75bc6b39690bd784b767a3436def49d6
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2419d2b65da08771cfabbb3738e7d140da962450
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/38ee6f9a09fd3496c5c44f0bc019a33dcdf1869b
         arc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0855de2cfe6b3b8f0caf0ad626d8aac43ad999e0
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9e5e84a78c69c4a1966d2ebcb116548034daecb5
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/fca0814e31f43f236e9e3e2950023d92dfabcec5
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/150142d9ff447cf32425e605d1b9542ec3d775bb
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b7e199c3c1a3e270625c388716308129c85747ef
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8c48678571ea39421114d7533f9038b99e60193d
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d51d6d37f89af37bcf241f145c68168b9c12a996
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/86337ef4155d29cd0300eb92831e8362771af735
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/71a2b52931a4258ae9f1d6b723cc09778de4e4b7
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/c9fe6322998769e71628d06765f206a3466d932d
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a615f35ca2611286643269af8434955713599dad
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/7780ddd5c97aceb63039e3da7c601b2f8c6df66f
       sparc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a8607bf3041165748f5056140dfbd58fb79140da
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/21d459b8209b94c2e90f7806f35b86a775a5a9e6
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/511d2270002fa6898449af4cd5957ba259d4f9fb
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/af5ce92c53cd5138f131066d7f5d19f76af4c74d
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/cf80f867a54e5295df250b0dc8f3cde6651b58a3
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b258efb8e9c6ee5a0f047cdc2e71ec172083e4de
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/307e0546d35b61ea1a372a72ce86cd2e727852ab
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/efbc107df7ebc2c3d8536aae87982b2c1fc0fabd
        mips |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1f2e96aba6d5f2f136b459a130561aaeebca9fb9
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/54f241c6a45aff5d21b96723831093db2eefa7ba
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/49b2eaf0797e2a6ce5835ec0c16b3fa943c07dae
 powerpc64le |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9faffd9548b27488e3663fcd5e441c48de6c883b
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/7cb4b2a57be40b9f749871351ad43510691f3800
        i586 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/be88430c98103110eeb380e4f030fa4a81a35e01
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/de894253c14ac11822d7e14a82c33dbbb9287085
        i586 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/8cc6ba71a53b9d517db4b6893cbab57143149922
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/7f97b54a041ff5ce4c8d422142e87cecee41a09b
     aarch64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/3da442eb58ca83522a19cfabe4c4f746f6afb215
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/98c31d5d69a97deac5923fcfd77de76c75615f01
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1c06b8eb1698713eba968b6ac3eca767c06a203b
         arc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f2da3a9a8fdbf2fbea92d1aca4d3dc4de289381c
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/6ad447701c3983eb1c3449bc477ec43d38391bd0
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d7447307706e68fdb21907557b3fa82a8f83f51c
         arc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9ccd3f52e99a467fc9cef56f76b233ca35adbcce
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/fddd1facce9680a3281492d43105ec99976b564c
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ca74ee9ca3c62dde8b95cbb16afa104a6969f15b
         sh4 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a5b048b5364d023fa0a033591b97721a1357e39c
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/472388ced5bb715bd8153207e145b26639564831
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/5499bf35794a96350cc068984d36c776073d0503
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/fc2d5a9f13f77e4166228f12bd25defdedc63e40
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/1b4007ae87855dd1472960c4d47a8aad0b567364
        m68k |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b7fdcd846a19ff65f4685c14ef9d23d4d4065a79
        i686 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d8f6508c5e1601082906c513fed8cfb07367df36
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/577d4d4a77054088966169dd11c377e55c5e9839
        m68k |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/d8bd2c96dcea0324adfefd866670a404fabae3f5
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/40f5bd8b7dc68e40e71e1bd4ec3047bc49b81946
        mips |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/62cad8e13128b918dc784b3b641c9023e7fd8491
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0e2a91d4b71f8fe94dec1cb6f7e7bfbc1d70add6
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/e06c06e71794f00fb019a4f07b97b70258573046
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/38afa34c9464bf1af5348dfc3bb346ebb25e3013
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/cdbac5648823dadfa952efc65227b391376d1274
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/459b26953fd9c9b817a3e0dffa6438f55e682526
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/52af323df268789b73a8c2ac324acfd4b26ca3d3
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0196ece6b93a443b3259e918f8ce35542cdee004
      mipsel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/ef91a9f5efccd5238346f79b12f47c92e8f83813
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/399664379c7d4ea57e53c035ad0cabb5dae70d78
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2d7a7231239780188d903c72ec745994d8b275a6
     aarch64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/7ae93bbd9f14f5c30d946859ad5395c545402a49
      x86_64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/a9e541dadae2bbae2dd0325d74a0aa8e15b86092
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/dd3988f2dee1c480f3bc0e45145ac0a9c37850a4
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f313d06068da4ae5b815f9fbb4999c8f95c6c44c
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/57622fbc4b5c54dc1215d6b86a94146b3e0e6c54
       nios2 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/9d71c935d4cec8bd785cc9b04f38797aaefa7e64
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f674353540d368d771d602108e6711fa565672bc
    mips64el |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/db0aeef6df7d50a19d584bc445722968122eef30
      xtensa |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/929791d9dfe3383962a73c8782a1711a063f915d
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/f6297566bebc93c0fecd59b5780ec358117af5f9
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/6c899c19a50f26df4d61d6b6c10adcc87cc8fd92
     sparc64 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/86e51344f6204ce7ceb383f39c9fd3f1006e2c8a
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b0d72fabfd9226d04badd603743a1907d73323db
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/99dd5c484383f1f3122ac5ff075679088e81deb2
microblazeel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2fad287bacdc462b699c093578995f0b37936117
       sparc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/bcc335576391d081078890c4c603cc938796c36b
        sh4a |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/b09230df424aebecbe37c90304609998e5a46617
       nios2 |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/0ac3daf47962fa640223138feeca0d8be0bd9a38
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/6af02cd8a4243d092b61eb394f62fe5b68d37bef

-- 
http://autobuild.buildroot.net
