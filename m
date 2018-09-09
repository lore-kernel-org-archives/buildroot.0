From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  9 Sep 2018 08:00:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-08
Message-ID: <20180909060021.F111220799@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   2 |   1 |  32 |
   2018.05.x |  36 |   3 |   1 |  40 |
      master | 138 | 120 |   0 | 258 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 1 
                host-libsodium | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

        i586 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/872a5a8580228f772f6a9a6cc6efcbc54e8052ab | ORPH
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/0b5b64b963412d000858eb5bcaabe11efbcefb29 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1731c32eb562467d1bfb6acf3bd71bbf70c973c7 | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 2 
                host-libsodium | 1 
                    sox-14.4.2 | 1 


Detail of failures
------------------

      x86_64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/ee47d7c5a1f37d24ea2504e940b976bda4630e96 | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/b4e095fa656db7d8bdde0d0c8206239d4b9c8604 | ORPH
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/6cc8fe72205791c156084bf094772bf96ff9c8bb |     
        m68k |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/e4ab31b0f2da3f45fd3c469c7547b30ea3b9ea47 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 26
                rtorrent-0.9.6 | 21
         host-e2fsprogs-1.44.2 | 12
 Makefile:708: target-finalize | 9 
                   botan-2.7.0 | 8 
              ptpd2-ptpd-2.3.1 | 7 
                blktrace-1.1.0 | 6 
            duktape-legal-info | 6 
           python-numpy-1.13.3 | 3 
             util-linux-2.32.1 | 3 
                  libssh-0.8.1 | 2 
                 lvm2-2.02.180 | 2 
                  acpid-2.0.30 | 1 
                  boost-1.68.0 | 1 
                         botan | 1 
                 flatcc-v0.5.2 | 1 
                 gadgetfs-test | 1 
              glibc-glibc-2.28 | 1 
host-android-tools-4.2.2+gi... | 1 
                host-file-5.33 | 1 
       libminiupnpc-legal-info | 1 
                libmpeg2-0.5.1 | 1 
                   netsnmp-5.8 | 1 
package/duktape/duktape.mk:... | 1 
package/glibc/glibc.mk:129:... | 1 
package/libminiupnpc/libmin... | 1 
                     squid-4.2 | 1 


Detail of failures
------------------

         arm |                   acpid-2.0.30 | NOK | http://autobuild.buildroot.net/results/2e55dcb8393211130807a5c610d5dac1338581c5 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a031c458c95043475602bc84ed50e20eb0a6e838 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/435ea8415bbf0777aad265622e6ec850c484b5d1 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/46378587588b01e06666403c47882e63b6932ea8 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/63f0e1140ca8a47762614ae40558f00cd9771365 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/485c9f3be8b8fb34dddc1b5abeedcf561e5cc9f9 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/4df69733958571488d2e3531f537a9b0fba87c2f | ORPH
        i686 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/31e63ee6c112840a988b246c7b8ba3d3beed92b5 |     
         arm |                          botan | NOK | http://autobuild.buildroot.net/results/22052e0d8d0858abdd90ea0cd98a35678daa061f |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/d948e3b2b81698fa988500a8b828a8e9ebca15ca |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/3755d05102cffdbafcffc31176205f299c127642 |     
    mips64el |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/4f676a313e48b06094a6a21469d808fc3ba411c1 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/3cdd79c4fcca807534c72515cd6de6d968b334cf |     
   powerpc64 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/771b17ef3767beaa52cd2977d5e8ae8450fbdc6a |     
    mips64el |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/634803c98f94b0c788036333ac4fbd86503bd69d |     
        i686 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/3f97a76cc1e169849219225edbde92c870d39128 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/076900d4753c834317c49669f70da29d29e2c261 |     
    mips64el |             duktape-legal-info | NOK | http://autobuild.buildroot.net/results/b53ef669d8db8eab0536a1430b90c3d51728b5b7 |     
         arm |             duktape-legal-info | NOK | http://autobuild.buildroot.net/results/a685efc764ead5ecba6852ac28406ea80d3cf1b0 |     
  aarch64_be |             duktape-legal-info | NOK | http://autobuild.buildroot.net/results/562decd93584659a7377044a154705700f40465f |     
    mips64el |             duktape-legal-info | NOK | http://autobuild.buildroot.net/results/00333dac52fd9f8e88556b071779d3b5b6ac5511 |     
    mips64el |             duktape-legal-info | NOK | http://autobuild.buildroot.net/results/bee52a5cd7233667a5f29c0d6de2e4280b9e01c3 |     
