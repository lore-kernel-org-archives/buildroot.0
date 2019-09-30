From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 06:16:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-29
Message-ID: <20190930061643.1153D203C8@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-29
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  2  |  0  | 19  |
  2019.05.x  | 22  |  1  |  0  | 23  |
  2019.08.x  | 25  |  3  |  0  | 28  |
    master   | 181 | 85  |  1  | 267 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             subversion-1.9.12 | 19
                    brltty-6.0 | 17
                 uclibc-1.0.31 | 7 
                    bird-2.0.6 | 6 
                    flac-1.3.3 | 4 
                 libdrm-2.4.99 | 4 
                     znc-1.7.5 | 4 
                  cmocka-1.1.5 | 3 
                  ffmpeg-4.2.1 | 2 
                 ytree-1.99pl1 | 2 
                  c-icap-0.5.5 | 1 
           cups-filters-1.25.6 | 1 
                  flashrom-1.1 | 1 
                   grpc-1.23.0 | 1 
           host-harfbuzz-2.5.3 | 1 
           host-nodejs-10.16.3 | 1 
                   hostapd-2.9 | 1 
                   libiio-0.18 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
                 mesa3d-19.2.0 | 1 
                         mimic | 1 
                    mpv-0.29.1 | 1 
                     ngircd-25 | 1 
          qt5multimedia-5.12.4 | 1 
                snort-2.9.14.1 | 1 
                suricata-4.1.3 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/d9b41095dcb19156e78d68613dabdec9b10e165f |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/ca3bf4049f2aebe9b6e31bf4c87bfa673c0d33a0 |     
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/5b1aa9d45b207ef5abc909379db09d91a06e8751 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/0b00948eed9bb8405b70f3f9112ecce99b365f35 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/427d299b69923507f2fa2b8c243bf18d41fd83d2 |     
microblazeel |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/fe0f2c37bec189641f4854f0ced1a24bba5c3abd |     
 aarch64_be  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fa3696662ac18c249487e2c5635ed05e8504c29e |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0dfe1bf04c40875e668965d7bee9bd4c0e6639b2 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ec83da5c6b093d3fa3b0f57d25dfbd6e11409d39 |     
  riscv32    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/72ddf6e02bafbd2000b40e2b9ca2aa844df27603 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f431a7ac4ea148d30cd2d0acd087b1c41ac9fef5 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e99179a48ccb6f9484b1fdddd9d223562d8ea728 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/362cfb57e4a91a066493269d8078d931529ddf69 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7c8c58a19f4c72e84243be7007b64490cbb7ae77 |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/970371cca78fc07465f3b6176b53cc52c1b597d2 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6149065a39afca0e5a5fb1342ea653594c607c25 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b12f163348d692d86027ef687bf6e58f48caa94b |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a0584e0d7da8ed9de78b36d1c17aa6e9f4e87047 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/face3734187b107dd1ffa230eb88a93112b68e7d |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6c22a571bca6219bf25c8b595600dbee05882458 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f74e8bffb741efafd1bebf506bb1b20f90df9e78 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a1d0c374481366053e0b79e3f5c2ae3d62ee3acb |     
  riscv32    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1d320d5db409c42add01e408ac2cedf72c2739a1 |     
   x86_64    |          c-icap-0.5.5          | NOK | http://autobuild.buildroot.net/results/2ce70b92d7e4ad78aa0fd257a3b40a841489ab6d |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/efc02c81d603251bfe46c485b38858a6db811060 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/5e01c530386b3c158ea6a1f94309230295a235d7 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/9ef4d448408773de7980fd3b511c6e6405c64997 |     
  riscv64    |      cups-filters-1.25.6       | NOK | http://autobuild.buildroot.net/results/c78e7d6d703b1b48ba19d8c4fae32b4e4489cb43 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/bbb3149e53109fffe639d8279f081be70cb34a38 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/13bc2fed948a19c07df721b3a11bc3a3eb26d234 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/8efa45ce77570eaa48dba3dfac6618c73f92fc34 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/39a308189f3bdf63e669fbf4a3eb2f7b7e987260 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/f9cff83f031f7f1c9081e883f2477e81e9b5fdd0 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/1e5fc79f709e87d57dd8e4ecd7763318979d1010 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/841a089ff0f716c13290f9c7e7be2758dc125a3f |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/190f275e4eb6d5d855f0da20d18b7240ff885398 |     
    sh4      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/dacffd0edf92e12937b02fb2c6ae7227600d6d26 | ORPH
   mipsel    |      host-nodejs-10.16.3       | NOK | http://autobuild.buildroot.net/results/a1f5e336ddaf386ba08eb5a7a299a48e2bdfe2d9 |     
    arc      |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/fad153a6eabfeda22b92b414cb639a6c058dcfe6 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a8d245487a7e58c2696f3c7b482389087d41d9b8 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/00416abc99964a416a0d295bda18e7d801672cd2 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/50b2d180986daa7f58983cd3cdee9bbfbe8a6bec |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/b4da65e9c12513d7e3362ba6977599cc7b2d8ed0 |     
    arm      |          libiio-0.18           | NOK | http://autobuild.buildroot.net/results/8ac583f965e5195fcdfb91aacc9501ce0d7a3e52 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/404fb856c7b88e69f03dbf9366505a93537ce18e |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/11599b83f0357ebb4cff27fcb201f8085b5750a2 |     
    mips     |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/bba89f029d2e7578ec84dfa8929a9e72dcf76252 |     
    mips     |             mimic              | TIM | http://autobuild.buildroot.net/results/f4331d6ec4fae898ced8e7ec6c05af1cf888a91d |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/df432f96a0ed8fc54612825eaefc91e0901e3f20 |     
   sparc     |           ngircd-25            | NOK | http://autobuild.buildroot.net/results/ffa1821387d5ed3bab1f59461bbee872799233ae | ORPH
   sparc     |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/fc3cc1de4f910c46f8b18237e215ba9efcd68ef5 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/88bd5e0ef598f76f10aebbca468d1ebc98fe3769 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/dccf12f2766d11d49e5e3954638addb765b8ac8f |     
    i686     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d2f9211f65dd7ba9060bb11795143c39c0501367 |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b059673f210853f12467cce3e805c95b21aaecde |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5d53abc66bd647502c6059d804d789378ecc1cf8 |     
    m68k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/340c407b57ab980fb8e416982eacbc80b43a69f2 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/868aafbb8d25f74284044d9f9a6c37dd6703a470 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/62e1f8c0afaa7372aa993bf831dc03eb243f0eaf |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e7ebbf5c4f156eb5410d3f318799779b3f9d95fc |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5c230a1fa6fb8f789e5762af04b639237cd79054 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f2b3c21c8afbc4fac8e616aa57541fe9f3d3355b |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f62d2689b57748fb5d2ad4bad28247483e8d1370 |     
