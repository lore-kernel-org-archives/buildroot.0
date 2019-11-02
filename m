From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 02 Nov 2019 07:17:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-01
Message-ID: <20191102071743.6F55C8ADCB@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-01
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  1  |  0  | 13  |
  2019.08.x  | 15  |  1  |  0  | 16  |
    master   | 118 | 42  |  1  | 161 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

      glibc-arc-2019.09-eng002 | 5 
am33x-cm3-11107db2f1e9e58ee... | 2 
                  cmocka-1.1.5 | 2 
domoticz-0f411f781ae4fb4a82... | 2 
              host-grpc-1.23.0 | 2 
               libgtk3-3.22.30 | 2 
               libupnpp-0.17.1 | 2 
        ltp-testsuite-20190930 | 2 
                 rng-tools-6.7 | 2 
                    bird-2.0.7 | 1 
                  flashrom-1.1 | 1 
                    glog-0.4.0 | 1 
                grantlee-5.1.0 | 1 
                   grpc-1.23.0 | 1 
                 haproxy-2.0.5 | 1 
               host-llvm-9.0.0 | 1 
          host-waylandpp-0.2.7 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
                       kmod-26 | 1 
                libcurl-7.66.0 | 1 
                libdrm-2.4.100 | 1 
                libgdiplus-5.6 | 1 
                libselinux-2.9 | 1 
           libwebsockets-3.2.0 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                qt5base-5.12.5 | 1 
                    strace-5.3 | 1 
toolchain-external-codesour... | 1 
         uvw-2.2.0_libuv-v1.33 | 1 
                     wpewebkit | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/39c6b90f8610a06bf520d281567cf68b976f382a | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/ebbdec736e29d3d41f13d4b1e3fe40ce2d809acc | ORPH
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/2d6a0ac003124c68c753d98118fe7032dfdd8b80 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/f3d49e54dc22d7b27f22daab027903b55e017579 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/2576b0b433bf5c7eca9b9d24f2474bcf6138fbf9 |     
  riscv32    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c392489b8f78dd5d1da6e8038a7b34c39ea11e55 |     
  mips64el   | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/bb75fe67b0e43d2954810d5c2ce9f9396192bb45 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/832f3e32187a2ea2729e06c801ec540c0a27aaea |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/028fec168e98bcba981272e2f5bcf045c16cc082 |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/0bf0d7613b03c66bc5d8d5ca333942cc9d97695d |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/5aaf561352d07eb2211003b60946cc88bcae5693 |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/bbfefc7fa56137ec49b501d0adb15ac96ae41e20 |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/79a9aa11293c71a956ef6fc15f0683df8ad58c59 |     
    arm      |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/ff7e59fdb0259a3a09ef9ef1d0e2030fcab298a0 |     
    arm      |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/3a2d52eb815ff99dcf6b2ef98823e3452805f427 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/5735fff21c78700c3d584f2deba590ab125da8d0 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/7f847bc8c3756a983a2364c70fcf309c2544982c |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/393e8afe540c1f59cc1e78aebe14ea0ee211bcd0 |     
   mipsel    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/4a95e4fdb90e793efb05a64a9ce97604281ac038 |     
  riscv32    |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/6abc3e557f21da38136de3d093000a855879fa9a |     
 powerpc64   |      host-waylandpp-0.2.7      | NOK | http://autobuild.buildroot.net/results/587fb44ea2272bd134262716870f5ad36a18661d |     
    arm      |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/7ae0a713bb801033f787093ca309e5f0dea91670 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/222f0d827edbdec2685737e889718d8af5664fc6 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/d8f91d1861faa54dc540673dd3f3e4131cd4ba76 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/94d484935eaba91e1942234bbb5d5ad49fcf1fce |     
 aarch64_be  |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/39481716c699dca3592c059179628e10200d6fef |     
  riscv32    |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/04a6c81b81e70a0f38dfa25c6afceae460f60427 |     
   xtensa    |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/7e3c2dcd98be6c579be92a6593ad551b90695525 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/05e93cbeea17b42ba75d024fe0f459213c4183b1 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/4f7a3af81aa3cbb893456f6971a6852bf06206ab |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/1e28033f7e44ee6ba5cda11fd4b52a397345c6d7 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/eec4ef15627ac1eec9d8995c8d23f7723e6e9dfb |     
   x86_64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/36e99eec5796d363c07a838aa20b2c45f88ff443 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/ef21cf51611122b3626b281f38d37feb6a9ac6d0 |     
  riscv64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/74c1d0428cb45ae3206a0485623f3c6166b94814 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/c5f7508cc0469fa83837feedce69393e8acc2598 |     
  riscv64    |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/fe822383f30d61623632e7b9ce39d604d501184b |     
    m68k     |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/5eafa43f8a092593a3514f6056fe0533f6cec17f |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/764861df0ee0ead9df85c62b3aad217598f43d5e |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/5375b2487709f4a62c2233771547380ad20ec9e4 | ORPH
 aarch64_be  |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/3acdb52d469fcc813918548ac0fb84fe7fe0acc0 |     
  aarch64    |           wpewebkit            | TIM | http://autobuild.buildroot.net/results/7ac4c3fdb60f143e8a9e8f111960602ee6b3435c |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/6bfe000203e3e2189a52c7e00e4f09f50b6e058d |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180796  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180798  |      
                     beagleboneai |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180799  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180847  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180848  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180849  |      
        olimex_a10_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180866  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180878  |      
                     orangepi_one |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180879  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180884  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180902  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180988  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339180996  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339181081  | ORPH 
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/339181064  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/5d67e3e39e9f132b3171a03342a87e5179ac8180 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/8c836aaf9dccc3b3d526c71456a2fb8a1d58aa70 | ORPH



-- 
http://autobuild.buildroot.net
