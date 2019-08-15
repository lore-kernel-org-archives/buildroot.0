From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 06:16:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-14
Message-ID: <20190815061628.E0F5D204BF@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  2  |  0  | 23  |
  2019.05.x  | 18  |  1  |  1  | 20  |
    master   | 217 | 41  |  0  | 258 |
     next    | 21  |  9  |  0  | 30  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                           git | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |              git               | TIM | http://autobuild.buildroot.net/results/a575f79036e39bb3098afa33fafb055533f48e79 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/9ac10d2d3bd2ea1c0a78c00565c2f23bbf58bdd9 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               wireshark-2.6.7 | 1 
                wolfssl-3.15.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        wireshark-2.6.7         | NOK | http://autobuild.buildroot.net/results/15b59812be35cee34c4c19d3812a293e7560c50d | ORPH
    arm      |         wolfssl-3.15.7         | NOK | http://autobuild.buildroot.net/results/f8046c098997b0245295b09413b2898fa2860ea0 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 5 
                      icu-64-2 | 4 
          qt5multimedia-5.12.4 | 4 
                qt5base-5.12.4 | 3 
                    ffmpeg-4.2 | 2 
                  flashrom-1.1 | 2 
                harfbuzz-2.5.3 | 2 
           host-harfbuzz-2.5.3 | 2 
                 libdrm-2.4.99 | 2 
                  rygel-0.36.2 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                 expect-5.45.4 | 1 
            host-mfgtools-0.02 | 1 
           libfreeimage-3.17.0 | 1 
               libsigsegv-2.12 | 1 
               log4cplus-2.0.4 | 1 
                   mimic-1.1.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