powerpc64le  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/194646941f395b88f4f00675d925a817ee348efb |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5ee8f63d7338fdeaf8f8d453a91b22454558547d |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/af502a9f958040da4b0984b7e31edab17c8a4d51 |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/424b123641e3b55c2674a66f77d37064cdff6963 |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f1a147ded65e935b432c51d42283cc6a3783f667 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/96864a4ef36560613a7b76b78c331b913186b095 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d42be423c1c6fe7e7c419976ff35a04e18dfb8dd |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/10558123861dfcba581c422e38273c5e23c3a2cf |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/1ce434ad8a0cccb49d94f0a19c6ac195b5dd0219 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/336ba3d9f44fdded48bc71a51e8620418793770b |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/6f84443538c487345175f759d5428bf8b8d79aff |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/0a4e67437a0b525c5c3c50000ec39b29fc4e0cfb |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/ea52f9e673847eaa292e1ee236fdf134955bed20 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/7425366fc180d95b38df2cdcc3b7a2d98deb291e |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/29c8a9dfe7c102f71608ee8e8c1f3a0213c9825e |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/118cf6d8c9af90ec8a4cfe0a3a88c9de01f12411 |     
    i686     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/24c5a2c328688e5f19c847e1b69cba006d93b4d8 |     
    or1k     |         ytree-1.99pl1          | NOK | http://autobuild.buildroot.net/results/19b4bb0e194f1dbba518d9dd873cf0ca30b7aba4 |     
    sh4      |         ytree-1.99pl1          | NOK | http://autobuild.buildroot.net/results/df4f2753136d3bb3f795d3e57fa6283cd9c5f1f5 |     
   nios2     |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/e03382596360b9275cb3f055cdfdee9db5873d33 |     
  riscv32    |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/ae6a874b00e09027f2139a084a03d54c6766dac1 |     
    arm      |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/0087d561aa285c03524f54b87c16ce6c468128db |     
  mips64el   |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/3f4acdee66eb3fa33794616d06a712b73bc1c346 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
                   sudo-1.8.23 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/1c13e82424af88b37ba8fe7f9e05bc5e1815b3de |     
 powerpc64   |          sudo-1.8.23           | NOK | http://autobuild.buildroot.net/results/ceacfe8b2316a63b2b73ff8a5d3e117f8058aa7d | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

               wireshark-3.0.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/fdfc309b97b8ccb1a0e2cbc09da2c5d06e4d9022 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

      intel-mediadriver-18.4.0 | 1 
          qt5multimedia-5.12.4 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/67182f8b2cc25bdd44f9d66ddb7456b6d6ec211b |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/3de1b0ca7ef3a77b8c64f3d6138bb52c31985ab4 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/674b5844444ecda5c5c4d38ad9383c566ad96574 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           4th |  DISTRO  | https://release-monitoring.org/project/20471 | 3.62.5       | 3625         |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20190703     | 20190816     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.4        | 1.1.7        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.0       |     
                       alljoyn |  DISTRO  | https://release-monitoring.org/project/21665 | 16.04.00a    | 16.10.02     |     
                   alljoyn-tcl |  DISTRO  | https://release-monitoring.org/project/21666 | 16.04.00a    | 16.10.02     |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r3    |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.700.2      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 5.0.0        |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.34.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2019-09-23   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 0.6.0        | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.10      | 9.15.4       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.31.1       | 2.32         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.1        | 3.4.2        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.18.1       |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.1       | 7.16.3       |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.1.0        | 4.3.1        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.2.2        | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.111        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.39.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.39.0       |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20190315     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.8          | 6.9          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.14.0       | 0.15.0       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 8.0.1        | 9.0.0        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.8.2        | 3.15.3       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                       cppunit |  DISTRO  | https://release-monitoring.org/project/09543 | 1.13.2       | 1.14.0       | ORPH
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.0          |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.7.0        | 2.9.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.8        | 1.2.12       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9          | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.0.6        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20170509 | 1.3-20190808 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 18.09.9      | 19.03.3-b... |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.20.1       | 1.25.0-rc2   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.6        | 1.3.0        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 18.09.9      | 19.03.3-b... |     
                      dos2unix |  DISTRO  | https://release-monitoring.org/project/00453 | 7.4.0        | 7.4.1        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.14       | 1.8.16       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.2.0        | 9.10.0       |     
                         dstat |  DISTRO  | https://release-monitoring.org/project/00630 | 0.7.3        | 0.7.4        | ORPH
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | v18.32       | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/16911 | 1.5.0        | 1.5.1        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.22.5       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.09        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.176        | 0.177        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.20         | 0.23         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.1.1       |     
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
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.2        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.21       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.2          | 5.3          |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.0.0      | 2.5.2.0      |     
                          exim |  DISTRO  | https://release-monitoring.org/project/00768 | 4.92.2       | 4.92.3       |     
                         expat |  DISTRO  | https://release-monitoring.org/project/00770 | 2.2.8        | 2.2.9        |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/14689 | 1.12.0       | 1.13.0       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | v0.5.5       | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 3.2.10       | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 5.3.0        | 6.0.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.11.2       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | V18.09.00    | 19.09.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.3.2        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.28.1       | 3.33.4       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.39.2       | ORPH
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/08735 | 2.2.0        | 2.2.2        |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.22.0       | 2.23.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.62.0       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.60.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.6      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.3.5        | 0.4.0        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.7        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.7.13.3     | 3.8.0.0      |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.9        | 3.6.10       |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.12.9       | 1.13.1       |     
                         gperf |  DISTRO  | https://release-monitoring.org/project/01237 | 3.0.4        | 3.1          | ORPH
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.11.4       | 2.11.5       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.5        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.23.0       | 1.24.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.16.0       | 1.16.1       | ORPH
               gst-plugins-bad |  GUESS   | https://release-monitoring.org/project/21849 | 0.10.23      | 1.16.1       | ORPH
              gst-plugins-base |  GUESS   | https://release-monitoring.org/project/21850 | 0.10.36      | 1.16.1       | ORPH
              gst-plugins-good |  GUESS   | https://release-monitoring.org/project/21852 | 0.10.31      | 1.16.1       | ORPH
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.1       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.16.0       | 1.16.1       |     
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.16.0       | 1.16.1       |     
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.16.0       | 1.16.1       |     
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.16.0       | 1.16.1       |     
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.16.0       | 1.16.1       |     
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.16.0       | 1.16.1       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/21854 | v0.6.0       | 0.6.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.16.0       | 1.16.1       |     
                 gst1-validate |  DISTRO  | https://release-monitoring.org/project/21856 | 1.16.0       | 1.16.1       |     
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.1       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.16.0       | 1.16.1       |     
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/21857 | 1.16.0       | 1.16.1       |     
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.8.0        | 1.8.1        |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.4.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.42.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.0.5        | 2.0.7        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.1        | ORPH
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 10.9         | 10.10        |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.8       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.327        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.7       | 2.1.0rc1     |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.24.0       | 2.28.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 64-2         | 65-rc        | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.8-67     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 18.4.1       | 19.3.2       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 18.4.0       | 600.0132     |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 18.4.0       | 19.3.pre5    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20190618     | 20190918     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_487        | 3.487        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.2.0        | 5.3.0        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.2          | 7.3          | ORPH
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.5.0        | 1.6.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.18         | 0.21         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.18         | 0.21         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.12       | 1.90         |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.10         | 0.11         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.7.3        | 0.7.4        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.2        | 2.0.3        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.18       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-09-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.4-Leia    |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.3.4        | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 2.5.6-Kry... | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 3.4.5v2-K... | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 2.4.14-Kr... | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 1.4.8-Kry... | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 2.4.7-Kry... | 4.1.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 2.4.14-Kr... | 4.5.2-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 2.4.19v2-... | 4.2.0-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 2.4.13-Kr... | 4.2.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 2.4.3-Kry... | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 1.4.7-Kry... | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 2.8.6-Kry... | 4.1.1-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 3.6.10-Kr... | 5.2.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 2.4.12-Kr... | 4.7.0-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 1.4.9v2-K... | 3.2.1-Matrix |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 1.3.0        | 1.4.0        |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                       leveldb |  DISTRO  | https://release-monitoring.org/project/09338 | 1.20         | 1.22         |     
                       libbson |  DISTRO  | https://release-monitoring.org/project/09537 | 1.9.4        | 1.9.5        |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.25         | 2.27         |     
                        libcgi |  DISTRO  | https://release-monitoring.org/project/21164 | 1.1          | 1.3.0        | ORPH
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.1.2        | 4.2.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                     libdvbpsi |  DISTRO  | https://release-monitoring.org/project/21684 | 1.3.2        | 1.3.3        |     
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.0        | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20190324-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.1       | 2.00.5       | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/00846 | 3.0.0        | 3.2.1        |     
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.5        | 1.0.7        |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.7.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.2        |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/21361 | 1.4.3        | 1.5.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.22.30      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 232          | 233          |     
                 libhttpparser |  DISTRO  | https://release-monitoring.org/project/10989 | 2.9.0        | 2.9.2        |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.6        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.14.0       | 1.14.1       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.16.2       | 1.17         |     
                       libldns |  DISTRO  | https://release-monitoring.org/project/14817 | 1.7.0        | 1.7.1        |     
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libloki |  DISTRO  | https://release-monitoring.org/project/21486 | 0.1.7        | 03.07.2005   |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.18.2       | 1.20.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.3        | 1.1.4        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 1.8.0        | 2.0.0        |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2018.9.1     | 2019.4       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/01699 | 0.4.9        | 0.4.10       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | v0.91.171102 | 140214       |     
                       libpfm4 |  DISTRO  | https://release-monitoring.org/project/21491 | 4.9.0        | 4.10.1       |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.2.5        | 6.4.5        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.22.6       | 1.24.0       |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/01709 | 0.19.2       | 0.19.5       |     
                      libroxml |  DISTRO  | https://release-monitoring.org/project/21687 | 3.0.1        | 3.0.2        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.46.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.0        | 2.4.1        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.19.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20190315     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20190315     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.68.1       |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.13         | 4.14         | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.1        | 1.2.2        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.8.4        |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.16.6       | 1.18.0       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.5.0        | 2.6.0.pre1   |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.1        | 8.8.3        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 2.4.2        | 3.2.0        |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.3        | 0.8.4        |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/03531 | 2.44         | 2.46         |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.04      |     
                       libyaml |  DISTRO  | https://release-monitoring.org/project/01800 | 0.2.1        | 0.2.2        | ORPH
                     lightning |  DISTRO  | https://release-monitoring.org/project/01816 | 2.1.2        | 2.1.3        |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.20         | 2.20.2       | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/14535 | 1.3.0        | 1.3.2        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.03.06   | 2019.09.30   | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 8.0.1        | 9.0.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                        luajit |  DISTRO  | https://release-monitoring.org/project/06444 | 2.0.5        | 2.1.0-beta3  |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.30.1-0     | 1.30.1-1     |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.183     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.1.0        | 3.2.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.18      | 10.4.8       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.20       | 4.8.23       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | v153         | 164          |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.12       | 1.5.18       | ORPH
                       memtool |  DISTRO  | https://release-monitoring.org/project/21747 | 2016.10.0    | 2018.03.0    |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.34.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.8.2        | 10.2         |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2019.03      | 2019.07.1    |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190116     | 20190618     | ORPH
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.10.4       | 1.10.6       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.6       | 4.3.0        |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.4.0.198    |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.14      | 0.21.15      |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.1        | 2.4.2        |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.1.1        | 3.2.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.3        | 1.8.6        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.4        | 1.1.5        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.12.1       | 1.12.2       |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.19         | 3.20         |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.14         | 1.14.1       |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.34         | 0.35         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20190928 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.3        | 1.0.4        | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.203        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.2       | 1.21.2-dev   | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.20      | 0.52.21      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.0        | 0.9.2        |     
                         nginx |  GUESS   | https://release-monitoring.org/project/05413 | 1.16.1       | 1.17.4       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                         ngrep |  DISTRO  | https://release-monitoring.org/project/02084 | 1_47         | 1.47         |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 10.16.3      | 12.11.0      |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                 nss-pam-ldapd |  DISTRO  | https://release-monitoring.org/project/21868 | 0.9.8        | 0.9.10       |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.12       | 2.0.13       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.129      |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          olsr |  DISTRO  | https://release-monitoring.org/project/21543 | 0.9.6.1      | 0.9.8        | ORPH
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.2.2        | 305          |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.2rc3     | ORPH
                       openpgm |  DISTRO  | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.0       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.5.0        | 3.6.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.5.0        | 3.6.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.17       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.29       | 0.4.30       |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.17      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.40.14      | 1.44.6       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.28.2       | 5.31.4       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.01         | 6.06         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.55         | 0.56         |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.22         | 8.25         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0201       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                        physfs |  DISTRO  | https://release-monitoring.org/project/03631 | 3.0.1        | 3.0.2        |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.4        |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20190315     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.77.0       | 0.81.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.10         | 2.11         |     
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 5.0.1        | 6.2.0        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0-rc1   |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | v5.1.0       | 5.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.9          | 1.10         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/05749 | 0.72         | 0.73         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.5.4        | 4.0.0a0      |     
        python-aiohttp-session |  DISTRO  | https://release-monitoring.org/project/21250 | 2.7.0        | 2.8.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.2        | 0.8.4        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.10.0       | 0.15.2       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.0        | 3.2.2        |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 18.2.0       | 19.1.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.8.1       | 19.9.3       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.6.0        | 2.7.0        |     
