From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Jun 2021 05:50:04 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-27
Message-ID: <20210628055019.1FA7D40394@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 18  |  7  |  0  | 25  |
  2021.05.x  | 17  |  4  |  0  | 21  |
    master   | 20  | 61  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.2 | 10
casync-4ad9bcb94bc83ff36cfc... | 7 
                qt5base-5.15.2 | 5 
              libostree-2021.1 | 4 
cegui-00b4e1fe174da53b7ed72... | 3 
                   libqb-2.0.2 | 3 
                libselinux-3.2 | 3 
             libsndfile-1.0.31 | 3 
                  exiv2-0.27.4 | 2 
                    ffmpeg-4.4 | 2 
             safeclib-08112019 | 2 
                   tor-0.4.6.5 | 2 
                       unknown | 2 
                 dc3dd-7.2.641 | 1 
                   gssdp-1.2.3 | 1 
                   guile-3.0.4 | 1 
               host-qemu-6.0.0 | 1 
                libnice-0.1.16 | 1 
                libsoup-2.72.0 | 1 
               memcached-1.6.9 | 1 
                 mesa3d-21.1.1 | 1 
                 pixman-0.40.0 | 1 
                   seatd-0.5.0 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                  zeromq-4.3.4 | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/03f5edbcc6d1fc2d9a5e92bcacf32528768b2973 |     
powerpc64le  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/037c700783752ef5e585969b9a20da54d168679c |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/2d70b79c98914148a6a564255a63c2052da9902d |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b416fc04407dc080446feefef51a6ddd9875f2f8 |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/57ab3f6bd0b3794671b5797555bfac35dda43695 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/15d2c62ef2bf0087d711cf2ed78b73238b34c0a2 |     
  nds32le    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/82ded16df699a33ce37b24d4315c8da57b3c6850 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7a86e59f6b9471635ba2f79528ec73a4b2d6309f |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/9455b70bf0afa2b7c5af6c871cc8d4ef280c095d |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/330c7f16de21a070816d8e033b3c5d84d2417dde |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/28efd4e784887a75a76175cc9106b464abac29fb | ORPH
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/107c06b5a8f6b4cf25118cc9b05a07b0e92d55da |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9522cf751bb9ac77b6d46b3577b5c51ef7815bca |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/db5db5b99d7677cfb0ff1ac11f7a2fca756fc1d7 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/078cb17ec399afe5025bd3fcfff092b98eb11efc |     
powerpc64le  |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/60a12ab1ac32c0be010fe5850e1917a03d9024ec |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/a3cebaf9f866f7aac56c4484ee929f0b8463f02f | ORPH
 aarch64_be  |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/7546e97dac1e9937ed0ee5085babe45d4346e51b |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/7f10c9bf4a81276617d49e9e379d37526fb12497 |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/c0001f50afa2da89b7abaebf64922c0d3c5d0a9e |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/9cb3e5fc3c490770d58b873aaed095687cb195f4 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/951f6a886af1e326fb1d020ad904f07e48afa0cd |     
    i686     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/97071a3e7b66f4d6067a70eda4449174a5ab35d8 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/2ec5827bdc2b73709a94c47fae0fd4688ad6a161 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/b419c93624bb541248bbd6f42d37808648176643 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/8c8a749fe446f58d27dfc69f45598dad512a48c9 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/9d39f9bae1335598f64ba5f09cb731d0183c83d1 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/0e70257ffb2f97ee825b57b65e935ec26a295884 |     
  riscv64    |         libnice-0.1.16         | NOK | http://autobuild.buildroot.net/results/36c67c75803e5b73e619739cb9c5c5b9b44578d4 |     
    i686     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/7e53a3ce28bd58cde755d71021bb93fe6e950278 |     
  aarch64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/62f01718a1dfc8d42396ce7e69096dacd10bd40f |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/b7e7aa2169e70d0c8a8198ccb684ebe1addebbca |     
  mips64el   |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/5203b6bafba7d9b091031c0d17ce1a6888ea78c5 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/93afcac4350928b48b9f8d5c0679a431fe0e7286 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/137b2739f4649e64d0ca9dc1211c59f606cc393a |     
microblazeel |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/7b3d6fa8cf3ce9872f3a8bbe35e5a26fa9310632 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/2e80f801b8e46c90727cfc2b55cc881dfb23435d |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/f9390b8768e1e275444f262b39756b5d5fc4983b |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/1877c45f25fc62019d43c03e2c2a5b9cf48e697c |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/84a05d121a00016f56ab07396f04d5d4b3ed60b7 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/02eb6b3fd68153f21beaf37569e890cc39706e91 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/0af174cfbcd0b65de82a8d2989f08b077c6bc945 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/7e953dc690c0bf03a0b49d728b84ded721419a7c |     
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/ffb71bd5548adb60476e0b054cb937952b36de9a | ORPH
    m68k     |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/5b5fc5c28aec2e71f4240dc0ced8ce5cd9e40ebf |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c770d5507c33d79d53d1f78808159ef4b7e99194 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f3330dcb22c3460b57f46b9a9d3b93862df21a98 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/1c791a0ff5b8dd78f1e6a82257a86e9af9e19d32 |     
  aarch64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5bec0b4546d443890990100e4666e6ef04260760 |     
   xtensa    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a890f62b983b8454063ff3e283ed36c36c213dc7 |     
  aarch64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/00f32059ce20f88df3439a0aa2b959a10c31857a |     
   nios2     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/8fa3af7ad925d2dd8d5c3207266f2aea3c2249fe |     
    m68k     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/dea2a7722e675b1a4552b2f83e626e0710c588fe |     
   xtensa    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/4b14c18980117b51b40f07deaa83c1760f854407 |     
    i586     |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/dcff658da9641a3e2546a02425cdbb27f53faa2a |     
  powerpc    |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/3748a0617f63c484a967188828448761a48c38a3 |     