piglit-ef761094be04d14e258a... | 1 
           python-numpy-1.16.4 | 1 
                 python3-3.7.4 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         expect-5.45.4          | NOK | http://autobuild.buildroot.net/results/35f4cfb378e89681b10cf9ff3d1914e6a62063e7 | ORPH
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/5e6ab5ec99440632b11dad5ba8d936e06ce8dc6c |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/6b8b4864a07beed9ab3fc90b11051147c5711902 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/66bdc66576342f7614ca278deaec7d60911e6f10 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/3f90260bbdf645d96fe46bf26a158a03c03c6c28 |     
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/1e11b50c540300664b472e954a231191ec68bb81 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/b54cf80fb8f09c6d4837e987657254d902a90ac1 | ORPH
    arm      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/a8d6a4e96b2949247e4cc43055520d65ba705972 | ORPH
    arc      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/f9ba83745963e3d4c18a8cc503bc9d0b5e2fc18e | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/35e8a379954a395e31f3c8cc9d258bbcc9d4f981 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0ce0a8a3167e45dd187d320845561c13380fa167 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/3e3d3980a9f2ec3902e55fa26a3f17e9247b0312 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/afc244cbfc0f3eb6c2a4f30c0b5a903f176bb032 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/55c96071cebf51e30c03b24ad3da6c13446db684 | ORPH
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/9d9c3952dd6ae2107d4996b5445d7151bf5023c1 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6a086859ec371139e0ae4a8ad1b52e9cacd49171 |     
    arm      |      libfreeimage-3.17.0       | NOK | http://autobuild.buildroot.net/results/bd895e80c02be0411ae14b2b23eff6cc137add99 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/1ce4110d26edfe1b1094add35e746de0463692c3 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/53ce7b7a426827efbe1ea740326535cf600fc39d |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/613889df53aa3c2fdc865f9c837b57a44de155ac |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/20388b94e8cef36fb06b3510d58633218e4a64ca |     
    mips     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2efde99dc8e0952d1f5be86737dfdf3bb436959d |     
  riscv32    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c8570ff7260611e4f4bf8cb1a3d23f3556c4f5a6 |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6cb323eb22160ecdff2c6fefd9e658de03ed2746 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3fc424a6815df7eb1daad497044d1e89e3a5c420 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4ff8a74f700a3a6a67ebbb06a151e1869f405341 |     
    arc      | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/3c2b7fb1e54dd52a5fd9c1024b8258e02063bd2c |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/d7772663c8c8cfedb0624fb5427859a376d8ad37 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/1eefef4d0ee0e5445207b99cc682e7085c934998 |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/eaaf2af0d73a2b760f0e7ff776f3d0c02af925a4 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/887bd8d235a796b4edbcf8854ed792a7711d84bf |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/5f38ad6d5bd6e4eab8243d5ab056e9572ed6b445 |     
 powerpc64   |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/091864422d8040d1bcb6956270ee955ac83af981 |     
  riscv64    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/64c187f2374fa56d9815bfd0bf88604900504ec9 |     
    mips     |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/9a04941c490783a00c3ce81f0d6083785e456c26 |     
  aarch64    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/ebbf4a13cceb7f337bf5abe252f64fbc38cb61c8 |     
   sparc     |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/3df9230dd4335ce9aa9983221dfef4489fd1f5f1 |     
   x86_64    |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/6b8a66b5f77610b41b0986e2446d5e052d4dc0d9 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/4ac752e8c07a8d5ff8398a228863ec5bcf8f55b2 |     
 powerpc64   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/697a6454c952fb8912f3233bfd381f5601a44e3b |     
   nios2     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/3612b0eb5def231f58a5a766018ddeac6166f60d |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                collectd-5.9.0 | 2 
                    dhcp-4.4.1 | 1 
                      icu-64-2 | 1 
                 libdrm-2.4.99 | 1 
                   mpd-0.21.11 | 1 
                  rygel-0.36.2 | 1 
                    strace-5.0 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/b759d5129e8fc54ff9c9c3e5bab1337dbfacee10 | ORPH
  powerpc    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/6ade1ec86f05d31eb30b59da9a1e5dc90bedd66f | ORPH
    arm      |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/935d7fc989f786ab4db38db79a3201f5207d6fbb | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/8f03f8edd885d838324affe4430c89ea9ff20698 | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/da9648b9722108b60f4edacdf1ea858016e6ea44 |     
   x86_64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/8806864dd3b2fc8a0c6d9c108d29770ffb15db60 |     
    arm      |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/09e168c6c84e0554c0cc3666cfdb178528adf124 |     
  riscv64    |           strace-5.0           | NOK | http://autobuild.buildroot.net/results/c9e8cdb95ef8282e23fe79a06f844f4169ff0e3c |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/f040d894b1a31df43d8c108fbdfe07dc14672f3e |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           4th |  DISTRO  | https://release-monitoring.org/project/20471 | 3.62.4       | 3625         |     
                         acpid |  DISTRO  | https://release-monitoring.org/project/00019 | 2.0.30       | 2.0.31       | ORPH
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.4        | 1.1.7        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.32.0       |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 9.0.0_r47    |     
                           apr |  GUESS   | https://release-monitoring.org/project/00095 | 1.6.3        | 1.7.0        |     
                      argparse |  GUESS   | https://release-monitoring.org/project/02100 | 0.6.0-1      | 1.0.10       |     
                         argus |  GUESS   | https://release-monitoring.org/project/00107 | 3.0.8        | 3.0.8.2      | ORPH
                     armadillo |  GUESS   | https://release-monitoring.org/project/07006 | 7.900.1      | 9.600.6      |     
                      asterisk |  GUESS   | https://release-monitoring.org/project/09838 | 16.4.1       | 16.5.0       |     
                            at |  GUESS   | https://release-monitoring.org/project/00127 | release_3... | 3.1.23       | ORPH
                   at-spi2-atk |  GUESS   | https://release-monitoring.org/project/07840 | 2.26.2       | 2.33.2       |     
                  at-spi2-core |  GUESS   | https://release-monitoring.org/project/07841 | 2.28.0       | 2.33.90      |     
                         atkmm |  GUESS   | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                         aubio |  GUESS   | https://release-monitoring.org/project/10301 | 0.4.6        | 0.4.7        |     
              autoconf-archive |  GUESS   | https://release-monitoring.org/project/00142 | 2017.03.21   | 2019.01.06   |     
                        autofs |  GUESS   | https://release-monitoring.org/project/00140 | 5.1.4        | 5.1.5        |     
                      automake |  GUESS   | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
                  b43-fwcutter |  GUESS   | https://release-monitoring.org/project/00152 | 015          | 019          |     
                        babeld |  GUESS   | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.0        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  GUESS   | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                        batctl |  GUESS   | https://release-monitoring.org/project/14740 | 2017.0       | 2019.3       |     
                    batman-adv |  GUESS   | https://release-monitoring.org/project/19529 | 2017.0.1     | 2019.3       |     
                            bc |  GUESS   | https://release-monitoring.org/project/00170 | 1.06.95      | 1.07.1       |     
                     bctoolbox |  GUESS   | https://release-monitoring.org/project/14746 | 0.4.0        | 0.6.0        | ORPH
                         bdwgc |  GUESS   | https://release-monitoring.org/project/17108 | 8.0.0        | 8.0.4        | ORPH
                          bind |  GUESS   | https://release-monitoring.org/project/14923 | 9.11.6-P1    | 9.15.2       | ORPH
                      binutils |  GUESS   | https://release-monitoring.org/project/07981 | 2.31.1       | 2.32         |     
                          bird |  GUESS   | https://release-monitoring.org/project/00192 | 2.0.4        | 2.0.5        |     
                       bitcoin |  GUESS   | https://release-monitoring.org/project/13618 | v0.16.3      | 0.18.1       |     
                     bitstream |  GUESS   | https://release-monitoring.org/project/16268 | 1.4          | 2.5.4        |     
                        bonnie |  GUESS   | https://release-monitoring.org/project/15231 | 1.03e        | 1.98         | ORPH
                         boost |  GUESS   | https://release-monitoring.org/project/06845 | 1.70.0       | 1.71.0.beta1 |     
                        brltty |  GUESS   | https://release-monitoring.org/project/00220 | 5.6          | 6.0          |     
                        bustle |  GUESS   | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                         cairo |  GUESS   | https://release-monitoring.org/project/00247 | 1.15.12      | 1.16.4       |     
                       cairomm |  GUESS   | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     capnproto |  GUESS   | https://release-monitoring.org/project/11515 | 0.6.1        | 0.7.0        |     
                         cargo |  GUESS   | https://release-monitoring.org/project/17512 | 0.26.0       | 0.37.0       |     
                        ccache |  GUESS   | https://release-monitoring.org/project/00257 | 3.6          | 3.7.2        | ORPH
                        ccrypt |  GUESS   | https://release-monitoring.org/project/14496 | 1.10         | 1.11         |     
                   checkpolicy |  GUESS   | https://release-monitoring.org/project/00276 | 2.9          | 20190315     |     
                      chipmunk |  GUESS   | https://release-monitoring.org/project/09061 | 7.0.2        | 7.0.3        |     
                        chrony |  GUESS   | https://release-monitoring.org/project/08810 | 3.4          | 3.5          | ORPH
                    cifs-utils |  GUESS   | https://release-monitoring.org/project/00287 | 6.8          | 6.9          |     
                        clinfo |  GUESS   | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  GUESS   | https://release-monitoring.org/project/00306 | 3.8.2        | 3.15.2       |     
                     coreutils |  GUESS   | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                       cppunit |  GUESS   | https://release-monitoring.org/project/09543 | 1.13.2       | 1.14.0       | ORPH
                      cracklib |  GUESS   | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                    cryptsetup |  GUESS   | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.0        |     
                          cups |  GUESS   | https://release-monitoring.org/project/00380 | 2.2.11       | 2.3b8        |     
                  cups-filters |  GUESS   | https://release-monitoring.org/project/05541 | 1.23.0       | 1.25.1       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-tools |  GUESS   | https://release-monitoring.org/project/10252 | 2.11.1       | 3.0.0        |     
                         dante |  GUESS   | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                         dc3dd |  GUESS   | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                    dehydrated |  GUESS   | https://release-monitoring.org/project/11312 | 0.6.2        | 0.6.5        |     
                        dhcpcd |  GUESS   | https://release-monitoring.org/project/11429 | 7.2.2        | 8.0.2        |     
                        dialog |  GUESS   | https://release-monitoring.org/project/00431 | 1.3-20170509 | 1.3-20190808 | ORPH
                        docker |  GUESS   | https://release-monitoring.org/project/11719 | 1.5          | 19.03.1      | ORPH
                docker-compose |  GUESS   | https://release-monitoring.org/project/06185 | 1.20.1       | 1.25.0-rc2   |     
                    drbd-utils |  GUESS   | https://release-monitoring.org/project/00462 | 9.2.0        | 9.10.0       |     
                         dstat |  GUESS   | https://release-monitoring.org/project/00630 | 0.7.3        | 0.7.4        | ORPH
                     e2fsprogs |  GUESS   | https://release-monitoring.org/project/00646 | 1.45.2       | 1.45.3       | ORPH
                      easy-rsa |  GUESS   | https://release-monitoring.org/project/17770 | 3.0.1        | 3.0.6        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 16           |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.08        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.176        | 0.177        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.20         | 0.21         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.5        |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.0.7       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.8        | 1.0.12       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.4.2        | 3.8.0        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.16       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.3        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.26       | 1.0.30       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.14       | 1.0.17       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.25       | 1.0.29       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.0.25       | 1.1.2        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.13       | 1.0.16       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.34       | 1.1.37       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.0        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.20       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                      eventlog |  GUESS   | https://release-monitoring.org/project/14684 | 0.2.12       | 3.22.1       |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.0.0      | 2.5.1.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.4.5        | 2.5.0        |     
                         exiv2 |  GUESS   | https://release-monitoring.org/project/00769 | 0.27.1       | 0.27.2       |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/14689 | v1.11.0      | 1.12.0       |     
                      fakeroot |  GUESS   | https://release-monitoring.org/project/12048 | 1.20.2       | 1.23         | ORPH
                           feh |  GUESS   | https://release-monitoring.org/project/00790 | 3.1.3        | 3.2.1        |     
                          file |  GUESS   | https://release-monitoring.org/project/00807 | 5.36         | 5.37         | ORPH
                           fio |  GUESS   | https://release-monitoring.org/project/00806 | fio-3.9      | 3.15         |     
                          flac |  GUESS   | https://release-monitoring.org/project/00817 | 1.3.2        | 1.3.3        |     
                       flannel |  GUESS   | https://release-monitoring.org/project/07421 | v0.5.5       | 0.11.0       |     
                         flite |  GUESS   | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  GUESS   | https://release-monitoring.org/project/07184 | 0.8.3        | 3.2.7        | ORPH
                          fltk |  GUESS   | https://release-monitoring.org/project/00823 | 1.3.4        | 1.3.5        | ORPH
                    fontconfig |  GUESS   | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                         fping |  GUESS   | https://release-monitoring.org/project/00834 | 4.0          | 4.2          | ORPH
                          fwts |  GUESS   | https://release-monitoring.org/project/17383 | V18.09.00    | 19.07.00     |     
                        gauche |  GUESS   | https://release-monitoring.org/project/00873 | 0.9.5        | 0.9.8        |     
                          gawk |  GUESS   | https://release-monitoring.org/project/00868 | 4.2.1        | 5.0.1        | ORPH
                           gcr |  GUESS   | https://release-monitoring.org/project/11801 | 3.28.1       | 3.33.4       | ORPH
                    gdk-pixbuf |  GUESS   | https://release-monitoring.org/project/09533 | 2.36.10      | 2.39.2       | ORPH
                     gengetopt |  GUESS   | https://release-monitoring.org/project/00892 | 2.22.6       | 2.23         |     
                        gflags |  GUESS   | https://release-monitoring.org/project/08735 | 2.2.0        | 2.2.2        |     
                        giflib |  GUESS   | https://release-monitoring.org/project/01158 | 5.1.4        | 5.2.1        |     
                        glibmm |  GUESS   | https://release-monitoring.org/project/07960 | 2.60.0       | 2.61.1       |     
                          glog |  GUESS   | https://release-monitoring.org/project/08732 | 0.3.5        | 0.4.0        |     
                       gnuplot |  GUESS   | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.7        |     
                      gnuradio |  GUESS   | https://release-monitoring.org/project/01217 | 3.7.13.3     | 3.8.0.0      |     
                        gnutls |  GUESS   | https://release-monitoring.org/project/01221 | 3.6.8        | 3.6.9        |     
                            go |  GUESS   | https://release-monitoring.org/project/01227 | 1.12.5       | 1.12.8       |     
                         gperf |  GUESS   | https://release-monitoring.org/project/01237 | 3.0.4        | 3.1          | ORPH
                           gpm |  GUESS   | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gqrx |  GUESS   | https://release-monitoring.org/project/09771 | 2.11.4       | 2.11.5       |     
                       granite |  GUESS   | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.4        | ORPH
                     graphite2 |  GUESS   | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  GUESS   | https://release-monitoring.org/project/19117 | 1.18.0       | 1.23.0-pre1  |     
                         grub2 |  GUESS   | https://release-monitoring.org/project/01257 | 2.02         | 2.04         |     
     gsettings-desktop-schemas |  GUESS   | https://release-monitoring.org/project/13139 | 3.33.1       | 3.33.90      | ORPH
                         gssdp |  GUESS   | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.0       | ORPH
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.0       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.8.0        | 1.8.1        |     
                 gtksourceview |  GUESS   | https://release-monitoring.org/project/07724 | 3.24.7       | 4.3.1        |     
                         guile |  GUESS   | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  GUESS   | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  GUESS   | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                          gvfs |  GUESS   | https://release-monitoring.org/project/05496 | 1.31.4       | 1.41.90      | ORPH
                       haproxy |  GUESS   | https://release-monitoring.org/project/01298 | 1.9.1        | 2.0.4        |     
                      harfbuzz |  GUESS   | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.0        | ORPH
                        hdparm |  GUESS   | https://release-monitoring.org/project/01304 | 9.56         | 9.58         |     
            hicolor-icon-theme |  GUESS   | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                       hostapd |  GUESS   | https://release-monitoring.org/project/01325 | 2.7          | 2.9          |     
                         hplip |  GUESS   | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.6       | ORPH
                          htop |  GUESS   | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  GUESS   | https://release-monitoring.org/project/05387 | 0.308        | 0.326        | ORPH
                         hwloc |  GUESS   | https://release-monitoring.org/project/13501 | 1.11.7       | 2.0.4        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.8-60     | ORPH
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20190514a    | 20190618     |     
                      ipmiutil |  GUESS   | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                         ipset |  GUESS   | https://release-monitoring.org/project/01393 | 7.2          | 7.3          | ORPH
                    irqbalance |  GUESS   | https://release-monitoring.org/project/01402 | 1.5.0        | 1.6.0        |     
                         irssi |  GUESS   | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  GUESS   | https://release-monitoring.org/project/13286 | 0.18         | 0.21         |     
                            iw |  GUESS   | https://release-monitoring.org/project/01410 | 5.0.1        | 5.3          |     
                           iwd |  GUESS   | https://release-monitoring.org/project/18380 | 0.18         | 0.19         |     
                        jimtcl |  GUESS   | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                            jo |  GUESS   | https://release-monitoring.org/project/18855 | 1.1          | 1.2          |     
                           joe |  GUESS   | https://release-monitoring.org/project/01467 | 4.4          | 4.6          | ORPH
                       jsoncpp |  GUESS   | https://release-monitoring.org/project/07483 | 1.8.4        | 1.9.1        |     
                           kbd |  GUESS   | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  GUESS   | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.18       |     
                      keyutils |  GUESS   | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-08-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.3-Leia    |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 1.1.0        | 2.0.1        |     
                       kvazaar |  GUESS   | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  GUESS   | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  GUESS   | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  GUESS   | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  GUESS   | https://release-monitoring.org/project/01550 | 487          | 551          | ORPH
                       leveldb |  GUESS   | https://release-monitoring.org/project/09338 | 1.20         | 1.22         |     
                 libatomic_ops |  GUESS   | https://release-monitoring.org/project/01561 | 7.6.6        | 7.6.10       | ORPH
                       libbson |  GUESS   | https://release-monitoring.org/project/09537 | 1.9.4        | 1.9.5        |     
                        libcap |  GUESS   | https://release-monitoring.org/project/01569 | 2.25         | 2.27         |     
                      libcroco |  GUESS   | https://release-monitoring.org/project/11787 | 0.6.12       | 0.6.13       | ORPH
                       libdnet |  GUESS   | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                    libdvdread |  GUESS   | https://release-monitoring.org/project/05614 | 6.0.0        | 6.0.1        |     
                    libebur128 |  GUESS   | https://release-monitoring.org/project/07316 | 1.2.2        | 1.2.4        |     
                       libedit |  GUESS   | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20190324-3.1 |     
                       libestr |  GUESS   | https://release-monitoring.org/project/13288 | 0.1.10       | 0.1.11       |     
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                       libftdi |  GUESS   | https://release-monitoring.org/project/14622 | 0.20         | 1.4          | ORPH
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.6.2        | ORPH
                    libgdiplus |  GUESS   | https://release-monitoring.org/project/06440 | 5.6          | 6.0.2        |     
                        libgee |  GUESS   | https://release-monitoring.org/project/01625 | 0.20.1       | 0.20.2       |     
                       libgit2 |  GUESS   | https://release-monitoring.org/project/01627 | 0.27.8       | 0.28.3       |     
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.2.1        | 3.3          |     
                      libgudev |  GUESS   | https://release-monitoring.org/project/07735 | 232          | 233          |     
                       libical |  GUESS   | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.5        |     
                      libiconv |  GUESS   | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                      libinput |  GUESS   | https://release-monitoring.org/project/05781 | 1.13.4       | 1.14.0       |     
                      libkcapi |  GUESS   | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        |     
                       libmbim |  GUESS   | https://release-monitoring.org/project/07308 | 1.18.0       | 1.18.2       |     
                 libmicrohttpd |  GUESS   | https://release-monitoring.org/project/01658 | 0.9.64       | 0.9.66       |     
                    libmodplug |  GUESS   | https://release-monitoring.org/project/05669 | 0.8.8.5      | 0.8.9.0      |     
                        libndp |  GUESS   | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                       libnice |  GUESS   | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                      libosip2 |  GUESS   | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                        libp11 |  GUESS   | https://release-monitoring.org/project/01699 | 0.4.9        | 0.4.10       |     
                      libpjsip |  GUESS   | https://release-monitoring.org/project/15701 | 2.7.2        | 2.9          |     
                        libpng |  GUESS   | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                        libpri |  GUESS   | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                       librsvg |  GUESS   | https://release-monitoring.org/project/05420 | 2.40.20      | 2.45.90      |     
                       librtas |  GUESS   | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                     librtlsdr |  GUESS   | https://release-monitoring.org/project/15172 | 0.6.0        | 0.7.0        |     
                    libselinux |  GUESS   | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                   libsemanage |  GUESS   | https://release-monitoring.org/project/01718 | 2.9          | 20190315     |     
                      libsepol |  GUESS   | https://release-monitoring.org/project/01719 | 2.9          | 20190315     |     
                     libsodium |  GUESS   | https://release-monitoring.org/project/01728 | 1.0.17       | 1.0.18       |     
                       libsoup |  GUESS   | https://release-monitoring.org/project/11483 | 2.62.3       | 2.67.91      |     
                      libtasn1 |  GUESS   | https://release-monitoring.org/project/01734 | 4.13         | 4.14         | ORPH
                     libtheora |  GUESS   | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                     libunwind |  GUESS   | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       |     
                 libusb-compat |  GUESS   | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       | ORPH
                         libuv |  GUESS   | https://release-monitoring.org/project/10784 | 1.30.1       | 1.31.0       |     
                        libvpx |  GUESS   | https://release-monitoring.org/project/11083 | 1.8.0        | 1.8.1        |     
                 libwebsockets |  GUESS   | https://release-monitoring.org/project/11181 | 2.4.2        | 3.2.0        |     
                        libwpe |  GUESS   | https://release-monitoring.org/project/17789 | 1.2.0        | 1.3.1        |     
                        libxcb |  GUESS   | https://release-monitoring.org/project/01767 | 1.13         | 1.13.1       |     
                  libxkbcommon |  GUESS   | https://release-monitoring.org/project/01780 | 0.8.3        | 0.8.4        |     
                       libyaml |  GUESS   | https://release-monitoring.org/project/13522 | 0.2.1        | 0.2.2        | ORPH
                      lighttpd |  GUESS   | https://release-monitoring.org/project/01817 | 1.4.53       | 1.4.54       |     
                         links |  GUESS   | https://release-monitoring.org/project/01822 | 2.14         | 2.19         | ORPH
                      linphone |  GUESS   | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
             linuxconsoletools |  GUESS   | https://release-monitoring.org/project/01827 | 1.6.0        | 1.6.1        |     
                    liquid-dsp |  GUESS   | https://release-monitoring.org/project/14535 | 1.3.0        | 1.3.2        |     
                       live555 |  GUESS   | https://release-monitoring.org/project/12414 | 2019.03.06   | 2019.08.12   | ORPH
                         lldpd |  GUESS   | https://release-monitoring.org/project/14019 | 1.0.3        | 1.0.4        |     
                          llvm |  GUESS   | https://release-monitoring.org/project/01830 | 8.0.0        | 8.0.1        |     
                lockfile-progs |  GUESS   | https://release-monitoring.org/project/10135 | 0.1.17       | 0.1.18       | ORPH
                          lpty |  GUESS   | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  GUESS   | https://release-monitoring.org/project/01844 | 4.91         | 4.93.2       | ORPH
                        lsscsi |  GUESS   | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.10.6       | 2.10.10      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.10.5       | 2.10.7       |     
                           lua |  GUESS   | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                lua-resty-http |  GUESS   | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                       luaossl |  GUESS   | https://release-monitoring.org/project/11690 | 20190612-0   | 20190731     |     
                      luksmeta |  GUESS   | https://release-monitoring.org/project/11763 | 8            | 9            |     
                           lxc |  GUESS   | https://release-monitoring.org/project/01860 | 3.1.0        | 3.2.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  GUESS   | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.1        | ORPH
                          lzip |  GUESS   | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  GUESS   | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  GUESS   | https://release-monitoring.org/project/01887 | 10.3.16      | 10.4.7       |     
                            mc |  GUESS   | https://release-monitoring.org/project/01954 | 4.8.20       | 4.8.23       |     
                        mcelog |  GUESS   | https://release-monitoring.org/project/08093 | v153         | 164          |     
                     memcached |  GUESS   | https://release-monitoring.org/project/01965 | 1.5.12       | 1.5.16       | ORPH
                      metacity |  GUESS   | https://release-monitoring.org/project/15392 | 2.25.1       | 3.32.0       | ORPH
                   micropython |  GUESS   | https://release-monitoring.org/project/10539 | 1.9.4        | 1.11         |     
                        midori |  GUESS   | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                          mksh |  GUESS   | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                        moarvm |  GUESS   | https://release-monitoring.org/project/21100 | 2019.03      | 2019.07.1    |     
