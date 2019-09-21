From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 06:16:07 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-20
Message-ID: <20190921061614.9B29E863E3@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  0  |  0  | 15  |
  2019.05.x  | 11  |  0  |  0  | 11  |
  2019.08.x  | 21  |  1  |  0  | 22  |
    master   | 97  | 45  |  2  | 144 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            wpa_supplicant-2.9 | 10
                      icu-64-2 | 3 
                  cmocka-1.1.5 | 2 
                     host-llvm | 2 
            host-mfgtools-0.02 | 2 
               libupnpp-0.17.1 | 2 
                   ncurses-6.1 | 2 
            python-sip-4.19.13 | 2 
                    strace-5.2 | 2 
                    4th-3.62.5 | 1 
               acpica-20190703 | 1 
         alljoyn-tcl-16.04.00a | 1 
                     apr-1.7.0 | 1 
                   attr-2.4.48 | 1 
                  check-0.12.0 | 1 
                    ffmpeg-4.2 | 1 
                 host-icu-64-2 | 1 
          host-libglib2-2.62.0 | 1 
           host-nodejs-10.16.3 | 1 
                   hostapd-2.9 | 1 
                   libcap-2.25 | 1 
                 libdrm-2.4.99 | 1 
                   libnl-3.4.0 | 1 
                  libsepol-2.9 | 1 
           lttng-libust-2.10.1 | 1 
                  monkey-1.6.9 | 1 
             openjdk-12.0.2+10 | 1 
                 qt5base-5.6.3 | 1 
                snort-2.9.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |           4th-3.62.5           | NOK | http://autobuild.buildroot.net/results/9a9c77fa3e8bbab1bb369acc647aaeb881f794fd |     
  riscv32    |        acpica-20190703         | NOK | http://autobuild.buildroot.net/results/2a8fbb8de1f2ef7dfb202645b6953e11b0d360c8 |     
  riscv32    |     alljoyn-tcl-16.04.00a      | NOK | http://autobuild.buildroot.net/results/b824350f3551db6d2859e3320b8041da22320075 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c1be546773b554ee193e8f72b027629ffd47cd9c |     
  riscv64    |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/0b800dfc9b34fae44f2eadded867d3b226e5b9dc |     
  riscv64    |          check-0.12.0          | NOK | http://autobuild.buildroot.net/results/52308ac3a42106fbb53b0f55ddc84d7ca4a84d50 | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/a4b4a822239f8078a8825f40f58536c06433c1dd |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/55834301a2f032eeffe1919e0f9ec4086dcce71b |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/72dac8763b264d41ee05c56bb253eb9b899f3b2a |     
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/19f816858974bcbed20985303bc3d5adfd3c3da7 | ORPH
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/21a8acdd5e0ba181f1e545b68fb49818860cfa69 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/39e4f67b8a518a34cc96d82fe28b4d7d63d2ae67 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/97bdcb3d22d5d6f82e07968aa5ee11e00c222b2a |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/2afebfd5a8b032aa51d678a072b9300dbf7893fe |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/2809165ac144271bfdab69d6d86188811e771db3 |     
    arm      |      host-nodejs-10.16.3       | NOK | http://autobuild.buildroot.net/results/43cbcc7270f4e3f6093dd56aa1e08d579f0011c5 |     
  aarch64    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/d0f55f9bf38425943df9a2a2378be7a64bd0ccbc |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/5e74a853105d0a2c380afed5ff0a19ae58426b58 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7111ed8026bc3ac15db282b4a7fc420ad31313af | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/accbe3fb9992010bf6551cb874ee578d3e257478 | ORPH
  riscv64    |          libcap-2.25           | NOK | http://autobuild.buildroot.net/results/3c7d4b29f7028e9b33e7d2f5e5912fa5c498869c |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a722399668ea709f06c71b1590c439cafa234575 |     
  riscv32    |          libnl-3.4.0           | NOK | http://autobuild.buildroot.net/results/6c63e42d09fe90795bf4e9d89db7c39d62e6e911 | ORPH
  riscv64    |          libsepol-2.9          | NOK | http://autobuild.buildroot.net/results/2c66db7fa5ceedd8f33b871abe3c9568525b8266 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/06f5b4e886f0d5c79e46d06079783ff8fd30dd55 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/408ef44462c3b6c7cb9a4e52180d7f57ec297d3e |     
    arm      |      lttng-libust-2.10.1       | NOK | http://autobuild.buildroot.net/results/00a69be575224b9fa739acf5a5f8676d171ad992 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f9848c8958ced5ca30927cc1658634eb7ae04244 |     
  riscv32    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/009f022bb2d73c3332fd6af56a4d2146c6fef315 | ORPH
  riscv32    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/61bbbb75a7b4786acaed2591bb1a6a42d38151ba | ORPH
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/32d4700fff98938e2cae5af92420a15225f48a94 |     
  mips64el   |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/31d3e8771ced272d018c4d0366fda3a9423aa8e3 |     
  mips64el   |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/f41bce70424746fd2f5467f7c5fc9e8566809172 |     
    arm      |         qt5base-5.6.3          | NOK | http://autobuild.buildroot.net/results/06182ba8bc006566df937c7e2cfe407b771b1a00 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/9e8ad30ef9204ba6b6ca09a288f5d69fa6519bc2 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/7a430700f24ffe033699592f881cd9cad6d73189 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/c63ff728464c1164dab850d88241d4ab0057e35f |     
  powerpc    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ed93c0d1e4cde73e371ec3c7514f441563a69b77 |     
