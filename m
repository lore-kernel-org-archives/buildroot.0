From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 09 Nov 2019 07:17:30 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-08
Message-ID: <20191109071735.A4D1686FB1@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-08
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  2  |  0  | 15  |
  2019.08.x  | 13  |  0  |  0  | 13  |
    master   | 95  | 45  |  0  | 140 |
     next    |  7  |  3  |  0  | 10  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 9 
                 gerbera-1.3.2 | 8 
                 haproxy-2.0.5 | 2 
                     lxc-3.2.1 | 2 
                    mpv-0.29.1 | 2 
           oracle-mysql-5.1.73 | 2 
                 ripgrep-0.8.1 | 2 
              sigrok-cli-0.7.0 | 2 
                   sudo-1.8.28 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                    bird-2.0.7 | 1 
                   grpc-1.23.0 | 1 
          imagemagick-7.0.8-59 | 1 
                       kmod-26 | 1 
                libdrm-2.4.100 | 1 
                libselinux-2.9 | 1 
linux-serial-test-5d11b31d9... | 1 
           python-numpy-1.16.4 | 1 
              spandsp-20180108 | 1 
                 uclibc-1.0.32 | 1 
                    vnstat-2.4 | 1 
    xserver_xorg-server-1.20.5 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/a7739a407a946516a7845cd99b7020f7005e2a47 | ORPH
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/1d48ca696599c4449185d7c0231a1ae396356b2f |     
  powerpc    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/d49700a009147cb8bad45339e996ffd83264f452 |     
    arc      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/df080fb30a605378e24e8efaaa2e6cb90f26bd26 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/0f70d6c0d10d35cdbe4a169762265b21603d312e |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/b498258d3fdec42a3bdd51a1493437b2cc1f21ef |     
  sparc64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/105a85d0f5411b47dbb9e82c45b417571b432e1d |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/9b1fa68337d4b0a2a20aa32ee781e2ec22f7ee65 |     
  sparc64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/d65ba2296598baa05a7befb19d8bf01ca46a93c9 |     
   nios2     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/e1810cac8c4b23d28c0fc63340ab5aac5a9c4a1f |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/4de9550742a86eda47aa453583e8661efd3b9aa6 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/3de383a31f990fbe8c23d39cbceced9bed0d60e9 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/453f3a671b143ba3c88a109095b9752b4cbb443c |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/3cfcf4f3cb05184bcea823d8402f7f62941822af |     
   xtensa    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/b4cadf5644cec9049035192898e171ad9c736880 |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/817da69a3ef861294189ac55bfc11e0f8f17c015 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/5f6ecdfc1b941918d851977e8967dbed491c80bf |     
powerpc64le  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/f999deee6a9179351ae43511e204cd13761163ca |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/494c44af1875c2cb5e3c63a39d4cdbd31c43ffef |     
 powerpc64   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/0065209de2ba376fd4a76a941d9c2fdb6d3cd219 |     
 powerpc64   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e259e7f0bd3bcd1b485ccf58587384a4f6518df8 |     
    mips     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/b7bf4e33102b3f5142e618f5b19a573fa5bcfdfa |     
    i686     |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/c5d9753b9c915d8d489aaf1c9fb863dbb13be615 | ORPH
   nios2     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/4ca5370bdbef9ae15af7d13afb11642141f79d62 |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/c83c9b8907e83b9ca575f079e8488a72aaa30359 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bc35f9647781dd6da217df7259e69245801bd9c5 |     
  mips64el   | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/1350cc46dcb285772b1a4c90aec6ba38fdb11e3c |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/e56bc86036aa588581972827a485355c67c7b48c |     
    i586     |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/3fa5b2c7613d9e4fc487fefdbf94f69d4ff6c6d0 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4a884ec3a971a7ce961fb97c192dcc77d1728c6a |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/212bd2d860ecdf4a4b79d0f0697397f395d97a9a |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/2388df50837f8607cacb06cc0743cf64576c8698 | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/59340d1df630ae8beb0131167517e73143c952ef | ORPH
  aarch64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/8c906edbd1e22b99a0fe664f1ba111d1d84f40e9 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/4b2110803b1366c966d632693bd7a898da1b61f0 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/9d36b7b6c7e7245702d6c031c207d25094d419a8 |     
  riscv64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/1b77c54a1af1250c24d37cf6068c7fc846b8ba33 |     
  mips64el   |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/079e5ba733df6774b1331732f5f6723cc7bc90a1 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/7a0a732170e12d72453c336552bf4d524fa1c54d |     
   mipsel    |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/0cfc61a98760c1d3a98aa0f1e126767881c49abd | ORPH
  mips64el   |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/b3923d62c3164e914c64d86c8f71ca3e67d4c282 | ORPH
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/ddd3738791ae37695166afded47db31153b8e936 |     
 powerpc64   |           vnstat-2.4           | NOK | http://autobuild.buildroot.net/results/9a64aa63bc215f94d9c7108255478bdf79c1f8f8 |     
    arc      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/d732a1b06b305997267ba7b4721c273b9c94e6ba |     
    or1k     | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/eba290189db7649a533a17715d96e50a25db0031 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/345263277  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/345263279  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/345263323  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/345263336  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/345263341  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/345263426  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/345263513  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/345263650  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             qt5wayland-5.11.3 | 1 
                 uclibc-1.0.31 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       qt5wayland-5.11.3        | NOK | http://autobuild.buildroot.net/results/b135c06f9136bc452daebab991e3dfe368bb0485 |     
    arm      |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/8ffe3352a393f6e2d1c28252d1710a7c9a5c7678 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 1 
              host-grpc-1.23.0 | 1 
                       kmod-26 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/0d1d29b94be02c3b49beeaed5af497f878df4e73 |     
   xtensa    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/939a62ffb28118e8cf1a078a238344af24088958 |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/d2231669a3ff6bf3c496ac29ea54ddfec9f2acd9 |     



-- 
http://autobuild.buildroot.net
