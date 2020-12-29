From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 08:23:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-28
Message-ID: <20201229082332.CE17986D16@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  2  |  0  | 15  |
  2020.11.x  | 11  |  5  |  1  | 17  |
    master   | 94  | 51  |  2  | 147 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 10
        host-sentry-cli-1.57.0 | 7 
                  bind-9.11.25 | 5 
                  boost-1.74.0 | 5 
            quickjs-2020-11-08 | 5 
               capnproto-0.8.0 | 3 
                    php-7.4.13 | 2 
                  zeromq-4.3.3 | 2 
      gst1-plugins-base-1.18.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                  host-python3 | 1 
                    htop-3.0.3 | 1 
           python-pybind-2.6.1 | 1 
                    qemu-5.2.0 | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                upmpdcli-1.5.5 | 1 
                       vmtouch | 1 
               wireshark-3.4.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/2b3cdd3a4288b76d7d485fded81692a2024556ce | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/a7d10c61278c379289a10bf279bfaf14fccbecaa | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/d915759f3e14aeee39a6780eeea89e7587fd0e07 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/c932acdf30ec7d812aa12f149e05d11ecaa55ddc | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/a14673ed9ccff9bd8a1178a073816e45b5a8456f | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/7e835cb905e960b1dac57648f1085faed5bd517b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/61a8028afd41c8fafb935fbeda50cd2d331d08ae |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/5beb90efbb764747333eb3b0b90fabb947f4a076 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/9031f2eb14daf00f4f796945d2033c1a26de2a18 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/0e6ee577bcf0588c20d1a9bde5aadadf02aff5e1 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8ac178ca38d054445b77dd84f2725034543a75f9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6392729465a0453149f788b9eecf215b4af09565 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/405d138c0f91b7e8ee921aaddd4f1fc829a17745 |     
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/bda42aa91b8ac0bb66f6a8ef18b2388428cba018 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a1107c73b6b6c4bf9f4ca3de41651030c0489dd3 | ORPH
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/0e4fd9d06a92f6e975c73731a9b30965765ef283 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fa13c4424a5774e11f5041c88ab2e48d470e3a2f |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1c937f452936d002be4031fe5fcd7c253b9be785 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0da0eb1540c0cb2bc6e9de31ddf29f63ef6a2e8d |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ae5af3b5d98119445a77731e0411a6cbea530f39 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1cdae0d4f2b0dd7cedeb86bf5c0b15c308f49e67 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2f570191e0385586a167fe489ab41d65629ca08a |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a2a756c426e6659f031bb8f7a4270cd590a87110 |     
microblazeel |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/d924bb22e643dac02374360f99df0e8102f6ea61 | ORPH
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/77a4732f35d78a1214d081b03274996fbccfdb64 | ORPH
   mipsel    |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/a1bd63f8b5c5cd3cda2ccccd4f0ce9ab617b5d61 | ORPH
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/4b9bb10cb4983561ec626a58377dafda3d641026 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/d57342b0fbabd5031e1c06769537302d5c344d61 | ORPH
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/c69e1f5cec56992551f8e80b302ef92bc7993c96 |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/5236cba880eea6c229be1afb90e14138bde4dd9f |     
    arc      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/4866e480b054fb03912dbc8cca53f9d2373a080e |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/cbb73c9fa7a1d447e0c765ac55abb28bd1ea9717 |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/c96f72f39664f7f6baa7983e52bf842e0ee87c9b |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/53dc0a6c4632ed92d48c95669bb8e8099154465a |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d5e85b1775d0b0621d1882efaea433e303f618d0 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f323f7df4063f9c7eb391b32ae778597e128bfc5 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6cd2fd7c43a66e19e5c51ebad66c75237a818837 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/11424483dedbe704e61ad04004b204899fc3feca |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8a9fd35fdde1162d22fdfa90c457615f2706108d |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/36495579f58c9b003f1069572aadf8a68f692bb2 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/d937186674841d0419a32869745f71e4e7f7b744 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/fb423d731fdb4901b2308302ebecb5c181004f60 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/adfcf2f8bfb0061de57ec76cfc62d4c8a2df8da8 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/d05588db46d05d839dbae86936e9b19a3101596b |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/84ac62e84bb2a32f935203ca3f1d87396364ffef |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/afacf5c5c2cd9dff6962523f1fdded9b474b9d66 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5bd96c32b471ce0e815b6ad7505a0524a0b1898a |     
    arm      |         upmpdcli-1.5.5         | NOK | http://autobuild.buildroot.net/results/dae8b2cdc46a698134fbd59d8597c4bbb5972340 |     
 aarch64_be  |            vmtouch             | TIM | http://autobuild.buildroot.net/results/37df5f0ac05eaf6665303b1f748adb3215c2c520 |     
  powerpc    |        wireshark-3.4.2         | NOK | http://autobuild.buildroot.net/results/211b0cf52a5b3a9e57852d35eda8dde39b9fac96 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/dd14c77305dd88283ef792ba6b092902155d60ca |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/bdbdd86100fc9bd01188e0ebd562ee13ee6a4e99 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/4827dfebfdbc285e7f4275fb954f2e5b1429b42d |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                    proj-6.3.0 | 1 
               protobuf-3.11.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           proj-6.3.0           | NOK | http://autobuild.buildroot.net/results/582e1081e5aa946532e932892428e94aac269c30 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f1af069da054644cd5722c25cc3baefb72b52f5b |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                 uclibc-1.0.36 | 2 
                        bustle | 1 
            qt5location-5.15.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |             bustle             | TIM | http://autobuild.buildroot.net/results/9a2eaa95b88dcb3494cb9e74a7a727c11e754a0b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fb6fc9702606663d5ade00c7140e3ac9e76bb3c8 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c51ce73216fc7da4cd79d9d2515a0bbefc53373a |     
   mipsel    |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/f9801ce754be83f1cd1db28da25edd57d489fde2 |     
   xtensa    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/7192ae16bba0d947de4f8a4e0307744f43e9cce0 |     
  powerpc    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/f3d4cac4e067191e45f1172230f3038165bbc0ae |     


