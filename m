From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Nov 2019 07:18:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-22
Message-ID: <20191123071821.5164188728@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-22
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 10  |  0  |  0  | 10  |
  2019.08.x  | 10  |  6  |  0  | 16  |
    master   | 98  | 35  |  1  | 134 |
     next    | 10  |  6  |  0  | 16  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 xvisor-0.2.11 | 4 
am33x-cm3-11107db2f1e9e58ee... | 3 
              host-grpc-1.23.0 | 2 
            host-mfgtools-0.02 | 2 
                libdrm-2.4.100 | 2 
                libselinux-2.9 | 2 
                snort-2.9.14.1 | 2 
                    wampcc-1.6 | 2 
                    czmq-4.2.0 | 1 
                  flashrom-1.1 | 1 
                     gzip-1.10 | 1 
                    host-clang | 1 
host-google-breakpad-7515ab... | 1 
libcamera-448393f77ec9e37cb... | 1 
                 libv4l-1.18.0 | 1 
linux-serial-test-5d11b31d9... | 1 
               log4cplus-2.0.4 | 1 
                     lxc-3.2.1 | 1 
                 mesa3d-19.2.5 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 ripgrep-0.8.1 | 1 
              spandsp-20180108 | 1 
                    strace-5.3 | 1 
                       unknown | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/1ba25fa903081d1ff5d095fa5ea9af47c1591c54 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/79f826380afe921452c380cd93f614872133760f | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/8ed121483a988944dfa8a6f0d58f89bb560f1961 | ORPH
   sparc     |           czmq-4.2.0           | NOK | http://autobuild.buildroot.net/results/fae5400cd13110ec3eed0a3a6549043fd013909f |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/b81ef05699b12962c30ff45303e33d680bf8a7c6 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/e6736f83414c027f07561f72d6555d0249737857 | ORPH
  aarch64    |           host-clang           | TIM | http://autobuild.buildroot.net/results/80a7f90b721d2afcf4473c86a3e76b086e7f07ea |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/60b5d14e98c8045895d82e40da27a4c05c5816f7 |     
powerpc64le  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/0f8463ccc05fcd1e07c38cb0f8b6bc99a470efba |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/dde87131690c79f026299edea694846f6fbc0050 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/e7a4d5bb9353ef347355376ccc92b88a806cdaac |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/ab772034921340263e804a95ff5ceea100dea80b |     
   xtensa    | libcamera-448393f77ec9e37cb... | NOK | http://autobuild.buildroot.net/results/bc2564887e2ef406999973e7cebd67659ac531f7 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/bd1327ca551e3b6c2f040b13edc1ed82a535d5c5 |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/2ae07f6663a4f59d0638817120a9030174100df5 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b16ab138379e705c3f400ca198663408df59b803 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b4126709904c518de2c51c0bf48630d3ec05c51b |     
   sparc     |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/bb0911fabad3be397ded2fbc23bad224fe64bfc3 |     
   sparc     | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/3c36ebaf58dc1a7a4294f365d7fa7a3cb2217152 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/f851aa4fbb789c488561560cc07d3bbf4aab1521 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/d7f2057847dbd20ce1b3df07d853ae7c3a6ee543 |     
    arm      |         mesa3d-19.2.5          | NOK | http://autobuild.buildroot.net/results/42e4fba3fab0bc22839360767d7e55025de33d6d |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3468a911faa39305dfc6701174b9de0d81df218e |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f43f00c5535c22496a310d1b511a423d60970d82 |     
   xtensa    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/672bd507cc667f172a9a1274c4aa0cb8d0ed1a8c |     
    i686     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/019728e378c20feab8401edf34dc190198d06ad1 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/50eaff10585ff201419b2e33439a4d073911b266 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/24e8c250d7aa64defd0a2d5d2d3cb5d7986316ad |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/23a5f912bce2725cf0336ceb5fcfb47e455d52e1 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/5e887d297ae680e3d3806c58944d5a36d8d6f20c |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/3b26de21bf6f4cf19d54099fdbaec284db0f72b7 |     
  mips64el   |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/6c787fa0a8c4eaeb703d00041116a1ad1a65de4f | ORPH
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/dfb8f2f37d2240716b7869d532d1188300d182ca |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/7c325a17d81cf50a99d7045e3f51ccac882d8de3 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/72d0aa5618e6daf0b50dbc9134284cb2e2e3d17a |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/6ec337c1df0d63d780245537c438f3776eeeca18 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/358206301  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/358206302  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/358206364  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/358206366  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/358206453  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/358206532  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/358206616  | ORPH 




Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
                  flashrom-1.1 | 1 
            mesa3d-demos-8.4.0 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/fa79a901bb6ec0e0b349565f044317ea74a4e9ad |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/b17cb2722f1192526a57e5604b6057f70441d977 |     
    arm      |       mesa3d-demos-8.4.0       | NOK | http://autobuild.buildroot.net/results/4a372c2597af75d153858223281cad0b285ce58e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/3d4bd45f66e6da8b3e3ae756366fd5e35cdec826 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7a01b198eccfd598c84a4eea5e887287aa148b58 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/39426979a1e3a1017a0f06fd2cdae5aa7fb61197 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 2 
                snort-2.9.14.1 | 2 
host-google-breakpad-7515ab... | 1 
                    php-7.3.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/36f8e76d0b196f5aec47c6e3798b808b7fe1529b |     
    mips     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/f44b81dd21a6605ddffea7db665e3926baa4e9fb |     
   mipsel    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/72d7d61e1b347b0ccb0284f4b117c56fa563426e |     
  mips64el   |           php-7.3.11           | NOK | http://autobuild.buildroot.net/results/ad0bd6a5494eee6f218059f7131f974639c3b079 |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/a443559a2a7d419a21dfb05828085cab160bf730 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/05de6a9f1fc513c73b92763876aa766e9ac5e700 |     



-- 
http://autobuild.buildroot.net
