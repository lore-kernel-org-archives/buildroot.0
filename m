From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Sep 2019 06:12:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-13
Message-ID: <20190914061259.9228385CA8@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  2  |  0  | 21  |
  2019.05.x  | 21  |  2  |  0  | 23  |
  2019.08.x  | 18  |  6  |  0  | 24  |
    master   | 121 | 66  |  1  | 188 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 apache-2.4.41 | 13
            wpa_supplicant-2.9 | 11
             subversion-1.9.12 | 10
                log4cxx-0.10.0 | 5 
                      icu-64-2 | 3 
            python-sip-4.19.13 | 3 
                classpath-0.99 | 2 
                    ffmpeg-4.2 | 2 
                   mimic-1.1.0 | 2 
android-tools-4.2.2+git2013... | 1 
                     apr-1.7.0 | 1 
                  cmocka-1.1.5 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  exempi-2.5.1 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                 host-icu-64-2 | 1 
           host-nodejs-10.15.3 | 1 
                 libdrm-2.4.99 | 1 
               libsigsegv-2.12 | 1 
                  libssh-0.9.0 | 1 
               log4cplus-2.0.4 | 1 
                      protobuf | 1 
                snort-2.9.14.1 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/85070748f6810c269f4692e7fc2e7fd08bf1d444 |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/cfff0b39581faa535aa70636af3bcea5ae4067d1 |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/1ef97df6b79f89253d6cc1a4da21d54148f5c34d |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/f67fb3c368be57d8ca3ae1ec8164785514afefae |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/2738dd8354756f0036b7207fa951a43673b8c4c2 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/58d3500c9efad0a4c3798d86dc51a9f8cbcfd076 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/f50ba3701054a37ec80a639d8cd527d9d422ef06 |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/26fbd6a87c128a22d87db1e209b4e83167c3b457 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/c72e9a00c9976a3996bd96c0bb574068596b7344 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/092e2b0f275c6613cdc7db2945cb7395337cf9f4 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/be190d8de955217eeac90afce94943922b1fbd04 |     
  nds32le    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/e5df612f2b9bf35b69d58b294ba2cf41a7a5f6be |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/8a848b6235ed0cb397ef7549a367edd7263205cc |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/9421557c26367b2fa45ef172138736c0605f25a6 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c3b4cf21b53f0781f6eac6e4d333a2d9837ada9a |     
   sparc     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/7d76dd4077a25d16a3431d408363cee1e8a87654 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/03aaae2afc46cca3f91fcfd87e988dae13a6b348 | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/6ef3b0d1e4bb94a3b4bad9a9cfd0210178f4fa33 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/35f6063ce05cd0e328f5df42aad5970154045414 |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/19ee2a604ccccf3dd493b3b72e4a07e5bf464d59 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/22b1d8b65d2cfe3b2e1698d5fc4c46187c82ff82 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/c3eb0704e4880c676895d7f5588de780b55ee0b5 |     
  sparc64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/35b57e34edb37a7c11bf1745a3651cb4057c6622 |     
  aarch64    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/eecb71f0ece1e549799b049bbb364cc7b354852c | ORPH
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/7d70904eb5883f0a9489ce9c1b908b3205d7abf2 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1ffbbc537539720ea36ea3f0353861a20099ad99 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f64c40a8bd496c7b4085377411f67ca78ef9e867 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1b3484b071855a0329c8309a6d4f80318c8aa2a4 | ORPH
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/cf9f058b629a137b423d75a9230dfdecdbeb0d0e |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/691f3cacb1d30861fe5df4b554523096d838fdd4 |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/00289a0e986d48e255d5235496c82c47d913944b |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/31ac364bf04cd7ac133aa5bd191b9ee69adf5f47 |     
  powerpc    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/dd279b073dfd1edb75e26cccfa5587c692e852af |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/7e0d8d1cc9b7a7dba3ff9d69c3334f70cde5f404 |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/2ffdf11590726154fb452a474371f07ab36775fa |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/e55c66432bc46dc4b8478c3ff4c584ce3005bfcf |     
    sh4      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/40bec47e1582cc436ddd21d365b859dc08bde581 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8f76bba4f630e2630548d98bd1a959cbafd3a7bc |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/0a2c339b12851917f867f243b12ea85c7cd553e1 |     