Gitlab CI results for 2020-12-28
================================

Detail of defconfig failures for 2020.02.9
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       atmel_sama5d2_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268135  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268136  |      
           atmel_sama5d3_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268137  |      
       atmel_sama5d3_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268138  |      
       atmel_sama5d3_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268139  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268140  |      
                 atmel_sama5d3xek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268141  |      
           atmel_sama5d4_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268142  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268143  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268144  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268145  |      
                      bananapi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268146  |      
                 bananapi_m2_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268147  |      
                bananapi_m2_ultra |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268148  |      
                     bananapi_m64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268149  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268150  |      
                   beagleboardx15 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268151  |      
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268152  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268153  |      
                     beagleboneai |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268154  |      
                      beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268155  |      
                  chromebook_snow |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268156  |      
                             ci20 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268157  |      
                     csky_gx6605s |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268158  |      
                      cubieboard2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268159  |      
            engicam_imx6qdl_icore |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268160  |      
        engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268161  |      
        engicam_imx6qdl_icore_rqs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268162  |      
              engicam_imx6ul_geam |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268163  |      
             engicam_imx6ul_isiot |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268164  |      
               freescale_imx28evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268165  |      
        freescale_imx6dlsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268166  |      
          freescale_imx6dlsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268167  |      
         freescale_imx6qsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268168  |      
           freescale_imx6qsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268169  |      
          freescale_imx6sxsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268170  |      
           freescale_imx7dsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268171  |      
              freescale_imx8mmevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268172  |      
              freescale_imx8mqevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268173  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268174  |      
               freescale_p1025twr |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268175  |      
             freescale_t1040d4rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268176  |      
          freescale_t2080_qds_rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268177  |      
           friendlyarm_nanopi_a64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268178  |      
          friendlyarm_nanopi_neo2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268179  |      
     friendlyarm_nanopi_neo_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268180  |      
                          galileo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268181  |      
                 grinn_chiliboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268182  |      
                  grinn_liteboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268183  |      
                 hifive_unleashed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268184  |      
                         imx23evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268185  |      
                   imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268187  |      
                     imx6-sabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268188  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268189  |      
                        imx6slevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268190  |      
                       imx6sx-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268191  |      
                        imx6ulevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268192  |      
                       imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268193  |      
                        imx7d-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268194  |      
                        imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268195  |      
                       imx8mmpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268196  |      
                        imx8mpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268197  |      
                          lafrite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268198  |      
                         lego_ev3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268199  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268200  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268201  |      
                  minnowboard_max |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268203  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268202  |      
                          mx25pdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268204  |      
                          mx51evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268205  |      
                         mx53loco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268206  |      
                         mx6cubox |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268207  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268208  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268209  |      
                        nanopi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268210  |      
                   nanopi_m1_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268211  |      
                       nanopi_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268212  |      
                      nexbox_a95x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268213  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268214  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268215  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268216  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268217  |      
                        odroidxu4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268218  |      
        olimex_a10_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268219  |      
             olimex_a13_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268220  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268222  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268221  |      
       olimex_a20_olinuxino_micro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268223  |      
             olimex_a33_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268224  |      
             olimex_a64_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268225  |      
          olimex_imx233_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268226  |      
                    openblocks_a6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268227  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268229  |      
                   orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268228  |      
                     orangepi_one |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268230  |      
                orangepi_one_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268231  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268233  |      
                     orangepi_pc2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268232  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268234  |      
                    orangepi_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268235  |      
                   orangepi_prime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268236  |      
                      orangepi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268237  |      
                     orangepi_win |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268238  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268239  |      
              orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268240  |      
                       pandaboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268241  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268242  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268243  |      
                           pine64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268244  |      
                    pine64_sopine |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268245  |      
                qemu_aarch64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268246  |      
               qemu_arm_versatile |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268247  |      
         qemu_arm_versatile_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268248  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268249  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268250  |      
                qemu_csky610_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268251  |      
                qemu_csky807_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268252  |      
                qemu_csky810_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268253  |      
                qemu_csky860_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268254  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268255  |      
                   qemu_m68k_q800 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268256  |      
            qemu_microblazebe_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268257  |      
            qemu_microblazeel_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268259  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268260  |      
            qemu_mips32r2el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268261  |      
              qemu_mips32r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268262  |      
            qemu_mips32r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268263  |      
                qemu_mips64_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268264  |      
              qemu_mips64el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268265  |      
              qemu_mips64r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268266  |      
            qemu_mips64r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268267  |      
                 qemu_nios2_10m50 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268268  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268269  |      
                 qemu_ppc64_e5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268270  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268271  |      
             qemu_ppc64le_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268272  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268273  |      
                   qemu_ppc_mac99 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268274  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268275  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268276  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268277  |      
                qemu_riscv64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268278  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268279  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268280  |      
               qemu_sparc64_sun4u |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268281  |      
                  qemu_sparc_ss10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268282  |      
                         qemu_x86 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268284  |      
                      qemu_x86_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268283  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268285  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268286  |      
                      raspberrypi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268295  |      
                     raspberrypi0 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268287  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268288  |      
                     raspberrypi2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268289  |      
                     raspberrypi3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268291  |      
                  raspberrypi3_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268290  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268292  |      
                     raspberrypi4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268294  |      
                  raspberrypi4_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268293  |      
                        riotboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268296  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268297  | ORPH 
                      roseapplepi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268298  |      
                 s6lx9_microboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268299  |      
                       sheevaplug |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268300  |      
                 snps_aarch64_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268301  |      
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268302  |      
              snps_archs38_axs103 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268303  |      
                snps_archs38_haps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268304  |      
                snps_archs38_hsdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268305  |      
                 snps_archs38_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268306  |      
                socrates_cyclone5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268307  |      
                solidrun_clearfog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268308  |      
          solidrun_clearfog_gt_8k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268309  |      
   solidrun_macchiatobin_mainline |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268310  | ORPH 
    solidrun_macchiatobin_marvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268311  | ORPH 
                  stm32f429_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268312  |      
                  stm32f469_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268313  |      
                  stm32mp157c_dk2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268314  |      
              toradex_apalis_imx6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268315  |      
                           ts4900 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268316  |      
                           ts5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268317  |      
                           ts7680 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268318  |      
                        wandboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268319  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268320  |      
                        warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268321  |      
                    zynq_microzed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268322  |      
                       zynq_zc706 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268323  |      
                         zynq_zed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268324  |      
                    zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268327  |      


