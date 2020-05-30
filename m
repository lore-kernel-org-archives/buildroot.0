From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 May 2020 06:26:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-29
Message-ID: <20200530062653.DB2A78748B@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-29
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  4  |  0  | 12  |
    master   | 88  | 35  |  1  | 124 |
     next    |  3  | 12  |  0  | 15  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  assimp-5.0.1 | 4 
                qt5base-5.14.2 | 4 
                     avahi-0.8 | 3 
                 gnutls-3.6.13 | 2 
              host-grpc-1.25.0 | 2 
              ibm-sw-tpm2-1563 | 2 
                   mimic-1.1.0 | 2 
                  ndisc6-1.0.4 | 2 
         python-gobject-3.36.0 | 2 
                       unknown | 2 
                        bullet | 1 
                hiawatha-10.10 | 1 
          host-acpica-20191018 | 1 
                   libnss-3.52 | 1 
              python-pyqt5-5.7 | 1 
                 ripgrep-0.8.1 | 1 
                 rocksdb-6.6.4 | 1 
                 rsh-redone-85 | 1 
                  rygel-0.38.3 | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/517d85d3481fe2a8a6685858b734f38d966651bc |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5a72870245e698998656d0027147a85cc6375a32 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/31be5df576e4e37b64ba0eff1e391e4f73d62da2 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/981341d9460b6ea79f75582c07699eab8f2d91e5 |     
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a3f926677a64ad82a8d6ac36b3fb3f7f573c507b | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/cebedfc709ac4d0cc9fdb7f742643a0114d93089 | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/27f1ff94da0ab2b0ae0ad8f40cdb6e30b1233c34 | ORPH
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/e962fa1dfc7c0d457b21de070fff5369ce78dd5e |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/1c82f88e89bde20a6b260b722cb51d8e1158064f |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/6f559fbbb084067c027e458c64ca9db561e2f360 |     
  riscv32    |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/8ada91a0191c057b022728b602c3ed25be228a9c |     
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/4df669ff251d1c0750bd27159c6b6efb96202618 |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a60faa07e88e717d040d583cfe36a4fd4f198f4f |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/96c93b77d3756bd38f7d6e1b067426441dbe502d |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/38948944fe1564eb67619accf2372ddd149b7745 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/7dd8fec13c4d0ccde77dc02193cc2a7faf1f6b20 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/55d0dbe51a4a996fd452e89ec05119fac944b424 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d322bde9493bdb0d3f1607e7cb0ba09067314442 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/94d2ef17b4e37267a00315f71a816645d7a453a1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/581687f97f67c4e1685300be17676318cb1343a2 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/61866855dbd169b689e51b30a8fa411315b50ea9 | ORPH
powerpc64le  |     python-gobject-3.36.0      | NOK | http://autobuild.buildroot.net/results/50d1b3300d6b18e29c705ab6804c9d9c7d880c9e |     
    mips     |     python-gobject-3.36.0      | NOK | http://autobuild.buildroot.net/results/b96d9dd4166601607e7e58fda979cf66dbc366c0 |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/4c02a834c3b5648934904b106f32e085f2e21c7a |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4c0fae19a4b558aad9bfc5aeda9f88f6071c6b22 |     
    i586     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/bd8ba90880e4e6529f649211169cdd34cef045c3 |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/504296b15507bbfdd1f5e6ddd398664419ff61ed |     
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1cb6fe82dce7efce6d2511067d3192ed55b49596 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/92385092a52ca96c5b2249c90de1d46ffa73a48d |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/242db7139ce5dd6ece4a1eb50a1aa47c841a41b7 |     
    i586     |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/1b7b36fa70dde9450d2d61396657cb3f8bc6f0d6 | ORPH
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/2b69befaf546d407fa699bac3d4253fcc6caa0f2 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/1c3e357b1934ca496f29ad66bf318ed30db274c8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/af39556a0a7b1677fc61a9b814f4511a0a5f235c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/13c58ad17dba263e32dd79cc8a5f690dedb67a95 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3b85d1c2c755c634debc8f57cfe1bc2ba55080ad |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
               arcturus_ucls1012a |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589563  |      
                   armadeus_apf27 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589570  |      
                 at91sam9x5ek_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589592  |      
             at91sam9x5ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589595  |      
           atmel_sama5d3_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589605  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589609  |      
                 atmel_sama5d3xek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589612  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589617  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589622  |      
                      bananapi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589625  |      
                 bananapi_m2_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589629  |      
                bananapi_m2_ultra |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589632  |      
                     bananapi_m64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589635  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589638  |      
                   beagleboardx15 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589641  |      
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589643  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589645  |      
                     beagleboneai |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589646  |      
                      beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589648  |      
                  chromebook_snow |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589649  |      
                             ci20 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589651  |      
                     csky_gx6605s |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589653  |      
                      cubieboard2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589654  |      
            engicam_imx6qdl_icore |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589657  |      
        engicam_imx6qdl_icore_rqs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589662  |      
              engicam_imx6ul_geam |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589665  |      
             engicam_imx6ul_isiot |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589669  |      
               freescale_imx28evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589673  |      
        freescale_imx6dlsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589675  |      
          freescale_imx6dlsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589677  |      
         freescale_imx6qsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589679  |      
           freescale_imx6qsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589680  |      
          freescale_imx6sxsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589682  |      
             freescale_imx6ullevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589685  |      
              freescale_imx8mmevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589687  |      
              freescale_imx8mqevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589688  |      
              freescale_imx8qmmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589689  |      
             freescale_t1040d4rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589694  |      
          freescale_t2080_qds_rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589695  |      
                          galileo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589702  |      
                        imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589728  |      
                  minnowboard_max |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589741  |      
                          mx51evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589745  |      
                         mx53loco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589746  |      
                         mx6cubox |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589748  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589750  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589751  |      
                   nanopi_m1_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589755  |      
                       nanopi_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589760  |      
                      nexbox_a95x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589765  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589767  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589772  |      
                      nitrogen8mm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589778  |      
                        odroidxu4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589782  |      
        olimex_a10_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589784  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589789  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589788  |      
       olimex_a20_olinuxino_micro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589792  |      
             olimex_a33_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589793  |      
             olimex_a64_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589794  |      
          olimex_imx233_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589797  |      
                         olpc_xo1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589799  |      
                       olpc_xo175 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589798  |      
                    openblocks_a6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589800  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589803  |      
                   orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589801  |      
                     orangepi_one |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589804  |      
                orangepi_one_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589805  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589807  |      
                     orangepi_pc2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589806  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589808  |      
                    orangepi_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589809  |      
                   orangepi_prime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589810  |      
                      orangepi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589812  |      
                     orangepi_win |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589813  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589815  |      
              orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589816  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589818  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589819  |      
                    pine64_sopine |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589821  |      
                qemu_aarch64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589822  |      
               qemu_arm_versatile |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589823  |      
         qemu_arm_versatile_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589824  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589825  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589826  |      
                qemu_csky610_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589828  |      
                qemu_csky807_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589830  |      
                qemu_csky810_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589832  |      
                qemu_csky860_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589833  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589834  |      
                   qemu_m68k_q800 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589836  |      
            qemu_microblazebe_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589837  |      
            qemu_microblazeel_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589838  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589840  |      
            qemu_mips32r2el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589841  |      
            qemu_mips32r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589844  |      
              qemu_mips64el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589846  |      
              qemu_mips64r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589848  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589851  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589854  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589858  |      
                   qemu_ppc_mac99 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589859  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589860  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589861  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589863  |      
                qemu_riscv64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589864  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589865  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589866  |      
               qemu_sparc64_sun4u |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589867  |      
                  qemu_sparc_ss10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589868  |      
                         qemu_x86 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589870  |      
                      qemu_x86_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589869  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589872  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589874  |      
                      raspberrypi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589894  |      
                     raspberrypi0 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589875  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589877  |      
                     raspberrypi2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589880  |      
                     raspberrypi3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589885  |      
                  raspberrypi3_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589884  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589888  |      
                     raspberrypi4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589892  |      
                        riotboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589895  |      
                    roc_pc_rk3399 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589897  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589899  |      
                      roseapplepi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589900  |      
                 s6lx9_microboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589902  |      
                       sheevaplug |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589903  |      
                 snps_aarch64_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589905  |      
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589906  |      
              snps_archs38_axs103 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589908  |      
                snps_archs38_haps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589909  |      
                snps_archs38_hsdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589910  |      
                 snps_archs38_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589912  |      
                socrates_cyclone5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589913  |      
                solidrun_clearfog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589914  |      
          solidrun_clearfog_gt_8k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589915  |      
            solidrun_macchiatobin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589916  |      
                  stm32f429_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589917  |      
                  stm32f469_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589919  |      
                  stm32mp157a_dk1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589922  |      
                  stm32mp157c_dk2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589924  |      
                           ts4900 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589927  |      
                           ts5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589930  |      
                           ts7680 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589931  |      
                        wandboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589935  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589936  |      
                    zynq_microzed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589939  |      
                      zynq_qmtech |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589941  |      
                       zynq_zc706 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589942  |      
                    zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589944  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589945  | ORPH 
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589946  | ORPH 
          TestATFVexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589947  | ORPH 
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590012  | ORPH 
         TestCheckPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590214  | ORPH 
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590013  | ORPH 
           TestCrudiniPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590014  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590015  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590016  | ORPH 
                 TestExt2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589981  | ORPH 
                 TestExt3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589984  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590204  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590206  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590210  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590212  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590213  | ORPH 
                 TestF2FS |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589986  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589955  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589956  | ORPH 
              TestGitHash |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589977  | ORPH 
              TestGitRefs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589979  | ORPH 
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589972  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589974  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590017  | ORPH 
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590018  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590020  | ORPH 
  TestInitSystemBusyboxRo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589997  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589998  | ORPH 
  TestInitSystemBusyboxRw |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589999  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590001  | ORPH 
...InitSystemOpenrcRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590002  | ORPH 
...InitSystemOpenrcRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590003  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590007  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590008  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590010  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590011  | ORPH 
...0Grub2ExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589988  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589989  | ORPH 
...so9660SyslinuxExternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589990  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589992  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589993  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590033  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590045  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590025  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590030  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590037  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590054  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590057  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590043  | ORPH 
          TestLuaLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590047  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590064  | ORPH 
           TestLuaLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590049  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590067  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590061  | ORPH 
             TestLuaLzlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590080  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590187  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590052  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590036  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590046  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590038  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590056  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590060  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590044  | ORPH 
        TestLuajitLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590050  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590068  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590072  | ORPH 
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590076  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590189  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590200  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590053  | ORPH 
                 TestLuvi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590077  | ORPH 
           TestNoTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589975  | ORPH 
                 TestOpkg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590087  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590088  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590089  | ORPH 
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590092  | ORPH 
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590093  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590095  | ORPH 
       TestPerlHTMLParser |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590096  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590097  | ORPH 
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590098  | ORPH 
 TestPerlLWPProtocolhttps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590102  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590103  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590106  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590107  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590101  | ORPH 
          TestPostScripts |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589966  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590109  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590111  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590112  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590124  | ORPH 
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590114  | ORPH 
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590121  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590125  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590133  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590137  | ORPH 
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590140  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590149  | ORPH 
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590153  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590022  | ORPH 
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590155  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590158  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590161  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590163  | ORPH 
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590166  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590170  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590173  | ORPH 
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590175  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590184  | ORPH 
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590118  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590120  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590122  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590128  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590130  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590139  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590143  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590145  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590147  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590150  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590154  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590156  | ORPH 
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590159  | ORPH 
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590162  | ORPH 
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590165  | ORPH 
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590169  | ORPH 
      TestPythonPy3Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590172  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590177  | ORPH 
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590179  | ORPH 
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590183  | ORPH 
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590186  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589960  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589961  | ORPH 
         TestRootPassword |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589969  | ORPH 
        TestRootfsOverlay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589970  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590193  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589994  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589963  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589964  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589949  | ORPH 
    TestSysLinuxX86_64EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589952  | ORPH 
                 TestTmux |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573590197  | ORPH 
                  TestUbi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589995  | ORPH 
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/573589996  | ORPH 




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-erlang-22.2 | 1 
             host-gnupg-1.4.23 | 1 
              host-perl-5.30.1 | 1 
                 mesa3d-19.3.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e3780ce02897157bc8445372d122c4ddc8fa9095 |     
    i586     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/4f8f9e1363ae3b4b8cd85b09149700e43ad07e68 | ORPH
   x86_64    |        host-perl-5.30.1        | NOK | http://autobuild.buildroot.net/results/e50ad1d3e87ec4ce92e85763a452d474687cbacf |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/08abd81d58086dd7ef1809e58d993352b2b9a3d3 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          host-checkpolicy-3.0 | 4 
             host-squashfs-4.4 | 2 
                    atk-2.36.0 | 1 
             freeswitch-1.10.3 | 1 
         host-exfatprogs-1.0.2 | 1 
             host-gnupg-1.4.23 | 1 
                suricata-4.1.8 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/3b0f99f0d0d79d74ba38085ba539502aac83fc60 | ORPH
   x86_64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/971ea3ff5364a369c6a4f1d3526e2b04ce2ee9ed |     
  riscv32    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/a1cad9abe32bdb5fbce05d1cf98babaf6e1791fb |     
  sparc64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/d8765a705dfe080daac5bae3f35f0d14cbc24249 |     
  sparc64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/4889e50b1ce925078d1016b219edd35d16632607 |     
   mipsel    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/dcdd1f3eaf4c586d543f6cb8faa5230b901929f1 |     
    mips     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/8b4e5f8636de34665259ad3ebaf0b74ef223c694 |     
   xtensa    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/d72f5369d6aa990a9615c5d0c458220155ee679f | ORPH
    m68k     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/bec8b7f0ec24e2b7d4e752983236fd8fe42a9702 |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/d5abc84bd5d5d42825a4b9619fcf604fb8394a28 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/7eeb09d2e05f3748c721e15324a01e038663aeff |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/30cf7d188d14a7d20dfd68c9bb0029e4c3bcda3c |     





-- 
http://autobuild.buildroot.net