microblazeel |            protobuf            | TIM | http://autobuild.buildroot.net/results/7db84b121938c61760f74a5b84ba087a64d3ef63 |     
  sparc64    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/c2ecd752f40bdd7da7bf0fc14afccc7468a46361 |     
  sparc64    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/da2c0fa387ab15ff90cb524a381ab764171be1e5 |     
  sparc64    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/c24c631e38060494c1b706e2436b6915ee933121 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/855bb8d3e9afecd9ff689066d5e88802fc569f36 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/1bc636b9c6e09c6fe1d91305deeeeb7c9ced217c |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7b63dc4a33b43349c4ae15c98e098affc16f8fac |     
    or1k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b771fc32f68caf321f71c099f49066a0130268ff |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/679ea20b35e9364731103ddeaab32aff631a3b35 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3de1695997dcf8f3f7562476b7f655cecf9b0c4d |     
    or1k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8a0f7e10e069361ec0d28e6c5f220fcba493288c |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3540aafc00880c9a02f6f83b7c6da83efa134e38 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b785a9837c7a58550a0d381eface18f165a14879 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/18ef7cffab33f628a6e42dcf2eff276f036ce5f4 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ed67b7f17654980fa0192cc3d72c76935e544547 |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/2ddbd9f0ca2c85b0f71c49a288fe46b3fc31054f |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/fe5250affd3cbf38a4486303aecb6d82040c5637 |     
