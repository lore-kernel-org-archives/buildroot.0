From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Nov 2019 07:18:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-15
Message-ID: <20191116071812.247E3881D0@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-15
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 11  |  0  |  0  | 11  |
  2019.08.x  | 10  |  2  |  0  | 12  |
    master   | 98  | 43  |  1  | 142 |
     next    |  9  |  3  |  0  | 12  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 7 
              host-grpc-1.23.0 | 4 
                libdrm-2.4.100 | 4 
                       kmod-26 | 3 
am33x-cm3-11107db2f1e9e58ee... | 2 
                libselinux-2.9 | 2 
               libupnpp-0.17.2 | 2 
                snort-2.9.14.1 | 2 
toolchain-external-codesour... | 2 
                 acsccid-1.1.7 | 1 
       gdb-arc-2019.09-rc1-gdb | 1 
                   grpc-1.23.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
host-google-breakpad-7515ab... | 1 
              jpeg-turbo-2.0.2 | 1 
linux-serial-test-5d11b31d9... | 1 
        ltp-testsuite-20190930 | 1 
                       mongodb | 1 
                  ndisc6-1.0.4 | 1 
               pulseview-0.4.1 | 1 
                 ripgrep-0.8.1 | 1 
              sigrok-cli-0.7.0 | 1 
               waylandpp-0.2.7 | 1 
                    xen-4.12.1 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/bbe4079a7e48fe8d405e6a7bd0624b2cc4b0ef06 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/1f29169c8796d7160bae1bdf7ee5fc4255aa96cb | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/fa71bc738f9d6c26909d2470d63afb83540d2457 | ORPH
    arc      |    gdb-arc-2019.09-rc1-gdb     | NOK | http://autobuild.buildroot.net/results/ef87f8eb1825995b04df7adeacd5407de02808ba | ORPH
  mips64el   |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/0a184c52900431dbdb1efbcc43c68792a7310a6a |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/eee6db1c151459475573922c99981081cb75980a |     
    i686     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/84ef4ffed322de3f30da600e580093863a3562fe |     
  sparc64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/1adb42efe0cc229964708a0f2a10de53889f01e6 |     
 powerpc64   |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/49f74780569f1e19a4b9012f6263ea1a3c16b7ee |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/ef9390d12d27cbbe463b5611f6645417e9488cd8 |     
    i586     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/6d86f367c14ebeacb6ae44d09bad253c96df1021 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/d8e76d39899ea06386328408e4c8f64578508ec7 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/14521ef71eda4cfdec9e1a7c08fe02eaf7c6aeff |     
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/699e49033cfa4de2bd29d81039257c6e03d4667c |     
    m68k     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e42b7dc5c105b8b4cc4e931cc65614cb4e75c935 |     
    i586     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/8414d42ae68b5558fb92bbb35a166a23d8ea21cb |     
 aarch64_be  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/29843d6d28963e8920dbb8a56221f730f736d1af |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/48c6cdb6c13e20fb361ec4b928c943c574196ef5 |     
 aarch64_be  |        jpeg-turbo-2.0.2        | NOK | http://autobuild.buildroot.net/results/d80077b0e3469d1d98c7c3ccf61a9c04c85e9baa |     
 aarch64_be  |            kmod-26             | NOK | http://autobuild.buildroot.net/results/f87335fdfad14c09cbe39aaf7fb548ded1769a33 |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/7deba6ada2ba80d2f56200e798c0505b994cfa6f |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/86338bc428a08362d721cd08240bdadf113849b0 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/190dc9e726abc4bf81a626e5f73b5af616a8f6f4 |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/756a66f5cf76b41f3256401a91167d9a55ad4d45 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/733ddd9b627e9d85575033ce42869addfbc50689 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/ba98408858bfdf046dc66b9569b0748eca3090d0 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f0594a7f9ed369a1d3d924728a4b9bb17ac1998b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/791b44455c88ba108bc6195fcd47131e53c84a90 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/28b21c6bf5022e1c14f413dade02fcdad81337f1 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/89a56e8751c9da5c3b599e716b055bd0a6f01221 |     
  sparc64    | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/088eb8c81bc3efee98db7e8832d3fd633fa12145 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/a43def025d44344a4a690b52a52b3959e20b5d26 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/e53853596657e575ed1b7514c0de1b619e8c09d0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/95f62253bd6371645f2ece1001f8ab1bc07dc441 | ORPH
  aarch64    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/3229baccf88943d9dcbca315c1e9d8d795038cca |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/8f609bc87a8b8fe5aca3c1d3b975173754da7d43 |     
    arm      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/39e6308cfa5b2a22a783dbcb3cccc6da8fdf7a8c |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/8d7cb61b57f3bca112cd40365cd88527c332af62 |     
   nios2     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/df4c983b0a9bad295dde15c3e2bcb6451d2cebe2 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ff0ac2152d56e870860145c06db02486fb436e06 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d28feafc3a0ced0b3d812a9071c628a3a9a6fceb | ORPH
  aarch64    |        waylandpp-0.2.7         | NOK | http://autobuild.buildroot.net/results/01aa19e98d0c5de2d11c78028c39e8fed0a0ba4e |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/1c5d069e0a38ae7f06f38f1bccee61d89c5a3425 |     
  riscv64    |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/a591f72cd28b992d179dcf42717fe3fabff7e20c |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/351579544  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/351579546  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/351579609  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/351579628  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/351579631  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/351579712  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/351579765  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/351579910  | ORPH 




Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/a1f0cd762fcead0a6dcdc7b38302379ee1127d8e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7e60816a255b3935cb8ec5ad6fd5d46bb0ba1655 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 2 
                       kmod-26 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/c644488059d80c43022b68d9f52966b4a3d5eb58 |     
    arc      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/f5384b2adff491b689e0995362a06d232bf61414 |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/c4f4f8ca2d4f36f77bd82673e1697560512d4fbc |     





-- 
http://autobuild.buildroot.net