mobile-broadband-provider-info |  GUESS   | https://release-monitoring.org/project/10267 | 20190116     | 20190618     | ORPH
                       mongodb |  GUESS   | https://release-monitoring.org/project/02008 | r4.0.6       | 4.0.3        |     
                         monit |  GUESS   | https://release-monitoring.org/project/05483 | 5.25.3       | 5.26.0       |     
                          mono |  GUESS   | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.0.0.319    |     
                        motion |  GUESS   | https://release-monitoring.org/project/20616 | 4.2.1        | 4.2.2        |     
                           mpd |  GUESS   | https://release-monitoring.org/project/14864 | 0.21.11      | 0.21.13      |     
                     mpdecimal |  GUESS   | https://release-monitoring.org/project/11578 | 2.4.1        | 2.4.2        |     
                         msmtp |  GUESS   | https://release-monitoring.org/project/02024 | 1.8.3        | 1.8.5        |     
                         mtdev |  GUESS   | https://release-monitoring.org/project/08868 | 1.1.4        | 1.1.5        |     
                          mutt |  GUESS   | https://release-monitoring.org/project/02035 | 1.11.4       | 1.12.1       |     
                          ncdu |  GUESS   | https://release-monitoring.org/project/06045 | 1.14         | 1.14.1       |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20190810 | ORPH
                      nftables |  GUESS   | https://release-monitoring.org/project/02082 | 0.9.0        | 0.9.1        | ORPH
                       nghttp2 |  GUESS   | https://release-monitoring.org/project/08651 | 1.37.0       | 1.39.2       |     
                         nginx |  GUESS   | https://release-monitoring.org/project/05413 | 1.16.0       | 1.17.3       |     
                         ngrep |  GUESS   | https://release-monitoring.org/project/02084 | 1_47         | 1.45         |     
                          nmap |  GUESS   | https://release-monitoring.org/project/02096 | 7.70         | 7.80         | ORPH
                          nmon |  GUESS   | https://release-monitoring.org/project/02097 | 16g          | 16k          | ORPH
                        nodejs |  GUESS   | https://release-monitoring.org/project/08251 | 10.15.3      | 12.8.0       |     
                      nss-mdns |  GUESS   | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                        nuttcp |  GUESS   | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                         ofono |  GUESS   | https://release-monitoring.org/project/16859 | 1.29         | 1.30         | ORPH
                      openblas |  GUESS   | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                      openipmi |  GUESS   | https://release-monitoring.org/project/02549 | 2.0.24       | 2.0.27       |     
                      openldap |  GUESS   | https://release-monitoring.org/project/02551 | 2.4.47       | 2.4.48       |     
                       openmpi |  GUESS   | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.1        | ORPH
                       openpgm |  GUESS   | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                       pangomm |  GUESS   | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  GUESS   | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  GUESS   | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  GUESS   | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                        physfs |  GUESS   | https://release-monitoring.org/project/03631 | 3.0.1        | 3.0.2        |     
                      pinentry |  GUESS   | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  GUESS   | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                      pngquant |  GUESS   | https://release-monitoring.org/project/03674 | 2.12.3       | 2.12.5       |     
                          poco |  GUESS   | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.2        |     
               policycoreutils |  GUESS   | https://release-monitoring.org/project/03680 | 2.9          | 20190315     |     
                        polkit |  GUESS   | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  GUESS   | https://release-monitoring.org/project/03686 | 0.77.0       | 0.79.0       |     
                     portaudio |  GUESS   | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  GUESS   | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  GUESS   | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                      protobuf |  GUESS   | https://release-monitoring.org/project/03715 | 3.6.0        | 3.9.1        |     
                    protobuf-c |  GUESS   | https://release-monitoring.org/project/03716 | 1.3.0        | 1.3.2        |     
                proxychains-ng |  GUESS   | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  GUESS   | https://release-monitoring.org/project/03729 | 12.2         | 12.99.2      |     
                            pv |  GUESS   | https://release-monitoring.org/project/03736 | 1.6.0        | 1.6.6        | ORPH
                        python |  GUESS   | https://release-monitoring.org/project/13254 | 2.7.16       | 3.8.0        |     
              python-alsaaudio |  GUESS   | https://release-monitoring.org/project/10072 | 0.8.2        | 0.8.4        |     
                python-cheroot |  GUESS   | https://release-monitoring.org/project/20163 | 5.10.0       | 6.5.5        |     
              python-daemonize |  GUESS   | https://release-monitoring.org/project/12761 | 2.4.7        | 2.5.0        |     
               python-engineio |  GUESS   | https://release-monitoring.org/project/15064 | 3.3.0        | 3.9.3        |     
                python-futures |  DISTRO  | https://release-monitoring.org/project/06595 | 3.2.0        | 3.3.0        |     
                 python-ipaddr |  DISTRO  | https://release-monitoring.org/project/12022 | 2.1.11       | 2.2.0        |     
               python-iptables |  GUESS   | https://release-monitoring.org/project/11475 | 0.13.0       | 0.14.0       |     
         python-jaraco-classes |  GUESS   | https://release-monitoring.org/project/20150 | 1.4.3        | 2.0          |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.0.2        | 3.1.0        |     
                    python-pam |  GUESS   | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                python-portend |  GUESS   | https://release-monitoring.org/project/20203 | 1.8          | 2.5          |     
             python-ptyprocess |  GUESS   | https://release-monitoring.org/project/06446 | 0.5.1        | 0.6.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.2.0        | 3.3.3        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.39         | 0.40.dev1    |     
                   python-xlrd |  GUESS   | https://release-monitoring.org/project/15107 | 1.0.0        | 1.2.0        |     
                   python-xlwt |  GUESS   | https://release-monitoring.org/project/15108 | 1.2.0        | 1.3.0        |     
              python-xmltodict |  GUESS   | https://release-monitoring.org/project/15109 | 0.11.0       | 0.12.0       |     
                          qpdf |  GUESS   | https://release-monitoring.org/project/05542 | 8.4.0        | 8.4.2        |     
                   qpid-proton |  GUESS   | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0-rc1   |     
                           qwt |  GUESS   | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
                        ranger |  GUESS   | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                     refpolicy |  GUESS   | https://release-monitoring.org/project/15707 | 2.20190201   | 20081014     |     
                   restorecond |  GUESS   | https://release-monitoring.org/project/16520 | 2.9          | 20190315     |     
                     rng-tools |  GUESS   | https://release-monitoring.org/project/04202 | 5            | 6.7          |     
                           rpm |  GUESS   | https://release-monitoring.org/project/15204 | 4.14.2.1     | 4.15.0-beta1 |     
                       rrdtool |  GUESS   | https://release-monitoring.org/project/04214 | 1.7.0        | 1.7.2        | ORPH
                       rsyslog |  GUESS   | https://release-monitoring.org/project/04218 | 8.22.0       | 8.1907.0     |     
                          ruby |  GUESS   | https://release-monitoring.org/project/04223 | 2.4.6        | 2.6.3        | ORPH
                          rust |  GUESS   | https://release-monitoring.org/project/07635 | 1.33.0       | 1.36.0       |     
                         rygel |  GUESS   | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.1       |     
                            s6 |  GUESS   | https://release-monitoring.org/project/05485 | 2.7.1.1      | 2.9.0.0      |     
                        s6-dns |  GUESS   | https://release-monitoring.org/project/16547 | 2.3.0.0      | 2.3.0.2      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 0.4.0.0      | 1.0.2.1      |     
                s6-linux-utils |  GUESS   | https://release-monitoring.org/project/16551 | 2.5.0.0      | 2.5.0.1      |     
                 s6-networking |  GUESS   | https://release-monitoring.org/project/16550 | 2.3.0.2      | 2.3.0.4      |     
             s6-portable-utils |  GUESS   | https://release-monitoring.org/project/16549 | 2.2.1.1      | 2.2.1.3      |     
                         s6-rc |  GUESS   | https://release-monitoring.org/project/16548 | 0.4.0.1      | 0.5.0.0      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.10.6       | 4.11.0rc1    |     
                 sane-backends |  GUESS   | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                           sbc |  GUESS   | https://release-monitoring.org/project/16338 | 1.3          | 1.4          | ORPH
                         scons |  GUESS   | https://release-monitoring.org/project/04770 | 3.0.5        | 3.1.1        |     
                        scrypt |  GUESS   | https://release-monitoring.org/project/09158 | 1.2.0        | 1.4.0        |     
                        sdparm |  GUESS   | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                       skalibs |  GUESS   | https://release-monitoring.org/project/05486 | 2.6.4.0      | 2.8.1.0      |     
                         slang |  GUESS   | https://release-monitoring.org/project/04829 | 2.3.1a       | 2.3.2        | ORPH
                         smack |  GUESS   | https://release-monitoring.org/project/06120 | 1.3.1        | 4.3.4        |     
                 smartmontools |  GUESS   | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                      smcroute |  GUESS   | https://release-monitoring.org/project/17369 | 2.4.2        | 2.4.4        |     
                     smstools3 |  GUESS   | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                         snort |  GUESS   | https://release-monitoring.org/project/13263 | 2.9.12       | 2.9.14.1     |     
                         socat |  GUESS   | https://release-monitoring.org/project/04848 | 1.7.3.2      | 1.7.3.3      |     
       sound-theme-freedesktop |  GUESS   | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  GUESS   | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  GUESS   | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  GUESS   | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  GUESS   | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         squid |  GUESS   | https://release-monitoring.org/project/04880 | 4.6          | 4.8          | ORPH
                         sshfs |  GUESS   | https://release-monitoring.org/project/11058 | 2.8          | 3.5.2        | ORPH
          startup-notification |  GUESS   | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  GUESS   | https://release-monitoring.org/project/06861 | 6.0          | 6.0.1        |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.0          | 5.2          |     
                     stress-ng |  GUESS   | https://release-monitoring.org/project/12538 | 0.09.58      | 0.10.01      |     
                    strongswan |  GUESS   | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.0        |     
                    subversion |  GUESS   | https://release-monitoring.org/project/04905 | 1.9.12       | 1.12.2       |     
                   sunxi-tools |  GUESS   | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      suricata |  GUESS   | https://release-monitoring.org/project/10925 | 4.1.3        | 5.0.0-beta1  |     
                          swig |  GUESS   | https://release-monitoring.org/project/04919 | 3.0.12       | 4.0.0        | ORPH
                        sysdig |  GUESS   | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.2       |     
                     syslog-ng |  GUESS   | https://release-monitoring.org/project/04930 | 3.19.1       | 3.22.1       |     
                       sysstat |  GUESS   | https://release-monitoring.org/project/04931 | 11.6.3       | 12.1.6       | ORPH
                       systemd |  GUESS   | https://release-monitoring.org/project/05440 | 241          | 243-rc1      |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  GUESS   | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                         tclap |  GUESS   | https://release-monitoring.org/project/04942 | 1.2.1        | 1.2.2        |     
                        tcllib |  GUESS   | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                   terminology |  GUESS   | https://release-monitoring.org/project/04951 | 1.4.1        | 1.5.0        |     
                          tinc |  GUESS   | https://release-monitoring.org/project/07716 | 1.0.35       | 1.1pre14     |     
                       tinyxml |  GUESS   | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                      tinyxml2 |  GUESS   | https://release-monitoring.org/project/04976 | 7.0.1        | 7.1.0        |     
                            tk |  GUESS   | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a1        |     
                          tmux |  GUESS   | https://release-monitoring.org/project/04980 | 2.8          | 3.0          |     
                    tpm2-abrmd |  GUESS   | https://release-monitoring.org/project/16819 | 2.0.3        | 2.2.0        |     
                    tpm2-tools |  GUESS   | https://release-monitoring.org/project/12841 | 3.1.4        | 3.2.1-rc0    |     
                     tpm2-totp |  GUESS   | https://release-monitoring.org/project/18790 | 0.1.1        | 0.1.2        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.0        |     
                     trace-cmd |  GUESS   | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                          tree |  GUESS   | https://release-monitoring.org/project/05006 | 1.7.0        | 1.8.0        | ORPH
                        tzdata |  GUESS   | https://release-monitoring.org/project/05021 | 2018e        | 2019b        |     
                      udftools |  GUESS   | https://release-monitoring.org/project/15774 | 2.0          | 2.1          |     
                         unrar |  GUESS   | https://release-monitoring.org/project/13306 | 5.6.4        | 5.7.5        | ORPH
                         unscd |  GUESS   | https://release-monitoring.org/project/07070 | 0.52         | 0.53         |     
                        upower |  GUESS   | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.7       |     
                           upx |  GUESS   | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                      usbredir |  GUESS   | https://release-monitoring.org/project/16012 | 0.7.1        | 0.8.0        |     
                          vala |  GUESS   | https://release-monitoring.org/project/05065 | 0.34.7       | 0.45.90      | ORPH
                           vdr |  GUESS   | https://release-monitoring.org/project/05069 | 2.4.0        | 2.4.1        |     
                           vim |  GUESS   | https://release-monitoring.org/project/05092 | 8.1.0133     | 8.1.1846     | ORPH
                        vnstat |  GUESS   | https://release-monitoring.org/project/07283 | 1.17         | 2.3          |     
                           vte |  GUESS   | https://release-monitoring.org/project/04674 | 0.48.3       | 3.3.6        | ORPH
                           waf |  GUESS   | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  GUESS   | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  GUESS   | https://release-monitoring.org/project/05355 | 2.24.3       | 2.25.4       |     
       webrtc-audio-processing |  GUESS   | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  GUESS   | https://release-monitoring.org/project/13745 | 6.0.1        | 6.0.92       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.4.3        | 5.5.0        |     
                     wireguard |  GUESS   | https://release-monitoring.org/project/13481 | 0.0.20190601 | 0.0.20190702 | ORPH
                     wireshark |  GUESS   | https://release-monitoring.org/project/05137 | 3.0.2        | 3.1.0        | ORPH
                wpa_supplicant |  GUESS   | https://release-monitoring.org/project/05146 | 2.7          | 2.9          |     
                wpebackend-fdo |  GUESS   | https://release-monitoring.org/project/17547 | 1.2.1        | 1.3.1        |     
                     wpewebkit |  GUESS   | https://release-monitoring.org/project/17557 | 2.24.2       | 2.25.2       |     
                          x265 |  GUESS   | https://release-monitoring.org/project/07275 | 3.0          | 3.1.1        |     
                       xdotool |  DISTRO  | https://release-monitoring.org/project/08648 | 3.20150503.1 | 3.20160805.1 |     
                           xen |  GUESS   | https://release-monitoring.org/project/05181 | 4.11.2       | 4.12.1       |     
                      xfsprogs |  GUESS   | https://release-monitoring.org/project/05188 | 4.18.0       | 5.2.0        | ORPH
                        xinetd |  GUESS   | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/05193 | 1.3.14       | 1.04         | ORPH
                xtables-addons |  GUESS   | https://release-monitoring.org/project/07736 | 2.12         | 3.3          | ORPH
                         xterm |  GUESS   | https://release-monitoring.org/project/05272 | 327          | 348          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.9        | 0.2.11       |     
                        xxhash |  GUESS   | https://release-monitoring.org/project/17583 | 0.6.5        | 0.7.0        |     
                            xz |  GUESS   | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  GUESS   | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2018e        | 2019b        |     
                           zsh |  GUESS   | https://release-monitoring.org/project/05307 | 5.6.2        | 5.7.1        |     

-- 
http://autobuild.buildroot.net