microblazeel | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/2c88d0e3f35a184a749e34a397e5c23e8bc8924d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/02a2387be7efdd9c2ff7b48c6b1b1ddffb177c80 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/a69b2efe92341819ef4a609bb1bab0a9f8e50474 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/44cdbf6698a4cd186ea89c6db19e2304d52802a7 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/48f4ca3fb2336066ba675453b4a3eb76886e8524 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 3 
           heirloom-mailx-12.5 | 1 
        host-sentry-cli-1.57.0 | 1 
                qt5base-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fd9fefe9c881e0b88db403b06d9ea1bced556690 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/81e250d6548bb364c56d67b4daa65ad26a221fb6 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/06a2e846c8d9055b5ff3eaed84fe69a1a6725591 |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/428c2c2f8ba431fa61fa3d57aef2bb7a6ac1bc9e |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1f86c2105fb72b38a973c6effabf2046d6e12b6e |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/69b1351c5395689c5183e2f376223cd29dbf3091 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/e12273a8380a6dc151f1a3d048f67d13dd66d209 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
                   httping-2.5 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/174c448a0b35fca31bb748b1683df449b2673fcd |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/c0b484fd2e158caf9c964f1b9f9608c63eaacba7 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/38412faa4581b1b0e85d348c335d77c1c515c47b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/22966d996908380c283eb9013589e0851c5dbad1 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20210604     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 40.1.1       |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.3.1        | 4.5.0        |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.4        | 1.2.5.1      |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/00037 | 1.2.4        | 1.2.5.1      |     
                 android-tools |  DISTRO  | https://release-monitoring.org/project/13989 | 4.2.2+git... | 11.0.0_r38   |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 9.0          | 10.0         |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 10.5.2       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.14.1      | 18.5.0       |     
                            at |  DISTRO  | https://release-monitoring.org/project/00127 | 3.2.1        | 3.2.2        |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.40.2       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.36.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.1        | 3.0.2        |     
                      autoconf |  DISTRO  | https://release-monitoring.org/project/00141 | 2.69         | 2.71         | ORPH
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2019.01.06   | 2021.02.19   |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.3       | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | r1450        | 6.3          |     
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.10.2       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 2020-12-09   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.10         |     
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/07137 | 2.0.3        | 2.0.4        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 19.03.14     | 19.03.21     | ORPH
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 5.1          | 5.1.8        | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2021.1       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 1.1.1        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.0.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.0.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.0.0-alpha  |     
                    berkeleydb |  DISTRO  | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.4       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.31      | 9.17.15      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.35.2       | 2.36.1       |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.7        | 2.0.8        |     
                      blktrace |  DISTRO  | https://release-monitoring.org/project/00202 | 1.2.0        | 1.3.0        | ORPH
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 3.0.0        | 3.1.0        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/10029 | 5.58         | 5.59         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/10029 | 5.58         | 5.59         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.16      | 7.18.0       |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.75.0       | 1.76.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.0.2        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.17.3       | 3.0.0-alpha0 | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.11         | 5.12.1       | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.09         | 3.17         |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.8        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                          cage |  DISTRO  | https://release-monitoring.org/project/21171 | 0.1.3        | 0.1.4        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.16.1       |     
                     can-utils |  DISTRO  | https://release-monitoring.org/project/10554 | 2020.12.0    | 2021.06.0    |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.301        | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.3          | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.4.0        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.2          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.2.2        | 2.4.0        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 4.0          | 4.1          | ORPH
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                      civetweb |  DISTRO  | https://release-monitoring.org/project/21329 | 1.13         | 1.14         | ORPH
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 11.0.0       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 3.0.21.02.21 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.16.9       | 3.21.0-rc1   |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.4.4        | 1.5.2        |     
                        cppcms |  DISTRO  | https://release-monitoring.org/project/21334 | 1.2.1        | 2.0.0.beta2  | ORPH
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.3.0        | 8.5.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.3.4        | 2.3.6        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.4       | 1.28.9       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.0.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.2        | 1.4.3        |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.3        | 3.0.4        | ORPH
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.11.3     | 0.5.11.4     | ORPH
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.10.25      |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 1.7.1        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 3.3.3        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.2.9        |     
                         dav1d |  DISTRO  | https://release-monitoring.org/project/18920 | 0.8.2        | 0.9.0        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.20      | 1.13.18      | ORPH
                     dbus-glib |  DISTRO  | https://release-monitoring.org/project/01979 | 0.110        | 0.112        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 4.11.2       | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/11312 | 0.6.5        | 0.7.0        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.5.0        | 1.6.1        |     
                          dhcp |  DISTRO  | https://release-monitoring.org/project/05584 | 4.4.2-P1     | 4.4.2b1      | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20200327 | 1.3-20210621 | ORPH
                       dmalloc |  DISTRO  | https://release-monitoring.org/project/21417 | 5.5.2        | 5.6.5        | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.29.2       |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.18       | 1.9.1        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.15.0       | 9.18.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/16911 | 1.6.0        | 1.6.1        |     
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6          | 1.6.2        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.16         | 1.17         | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202105       | ORPH
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/00666 | 3.3.7        | 3.3.9        |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 20.07        | 21.04        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.184        | 0.185        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.12.1       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.39         | 0.41         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.2.15       | 2.3.0        |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 24.0.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.17       | 1.0.20       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.1.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 1.0.6        | 1.0.8        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.11.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.9        | 1.0.12       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.25       | 1.0.28       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.10       | 1.0.13       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.7        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.6        | 1.0.7        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.38       | 1.0.42       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.23       | 1.0.26       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.39       | 1.0.43       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.9        | 1.1.12       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.20       | 1.0.22       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.44       | 1.1.46       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.10       | 1.5.3        |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.8        | 1.0.11       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/63188 | 1.2.1        | 1.3          |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.1.0        | 1.1.2        |     
                         fastd |  DISTRO  | https://release-monitoring.org/project/17116 | 21           | 22           |     
                   fb-test-app |  DISTRO  | https://release-monitoring.org/project/206162 | rosetta-1... | 1.0.0        |     
                        fbgrab |  DISTRO  | https://release-monitoring.org/project/14696 | 1.4          | 1.5          |     
                       fdk-aac |  DISTRO  | https://release-monitoring.org/project/16208 | 2.0.1        | 2.0.2        |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.6.3        | 3.7          |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.40         | ORPH
                     findutils |  DISTRO  | https://release-monitoring.org/project/00812 | 4.7.0        | 4.8.0        | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.19         | 3.27         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.12.0       | 0.14.0       |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 1.12.0       | 2.0.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.2        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.5        | 1.3.6        | ORPH
                           fmc |  DISTRO  | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 7.1.3        | 8.0.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.15.3       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.93      | ORPH
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.3.1        | 2.3.2        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.6          |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.02.00     | 21.06.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.8.0        | 1.8.4        |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.10       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.40.0       | ORPH
                          gdbm |  DISTRO  | https://release-monitoring.org/project/00882 | 1.18.1       | 1.20         | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.4       | 2.42.6       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.4        | 2.2.7        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.8.1        | 1.8.2        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.53.3       | 9.54.0       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.1       | 2.32.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.66.0       | 2.68.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.66.0       | 2.68.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.4.0        | 0.5.0        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/21445 | 0.0.8        | 0.0.9        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.13       |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.25       | 2.3.1        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.1.0      | 3.9.2.0      |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.7.1        | 3.7.2        |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.16.5       | 1.17beta1    |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.20         | 3.22         |     
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.7        | 1.0.8        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.13.2       | 2.14.4       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 5.4.0        | 6.0.0        | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.37.1       | 1.38.1       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.04         | 2.06         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 40.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7          | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.18.4       | 1.19.1       | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.18.4       | 1.19.1       |     
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.0.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.18.4       | 1.19.1       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.18.4       | 1.19.1       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.18.4       | 1.19.1       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.18.4       | 1.19.1       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.18.4       | 1.19.1       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.18.4       | 1.19.1       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.18.4       | 1.19.1       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.18.4       | 1.19.1       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.18.4       | 1.19.1       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.10.0       | 1.11.0       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.2.0        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.0.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 3.0.4        | 3.0.7        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.2.6        | 1.2.7        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.10.0       | 0.10.1       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.44.1       | 1.48.1       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2018.01.1    | 2021.03.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.2.14       | 2.4.1        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.13       | 1.9.14       |     
                        hdparm |  DISTRO  | https://release-monitoring.org/project/01304 | 9.60         | 9.62         |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 10.11        | 10.12        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.21.4       | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.4.1        | 2.5.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.37.0       | 2.38.0       |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1661         |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 68-1         | 69-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.12         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.36       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.11-13    | 7.1.0-2      | ORPH
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.20.11.0    | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 21.1.3       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 21.2.2       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 21.2.2       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_490        | 3.492        |     
                        ipcalc |  DISTRO  | https://release-monitoring.org/project/07555 | 1.0.0        | 1.0.1        |     
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.0.13       | 2.1.2        |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.7.0        | 1.8.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.3        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.23         | 0.24         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.13         | 1.15         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.17       | 1.9.18       |     
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.15.4       | 1.16.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.10.10      | 0.11.3       |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.28       | 2.0.32       |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 2.2.0        | 3.0.2        |     
                          jose |  DISTRO  | https://release-monitoring.org/project/11761 | 10           | 11           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.6        | 2.1.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.3       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.9.0        | 3.9.1        | ORPH
                     json-glib |  DISTRO  | https://release-monitoring.org/project/13144 | 1.4.4        | 1.6.2        |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.6.0-0      |     
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.1.4        | 2.2.2        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.83.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.83.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.83.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.83.0       |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2020-12-R3   | 2021-06-R1   | ORPH
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 28           | 29           |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.6.16-Ma... | 2.6.17-Ma... |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.7.2-Matrix | 17beta1      |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.9.0        | 3.9.1        |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 563          | 581.2        | ORPH
                       leveldb |  DISTRO  | https://release-monitoring.org/project/09338 | 1.22         | 1.23         |     
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20200923.3   | 20210324.2   |     
                        libass |  DISTRO  | https://release-monitoring.org/project/01560 | 0.15.0       | 0.15.1       |     
                     libassuan |  DISTRO  | https://release-monitoring.org/project/01559 | 2.5.4        | 2.5.5        | ORPH
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.25         | 2.25-1       | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 0.2          | 0.4.0        | ORPH
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.10.0       | 0.11.3       |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.49         | 2.51         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 2.0          |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.4       | 1.10.7       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.1        | 4.3.0        |     
                     libconfig |  DISTRO  | https://release-monitoring.org/project/01580 | 1.7.2        | 1.7.3        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.14         | ORPH
                     libdvdcss |  DISTRO  | https://release-monitoring.org/project/05568 | 1.4.2        | 1.4.3        |     
                     libdvdnav |  DISTRO  | https://release-monitoring.org/project/05615 | 6.1.0        | 6.1.1        |     
                    libdvdread |  DISTRO  | https://release-monitoring.org/project/05614 | 6.1.1        | 6.1.2        |     
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 5.2.0        | 5.2.1        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20191231-3.1 | 20210522-3.1 |     
                      libepoxy |  DISTRO  | https://release-monitoring.org/project/06090 | 1.5.7        | 1.5.8        |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.1.2        | 2.1.4        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                        libffi |  DISTRO  | https://release-monitoring.org/project/01611 | 3.3          | 3.4-rc1      |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.10.4       | ORPH
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/01623 | 1.9.2        | 1.9.3        | ORPH
                       libgeos |  DISTRO  | https://release-monitoring.org/project/13493 | 3.9.0        | 3.9.1        | ORPH
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.2        | 3.3.4        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.68.2       | 2.68.3       |     
                        libglu |  DISTRO  | https://release-monitoring.org/project/13518 | 9.0.1        | 9.0.2        |     
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.41         | 1.42         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.15.1       | 1.16.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.26       | 2.5.27       | ORPH
                        libgta |  DISTRO  | https://release-monitoring.org/project/01564 | 1.0.8        | 1.2.1        |     
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.3.1        |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.24      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 233          | 236          |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20210224     | 20210624     |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.36.1       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.10       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/01639 | 1.36         | 1.37         |     
                       libidn2 |  DISTRO  | https://release-monitoring.org/project/05597 | 2.3.0        | 2.3.1        |     
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.19         | 0.21         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.17.2       | 1.18.0       |     
                        libite |  DISTRO  | https://release-monitoring.org/project/17367 | 2.2.0        | 2.4.0        | ORPH
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.3.0        | ORPH
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.5.0        | 1.6.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.43         |     
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.17         |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/07470 | 1.5.2        | 1.6.0        |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.24.6       | 1.24.8       |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.10.0       | 0.10.1       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/13148 | 1.9.4        | 1.9.5        |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                 libmicrohttpd |  DISTRO  | https://release-monitoring.org/project/01658 | 0.9.72       | 0.9.73       |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1.20201016 | 2.2.2        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/14944 | 1.7          | 1.8          |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.43       | 2.0.1        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.7        | 1.2.0        |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/07953 | 4.30         | 4.31         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.65         | 3.67         |     
                        libogg |  DISTRO  | https://release-monitoring.org/project/01694 | 1.3.4        | 1.3.5        |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.1        | 3.2.4        |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 5.2.0        | 5.2.1        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2021.1       | 2021.2       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                    libphidget |  DISTRO  | https://release-monitoring.org/project/115726 | 2.1.8.201... | 2.1.9.201... |     
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.10         | 2.11         |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.5.2        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.2        | 2.0.3        | ORPH
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.2.5        | 3.3.3        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.5       | 2.51.3       |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.4        | 2.5.1        |     
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.2          | 20200710     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.2          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.2          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.6       | 3.0.7        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.72.0       | 2.99.8       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                      libsysfs |  DISTRO  | https://release-monitoring.org/project/04928 | 2.1.0        | 2.1.1        | ORPH
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.16.0       | 4.17.0       | ORPH
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.12       | 2.0.4        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.6       | 1.14.7       |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.12.1       | 0.13.0       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.40.0       | 1.41.0       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.11.0       |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.0.21       | 4.2.0        |     
                     libxcrypt |  DISTRO  | https://release-monitoring.org/project/16436 | 4.4.18       | 4.4.23       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.1.0        | 1.3.0        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 5.0.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.51.06      | 1.51.07      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.225      | 2.0.7        |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.7.3        | 1.8.0        |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.22         | 2.23         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.0.0-alpha  | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20201022     | 20210511     |     
             linuxconsoletools |  DISTRO  | https://release-monitoring.org/project/01827 | 1.7.0        | 1.7.1        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2021.06.25   | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.11       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 12.0.1-rc3   |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.11.0       | 0.12.0       |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.18.0       | 3.18.1       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/01844 | 4.93.2       | 4.94.0       | ORPH
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.31         | 0.32         |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.3        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.12.1       | 2.12.2       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.6       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.12.3       | 2.12.4       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.3        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 4.0.6        | 4.0.9        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                            m4 |  DISTRO  | https://release-monitoring.org/project/01871 | 1.4.18       | 1.4.19       | ORPH
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.28      | 10.6.0       | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.18       | 1.5.21       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 172          | 176          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.0.0-beta   | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.5.0        | 4.5.1        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 21.1.1       | 21.1.3       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 21.1.1       | 21.1.3       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.57.2       | 0.58.1       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.40.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.14         | 1.16         |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 9.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.10.6       | 3.0.2        |     
                    mjpegtools |  DISTRO  | https://release-monitoring.org/project/14612 | 2.1.0        | 2.2.0        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2021.04      | 2021.06      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20201225     | ORPH
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.11       | 5.0.0-rc4    |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.28.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.90    | 6.12.0.122   |     
                         mp4v2 |  DISTRO  | https://release-monitoring.org/project/98413 | 4.1.3        | 5.0.0        | ORPH
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.22.6       | 0.22.9       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.5.0        | 2.5.1        |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.28.0       | ORPH
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 2.1.0        | 2.2.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.15       |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.26       | 4.0.31       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.93         | 0.94         | ORPH
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.16.0       | 1.18.0       | ORPH
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.0.7        | 2.1.0        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 5.7          | 5.8          | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.20         | 3.21         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20210626 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.1       | 1.31.0       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.3        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 1.1.70       | 2.0.0        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.1        | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.7.2        | 3.7.3        | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.16      | 1.33.1-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.15-dev   |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.6        | 0.9.9        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.43.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.18.0       | 1.21.0       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
             nginx-modsecurity |  DISTRO  | https://release-monitoring.org/project/68639 | 1.0.1        | 1.0.2        |     
                   nginx-naxsi |  DISTRO  | https://release-monitoring.org/project/20448 | 0.56         | 1.3          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.22.1      | 16.4.0       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.14.1       | 0.15.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.143      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 470.42.01    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 1.14         | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 1.31         | 1.32         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.12      |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | 1.0          | 1.2.2        |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.20.1       | 1.21.1       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.15       | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.13       | 4.5.2        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.31       |     
                       openjdk |  DISTRO  | https://release-monitoring.org/project/176098 | 11.0.11+9    | 18+3         |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.58       | 2.5.5        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.1        | ORPH
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.42.1       | 0.43.3       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.10.0       | 3.12.0       |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.3.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.2        | 0.4.5        |     
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.3        | 0.4.5        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.12.0       | 3.13.0       |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.12.0       | 3.13.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.12.0       | 3.13.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.12.0       | 3.13.0       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.25       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.0.0-alpha  | ORPH
                          owfs |  DISTRO  | https://release-monitoring.org/project/21559 | 3.2p3        | 3.2p4        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.22      | 0.24.0       | ORPH
                         p7zip |  DISTRO  | https://release-monitoring.org/project/02583 | 16.02        | 17.04        |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/21376 | 1.1          | 1.2.0        |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.48.4       | 1.48.5       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.49.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.3          | 3.4          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.12         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202105       | ORPH
                          pcre |  DISTRO  | https://release-monitoring.org/project/02610 | 8.44         | 8.45         | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.36        | 10.37        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.2          | 3.3          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.32.1       | 5.35.1       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
      perl-crypt-openssl-guess |  DISTRO  | https://release-monitoring.org/project/17375 | 0.12         | 0.13         |     
                perl-data-dump |  DISTRO  | https://release-monitoring.org/project/06648 | 1.23         | 1.25         |     
             perl-data-optlist |  DISTRO  | https://release-monitoring.org/project/02769 | 0.110        | 0.112        |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.54         | 6.55         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20200907   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.17         | 9.19         |     