microblazeel |             duktape-legal-info | NOK | http://autobuild.buildroot.net/results/48c97eb260fc7f53da3bd4e65ae83037821e4053 |     
         arm |                  flatcc-v0.5.2 | NOK | http://autobuild.buildroot.net/results/ded34015ada4ecac2f19def60fee64ba9c1d4b4f |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/c043597d9d462cbf977efca8138187a2bc049224 |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/d10ed8b1e49a216904eb2b589d8ae2a65878b68d | ORPH
    mips64el | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b55aa69654e758af5232ae69618ba1ea5c245074 |     
      x86_64 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/2f9fb91c1dcaac9d40cccb5031e5a1d9d2a8f076 | ORPH
        mips |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/e76c0965feba5c4e68ebffcea21429dca1d5b711 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/522a6c5d5d583ab8c62cf6d11a239dacdf843853 | ORPH
     aarch64 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/be2aa9a46342ffeae42ef067eee15f4e1d6e2568 | ORPH
        m68k |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/131cc7be5d0d533c32de06327fee75d5c6469784 | ORPH
      xtensa |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/77d61c63e2c57bf3404da05ddddd36c582cc5748 | ORPH
        or1k |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/5c5252d336aca2616f2de32545330416038f22e5 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/92a36eb6a321760c09ccd495f653ce86f40ef30e | ORPH
       nios2 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/0c14664f384cad1af5d0a39ca588dac78987391e | ORPH
      x86_64 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/544f81c8f17cc1020b45c60f5d354336bd2cd908 | ORPH
   powerpc64 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/932f461af76240cf0567385f683d50c7f5b8e0b5 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/45fa90a024d4d9b6f59429275051a13bc7b1ef5e | ORPH
         arc |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/f640ae7a7f10cf4c5362f36187ec7489653bda63 | ORPH
      mipsel |        libminiupnpc-legal-info | NOK | http://autobuild.buildroot.net/results/7336aa21d9f8187854e56d9e05ffdb774b4b0a50 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1fdd9144a8c1310b0abda7acad43133016ebaa57 | ORPH
      x86_64 |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/84629f9691551bfbdc0441b55430a2656c636a8e |     
        i586 |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/f37087cb6f5ef167df8f7efe3decf7ce92f39406 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/693fe7020d325b962b1d622ff1a294b667dd59ee | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/b11e0002179a6debb41d8f0a2c59488e4b0a2906 | ORPH
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/34795acb0c76a9d14d8f11bbc6e26ddeb06a1239 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/b6d79a70d483833e07927caae412cb40ea771f95 |     
 powerpc64le |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/6b32471be199592aaa31658a4d762fa31c91cf3f |     
        mips |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/c613a24b4918de35ed26084fdd1aabc83a42e036 |     
         sh4 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/be7762acf8ffbe8cc37d1dfa5ed6c3eef5dd19f6 |     
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/d6af8748eb7f628e4afae9683f0886bec4289f41 |     
         arc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/993999fce7111d8011d4822cecb88f10b7820558 |     
        mips |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/f256f51027b51cc809ea84991e9850bbeb50a00d |     
       sparc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/e31ab9eeb60adee3dfd6380f17b4320997c97a50 |     
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/1b30f9813a4605056963bfe4532374f725830fda | ORPH
         arm | package/duktape/duktape.mk:... | NOK | http://autobuild.buildroot.net/results/02df00538f20b565082cbf8237ca2b99bfc4abe1 |     
         arm | package/glibc/glibc.mk:129:... | NOK | http://autobuild.buildroot.net/results/c0617bd25f911efaa7ca3779b62ba6d1d8aed085 |     
      x86_64 | package/libminiupnpc/libmin... | NOK | http://autobuild.buildroot.net/results/51dde9a1a7f60899a1befa24af379d204acb0d22 |     
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/2bb567d4643ac39ef216946e63e41d13caa1be9b | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c945ae05d274fd08a6c0ddbf954ebddc4d929149 | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8f0c84226dd9c855762a41da78199025178acee9 | ORPH
        m68k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/52ebb5102b551f3712c8bf4d00a870e297ae3a5a | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/cb912be14bcc3fb997f0f9b1bd54593bb6a577fd | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/394da4a9eba9cd5a83db62b222b6d2ea52ca1034 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a326e77eec4e8502b67a1765ec07a6b849c2201f | ORPH
        i586 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/78eebbd008535077ed89690dc17d3acfaa158908 |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/2ec420a42aa695c7a32e938c88401f12200300ec |     
   powerpc64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/c6f145c7150c6738ba627be7a3383dfd73bd7877 |     
        or1k |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/97851d3cfd0942262dadf91e577bb196a9e89600 | ORPH
        mips |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/7d50b78f11c3f50aae5fabc2e7f5f1b5c322192a | ORPH
        i686 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/093fb7e0d29afbab50c6aef8baaf2a1c10f9283c | ORPH
       nios2 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/b4e05576955876b3bb39fe6bd002419ffbc9a289 | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/57511f9c3b7bf4d9f74dcd8973a61cef3c442d1f | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/c8ff7e2a6b22e857d2f6489e39e07e3ad480c880 | ORPH
         arc |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/27a9e5532a3c30fb00f6d580b88fcd88bceff2ab | ORPH
         arc |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/e83877b3567dac486eb364708dd0003506ce026f | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/4d6b9a50902de465fcd44200e2a61fc753084f06 | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/0de8d283aaae7a8a504fdf9107054e483bd59285 | ORPH
      xtensa |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/9f14ae5fbb6066143a3136599e16b1ed50a6f81f | ORPH
      x86_64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/6e73f0953280e6662988eccf32ec3764e823149b | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/21a8cee8b24c7c7edb0dbe3aad029bac13410f01 | ORPH
 powerpc64le |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/77fd14d7f462340f0689ff61abd2418a0d5b07c8 | ORPH
     powerpc |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/fe22afeecf07b39048ec3bcce3474af95d757d00 | ORPH
      mipsel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/759a8cfef9196637160adcba349ca16eb0ac6db8 | ORPH
      xtensa |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/e19387ea485241cbefc0c8447400fe887e952306 | ORPH
     aarch64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/08b444c685d1286454a8bf61ca1c078bfb58b704 | ORPH
        mips |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/d5415bccf43b3f1726c29d51ff3226e6427d9133 | ORPH
         arc |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/a1e621d47f516886848f9d3b63db707831d94054 | ORPH
      xtensa |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/c215f977c5c8b2749f5db36f6c9701c52116fd2f | ORPH
         arm |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/d1b6641e5a295dd2eaed1b91d9ddb0dc51caad7a | ORPH
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0659439591b19d5270f171567d676b7f59354162 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/58f0485157bc875922c121e76c0d59345d240129 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/7c9cbef0ac39071dfd5ea52c3b66e13584bfb347 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/680c462c334b07266ae7e11bbbe1c733c0661a97 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/867071730d0fafeac2bc9e63f9338fde09cf2608 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/783d5737a67177ea721df78361920473b6084bd1 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9b3c555c5663b84f75d83c4ce55bb1a1aeaefbdb |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4b479a03b9132611b9c857f7b0c387c82ea86b18 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/4f06e04991672730e56c2384c290c2097c644f89 |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9f0dbff4ac6176434790498ec1c20b16089b7c87 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8f92cc53cc7f8e73dc036a89de1f26a467c583f1 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2154d73f28a52cf8f918d3ec0c948b9945277680 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/cbd9e727cd6b82df236d692312a616ee00680d9a |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/8122a00644810722b827cd5e0b90181996dc5657 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/93cc83e456337bea268fcc9b8880b114a05808a1 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/5527b0173bc7157d181108962400ad1a1358b117 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/cbce52267b3d9f8e5df2a5d2d1f1b8615d956b31 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5490ec1fc9cb07310f4cfba27b19058f30308d22 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/b27bd273792f94b31f1e6ee7564de01091341bed |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/374ddf768bc5d59e650721d405ac7a614a5b8feb |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/478eb587b95c1e7c2d3e128318855e54c388a9df |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/3e59eeda1582aa1560efcae7e2a23e941fe5d374 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/19d8550eadb019385b1054deddb07631be7abe25 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/4bbbbc4c2230264fa6759ad16960a63cb9a3c11d |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/667cd5e09c1049378fe5a0f32b2063f6f86d12de |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/989ec9fefc301d03d8c9a0b6a095143b72282580 |     
     aarch64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/0c7f772f7b64d5c3e5c46a4b42546083c1d0b78f |     
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/b2aadc94bfb38e1650fdb2273b5e1a9d42bfa6e1 |     
     aarch64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/a2db6ea0b3dbea10fa0c70e2adb09bc377356f64 |     


-- 
http://autobuild.buildroot.net