microblazeel |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/40ddb789941a5efbabe53bf8d49f4f9e4124faa9 |     
   nios2     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c65c405a57a84d4f58c841eb1127b8654d16def3 |     
    sh4      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/23e226d8aca213bff1b6cdf6fd0d1f3c83ec2cbc |     
   mipsel    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/1129a9ccd148d0c9b8dc290c2468b7932d12e6af |     
  sparc64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/aefb47c104a3b94b7d5c95955800df4017e3841f |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/82837026e271b9b5f0b6cbfff0904236300582ea |     
   nios2     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/384409c852fbebf71b58e7aa7c0cfd55127afaa4 |     
    sh4      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/74dc41c93059ac4936170dc0e65e5b201b4e7cd8 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/55bbb9fd00919789f5332c686b5d32ddf7f329b5 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783836  |      
                amarula_a64_relic |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783845  |      
                 arm_foundationv8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783856  | ORPH 
                         arm_juno |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783857  |      
               asus_tinker_rk3288 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783865  |      
                   at91sam9g20dfc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783868  |      
                 at91sam9g45m10ek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783871  |      
                     at91sam9rlek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783873  |      
                     at91sam9x5ek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783874  |      
       atmel_sama5d3_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783885  |      
       atmel_sama5d3_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783886  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783887  |      
           atmel_sama5d4_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783889  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783890  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783891  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783892  |      
                      bananapi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783893  |      
                 bananapi_m2_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783894  |      
                bananapi_m2_ultra |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783895  |      
                     bananapi_m64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783896  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783897  |      
                   beagleboardx15 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783898  | ORPH 
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783899  | ORPH 
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783901  | ORPH 
                  chromebook_snow |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783903  |      
                             ci20 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783904  |      
                     csky_gx6605s |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783905  |      
                      cubieboard2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783907  |      
            engicam_imx6qdl_icore |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783908  |      
        engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783909  |      
        engicam_imx6qdl_icore_rqs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783910  |      
              engicam_imx6ul_geam |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783911  |      
             engicam_imx6ul_isiot |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783912  |      
               freescale_imx28evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783913  |      
        freescale_imx6dlsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783915  |      
          freescale_imx6dlsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783916  |      
         freescale_imx6qsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783917  |      
           freescale_imx6qsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783918  |      
          freescale_imx6sxsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783919  |      
           freescale_imx7dsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783920  |      
              freescale_imx8mmevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783921  |      
              freescale_imx8mqevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783922  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783923  |      
               freescale_p1025twr |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783924  |      
             freescale_t1040d4rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783925  |      
          freescale_t2080_qds_rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783927  |      
           friendlyarm_nanopi_a64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783928  |      
          friendlyarm_nanopi_neo2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783930  |      
                          galileo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783931  | ORPH 
                 grinn_chiliboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783933  |      
                  grinn_liteboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783937  |      
                 hifive_unleashed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783939  |      
                         imx23evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783942  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783949  |      
                        imx6slevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783951  |      
                       imx6sx-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783954  |      
                        imx6ulevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783955  |      
                       imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783956  |      
                        imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783959  |      
                       imx8mmpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783960  |      
                        imx8mpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783962  |      
                          lafrite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783963  |      
                         lego_ev3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783964  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783965  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783966  |      
                          mx25pdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783969  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783974  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783975  |      
                        nanopi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783976  |      
                   nanopi_m1_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783977  |      
                       nanopi_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783978  |      
                      nexbox_a95x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783979  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783981  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783982  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783983  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783984  |      
                        odroidxu4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783985  |      
        olimex_a10_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783987  |      
             olimex_a13_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783988  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783990  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783989  |      
       olimex_a20_olinuxino_micro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783991  |      
             olimex_a33_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783993  |      
             olimex_a64_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783994  |      
          olimex_imx233_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783995  | ORPH 
                    openblocks_a6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783996  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783998  |      
                   orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783997  |      
                     orangepi_one |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299783999  |      
                orangepi_one_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784000  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784002  |      
                     orangepi_pc2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784001  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784003  |      
                    orangepi_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784004  |      
                   orangepi_prime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784005  |      
                      orangepi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784006  |      
                     orangepi_win |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784007  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784009  |      
              orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784010  |      
                       pandaboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784011  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784012  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784013  |      
                           pine64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784014  |      
                    pine64_sopine |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784015  |      
                qemu_aarch64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784016  |      
               qemu_arm_versatile |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784018  |      
         qemu_arm_versatile_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784019  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784020  |      
                qemu_csky610_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784021  |      
                qemu_csky807_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784022  |      
                qemu_csky810_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784023  |      
                qemu_csky860_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784024  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784025  |      
                   qemu_m68k_q800 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784026  |      
            qemu_microblazebe_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784028  |      
            qemu_microblazeel_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784029  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784030  |      
            qemu_mips32r2el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784031  |      
              qemu_mips32r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784032  |      
            qemu_mips32r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784033  |      
                qemu_mips64_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784034  |      
              qemu_mips64el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784035  |      
              qemu_mips64r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784036  |      
            qemu_mips64r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784037  |      
                 qemu_nios2_10m50 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784038  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784039  |      
                 qemu_ppc64_e5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784040  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784041  |      
             qemu_ppc64le_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784043  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784044  |      
                   qemu_ppc_mac99 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784045  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784046  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784047  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784048  |      
                qemu_riscv64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784049  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784051  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784053  |      
               qemu_sparc64_sun4u |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784054  |      
                  qemu_sparc_ss10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784055  |      
                         qemu_x86 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784058  |      
                      qemu_x86_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784057  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784059  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784061  |      
                      raspberrypi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784071  |      
                     raspberrypi0 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784062  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784064  |      
                     raspberrypi2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784065  |      
                     raspberrypi3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784068  |      
                  raspberrypi3_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784067  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784069  |      
                     raspberrypi4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784070  |      
                        riotboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784072  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784073  |      
                      roseapplepi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784075  |      
                 s6lx9_microboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784079  |      
                       sheevaplug |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784080  |      
                 snps_aarch64_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784081  | ORPH 
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784082  |      
              snps_archs38_axs103 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784084  |      
                snps_archs38_haps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784086  |      
                snps_archs38_hsdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784096  |      
                 snps_archs38_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784098  |      
                socrates_cyclone5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784099  |      
                solidrun_clearfog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784100  |      
          solidrun_clearfog_gt_8k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784102  |      
   solidrun_macchiatobin_mainline |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784104  |      
    solidrun_macchiatobin_marvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784105  |      
                  stm32f429_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784107  |      
                  stm32f469_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784108  |      
                    stm32mp157_dk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784110  |      
                           ts4900 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784112  |      
                           ts5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784113  |      
                           ts7680 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784114  | ORPH 
                        wandboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784115  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784117  |      
                        warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784118  |      
                    zynq_microzed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784120  |      
                       zynq_zc706 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784121  |      
                         zynq_zed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784122  |      
                    zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784123  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784124  | ORPH 
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784125  | ORPH 
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784190  |      
         TestCheckPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784395  |      
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784191  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784193  | ORPH 
                 TestExt2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784150  | ORPH 
               TestExt2r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784151  | ORPH 
                 TestExt3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784153  | ORPH 
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784377  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784379  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784381  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784383  | ORPH 
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784386  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784387  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784390  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784391  | ORPH 
                 TestF2FS |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784155  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784127  |      
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784129  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784130  | ORPH 
              TestGitHash |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784147  |      
              TestGitRefs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784149  |      
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784142  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784143  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784194  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784195  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784174  | ORPH 
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784177  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784178  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784179  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784180  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784182  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784185  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784187  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784188  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784160  | ORPH 
...so9660SyslinuxExternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784161  | ORPH 
...slinuxExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784162  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784164  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784166  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784205  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784215  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784196  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784201  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784222  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784227  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784235  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784237  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784239  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784211  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784232  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784367  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784218  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784208  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784217  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784197  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784204  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784225  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784229  | ORPH 
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784236  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784238  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784240  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784213  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784369  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784219  | ORPH 
           TestNoTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784145  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784244  |      
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784245  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784269  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784270  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784260  | ORPH 
          TestPostScripts |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784138  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784274  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784277  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784279  |      
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784281  |      
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784287  |      
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784291  |      
    TestPythonPy2Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784297  |      
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784303  |      
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784306  |      
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784310  |      
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784314  |      
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784320  |      
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784327  |      
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784330  |      
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784334  |      
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784338  |      
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784341  |      
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784343  |      
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784346  |      
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784349  |      
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784350  |      
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784352  |      
       TestPythonPy2Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784355  |      
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784358  |      
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784361  |      
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784289  |      
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784295  |      
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784299  |      
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784305  |      
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784308  |      
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784311  |      
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784323  |      
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784324  |      
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784328  |      
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784332  |      
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784335  |      
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784340  |      
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784342  |      
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784345  |      
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784347  |      
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784351  |      
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784353  |      
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784357  |      
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784360  |      
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784363  |      
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784133  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784134  | ORPH 
        TestRootfsOverlay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784140  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784371  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784373  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784167  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784135  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784136  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784374  |      
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/299784171  | ORPH 




Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/8fcfe7b40af3ae42549351c70466b4dd388820e3 | ORPH



-- 
http://autobuild.buildroot.net