perl-mojolicious-plugin-aut... |  DISTRO  | https://release-monitoring.org/project/21729 | 1.36         | 1.37         |     
perl-mojolicious-plugin-aut... |  DISTRO  | https://release-monitoring.org/project/85788 | 1.05         | 1.06         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.90         |     
               perl-net-telnet |  DISTRO  | https://release-monitoring.org/project/05984 | 3.04         | 3.05         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 7.4.20       | 8.1.0alpha2  |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.11.0beta   |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.4.0        | 1.5.0        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.5.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.3.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 2.9.6        | 3.0.4        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.0.4        | 2.2.1        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.27       | 0.3.30       |     
                 pkcs11-helper |  DISTRO  | https://release-monitoring.org/project/91990 | 1.26         | 1.27         | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.7.4        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.13.1       | 2.15.1       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 1.2          | 1.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.116        | 0.119        |     
                      popperjs |  DISTRO  | https://release-monitoring.org/project/141557 | 1.16.0       | 2.9.2        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 21.06.1      |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                       postgis |  DISTRO  | https://release-monitoring.org/project/03694 | 3.1.1        | 3.1.2        |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/05601 | 13.3         | 14_BETA2     |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.4          | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                          pppd |  DISTRO  | https://release-monitoring.org/project/03703 | 2.4.8        | 2.4.9        | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.17       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.8rc1     |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 7.2.1        | 8.0.1        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.17.0       | 4.0.0-rc2    |     
                    protobuf-c |  DISTRO  | https://release-monitoring.org/project/03716 | 1.3.3        | 1.4.0        |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.7.0        | 5.8.0        |     
                          ptpd |  DISTRO  | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 14.2         | 14.99.2      |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 2.2.3        | 3.1.0        |     
             python-aioblescan |  DISTRO  | https://release-monitoring.org/project/21242 | 0.2.7        | 0.2.8        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4.1        |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/21245 | 2.0.0        | 3.0.0        |     
               python-aiofiles |  DISTRO  | https://release-monitoring.org/project/12743 | 0.5.0        | 0.7.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.7.4        | 4.0.0a1      |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.2.2        | 0.3.0        |     
               python-aioredis |  DISTRO  | https://release-monitoring.org/project/21938 | 1.3.1        | 2.0.0a1      |     
              python-aiosignal |  DISTRO  | https://release-monitoring.org/project/41889 | 1.0.0        | 1.1.2        |     
              python-aiozipkin |  DISTRO  | https://release-monitoring.org/project/56569 | 0.7.1        | 1.1.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 1.1.1        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.4.0        |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.3.0        | 1.4.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a3      |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 19.3.0       | 21.2.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.4.3       | 21.3.1       |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.10.2       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.9.1        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.4        |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.1.7        | 3.2.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.3        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.11.0       | 0.12.0       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.16.50      | 1.17.101     |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.19.48      | 1.20.101     |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/44268 | 1.2.0        | 1.2.1        |     
        python-cached-property |  DISTRO  | https://release-monitoring.org/project/06048 | 1.5.1        | 1.5.2        |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.4        | 4.0.0-dev.0  |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.2.1        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.2.0        | 5.4.0        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/14813 | 2.1.6        | 2.1.7        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2020.12.5    | 2021.5.30    |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.2       | 1.14.5       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.3        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.2.0        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.6.post2  |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.5.2        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.1.2        | 8.0.1        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 4.8.0        | 6.3.0a1      |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.4.2       | 21.3.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 3.0          | 3.4.7        |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 1.0.2        | 2.3.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a7        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 5.0.9        |     
             python-defusedxml |  DISTRO  | https://release-monitoring.org/project/03821 | 0.6.0        | 0.7.1        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.2        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.2        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.1.1        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 1.16.0       | 2.1.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 5.0.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.17.1b1.... |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.6.0        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.9.2        | 1.9.6        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.16.1       | 0.17.0       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 4.2.0        |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 3.0          | 3.1          |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.1.2        | 2.0.1        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 1.1.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.5.1        |     
              python-flask-wtf |  DISTRO  | https://release-monitoring.org/project/05702 | 0.14.3       | 0.15.1       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/85010 | 1.12         | 2.0          |     
             python-frozenlist |  DISTRO  | https://release-monitoring.org/project/41138 | 1.1.0        | 1.1.1        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.7        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.36.1       | 3.40.1       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/06870 | 0.4.16       | 1.1.0        |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.1.0       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.2.0        | 4.0.0        |     
                  python-hpack |  DISTRO  | https://release-monitoring.org/project/19034 | 3.0.0        | 4.0.0        |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0.1        | 1.1          |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 3.9.0        |     
             python-hyperframe |  DISTRO  | https://release-monitoring.org/project/19035 | 5.2.0        | 6.0.1        |     
              python-hyperlink |  DISTRO  | https://release-monitoring.org/project/19142 | 19.0.0       | 21.0.0       |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 2.10         | 3.2          |     
            python-incremental |  DISTRO  | https://release-monitoring.org/project/15162 | 17.5.0       | 21.3.0       |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.1        |     
                   python-ipdb |  DISTRO  | https://release-monitoring.org/project/12710 | 0.13.2       | 0.13.9       |     
                    python-ipy |  DISTRO  | https://release-monitoring.org/project/19783 | 1.00         | 1.01         |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.25.0       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.1        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.3.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.3       | 3.0.1        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 4.0.0a1      |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.0.1       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.3.1        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.9.2        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.99         | 1.2.1        |     
               python-m2crypto |  DISTRO  | https://release-monitoring.org/project/06599 | 0.37.1       | 0.38.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.3        | 1.1.4        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.3.4        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.3.9        | 2.4.0        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.4.2        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a6      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.4.0        | 8.8.0        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 1.0.0        | 1.0.2        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/11132 | 5.0.2        | 5.1.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.45.1       |     
              python-netifaces |  DISTRO  | https://release-monitoring.org/project/05644 | 0.10.9       | 0.11.0       |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.4          | 2.6rc2       |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.22.0.dev0  |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.0        | 3.1.1        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.1        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                python-passlib |  DISTRO  | https://release-monitoring.org/project/13203 | 1.7.2        | 1.7.4        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.4.1        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.6.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 21.1.3       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 0.13.1       | 1.0.0.dev0   |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.7.1        |     
              python-posix-ipc |  DISTRO  | https://release-monitoring.org/project/13204 | 1.0.4        | 1.0.5        |     
               python-priority |  DISTRO  | https://release-monitoring.org/project/19036 | 1.3.0        | 2.0.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.19       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.17.0       | 4.0.0-rc2    |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.7.2        | 5.8.0        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.8.5        | 2.9.1        |     
             python-ptyprocess |  DISTRO  | https://release-monitoring.org/project/06446 | 0.6.0        | 0.7.0        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2021.1       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.6.1        | 2.6.2        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.20.1       |     
                python-pycares |  DISTRO  | https://release-monitoring.org/project/19900 | 3.1.1        | 4.0.0        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.9.9        | 3.10.1       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20200910.1   | 20210626.3   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.8.2        |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.1        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.9.0        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.7.4        |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.2        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.16.0       | 1.18.14      | ORPH
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 0.9.3        | 1.0.2        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 19.1.0       | 20.0.1       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.11.7       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.4       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.6.4        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.2.7        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.0       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.61.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2021.1       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 22.1.0       |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.1        | 1.3.2        |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2020.11.20   | 2021.3.2     |     
             python-request-id |  DISTRO  | https://release-monitoring.org/project/21598 | 1.0          | 1.0.1        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.3.3        | 0.4.2        |     
                  python-scapy |  DISTRO  | https://release-monitoring.org/project/04764 | 2.4.4        | 2.4.5        |     
               python-schedule |  DISTRO  | https://release-monitoring.org/project/21600 | 0.6.0        | 1.1.0        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.1        |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.10.2       | 3.0.0-dev.1  |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.17.3       | 1.1.0        |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 18.1.0       | 21.1.0       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.1.10       | 1.2.2        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 57.0.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 5.0.1        | 6.0.1        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.13.1       | 1.14.2       |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.17.0       | 3.17.2       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
         python-singledispatch |  DISTRO  | https://release-monitoring.org/project/12013 | 3.4.0.3      | 3.6.2        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                    python-six |  DISTRO  | https://release-monitoring.org/project/04027 | 1.15.0       | 1.16.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 4.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/07203 | 0.5.4        | 0.6.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 5.3.0        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.3.0        | 2.4.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.2.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.19       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.2.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 1.1.2        | 1.1.4        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 4.1.1        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1b2        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.61.1       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 4.3.3        | 5.0.5        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 21.5.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 20.4.1       | 21.2.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typing |  DISTRO  | https://release-monitoring.org/project/10922 | 3.7.4.3      | 3.10.0.0     |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 3.7.4.3      | 3.10.0.0     |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.7.1        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 4.0.2        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.26.4       | 1.26.6       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.2        |     
                 python-uvloop |  DISTRO  | https://release-monitoring.org/project/12762 | 0.15.0       | 0.15.2       |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.2       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 2.1.3        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.20.4       | 2.21.1       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.6        | 1.8.7        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.1.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 9.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 1.0.1        | 2.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                python-wsaccel |  DISTRO  | https://release-monitoring.org/project/07278 | 0.6.2        | 0.6.3        |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.0a1      |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.30         |     
                   python-xlrd |  DISTRO  | https://release-monitoring.org/project/15107 | 1.2.0        | 2.0.1        |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.4.3        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.32.0b6     |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 5.3.0        | 5.4.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.9.5        | 3.10.0b3     |     
                  python3-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.2       | 1.14.5       |     
               python3-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.6.post2  |     
          python3-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 3.0          | 3.4.7        |     
                python3-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a7        |     
             python3-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 5.0.9        |     
                python3-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.3       | 3.0.1        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.3        | 1.1.4        |     
            python3-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.1        |     
                   python3-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 21.1.3       |     
                python3-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.7.2        | 5.8.0        |     
         python3-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.9.9        | 3.10.1       |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 57.0.0       |     
                   python3-six |  DISTRO  | https://release-monitoring.org/project/04027 | 1.15.0       | 1.16.0       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.3.2       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.33.0       | 0.35.0-rc1   |     
                         qt53d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                     qt5lottie |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
              qt5quicktimeline |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
              qt5remoteobjects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 6.2.0-alpha1 |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 6.2.0-alpha1 |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.2.0-alpha1 |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.9.0-beta.1 |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2021-02-02   | 2021-06-01   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.2          | 20200710     | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 13.0.0       |     
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 6.12         | 6.13         |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.14         | 3.15         | ORPH
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.16.1.3     | 4.17.0-beta1 |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2010.0     | 8.2106.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 1.10         | 2.0          |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 7.4.2        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc95   | 1.0.0        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.52.0       | 1.53.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.52.0       | 1.53.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.38.3       | 0.40.1       |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.14.4       | 4.14.5       |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/16338 | 1.4          | 1.5          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.1.0        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.2          | 20200710     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.2          | 20200710     | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.57.0       | 1.66.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.10       |     
                     sg3_utils |  DISTRO  | https://release-monitoring.org/project/04801 | 1.45         | 1.46         |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.7        | 3.3.8        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.1          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.1        | 0.7.2        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.8          | 4.9          |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/96796 | 4.3.1        | 4.6.1        |     
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.8        | 1.1.9        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.4.9        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.2        | 3.4.6        |     
                         snort |  DISTRO  | https://release-monitoring.org/project/212335 | 2.9.17.1     | 2.9.18       |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.4.0      | 3.1.6.0      | ORPH
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.3-80... | 1.13.4.69... |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.36-9754... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/20628 | 0.8.6        | 0.8.7        |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.3       | 0.15.0       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.15         | 5.0.4        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 3.7.1        | 3.7.2        | ORPH
                      sshguard |  DISTRO  | https://release-monitoring.org/project/13819 | 2.4.1        | 2.4.2        |     
                       sshpass |  DISTRO  | https://release-monitoring.org/project/12961 | 1.06         | 1.09         |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.20.9       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.4          | 6.5.3        |     
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 0.21.0       | 0.21.1       |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.11         | 5.12         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.12.02      | 0.12.11      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.1        | 5.9.2        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.58         | 5.59         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.5p2      | 1.9.7p1      | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                  supertuxkart |  DISTRO  | https://release-monitoring.org/project/04912 | 1.1          | 1.2          |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.2        | ORPH
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2020.04      | 2021.04      |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.27.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.31.2       | 3.32.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.40.1       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.4.122      | 2.0.1        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.5.4       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 247.3        | 249-rc2      |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12         |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a5        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.2        | 1.2.4        |     
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.3        | 4.3.4        | ORPH
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.4.6        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.13.0       | 0.14.2       | ORPH
                          tiff |  DISTRO  | https://release-monitoring.org/project/01738 | 4.2.0        | 4.3.0        | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.1.1        | 2.3.0        |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre18     |     
                      tinyalsa |  DISTRO  | https://release-monitoring.org/project/21382 | 1.1.1        | 2.0.0        |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                      tinyxml2 |  DISTRO  | https://release-monitoring.org/project/04976 | 8.0.0        | 9.0.0        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a5        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.2a         |     
                           tor |  DISTRO  | https://release-monitoring.org/project/04991 | 0.4.6.5      | 0.4.7.0-a... |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.0        | ORPH
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/18777 | 1.5.0        | 1.6.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.2        | 5.1.1        | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.0.3        | 3.1.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.9.1        |     
                         uacme |  DISTRO  | https://release-monitoring.org/project/22795 | 1.4.1        | 1.7.1        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.04      | 2021.07-rc4  |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.9.4        | 0.10         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.1.0.0-rc1  |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.4        | 6.0.7        | ORPH
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.8.0        | 0.10.0       |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.36.2       | 2.37         | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.36.2       | 2.37         | ORPH
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.8.0_lib... | 2.9.0_lib... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.52.4       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.3          | 0.4          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.3070     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.14       | 4.0.0-dev    |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.6          | 2.7          |     
                        vsftpd |  DISTRO  | https://release-monitoring.org/project/05107 | 3.0.3        | 3.0.4        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.64.2       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.0.5        | 3.1.2        |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.6.1        | 1.7.0        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/05120 | 0.9.1        | 0.9.3        |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.20         | 1.21         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.32.1       | 2.33.2       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.9        | 5.5.10       |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.5         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 6.0          | 6.11         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20210219 | 1.0.20210606 |     
               wireguard-tools |  DISTRO  | https://release-monitoring.org/project/62381 | 1.0.20210223 | 1.0.20210424 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2020.11.20   | 2021.04.21   |     
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.13.0       | 0.14.0       |     
                       wolfssl |  DISTRO  | https://release-monitoring.org/project/21631 | 4.7.0-stable | 4.7.1r       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.32.1       | 2.33.2       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/21723 | 1.2.1        | 1.2.2        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20210218     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.2       | 4.15.0       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.10.0       | 5.12.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.32         | 2.33         |     
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.7.1        | 1.7.2        |     
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/01778 | 1.7.10       | 1.7.99.2     |     
                         xmrig |  DISTRO  | https://release-monitoring.org/project/17499 | 6.12.1       | 6.12.2       | ORPH
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2021.4       | 2021.4.99.2  |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.45         | 6.01         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.18         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 367          | 368          | ORPH
                          zbar |  DISTRO  | https://release-monitoring.org/project/13689 | 0.23.1       | 0.23.90      |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.0.5        | 2.1.0-rc7    |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2020f        | 2021a        |     
                       zlib-ng |  DISTRO  | https://release-monitoring.org/project/115592 | 1.9.9-b1     | 2.0.5        | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2021.1       |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-3487    | https://security-tracker.debian.org/tracker/CVE-2021-3487   
                          bird | CVE-2021-26928   | https://security-tracker.debian.org/tracker/CVE-2021-26928  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2019-14318   | https://security-tracker.debian.org/tracker/CVE-2019-14318  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                       dovecot | CVE-2016-4983    | https://security-tracker.debian.org/tracker/CVE-2016-4983   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2021-29221   | https://security-tracker.debian.org/tracker/CVE-2021-29221  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                         exiv2 | CVE-2021-3482    | https://security-tracker.debian.org/tracker/CVE-2021-3482   
                        ffmpeg | CVE-2021-33815   | https://security-tracker.debian.org/tracker/CVE-2021-33815  
                   flatbuffers | CVE-2020-35864   | https://security-tracker.debian.org/tracker/CVE-2020-35864  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-27645   | https://security-tracker.debian.org/tracker/CVE-2021-27645  
                         glibc | CVE-2021-33574   | https://security-tracker.debian.org/tracker/CVE-2021-33574  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                     libgcrypt | CVE-2021-33560   | https://security-tracker.debian.org/tracker/CVE-2021-33560  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2001-1323    | https://security-tracker.debian.org/tracker/CVE-2001-1323   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                libmodsecurity | CVE-2020-15598   | https://security-tracker.debian.org/tracker/CVE-2020-15598  
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libuci | CVE-2019-15513   | https://security-tracker.debian.org/tracker/CVE-2019-15513  
                       libyang | CVE-2021-28902   | https://security-tracker.debian.org/tracker/CVE-2021-28902  
                       libyang | CVE-2021-28903   | https://security-tracker.debian.org/tracker/CVE-2021-28903  
                       libyang | CVE-2021-28904   | https://security-tracker.debian.org/tracker/CVE-2021-28904  
                       libyang | CVE-2021-28905   | https://security-tracker.debian.org/tracker/CVE-2021-28905  
                       libyang | CVE-2021-28906   | https://security-tracker.debian.org/tracker/CVE-2021-28906  
                     lightning | CVE-2020-7747    | https://security-tracker.debian.org/tracker/CVE-2020-7747   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                         mupdf | CVE-2017-5991    | https://security-tracker.debian.org/tracker/CVE-2017-5991   
                         mupdf | CVE-2020-16600   | https://security-tracker.debian.org/tracker/CVE-2020-16600  
                         mupdf | CVE-2020-26519   | https://security-tracker.debian.org/tracker/CVE-2020-26519  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
               network-manager | CVE-2005-2410    | https://security-tracker.debian.org/tracker/CVE-2005-2410   
               network-manager | CVE-2015-0272    | https://security-tracker.debian.org/tracker/CVE-2015-0272   
               network-manager | CVE-2020-10754   | https://security-tracker.debian.org/tracker/CVE-2020-10754  
               network-manager | CVE-2021-20297   | https://security-tracker.debian.org/tracker/CVE-2021-20297  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2020-14145   | https://security-tracker.debian.org/tracker/CVE-2020-14145  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                   php-imagick | CVE-2019-11037   | https://security-tracker.debian.org/tracker/CVE-2019-11037  
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-autobahn | CVE-2020-35678   | https://security-tracker.debian.org/tracker/CVE-2020-35678  
           python-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
          python3-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
                   python3-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2020-35503   | https://security-tracker.debian.org/tracker/CVE-2020-35503  
                          qemu | CVE-2020-35505   | https://security-tracker.debian.org/tracker/CVE-2020-35505  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3507    | https://security-tracker.debian.org/tracker/CVE-2021-3507   
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3544    | https://security-tracker.debian.org/tracker/CVE-2021-3544   
                          qemu | CVE-2021-3545    | https://security-tracker.debian.org/tracker/CVE-2021-3545   
                          qemu | CVE-2021-3546    | https://security-tracker.debian.org/tracker/CVE-2021-3546   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       ripgrep | CVE-2021-3013    | https://security-tracker.debian.org/tracker/CVE-2021-3013   
                           rpm | CVE-2021-3421    | https://security-tracker.debian.org/tracker/CVE-2021-3421   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         slirp | CVE-2021-3592    | https://security-tracker.debian.org/tracker/CVE-2021-3592   
                         slirp | CVE-2021-3593    | https://security-tracker.debian.org/tracker/CVE-2021-3593   
                         slirp | CVE-2021-3594    | https://security-tracker.debian.org/tracker/CVE-2021-3594   
                         slirp | CVE-2021-3595    | https://security-tracker.debian.org/tracker/CVE-2021-3595   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                         spice | CVE-2021-20201   | https://security-tracker.debian.org/tracker/CVE-2021-20201  
                        thrift | CVE-2020-13949   | https://security-tracker.debian.org/tracker/CVE-2020-13949  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                    tpm2-tools | CVE-2021-3565    | https://security-tracker.debian.org/tracker/CVE-2021-3565   
                   uboot-tools | CVE-2021-27097   | https://security-tracker.debian.org/tracker/CVE-2021-27097  
                   uboot-tools | CVE-2021-27138   | https://security-tracker.debian.org/tracker/CVE-2021-27138  
                          wget | CVE-2021-31879   | https://security-tracker.debian.org/tracker/CVE-2021-31879  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2021.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                          bash | CVE-2019-18276   | https://security-tracker.debian.org/tracker/CVE-2019-18276  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-3487    | https://security-tracker.debian.org/tracker/CVE-2021-3487   
                          bird | CVE-2021-26928   | https://security-tracker.debian.org/tracker/CVE-2021-26928  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                  bluez5_utils | CVE-2021-0129    | https://security-tracker.debian.org/tracker/CVE-2021-0129   
                  bluez5_utils | CVE-2021-3588    | https://security-tracker.debian.org/tracker/CVE-2021-3588   
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2021-0129    | https://security-tracker.debian.org/tracker/CVE-2021-0129   
          bluez5_utils-headers | CVE-2021-3588    | https://security-tracker.debian.org/tracker/CVE-2021-3588   
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2019-14318   | https://security-tracker.debian.org/tracker/CVE-2019-14318  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                       dovecot | CVE-2016-4983    | https://security-tracker.debian.org/tracker/CVE-2016-4983   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2021-29221   | https://security-tracker.debian.org/tracker/CVE-2021-29221  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                         exiv2 | CVE-2021-3482    | https://security-tracker.debian.org/tracker/CVE-2021-3482   
                        ffmpeg | CVE-2021-30123   | https://security-tracker.debian.org/tracker/CVE-2021-30123  
                   flatbuffers | CVE-2020-35864   | https://security-tracker.debian.org/tracker/CVE-2020-35864  
                    fluidsynth | CVE-2021-21417   | https://security-tracker.debian.org/tracker/CVE-2021-21417  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-27645   | https://security-tracker.debian.org/tracker/CVE-2021-27645  
                         glibc | CVE-2021-33574   | https://security-tracker.debian.org/tracker/CVE-2021-33574  
                      gnuchess | CVE-2021-30184   | https://security-tracker.debian.org/tracker/CVE-2021-30184  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                     libgcrypt | CVE-2021-33560   | https://security-tracker.debian.org/tracker/CVE-2021-33560  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2001-1323    | https://security-tracker.debian.org/tracker/CVE-2001-1323   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                libmodsecurity | CVE-2020-15598   | https://security-tracker.debian.org/tracker/CVE-2020-15598  
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libuci | CVE-2019-15513   | https://security-tracker.debian.org/tracker/CVE-2019-15513  
                       libyang | CVE-2021-28902   | https://security-tracker.debian.org/tracker/CVE-2021-28902  
                       libyang | CVE-2021-28903   | https://security-tracker.debian.org/tracker/CVE-2021-28903  
                       libyang | CVE-2021-28904   | https://security-tracker.debian.org/tracker/CVE-2021-28904  
                       libyang | CVE-2021-28905   | https://security-tracker.debian.org/tracker/CVE-2021-28905  
                       libyang | CVE-2021-28906   | https://security-tracker.debian.org/tracker/CVE-2021-28906  
                     lightning | CVE-2020-7747    | https://security-tracker.debian.org/tracker/CVE-2020-7747   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                        monkey | CVE-2013-1771    | https://security-tracker.debian.org/tracker/CVE-2013-1771   
                        monkey | CVE-2013-2183    | https://security-tracker.debian.org/tracker/CVE-2013-2183   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2021-32055   | https://security-tracker.debian.org/tracker/CVE-2021-32055  
               network-manager | CVE-2005-2410    | https://security-tracker.debian.org/tracker/CVE-2005-2410   
               network-manager | CVE-2015-0272    | https://security-tracker.debian.org/tracker/CVE-2015-0272   
               network-manager | CVE-2020-10754   | https://security-tracker.debian.org/tracker/CVE-2020-10754  
               network-manager | CVE-2021-20297   | https://security-tracker.debian.org/tracker/CVE-2021-20297  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2020-14145   | https://security-tracker.debian.org/tracker/CVE-2020-14145  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                   php-imagick | CVE-2019-11037   | https://security-tracker.debian.org/tracker/CVE-2019-11037  
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-autobahn | CVE-2020-35678   | https://security-tracker.debian.org/tracker/CVE-2020-35678  
           python-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2020-35503   | https://security-tracker.debian.org/tracker/CVE-2020-35503  
                          qemu | CVE-2020-35504   | https://security-tracker.debian.org/tracker/CVE-2020-35504  
                          qemu | CVE-2020-35505   | https://security-tracker.debian.org/tracker/CVE-2020-35505  
                          qemu | CVE-2020-35506   | https://security-tracker.debian.org/tracker/CVE-2020-35506  
                          qemu | CVE-2020-35517   | https://security-tracker.debian.org/tracker/CVE-2020-35517  
                          qemu | CVE-2021-20181   | https://security-tracker.debian.org/tracker/CVE-2021-20181  
                          qemu | CVE-2021-20196   | https://security-tracker.debian.org/tracker/CVE-2021-20196  
                          qemu | CVE-2021-20203   | https://security-tracker.debian.org/tracker/CVE-2021-20203  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-20263   | https://security-tracker.debian.org/tracker/CVE-2021-20263  
                          qemu | CVE-2021-3392    | https://security-tracker.debian.org/tracker/CVE-2021-3392   
                          qemu | CVE-2021-3409    | https://security-tracker.debian.org/tracker/CVE-2021-3409   
                          qemu | CVE-2021-3416    | https://security-tracker.debian.org/tracker/CVE-2021-3416   
                          qemu | CVE-2021-3507    | https://security-tracker.debian.org/tracker/CVE-2021-3507   
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3544    | https://security-tracker.debian.org/tracker/CVE-2021-3544   
                          qemu | CVE-2021-3545    | https://security-tracker.debian.org/tracker/CVE-2021-3545   
                          qemu | CVE-2021-3546    | https://security-tracker.debian.org/tracker/CVE-2021-3546   
                   qpid-proton | CVE-2016-2166    | https://security-tracker.debian.org/tracker/CVE-2016-2166   
                   qpid-proton | CVE-2016-4467    | https://security-tracker.debian.org/tracker/CVE-2016-4467   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       ripgrep | CVE-2021-3013    | https://security-tracker.debian.org/tracker/CVE-2021-3013   
                           rpm | CVE-2021-3421    | https://security-tracker.debian.org/tracker/CVE-2021-3421   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         slirp | CVE-2021-3592    | https://security-tracker.debian.org/tracker/CVE-2021-3592   
                         slirp | CVE-2021-3593    | https://security-tracker.debian.org/tracker/CVE-2021-3593   
                         slirp | CVE-2021-3594    | https://security-tracker.debian.org/tracker/CVE-2021-3594   
                         slirp | CVE-2021-3595    | https://security-tracker.debian.org/tracker/CVE-2021-3595   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                         spice | CVE-2021-20201   | https://security-tracker.debian.org/tracker/CVE-2021-20201  
                        thrift | CVE-2020-13949   | https://security-tracker.debian.org/tracker/CVE-2020-13949  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                    tpm2-tools | CVE-2021-3565    | https://security-tracker.debian.org/tracker/CVE-2021-3565   
                   uboot-tools | CVE-2021-27097   | https://security-tracker.debian.org/tracker/CVE-2021-27097  
                   uboot-tools | CVE-2021-27138   | https://security-tracker.debian.org/tracker/CVE-2021-27138  
                          wget | CVE-2021-31879   | https://security-tracker.debian.org/tracker/CVE-2021-31879  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2021.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-3487    | https://security-tracker.debian.org/tracker/CVE-2021-3487   
                          bird | CVE-2021-26928   | https://security-tracker.debian.org/tracker/CVE-2021-26928  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2019-14318   | https://security-tracker.debian.org/tracker/CVE-2019-14318  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2020-35512   | https://security-tracker.debian.org/tracker/CVE-2020-35512  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                    docker-cli | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                 docker-engine | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                       dovecot | CVE-2016-4983    | https://security-tracker.debian.org/tracker/CVE-2016-4983   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2021-29221   | https://security-tracker.debian.org/tracker/CVE-2021-29221  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                         exiv2 | CVE-2021-3482    | https://security-tracker.debian.org/tracker/CVE-2021-3482   
                        ffmpeg | CVE-2021-33815   | https://security-tracker.debian.org/tracker/CVE-2021-33815  
                   flatbuffers | CVE-2020-35864   | https://security-tracker.debian.org/tracker/CVE-2020-35864  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-27645   | https://security-tracker.debian.org/tracker/CVE-2021-27645  
                         glibc | CVE-2021-33574   | https://security-tracker.debian.org/tracker/CVE-2021-33574  
                      gnuchess | CVE-2021-30184   | https://security-tracker.debian.org/tracker/CVE-2021-30184  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                       jansson | CVE-2020-36325   | https://security-tracker.debian.org/tracker/CVE-2020-36325  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                     libgcrypt | CVE-2021-33560   | https://security-tracker.debian.org/tracker/CVE-2021-33560  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2001-1323    | https://security-tracker.debian.org/tracker/CVE-2001-1323   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                libmodsecurity | CVE-2020-15598   | https://security-tracker.debian.org/tracker/CVE-2020-15598  
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libuci | CVE-2019-15513   | https://security-tracker.debian.org/tracker/CVE-2019-15513  
                       libyang | CVE-2021-28902   | https://security-tracker.debian.org/tracker/CVE-2021-28902  
                       libyang | CVE-2021-28903   | https://security-tracker.debian.org/tracker/CVE-2021-28903  
                       libyang | CVE-2021-28904   | https://security-tracker.debian.org/tracker/CVE-2021-28904  
                       libyang | CVE-2021-28905   | https://security-tracker.debian.org/tracker/CVE-2021-28905  
                       libyang | CVE-2021-28906   | https://security-tracker.debian.org/tracker/CVE-2021-28906  
                     lightning | CVE-2020-7747    | https://security-tracker.debian.org/tracker/CVE-2020-7747   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
               network-manager | CVE-2005-2410    | https://security-tracker.debian.org/tracker/CVE-2005-2410   
               network-manager | CVE-2015-0272    | https://security-tracker.debian.org/tracker/CVE-2015-0272   
               network-manager | CVE-2020-10754   | https://security-tracker.debian.org/tracker/CVE-2020-10754  
               network-manager | CVE-2021-20297   | https://security-tracker.debian.org/tracker/CVE-2021-20297  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2020-14145   | https://security-tracker.debian.org/tracker/CVE-2020-14145  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                   php-imagick | CVE-2019-11037   | https://security-tracker.debian.org/tracker/CVE-2019-11037  
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                        python | CVE-2021-23336   | https://security-tracker.debian.org/tracker/CVE-2021-23336  
               python-autobahn | CVE-2020-35678   | https://security-tracker.debian.org/tracker/CVE-2020-35678  
           python-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
          python3-cryptography | CVE-2020-36242   | https://security-tracker.debian.org/tracker/CVE-2020-36242  
                   python3-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2020-35503   | https://security-tracker.debian.org/tracker/CVE-2020-35503  
                          qemu | CVE-2020-35504   | https://security-tracker.debian.org/tracker/CVE-2020-35504  
                          qemu | CVE-2020-35505   | https://security-tracker.debian.org/tracker/CVE-2020-35505  
                          qemu | CVE-2020-35506   | https://security-tracker.debian.org/tracker/CVE-2020-35506  
                          qemu | CVE-2020-35517   | https://security-tracker.debian.org/tracker/CVE-2020-35517  
                          qemu | CVE-2021-20181   | https://security-tracker.debian.org/tracker/CVE-2021-20181  
                          qemu | CVE-2021-20196   | https://security-tracker.debian.org/tracker/CVE-2021-20196  
                          qemu | CVE-2021-20203   | https://security-tracker.debian.org/tracker/CVE-2021-20203  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-20263   | https://security-tracker.debian.org/tracker/CVE-2021-20263  
                          qemu | CVE-2021-3392    | https://security-tracker.debian.org/tracker/CVE-2021-3392   
                          qemu | CVE-2021-3409    | https://security-tracker.debian.org/tracker/CVE-2021-3409   
                          qemu | CVE-2021-3416    | https://security-tracker.debian.org/tracker/CVE-2021-3416   
                          qemu | CVE-2021-3507    | https://security-tracker.debian.org/tracker/CVE-2021-3507   
                          qemu | CVE-2021-3527    | https://security-tracker.debian.org/tracker/CVE-2021-3527   
                          qemu | CVE-2021-3544    | https://security-tracker.debian.org/tracker/CVE-2021-3544   
                          qemu | CVE-2021-3545    | https://security-tracker.debian.org/tracker/CVE-2021-3545   
                          qemu | CVE-2021-3546    | https://security-tracker.debian.org/tracker/CVE-2021-3546   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
                        raptor | CVE-2020-25713   | https://security-tracker.debian.org/tracker/CVE-2020-25713  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       ripgrep | CVE-2021-3013    | https://security-tracker.debian.org/tracker/CVE-2021-3013   
                           rpm | CVE-2021-3421    | https://security-tracker.debian.org/tracker/CVE-2021-3421   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         slirp | CVE-2021-3592    | https://security-tracker.debian.org/tracker/CVE-2021-3592   
                         slirp | CVE-2021-3593    | https://security-tracker.debian.org/tracker/CVE-2021-3593   
                         slirp | CVE-2021-3594    | https://security-tracker.debian.org/tracker/CVE-2021-3594   
                         slirp | CVE-2021-3595    | https://security-tracker.debian.org/tracker/CVE-2021-3595   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                         spice | CVE-2021-20201   | https://security-tracker.debian.org/tracker/CVE-2021-20201  
                        thrift | CVE-2020-13949   | https://security-tracker.debian.org/tracker/CVE-2020-13949  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                    tpm2-tools | CVE-2021-3565    | https://security-tracker.debian.org/tracker/CVE-2021-3565   
                   uboot-tools | CVE-2021-27097   | https://security-tracker.debian.org/tracker/CVE-2021-27097  
                   uboot-tools | CVE-2021-27138   | https://security-tracker.debian.org/tracker/CVE-2021-27138  
                          wget | CVE-2021-31879   | https://security-tracker.debian.org/tracker/CVE-2021-31879  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
