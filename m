From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 06:17:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-11
Message-ID: <20191012061726.DE5C8881A5@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 10  |  3  |  0  | 13  |
  2019.05.x  | 22  |  1  |  0  | 23  |
  2019.08.x  | 16  |  4  |  0  | 20  |
    master   | 103 | 84  |  0  | 187 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 12
             subversion-1.9.12 | 11
                elfutils-0.176 | 7 
                    bird-2.0.6 | 6 
           libwebsockets-3.2.0 | 6 
                 uclibc-1.0.31 | 5 
                clamav-0.102.0 | 4 
                 mesa3d-19.2.0 | 4 
                  ffmpeg-4.2.1 | 3 
                 libdrm-2.4.99 | 3 
               target-finalize | 3 
                   grpc-1.23.0 | 2 
               host-qemu-3.1.1 | 2 
                  libzip-1.5.2 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                  flashrom-1.1 | 1 
google-breakpad-7515ab13768... | 1 
                 haproxy-2.0.5 | 1 
host-google-breakpad-7515ab... | 1 
           host-harfbuzz-2.5.3 | 1 
             libopenh264-2.0.0 | 1 
        ltp-testsuite-20190930 | 1 
                    mpv-0.29.1 | 1 
                   systemd-241 | 1 
                upmpdcli-1.4.2 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.5 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/562836ebf137f45bbfc12259d01160021941fc8e |     
  powerpc    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/0e67b6ee31885e38d2dbf69ff6448e8c838325d1 |     
  powerpc    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/724c60eb0f01b7b8b0b55e5d0409e86eaf0fb53f |     
powerpc64le  |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/a97cc18f5b943c51113dc23aebf9da6e2c5ad869 |     
   sparc     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/93fc3cc54f7c067199014ed08231b1896315ea8a |     
microblazeel |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/2371acdef7bb6890e547bc447281b324b78feb42 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e3e6c6b940f443e25664d14cb7181c888e4f1305 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7c4cb295db7d744260797fda9986c987448b5368 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/acc53cde15890efd70db0dcf0f29c6def130db25 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/72268dd99911bfdf8238b48b5a23f6d55840db85 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9cbec9986717e02bd0f6dedba2290d7fd8ec4adf |     
  nds32le    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fb54671f9f3afe5d18f4bc147b01cf6288c42aaa |     
    i586     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fe1faec5b93a076ab947da286dc62090f25acf9d |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/af474d67bad7ae15eb50cfdad437548ae2c33b64 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8c348ca2ca0e44fe5d57ce5f4342610664b213eb |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/177f4c0cd75a84cc1b2e3c66513dd50195934059 |     
 aarch64_be  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7d0514afd52e4351139c98b0d9179e162c967f56 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3464db054353dc0551c3ca5ab7bd3e46c0059fb3 |     
  mips64el   |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/deb9f87e071457f7ace9685a3ec6c4f994e0e30d |     
    arm      |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/3b627df7c439b6c33770a6e81c29f719b8cc7584 |     
    arm      |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/ae62272cac108d9f0fbc5a3185f12d22ca227a0f |     
    or1k     |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/76b01ef250e93aa7e575209b09997a94571a3943 |     
    i586     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/31aefee15895c2f15140fa0016a903503cd048db |     
    or1k     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/617f72bce257a8081915b61b150ffc00fd5fa33c | ORPH
    arc      |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/b62ed3a7d3d9c62a163c4c23170ae0ff6a71e6fd | ORPH
    or1k     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/40473dd93a5b2fcc6b78dcb57dd688431a43571c | ORPH
    m68k     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/ef3ec5aaef2b26c9947f403d2672b0f9beafd6db | ORPH
    arm      |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/726852c32aba721e3f25ed077262fa050bb5c1bc | ORPH
    arc      |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/a94a0809f1c18f8c523cab319c05061bd6114519 | ORPH
   x86_64    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/331c73a3b1ff1d0e19601ad4859e7787b61fee0a | ORPH
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/0c703f30920602f49b7dd336949514591ab71767 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/140fc70750ef3b5ea5f0db54a1ff3bca91ca6836 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/c2bcdc7922e40f851c13988ea5a210f18b1304cb |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/88692a05c310a4d7388e23df4778ad1514148e64 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/6b11fc30a9fadbcfb5046f47e94b61744d562557 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/d4762ac3c44fd5c740eb7c1d404a978250010ba7 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/99d729ad998992bcd33d491aeb3237650cde2bcc |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/e12c28c856bf0c60ad7d37988624fce18991a29f |     
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/f2483ca8c207e44158dedff028dda2c456c8721e |     
  riscv32    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/3241d3bf7f3145600368d675ff73ca644582322b | ORPH
   mipsel    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/db41cd21a772aba8c424fc365183ba5c7cc66f9a | ORPH
  riscv32    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/209fda1b09af7dae62d5c9ba534330e0192990cf | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/fbf62f218e169f0feb50926bc2705afb5345da0d |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/4b76b8437b82468357d6fa7c7d8813ef574ddf66 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/957a16631a8077dcd97560b9a7d2ca9572b06dec |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/41be52ff4c52e4d07a84614f37f1204f41926f6d |     
