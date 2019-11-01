From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 01 Nov 2019 07:18:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-31
Message-ID: <20191101071825.42F96868CE@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-31
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  0  |  0  | 17  |
  2019.08.x  | 13  |  0  |  0  | 13  |
    master   | 142 | 68  |  0  | 210 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

am33x-cm3-11107db2f1e9e58ee... | 5 
                  cmocka-1.1.5 | 4 
                libselinux-2.9 | 4 
mmc-utils-d40ec535b9d4e4c97... | 4 
         uvw-2.2.0_libuv-v1.33 | 4 
domoticz-0f411f781ae4fb4a82... | 3 
                       kmod-26 | 3 
                libdrm-2.4.100 | 3 
               log4cplus-2.0.4 | 3 
                 sysrepo-0.7.8 | 3 
                  flashrom-1.1 | 2 
                grantlee-5.1.0 | 2 
              host-grpc-1.23.0 | 2 
                libgdiplus-5.6 | 2 
        ltp-testsuite-20190930 | 2 
   openvmtools-10.3.5-10430147 | 2 
          python-web2py-2.17.2 | 2 
                suricata-4.1.5 | 2 
toolchain-external-codesour... | 2 
                    bird-2.0.7 | 1 
      glibc-arc-2019.09-eng002 | 1 
                    glog-0.4.0 | 1 
                gnuchess-6.2.5 | 1 
host-gcc-final-arc-2019.09-... | 1 
               libgtk3-3.22.30 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
           libwebsockets-3.2.0 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.12.5 | 1 
              sigrok-cli-0.7.0 | 1 
                   sudo-1.8.28 | 1 
                    vnstat-2.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/b5601866491eaa09dfdb5a6ee78eb3d8b0eb5ea2 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7b83dbf54ab29003da325730599a87a0585c50e9 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/cdd98c5312db32f972a0264facfa9402abcffd4e | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/53287f7c8bc6aea36f5d54c37cc724c28426c540 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/5750262a39ca91e2cbe1911d4ea1dba163eb53cb | ORPH
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/d5c5bc0d853e3bb94fe87c0a69b19723124b46af |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/56718488ae3cf1ba82cd2b6ef9806ac970b2787c |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/29321d78bf4b8cf4f4c06997c53a6de56518ee97 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/78b7161e3149c82cb90aa2c8e26b65058273f393 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/288c3786f9b8be7aa8a2ac782b1805ad639bba07 |     
   mipsel    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/d8eaf41638b857a979aa1eade04054fcfd5009d3 |     
    arm      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c1cc79fac9ee1dacf67fdd9b757cc4f083f35fa7 |     
   mipsel    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/a9f8146ee0ee6ff9737002b101573aaea51ffc3c |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/d4736d7eea5fbfe10c9db3635e9f977122de9405 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/972bd0972b20c2a1d0c9140d4f95bd555d44480b |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/b8d8c2e4d6a69452b29c1ce1b0b427c1f9d0afda |     