powerpc64le  |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/47b06f09f6b9588b4c62e4e23b898676c93d05c2 |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/99c8dcddb2d89721f9414d4b6e5c6bda14221a3e |     
   nios2     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/259942a3c5da257a3f6ce5a1446a1e5a25db1db3 |     
  riscv32    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/95a021a14ad716e694fac6e3eb57d36c596bca81 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d1c03d60e6a4f968297e13985b3e578783b6f211 |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/441f9d31d6aea4ab4153f7227da2d0568f49d075 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/bdbf8d82b9396c44e244059cfe0bfef707b442df |     
    i686     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e6d1191d6060db3431924076ace4fbde75729feb |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/2cfa6c65c9c9cffcf4e37e5f2b7f878d0c04275c |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c07dc102e32ece8235c4f54aaa33cbefb3a233a6 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/2fb0f5bdc4b90897b3e7a005cce0da98162d8a2f |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472925  |      
       acmesystems_aria_g25_128mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472926  |      
       acmesystems_aria_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472927  |      
    acmesystems_arietta_g25_128mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472928  |      
    acmesystems_arietta_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472929  |      
                amarula_a64_relic |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472930  |      
             amarula_vyasa_rk3288 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472931  |      
                      andes_ae3xx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472932  |      
               arcturus_ucls1012a |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472933  |      
                 arcturus_ucp1020 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472934  |      
                 arm_foundationv8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472935  | ORPH 
                         arm_juno |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472936  |      
                   armadeus_apf27 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472937  |      
                   armadeus_apf28 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472938  |      
                   armadeus_apf51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472940  |      
               asus_tinker_rk3288 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472941  |      
                  at91sam9260eknf |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472942  |      
                   at91sam9g20dfc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472943  |      
             at91sam9x5ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472949  |      
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472950  |      
       atmel_sama5d2_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472951  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472952  |      
           atmel_sama5d3_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472953  |      
       atmel_sama5d3_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472954  |      
       atmel_sama5d3_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472955  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472956  |      
                 atmel_sama5d3xek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472957  |      
           atmel_sama5d4_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472958  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472961  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472962  |      
                      bananapi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472963  |      
                 bananapi_m2_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472964  |      
                bananapi_m2_ultra |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472965  |      
                     bananapi_m64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472966  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472967  |      
                   beagleboardx15 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472968  | ORPH 
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472969  | ORPH 
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472970  | ORPH 
                  chromebook_snow |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472971  |      
                             ci20 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472972  |      
                     csky_gx6605s |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472973  |      
        engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472976  |      
        engicam_imx6qdl_icore_rqs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472977  |      
             engicam_imx6ul_isiot |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472979  |      
               freescale_imx28evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472980  |      
        freescale_imx6dlsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472981  |      
          freescale_imx6dlsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472982  |      
         freescale_imx6qsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472983  |      
           freescale_imx6qsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472984  |      
           freescale_imx7dsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472986  |      
              freescale_imx8mqevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472988  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472989  |      
             freescale_t1040d4rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472991  |      
          freescale_t2080_qds_rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472992  |      
           friendlyarm_nanopi_a64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472993  |      
                          galileo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472995  | ORPH 
                 grinn_chiliboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472996  |      
                  grinn_liteboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472997  |      
                 hifive_unleashed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294472999  |      
                         imx23evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473000  |      
                   imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473001  |      
                     imx6-sabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473002  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473003  |      
                        imx6slevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473004  |      
                       imx6sx-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473006  |      
                        imx6ulevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473007  |      
                       imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473008  |      
                        imx7d-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473009  |      
                        imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473010  |      
                       imx8mmpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473011  |      
                        imx8mpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473012  |      
                         lego_ev3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473013  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473014  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473015  |      
                  minnowboard_max |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473017  |      
                         mx53loco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473020  |      
                         mx6cubox |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473021  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473022  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473023  |      
                        nanopi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473024  |      
                   nanopi_m1_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473025  |      
                       nanopi_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473026  |      
                      nexbox_a95x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473027  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473028  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473029  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473030  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473031  |      
                        odroidxu4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473032  |      
        olimex_a10_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473033  |      
             olimex_a13_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473034  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473036  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473035  |      
       olimex_a20_olinuxino_micro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473038  |      
             olimex_a33_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473039  |      
             olimex_a64_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473040  |      
          olimex_imx233_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473042  | ORPH 
                    openblocks_a6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473043  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473046  |      
                   orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473045  |      
                     orangepi_one |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473048  |      
                orangepi_one_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473050  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473053  |      
                     orangepi_pc2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473052  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473055  |      
                    orangepi_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473056  |      
                   orangepi_prime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473057  |      
                      orangepi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473058  |      
                     orangepi_win |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473059  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473060  |      
              orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473061  |      
                       pandaboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473063  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473064  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473066  |      
                           pine64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473067  |      
                    pine64_sopine |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473068  |      
                qemu_aarch64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473069  |      
               qemu_arm_versatile |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473070  |      
         qemu_arm_versatile_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473071  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473072  |      
                qemu_csky610_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473073  |      
                qemu_csky807_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473074  |      
                qemu_csky810_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473076  |      
                qemu_csky860_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473077  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473078  |      
                   qemu_m68k_q800 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473079  |      
            qemu_microblazebe_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473080  |      
            qemu_microblazeel_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473081  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473082  |      
            qemu_mips32r2el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473083  |      
              qemu_mips32r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473084  |      
            qemu_mips32r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473085  |      
                qemu_mips64_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473086  |      
              qemu_mips64el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473087  |      
              qemu_mips64r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473088  |      
            qemu_mips64r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473089  |      
                 qemu_nios2_10m50 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473090  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473091  |      
                 qemu_ppc64_e5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473092  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473093  |      
             qemu_ppc64le_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473094  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473095  |      
                   qemu_ppc_mac99 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473096  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473097  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473098  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473099  |      
                qemu_riscv64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473100  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473101  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473102  |      
               qemu_sparc64_sun4u |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473103  |      
                  qemu_sparc_ss10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473104  |      
                         qemu_x86 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473106  |      
                      qemu_x86_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473105  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473107  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473108  |      
                      raspberrypi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473117  |      
                     raspberrypi0 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473110  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473111  |      
                     raspberrypi2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473112  |      
                     raspberrypi3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473114  |      
                  raspberrypi3_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473113  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473115  |      
                     raspberrypi4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473116  |      
                        riotboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473118  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473119  |      
                      roseapplepi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473120  |      
                 s6lx9_microboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473121  |      
                       sheevaplug |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473122  |      
                 snps_aarch64_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473123  | ORPH 
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473124  |      
              snps_archs38_axs103 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473125  |      
                snps_archs38_haps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473126  |      
                snps_archs38_hsdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473127  |      
                 snps_archs38_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473128  |      
                socrates_cyclone5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473130  |      
                solidrun_clearfog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473131  |      
          solidrun_clearfog_gt_8k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473132  |      
   solidrun_macchiatobin_mainline |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473134  |      
    solidrun_macchiatobin_marvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473135  |      
                  stm32f429_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473136  |      
                  stm32f469_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473137  |      
                    stm32mp157_dk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473138  |      
              toradex_apalis_imx6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473139  |      
                           ts4900 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473140  |      
                           ts5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473142  |      
                           ts7680 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473143  | ORPH 
                        wandboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473144  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473145  |      
                        warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473146  |      
                    zynq_microzed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473147  |      
                       zynq_zc706 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473148  |      
                         zynq_zed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473149  |      
                    zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473151  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473152  |      
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473153  |      
          TestATFVexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473154  |      
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473196  |      
         TestCheckPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473307  |      
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473198  |      
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473200  |      
                 TestExt2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473170  |      
               TestExt2r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473171  |      
                 TestExt3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473172  |      
                 TestExt4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473173  |      
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473299  |      
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473300  |      
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473301  |      
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473302  |      
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473303  |      
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473304  |      
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473305  |      
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473306  |      
                 TestF2FS |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473174  |      
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473155  |      
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473156  |      
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473157  |      
              TestGitHash |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473168  |      
              TestGitRefs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473169  |      
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473165  |      
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473166  |      
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473201  |      
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473203  |      
  TestInitSystemBusyboxRo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473185  |      
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473186  |      
  TestInitSystemBusyboxRw |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473187  |      
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473188  |      
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473189  |      
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473190  |      
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473191  |      
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473192  |      
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473193  |      
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473194  |      
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473195  |      
 TestIso9660Grub2External |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473175  |      