python-backports-ssl-match-... |  DISTRO  | https://release-monitoring.org/project/11988 | 3.5.0.1      | 3.7.0.1      |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.1.6        | 3.1.7        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.5.3        | 4.8.0        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 3.1.5        | 3.1.6        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.13      | 0.12.17      |     
        python-cached-property |  DISTRO  | https://release-monitoring.org/project/06048 | 1.4.0        | 1.5.1        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2019.6.16    | 2019.9.11    |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 5.10.0       | 7.0.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.2.0       |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
                python-couchdb |  DISTRO  | https://release-monitoring.org/project/09473 | 1.1          | 1.2          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 19.9.1       |     
              python-cssselect |  DISTRO  | https://release-monitoring.org/project/11593 | 1.0.3        | 1.1.0        |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 1.0.1        | 1.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.29.1       | 0.43.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.0.11       | 4.4.0        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.0.1        | 3.4.0        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 2.2.4        | 3.0a1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 3.5.1        | 4.0.2        |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.3.1        | 2.4.0        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.8.r98      | 1.9.2        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.13         | 0.13.2       |     
                   python-fire |  DISTRO  | https://release-monitoring.org/project/21700 | 0.2.0        | 0.2.1        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.0.2        | 1.1.1        |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 0.11.1       | 0.12.2       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 3.0.3        | 3.0.8        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.0        | 2.4.1        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.0.1        | 3.1.1        |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0b10       | 1.0.1        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.10.3       | 0.14.0       |     
             python-hyperframe |  DISTRO  | https://release-monitoring.org/project/19035 | 5.1.0        | 5.2.0        |     
              python-hyperlink |  DISTRO  | https://release-monitoring.org/project/19142 | 18.0.0       | 19.0.0       |     
                python-ibmiotf |  DISTRO  | https://release-monitoring.org/project/21699 | 0.2.8        | 0.4.0        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/20876 | 0.3.1        | 1.0.0        |     
               python-influxdb |  DISTRO  | https://release-monitoring.org/project/12696 | 5.0.0        | 5.2.3        |     
                    python-ipy |  DISTRO  | https://release-monitoring.org/project/19783 | 0.83         | 1.00         |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.4.0        | 7.8.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.13.3       | 0.15.1       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.0.2        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 19.2.0       |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.94         | 0.97         |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.4.0        | 4.4.1        |     
                    python-m2r |  DISTRO  | https://release-monitoring.org/project/15243 | 0.1.12       | 0.2.1        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.0.6        | 1.1.0        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.0.1        | 3.1.1        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.3.6        | 2.3.8        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.1.1        |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 0.2.2        | 0.8.1        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 1.0.2        | 2.0.0        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8          | 0.8.4        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 4.0.1        | 7.2.0        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 0.6.1        | 0.6.2        |     
              python-netifaces |  DISTRO  | https://release-monitoring.org/project/05644 | 0.10.6       | 0.10.9       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.3          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.17.2       |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.4.0        | 0.5.1        |     
               python-pathlib2 |  DISTRO  | https://release-monitoring.org/project/12723 | 2.3.3        | 2.3.5        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 10.5         | 12.0.1       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.16.0       | 0.29.0       |     
                python-pexpect |  DISTRO  | https://release-monitoring.org/project/07654 | 4.6.0        | 4.7.0        |     
            python-pickleshare |  DISTRO  | https://release-monitoring.org/project/12037 | 0.7.4        | 0.7.5        |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 1.8          | 2.5          |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0-rc1   |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2017.1.2     | 2019.1       |     
                 python-pyasn1 |  DISTRO  | https://release-monitoring.org/project/06996 | 0.4.6        | 0.4.7        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.2.4        | 0.2.6        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.24         | 0.25         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.3        | 1.5.5        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev3   |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.2.0        | 2.4.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.3.1        |     
                  python-pylru |  DISTRO  | https://release-monitoring.org/project/21584 | 1.0.9        | 1.2.0        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 1.4.0        | 2.2.0        |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 0.7.10       | 0.9.3        |     
                 python-pynacl |  DISTRO  | https://release-monitoring.org/project/12703 | 1.2.1        | 1.3.0        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.2       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.13.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.76         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.3        | 0.5.6        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.27       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/13209 | 0.3.3        | 0.3.4        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/12027 | 4.4.6        | 4.4.12       |     
            python-pysnmp-apps |  DISTRO  | https://release-monitoring.org/project/21590 | 0.4.1        | 0.5.3        |     
                python-pysocks |  DISTRO  | https://release-monitoring.org/project/10673 | 1.6.7        | 1.7.1        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.15.0       | 0.26.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.27.1       | 0.46.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.21.0       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                 python-pyyaml |  DISTRO  | https://release-monitoring.org/project/04123 | 4.2b4        | 5.1.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 18.0.2       | 18.1.0       |     
                  python-raven |  DISTRO  | https://release-monitoring.org/project/08715 | 6.9.0        | 6.10.0       |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 1.1          | 2019.9       |     
             python-request-id |  DISTRO  | https://release-monitoring.org/project/21598 | 0.3.1        | 1.0          |     
      python-requests-toolbelt |  DISTRO  | https://release-monitoring.org/project/05665 | 0.7.1        | 0.9.1        |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.6.3        | 0.7.0a2      |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                  python-scapy |  DISTRO  | https://release-monitoring.org/project/04764 | 2.4.0        | 2.4.3        |     
                python-scapy3k |  DISTRO  | https://release-monitoring.org/project/21599 | v0.18        | 0.32         |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 2.3.1        | 3.1.1        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.7.10       | 0.12.2       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 17.0.0       | 18.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.2.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.2.0        | 3.3.3        |     
            python-simpleaudio |  DISTRO  | https://release-monitoring.org/project/21607 | 1.0.1        | 1.0.2        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.11.1       | 3.16.0       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.15.0       | 0.45.2       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 4.19.19      |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.0.2        | 4.3.1        |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/21612 | 3.2          | 3.4          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.3        | 1.3.8        |     
           python-subprocess32 |  DISTRO  | https://release-monitoring.org/project/04043 | 3.5.3        | 3.5.4b1      |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 0.0.5        | 0.9.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.7          | 1.14.1       |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 0.9.1        | 1.6.2        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.9.3        | 0.11.0       |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/12824 | 1.0.1        | 1.0.3        |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.9.3        | 0.10.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.1        | 6.0.3        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 17.8.0       | 18.6.0       |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 19.2.1       | 19.7.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.0.0       | 19.1.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.0        |     
                 python-typing |  DISTRO  | https://release-monitoring.org/project/10922 | 3.6.6        | 3.7.4.1      |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.0        | 2.5.2        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.12.0       | 0.14.0       |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.3       | 1.25.6       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 1.3.1        | 2.0.1        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.12.6       | 0.14.0       |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.1        | 1.8.5        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.39         | 0.40         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.47.0       | 0.56.0       |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 7.0          | 8.0.2        |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.15.2       | 0.16.0       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.10.11      | 1.11.2       |     
                  python-ws4py |  DISTRO  | https://release-monitoring.org/project/12030 | 0.4.2        | 0.5.1        |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 0.9.6        | 1.2.1        |     
              python-yieldfrom |  DISTRO  | https://release-monitoring.org/project/21621 | 1.0.3        | 1.0.4        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.7.4        | 3.8.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.0.6        | 1.1.0        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.2.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 3.1.1        | 4.1.0        | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.2.0        | 7.3.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 8.4.0        | 9.0.1        |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.13.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.13.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.0-rc.1   |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0-beta   | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190201   | 2.20190609   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20190315     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.8        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.9.1        | 1.10.4       | ORPH
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 5            | 6.7          |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.22.0       | 8.1908.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.6        | 2.6.4        | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.7.1.1      | 2.9.0.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.0.0      | 2.3.1.0      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 0.4.0.0      | 1.0.3.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.0.0      | 2.5.1.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.0.2      | 2.3.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.1.1      | 2.2.2.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.4.0.1      | 0.5.1.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 03032018     | 30122018     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.10.8       | 4.11.0       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/16338 | 1.3          | 1.4          | ORPH
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.0.5        | 3.1.1        |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 3.5          | 4.0          |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.2.4        | 3.3.1        |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.2.2        | 3.3.2        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.14         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.1          | 4.2          |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.6.4.0      | 2.9.0.0      |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | v4.28-966... | 4.30-9700... |     
                       solarus |  DISTRO  | https://release-monitoring.org/project/21319 | 1.6.0        | 1.6.2        |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                        spdlog |  DISTRO  | https://release-monitoring.org/project/15599 | 1.3.1        | 1.4.1        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.5.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 0.19.1       | 0.19.2       |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.2          | 5.3          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.09.58      | 0.10.06      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.1        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.9.12       | 1.12.2       |     
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 3.1.4        | 4.0.4        |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.3        | 5.0.0-rc1    |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.4       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.1.6       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 241          | 243          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.90         | 2.96         |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                           tar |  DISTRO  | https://release-monitoring.org/project/04939 | 1.29         | 1.32         | ORPH
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.8          | 3.0          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.0.3        | 2.2.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 3.1.4        | 4.0          |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.1        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                      turbolua |  DISTRO  | https://release-monitoring.org/project/11727 | 2.1.2        | 2.1.3        |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 4.9.11       | 4.10         |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.6.4        | 5.8.2        | ORPH
                         unscd |  DISTRO  | https://release-monitoring.org/project/07070 | 0.52         | 0.53         |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.11      |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.7.1        | 0.8.0        |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.46.1       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.1          | 0.2          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.0133     | 8.1.2102     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.58.0       | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 6.0.1        | 7.0.0        |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.0        | 5.5.1        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.2        | 4.17         |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.0.3        | 3.1.0        | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.0       | 2.26.1       |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20190929-... |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.1.2        | 3.2          |     
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/21723 | 1.0.4        | 1.0.5        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
              xapp_xsetpointer |  DISTRO  | https://release-monitoring.org/project/21716 | 1.0.0        | 1.0.1        |     
                       xdotool |  DISTRO  | https://release-monitoring.org/project/08648 | 3.20150503.1 | 3.20160805.1 |     
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/05217 | 2.10.5       | 2.10.6       |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 0.28.2       | 0.29.0       |     
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/05239 | 1.9.0        | 1.9.1        |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/05229 | 1.0.15       | 1.0.16       |     
 xdriver_xf86-video-openchrome |  DISTRO  | https://release-monitoring.org/project/05230 | 0.5.0        | 0.6.0        |     
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/05193 | 1.3.14       | 1.04         | ORPH
                    xlib_libXt |  DISTRO  | https://release-monitoring.org/project/01793 | 1.1.5        | 1.2.0        |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.4          | 3.5          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 348          | 349          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.9        | 0.2.11       |     
                         xvkbd |  DISTRO  | https://release-monitoring.org/project/05273 | 3.9          | 4.0          | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.2        | 0.6.3        | ORPH
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 1.99pl1      | 1.99pl2      |     
                          zbar |  DISTRO  | https://release-monitoring.org/project/13689 | 0.22         | 0.23         |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.2        | 1.4.3        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.1       |     

-- 
http://autobuild.buildroot.net