microblazeel |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/761e8617617ec7c82bfe53dcdf253304a5ce9820 |     
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/d08ca4413f99a2c513e699b38c566122cbeeeef4 | ORPH
  aarch64    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/918b7e7602e3696630305325f77ea5fb698b8049 |     
    arm      |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/7b43b10ed14f0865460a455558d8caba96737ddb |     
    arc      | host-gcc-final-arc-2019.09-... | NOK | http://autobuild.buildroot.net/results/7305e637ae21af226a3d790bce38072415da8d65 |     
  powerpc    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/382a0a56caaa13a1c052988023302abd1fc1446f |     
   sparc     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/8950f7fcd81dfdeec449a93dcb862aa3a07f69c0 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/fcade5050fc0b72b2a820640a13dabb9923e288a |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/1c6c51b8b197dfa8b59eb941d688e6bd7f308643 |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/4db7a55ee1bdf290e5e4107bb945987278d96453 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/e05b265359b13eff55886459d134db8ac6f61fde |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/0cdf3af7df5b4bb9ffa517eb5a91d3421cbe7ef5 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/6379bb122f5df8a2a8122303d6d27e510e2b9cd1 |     
  mips64el   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/38682c6cc334a07adea36850fa8a4a99453ab03d |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/127029f81d25801b54bc1bedaa14f998ae2f85f1 |     
  riscv32    |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/cb7f08e5c64f5480eb310038ae1dd1341c03dec9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/84f7349f9ce6ce11fe05e002dcc6713608f76630 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b48053f234c578d3ec6942305d6cbfd0f24dcef4 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/341d48959a2a743a8988b60de94bea40fd197dfb |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0f1cfe3fbd6a42d88bea202f96414f15faf2c196 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/189cf454d9f0fa6ed59253b170a32bb94a37792f |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/1c3f20f1bda61b1f590c2fca79209eac84dec4d5 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/ac49896fa676e9b1053824d1570a8d63304ba663 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/535d1c456173d90dde8a82cf38b88c389c345393 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/37f6fd948ffc82ad2467a0481cd23c85227e9e45 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/4e3a08aec763f4cbc40c73a12c6f9aad7c625b10 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/3b70143456b0f0e0b9a4b1132fca04c8aaa4d2f1 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/2153d9982f3f076e4a0e3c7d144cf4df18be0727 |     
    mips     | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/cfef9315441b5f4909b58a6dccd8bea8e67ae992 |     
   mipsel    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/6e76d6808cf0a6a4d7148949e0f0f5c11a1f9eeb |     
  riscv32    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/45afac5c1736d304d132e379457bdc329dbb3b9a |     
  sparc64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/9c3e7ba7cb20fea010f98833490cb7d52b917f4d |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9c67acf77fdcebab1e50d6c1b42475efcedec82d |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/7d674af6314f2a67121edc676dc8e5143f1d326a |     
   sparc     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/a471b33e8a9803dfe8b36e83647c98165873ddf1 |     
    arm      |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/88c9f848b034e35ea50bbf49161dc96e2e06b6ab |     
    arm      |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/485e120bf544f837e6a1d34c606be17bab3c2648 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/87ffb1411dba80a3b3d029dfb06e7c8f3c87e2dd |     
    i686     |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/8062953d761464cc41c71506422766af5477a96d |     
  powerpc    |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/f85bcca99bf09999af0f6d041c16d839defb8674 | ORPH
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/905a72beb4723b4d6b5da71d928d9ee9114978f4 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/991c4bdb850026d7992a0b6cb3c790cc8f58a1fd |     
    m68k     |         sysrepo-0.7.8          | NOK | http://autobuild.buildroot.net/results/f0e4368977f257d76aedff335af3068deafaf28f |     
  riscv32    |         sysrepo-0.7.8          | NOK | http://autobuild.buildroot.net/results/bcd9bdd3bc83c1f2ab0b24348d51de27d88649b4 |     
   sparc     |         sysrepo-0.7.8          | NOK | http://autobuild.buildroot.net/results/d807f3dc922a61e099a66de3bc340c018a86e150 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/e09e23a41f96621064880ed1c58f2c18e0d88357 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/1ba8974067073249b8da9055fd7221d68e165370 | ORPH
microblazeel |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/b2292e5fd0a73d199b47cb8360adefcff1019b59 |     
   x86_64    |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/f58a1d1a4ffdaf94fd0fcb4dbebe1e898f95638d |     
   x86_64    |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/189e6f0d1acab18ab4027e805823d06243754888 |     
   xtensa    |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/7870883d3fa0b24acbaa349eb70141aaec7da0a5 |     
  sparc64    |           vnstat-2.4           | NOK | http://autobuild.buildroot.net/results/3aefa8d63f710b71720fc114450110d2f885820b |     



-- 
http://autobuild.buildroot.net