microblazeel |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/22a89a3ad18ed61f330bfa907a690eb2320bdb72 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/a495bedcc88b539468f1f2c5cd5f39629706ab81 |     
   sparc     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/5362b966dca9be1036e6a78b84b9dee04ac61083 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/477be041332174db5657bd632b49dec09a830cd1 |     
  powerpc    |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/05224be3d6f83b7c99ca8fdd27bb24e90dd91612 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/811e2d26ecbfb2e15194169f826e408d66ff1bac |     
   sparc     |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/963837c499771143085ffddf128189182e96e70c |     
    arc      |          libzip-1.5.2          | NOK | http://autobuild.buildroot.net/results/89f5fc111bb8bcecbe05ab79d62ac809094b6ce1 |     
    sh4      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/7a4b54768584b2ec95f7f5c0932d0161ab8e43d5 |     
   x86_64    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/5ace483b81da5d84aa0980e56a0b758c3a331e62 |     
  powerpc    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/7666bed0a0f949efd0862a48e4be89bf3e9580f7 |     
  mips64el   |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/fce0dbd97ef9987f0268c263f1fb11023bee501e |     
    i586     |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/4c78b76394dcf55fc687b2e276cdd3784138628f |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/40046c977fae6aeb5610d676bca012da3e1c57f9 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/436e92dfc27a22ac2a184b2fecec8b832936d4a3 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4e76212ad4e48f6fd50b463474c4202bff2c83e6 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/cd926d9bd8c392572ccb355e4c23605f70056ba4 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/bee6561d42ea79870889f2b46eac51718296cec4 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/628d9cd30fde85e37c7232f53a7e36b7060f3832 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7ffc37f954a37855d3c5beca9f91768216bacc13 |     
  sparc64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a6c08c62ca3aa087c53a6d7153e4ecce93052c93 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f1c34ea176a641e7c35cf9a3764a0b5bf9e2c53f |     
  sparc64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e8b7d06fa20b767885c5e6279684c19867e4714b |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/0ffc700bf1098925e0496f083fd15426a813b393 |     
powerpc64le  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a94be1a41df1df819c516ac1c3ab9fdee8c18d53 |     
 powerpc64   |          systemd-241           | NOK | http://autobuild.buildroot.net/results/1fc091e82cf07507415c0d82ab35830e1ac3b31f |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/65a7d86b0275b2070a24174fc8bc3e94524c449b |     
    sh4      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/089df5f38208beb47ea158a7eab6421053372379 |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/819c0f53a610006b09f46a0b40010f90b0f6551f |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/1a1c319342c45094ee75a8a2420284fb3a7492b4 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/4a438829c4d0be53e31b28ed2660083cd7c1e2ee |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/8e8fdef18105bc8e6fbda41ddaa4b403e49e1d97 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/340103ee2c5e81018a605b593c9afafc8449ef07 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/37bd76984226c6cddba4be2e617adb9f4ca038c1 |     
    arc      |         upmpdcli-1.4.2         | NOK | http://autobuild.buildroot.net/results/4490ef20573f35d943c16d1e98753fff38c9a496 |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/2d05740aaa3fd5ab290154d708de4498195d0525 |     
    arm      |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/d2de37adc21bdc8fbb82141ec873f7c2b5652050 | ORPH
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/58ae30625acf1f33dbe67159a3899c67948d6d00 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105145  |      
        engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105157  |      
                   imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105190  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105208  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105337  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105367  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105533  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105519  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105521  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105523  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/318105525  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
                      gzip-1.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            gzip-1.9            | NOK | http://autobuild.buildroot.net/results/04c8fb9272bed108fbfd7b4094e1719d89d78a34 | ORPH
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/ab813082e7a4ddc14448be8b3a94f4eaedd48984 |     
  powerpc    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/a656192bbfad4a7530cb15eba24f7674e4cb0063 |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         qt5base-5.12.2         | NOK | http://autobuild.buildroot.net/results/c424bd74f9d51995ca3631661204aa2334ad8455 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
                  flashrom-1.1 | 1 
                 libdrm-2.4.99 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/e4dfab16b9f49a3dc3d4c0f68988cbf7659a9e5a |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/096225f9b66fada7bdd0bb60e64ac781835aa6ee |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/727dd5140b216deb56262bb02ec958c4616f81b4 |     
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/7b3bdea10627236bf936984f8d33535d0bddceed |     



-- 
http://autobuild.buildroot.net
