From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Nov 2019 07:16:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-29
Message-ID: <20191130071641.93C1585F49@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-29
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  6  |  1  |  0  |  7  |
  2019.08.x  | 13  |  2  |  0  | 15  |
    master   | 96  | 30  |  0  | 126 |
     next    |  1  |  9  |  0  | 10  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                snort-2.9.14.1 | 3 
                  flashrom-1.1 | 2 
                libselinux-2.9 | 2 
                    xen-4.12.1 | 2 
                 acsccid-1.1.7 | 1 
                   grpc-1.23.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 haproxy-2.0.5 | 1 
                host-go-1.13.3 | 1 
              host-grpc-1.23.0 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
          imagemagick-7.0.8-59 | 1 
                libcurl-7.66.0 | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
        matchbox-desktop-0.9.1 | 1 
                 mesa3d-19.2.6 | 1 
                    mpv-0.29.1 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                 systemd-243.4 | 1 
               wireshark-3.0.5 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/e255e256809736dd63c72fcfa9d16ced252b4191 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/05af51ce204a53b3b1bf288d7873122e3cae2b04 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/047d5671e19f2af4e5a23c433edcc41a491c35ae |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/2faf51a91ee0c0d34679016c9224dbca06e3fa04 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/306005911e303fcae125316150e4c6bae157c579 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/8650260879d5d6f7272e68c806bb2cbef9efd887 |     
  mips64el   |         host-go-1.13.3         | NOK | http://autobuild.buildroot.net/results/fc1ae012f5936deb5b27ebb26e12e52ae0e13b6b |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/019224daf8f324226218fa01e25d4be2173006b8 |     
 powerpc64   |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/5b5dc7dfb6f74d983fb1877aedceee9fadd77d4b |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/d3db3fef24b9e6e3e7d293cd6756ed51d444bb19 | ORPH
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/03298ea062772b2696e8200f8a4517b312a763fd |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/3fd27ea8e178c0803947266961eab1bfc82fffa9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d1df0bb495c07158c6ed6f0824465fb7179575e4 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/36a62abdbf7e9c838665fc2905f729fc5d5a9341 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/867816628de74cfda8a8ead8edcd1a46379e55af |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/6892a17ddac28baaa07e03d13d835ba43b9fbaf7 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/f444fd8bf21594ce702d7db0f8bfea8c14ec1a65 |     
  mips64el   |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/d4ce5034ba04543283b8ed770811c8b4f69c5bb3 |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/6bf18d021cfe848169bc09a0facddf53a30bbfbd |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e36d6811a702c0e26b62d5b7b27856c93de96532 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/4b4f77047e484bef6ba869075edddddf54bbc61c |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/88d6c0cadf1a3e275d89d9c00a6c3f4a87cabbf1 | ORPH
   x86_64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/7a13f93a704e2397dbf6b77dd5e41e639f589577 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/1639960abc4baa8ad5e880ed3b11274b46ac3927 |     
powerpc64le  |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/a35157ba4f89e1bb910c3c4385d2f3e096074d26 |     
    arm      |         systemd-243.4          | NOK | http://autobuild.buildroot.net/results/6fe219f3466191718fa06051427613ea9fff1e6d |     
    arm      |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/3f4d1f891ba0ce268663202a2e7b9762c12b82d6 | ORPH
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/73bad12995f066852185f4708fef9a7fa6a62b58 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/3ca3be16f076aab833cff6c15473fd00999a7970 |     
    arm      | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/fb627889da77ea6f4898175419c4318d425d7fab |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/364561415  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/364561416  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/364561470  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/364561497  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/364561500  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/364561588  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/364561635  |      
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/364561644  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/364561736  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/b2ac86abb6abd00195bbcc37b513891b3c30f1a6 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 1 
                snort-2.9.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/93da14e55896d2002b4129a882d8d1f24ebc0fed |     
   sparc     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/fdad7fbb75e0f74470725d6b710f019bd9535b07 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 3 
                 acsccid-1.1.7 | 1 
                  gmpc-11.8.16 | 1 
           libwebsockets-3.2.0 | 1 
               protobuf-3.10.1 | 1 
                 samba4-4.11.2 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/03b52091db38a4bd3cf7cfd32d5fc8b71f0281cc |     
   nios2     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/6325b2e8489a37737ab2874564007b35483b0a1f | ORPH
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/3bd4803a6aed015e6d817c04a6640e81ddad78c0 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/dceb507d8c44c2072bcb285f5ff133372e6c7d91 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/37f7c1966565108c059fbf9904e56f4d002d4443 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/74e7caf3ae830b434bfd5ffbc97062f3cc8b1a3a |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/12787cd4539a4ac793e0a989c1a90835ecb90e18 |     
    arc      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/274611f79eb3d7a18e88dab14eb9d82421195dea |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/09c433133c3fdd1fc233e934c1e31b2d1b88ab68 |     



-- 
http://autobuild.buildroot.net