Detail of runtime-test failures for 2020.02.9
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268328  | ORPH 
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268329  | ORPH 
          TestATFVexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268330  | ORPH 
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268372  | ORPH 
         TestCheckPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268508  |      
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268373  | ORPH 
           TestCrudiniPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268374  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268375  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268376  | ORPH 
                 TestExt2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268346  | ORPH 
               TestExt2r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268347  | ORPH 
                 TestExt3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268348  | ORPH 
                 TestExt4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268349  | ORPH 
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268500  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268501  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268502  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268503  | ORPH 
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268504  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268505  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268506  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268507  | ORPH 
                 TestF2FS |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268350  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268331  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268332  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268333  | ORPH 
              TestGitHash |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268344  | ORPH 
              TestGitRefs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268345  | ORPH 
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268341  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268342  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268377  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268378  | ORPH 
  TestInitSystemBusyboxRo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268361  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268362  | ORPH 
  TestInitSystemBusyboxRw |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268363  | ORPH 
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268364  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268365  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268366  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268367  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268368  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268369  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268370  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268371  | ORPH 
 TestIso9660Grub2External |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268351  | ORPH 
...0Grub2ExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268352  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268353  | ORPH 
...so9660SyslinuxExternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268354  | ORPH 
...slinuxExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268355  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268356  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268357  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268385  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268393  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268381  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268383  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268387  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268399  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268401  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268391  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268405  | ORPH 
           TestLuaLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268395  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268407  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268409  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268389  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268403  | ORPH 
         TestLuaLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268411  | ORPH 
             TestLuaLzlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268415  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268492  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268397  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268386  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268394  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268382  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268384  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268388  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268400  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268402  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268392  | ORPH 
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268406  | ORPH 
        TestLuajitLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268396  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268408  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268410  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268390  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268404  | ORPH 
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268412  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268494  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268499  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268398  | ORPH 
                 TestLuvi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268413  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268414  | ORPH 
           TestNoTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268343  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268416  | ORPH 
                 TestOpkg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268417  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268418  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268419  | ORPH 
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268420  | ORPH 
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268421  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268422  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268423  | ORPH 
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268424  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268427  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268428  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268429  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268425  | ORPH 
          TestPostScripts |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268338  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268430  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268431  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268432  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268433  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268442  | ORPH 
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268434  | ORPH 
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268436  | ORPH 
    TestPythonPy2Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268438  | ORPH 
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268440  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268443  | ORPH 
         TestPythonPy2Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268445  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268447  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268449  | ORPH 
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268451  | ORPH 
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268454  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268457  | ORPH 
     TestPythonPy2Gobject |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268459  | ORPH 
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268460  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268379  | ORPH 
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268462  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268464  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268466  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268468  | ORPH 
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268470  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268472  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268474  | ORPH 
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268475  | ORPH 
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268477  | ORPH 
       TestPythonPy2Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268479  | ORPH 
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268481  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268487  | ORPH 
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268435  | ORPH 
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268437  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268439  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268441  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268444  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268446  | ORPH 
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268448  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268450  | ORPH 
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268452  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268453  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268455  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268456  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268458  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268461  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268380  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268463  | ORPH 
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268465  | ORPH 
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268467  | ORPH 
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268469  | ORPH 
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268471  | ORPH 
      TestPythonPy3Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268473  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268476  | ORPH 
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268478  | ORPH 
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268480  | ORPH 
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268484  | ORPH 
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268490  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268334  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268335  | ORPH 
         TestRootPassword |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268339  | ORPH 
        TestRootfsOverlay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268340  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268495  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268496  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268358  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268336  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268337  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268497  | ORPH 
                 TestTmux |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268498  | ORPH 
                  TestUbi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268359  | ORPH 
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933268360  | ORPH 