...0Grub2ExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473176  |      
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473177  |      
...so9660SyslinuxExternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473178  |      
...slinuxExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473179  |      
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473180  |      
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473181  |      
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473211  |      
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473216  |      
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473204  |      
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473207  |      
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473220  |      
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473222  |      
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473226  |      
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473228  |      
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473230  |      
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473214  |      
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473224  |      
         TestLuaLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473232  |      
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473294  |      
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473218  |      
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473213  |      
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473217  |      
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473206  |      
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473209  |      
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473221  |      
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473223  |      
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473227  |      
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473229  |      
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473231  |      
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473215  |      
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473225  |      
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473233  |      
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473295  |      
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473219  |      
           TestNoTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473167  |      
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473234  |      
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473235  |      
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473236  |      
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473237  |      
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473238  |      
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473239  |      
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473240  |      
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473241  |      
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473243  |      
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473244  |      
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473245  |      
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473242  |      
          TestPostScripts |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473162  |      
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473246  |      
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473247  |      
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473248  |      
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473249  |      
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473250  |      
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473252  |      
    TestPythonPy2Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473254  |      
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473256  |      
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473258  |      
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473260  |      
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473262  |      
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473264  |      
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473267  |      
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473269  |      
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473272  |      
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473275  |      
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473277  |      
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473279  |      
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473281  |      
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473283  |      
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473284  |      
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473286  |      
       TestPythonPy2Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473288  |      
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473290  |      
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473292  |      
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473251  |      
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473253  |      
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473255  |      
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473257  |      
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473259  |      
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473261  |      
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473263  |      
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473265  |      
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473266  |      
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473268  |      
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473270  |      
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473273  |      
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473276  |      
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473278  |      
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473280  |      
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473282  |      
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473285  |      
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473287  |      
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473289  |      
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473291  |      
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473293  |      
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473158  |      
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473159  |      
         TestRootPassword |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473163  |      
        TestRootfsOverlay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473164  |      
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473296  |      
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473297  |      
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473182  |      
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473160  |      
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473161  |      
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473298  |      
                  TestUbi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473183  |      
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/294473184  |      




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/ed4dfc4c4c65bf0197df95cd4d52bcb3c7162180 | ORPH
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/14018670f23cf456d8932fb7dc57167bf3319ad3 |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.35 | 1 
                qt5base-5.12.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/170ccef14f69e104fdc495d6f0ae206416eed114 | ORPH
    arm      |         qt5base-5.12.2         | NOK | http://autobuild.buildroot.net/results/8b7f11ae4e5f0b3f67c5f45bb6182e94b5b0bb3a |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 2 
                       unknown | 2 
                qt5base-5.12.4 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/0aa29b5c4401c9eadaa23bf471387262b43eeb6b | ORPH
    m68k     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/6b19724775953c70a6f6a0cf619ab0e4142508d2 | ORPH
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/a1f5a68fd9ae14a7b5358758fda7cb92ae550632 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/acafb5298e5152df7857317f48ec2d8199635708 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ab70fbaa7bf65d006246cf25e84dec0f3b1c7aeb |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/9040c501b4a67b61cbb8a0d0bcf993378dad43c1 |     



-- 
http://autobuild.buildroot.net