Detail of defconfig failures for 2020.11.1
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198014  |      
                     raspberrypi2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198083  |      


Detail of runtime-test failures for 2020.11.1
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198204  | ORPH 
           TestCrudiniPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198206  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198207  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198208  | ORPH 
...rch64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198345  | ORPH 
...tlinAarch64GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198346  | ORPH 
...arch64MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198347  | ORPH 
...otlinAarch64MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198348  | ORPH 
...ch64UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198349  | ORPH 
...linAarch64UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198350  | ORPH 
...h64beGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198351  | ORPH 
...inAarch64beGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198352  | ORPH 
...64beUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198353  | ORPH 
...nAarch64beUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198354  | ORPH 
...750dUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198355  | ORPH 
...nArcle750dUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198356  | ORPH 
...ehs38GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198357  | ORPH 
...inArclehs38GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198358  | ORPH 
...hs38UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198359  | ORPH 
...nArclehs38UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198360  | ORPH 
...5eabiGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198361  | ORPH 
...inArmv5eabiGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198362  | ORPH 
...v5eabiMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198363  | ORPH 
...linArmv5eabiMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198364  | ORPH 
...eabiUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198365  | ORPH 
...nArmv5eabiUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198366  | ORPH 
...abihfGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198367  | ORPH 
...Armv6eabihfGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198368  | ORPH 
...eabihfMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198369  | ORPH 
...nArmv6eabihfMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198370  | ORPH 
...bihfUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198371  | ORPH 
...rmv6eabihfUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198372  | ORPH 
...abihfGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198373  | ORPH 
...Armv7eabihfGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198374  | ORPH 
...eabihfMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198375  | ORPH 
...nArmv7eabihfMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198376  | ORPH 
...bihfUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198377  | ORPH 
...rmv7eabihfUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198378  | ORPH 
...mv7mUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198379  | ORPH 
...tlinArmv7mUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198380  | ORPH 
...8xxxUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198381  | ORPH 
...nM68k68xxxUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198382  | ORPH 
...fireUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198383  | ORPH 
...8kcoldfireUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198385  | ORPH 
...azebeGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198386  | ORPH 
...icroblazebeGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198387  | ORPH 
...lazebeMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198388  | ORPH 
...MicroblazebeMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198389  | ORPH 
...zebeUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198390  | ORPH 
...croblazebeUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198391  | ORPH 
...azeelGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198392  | ORPH 
...icroblazeelGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198393  | ORPH 
...lazeelMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198394  | ORPH 
...MicroblazeelMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198395  | ORPH 
...zeelUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198396  | ORPH 
...croblazeelUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198397  | ORPH 
...ips32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198398  | ORPH 
...otlinMips32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198399  | ORPH 
...Mips32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198400  | ORPH 
...ootlinMips32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198401  | ORPH 
...ps32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198402  | ORPH 
...tlinMips32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198403  | ORPH 
...s32elGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198404  | ORPH 
...linMips32elGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198405  | ORPH 
...ps32elMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198406  | ORPH 
...tlinMips32elMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198407  | ORPH 
...32elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198408  | ORPH 
...inMips32elUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198409  | ORPH 
...2r5elGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198410  | ORPH 
...nMips32r5elGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198411  | ORPH 
...32r5elMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198412  | ORPH 
...inMips32r5elMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198413  | ORPH 
...r5elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198414  | ORPH 
...Mips32r5elUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198415  | ORPH 
...2r6elGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198416  | ORPH 
...nMips32r6elGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198417  | ORPH 
...32r6elMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198418  | ORPH 
...inMips32r6elMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198419  | ORPH 
...r6elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198420  | ORPH 
...Mips32r6elUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198421  | ORPH 
...eln32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198422  | ORPH 
...Mips64eln32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198423  | ORPH 
...4eln32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198424  | ORPH 
...nMips64eln32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198425  | ORPH 
...ln32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198426  | ORPH 
...ips64eln32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198427  | ORPH 
...64n32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198428  | ORPH 
...inMips64n32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198429  | ORPH 
...s64n32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198430  | ORPH 
...linMips64n32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198431  | ORPH 
...4n32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198432  | ORPH 
...nMips64n32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198433  | ORPH 
...eln32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198434  | ORPH 
...ps64r6eln32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198435  | ORPH 
...6eln32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198436  | ORPH 
...ips64r6eln32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198437  | ORPH 
...ln32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198438  | ORPH 
...s64r6eln32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198439  | ORPH 
...Nios2GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198440  | ORPH 
...ootlinNios2GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198441  | ORPH 
...enriscMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198442  | ORPH 
...tlinOpenriscMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198443  | ORPH 
...riscUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198444  | ORPH 
...inOpenriscUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198445  | ORPH 
...440fpGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198447  | ORPH 
...owerpc440fpGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198448  | ORPH 
...c440fpMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198449  | ORPH 
...Powerpc440fpMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198450  | ORPH 
...40fpUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198451  | ORPH 
...werpc440fpUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198452  | ORPH 
...e5500GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198453  | ORPH 
...erpc64e5500GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198454  | ORPH 
...e6500GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198455  | ORPH 
...erpc64e6500GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198456  | ORPH 
...4e6500MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198457  | ORPH 
...werpc64e6500MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198458  | ORPH 
...ower8GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198459  | ORPH 
...c64lepower8GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198460  | ORPH 
...power8MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198461  | ORPH 
...pc64lepower8MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198462  | ORPH 
...ower8GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198463  | ORPH 
...rpc64power8GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198464  | ORPH 
...power8MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198465  | ORPH 
...erpc64power8MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198466  | ORPH 
...300c3GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198467  | ORPH 
...werpce300c3GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198468  | ORPH 
...e300c3MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198469  | ORPH 
...owerpce300c3MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198470  | ORPH 
...00c3UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198471  | ORPH 
...erpce300c3UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198472  | ORPH 
...500mcGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198473  | ORPH 
...werpce500mcGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198474  | ORPH 
...e500mcMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198475  | ORPH 
...owerpce500mcMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198476  | ORPH 
...00mcUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198477  | ORPH 
...erpce500mcUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198478  | ORPH 
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198479  | ORPH 
...scv64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198480  | ORPH 
...iscv64MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198481  | ORPH 
...Shsh4GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198482  | ORPH 
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198337  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198338  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198339  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198340  | ORPH 
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198341  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198342  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198343  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198344  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198210  | ORPH 
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198211  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198212  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198219  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198227  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198215  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198217  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198221  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198235  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198237  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198225  | ORPH 
          TestLuaLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198229  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198241  | ORPH 
           TestLuaLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198231  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198243  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198245  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198223  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198239  | ORPH 
         TestLuaLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198247  | ORPH 
             TestLuaLzlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198251  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198330  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198233  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198220  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198228  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198216  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198218  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198222  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198236  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198238  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198226  | ORPH 
       TestLuajitLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198230  | ORPH 
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198242  | ORPH 
        TestLuajitLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198232  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198244  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198246  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198224  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198240  | ORPH 
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198248  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198331  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198336  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198234  | ORPH 
                 TestLuvi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198249  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198250  | ORPH 
              TestNetdata |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198252  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198253  | ORPH 
         TestOpenSshGlibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198254  | ORPH 
        TestOpenSshuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198255  | ORPH 
                 TestOpkg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198256  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198257  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198258  | ORPH 
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198259  | ORPH 
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198260  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198261  | ORPH 
       TestPerlHTMLParser |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198262  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198263  | ORPH 
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198264  | ORPH 
 TestPerlLWPProtocolhttps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198266  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198267  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198268  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198269  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198265  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198270  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198271  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198272  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198273  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198281  | ORPH 
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198274  | ORPH 
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198276  | ORPH 
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198279  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198282  | ORPH 
         TestPythonPy2Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198284  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198286  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198288  | ORPH 
   TestPythonPy2Colorzero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198290  | ORPH 
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198292  | ORPH 
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198295  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198298  | ORPH 
    TestPythonPy2Gpiozero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198301  | ORPH 
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198303  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198213  | ORPH 
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198305  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198307  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198309  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198312  | ORPH 
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198315  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198317  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198319  | ORPH 
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198320  | ORPH 
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198322  | ORPH 
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198325  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198327  | ORPH 
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198275  | ORPH 
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198277  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198278  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198280  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198283  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198285  | ORPH 
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198287  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198289  | ORPH 
   TestPythonPy3Colorzero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198291  | ORPH 
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198293  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198294  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198296  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198297  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198299  | ORPH 
     TestPythonPy3Gobject |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198300  | ORPH 
    TestPythonPy3Gpiozero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198302  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198304  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198214  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198306  | ORPH 
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198308  | ORPH 
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198310  | ORPH 
      TestPythonPy3Pytest |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198311  | ORPH 
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198313  | ORPH 
     TestPythonPy3RpiGpio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198314  | ORPH 
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198316  | ORPH 
      TestPythonPy3Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198318  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198321  | ORPH 
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198323  | ORPH 
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198324  | ORPH 
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198326  | ORPH 
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198328  | ORPH 
                TestRedis |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198329  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198332  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198333  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198334  | ORPH 
                 TestTmux |  https://gitlab.com/buildroot.org/buildroot/-/jobs/933198335  | ORPH 



-- 
http://autobuild.buildroot.net
