From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 06 Jun 2020 06:25:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-05
Message-ID: <20200606062558.62F8520392@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  |  5  |  0  | 25  |
    master   | 79  | 63  |  1  | 143 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      ell-0.31 | 10
        python-markdown2-2.3.9 | 5 
                       unknown | 4 
             freeswitch-1.10.3 | 3 
                  gloox-1.0.23 | 3 
  gobject-introspection-1.64.1 | 3 
           host-wayland-1.18.0 | 3 
                libdrm-2.4.102 | 3 
                qt5base-5.14.2 | 3 
                     avahi-0.8 | 2 
              bitcoin-0.19.0.1 | 2 
                   ethtool-5.6 | 2 
              host-grpc-1.25.0 | 2 
               apcupsd-3.14.14 | 1 
                  assimp-5.0.1 | 1 
             c-periphery-2.2.1 | 1 
   gdb-arc-2020.03-release-gdb | 1 
                 granite-0.4.1 | 1 
        host-gcc-initial-8.4.0 | 1 
             host-pango-1.44.6 | 1 
               libgtk2-2.24.32 | 1 
            libnetconf2-1.1.26 | 1 
               libupnpp-0.17.2 | 1 
make: *** Waiting for unfin... | 1 
                 mesa3d-20.1.0 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
                       mongodb | 1 
                nftables-0.9.4 | 1 
                 openal-1.19.1 | 1 
                  umtprd-1.3.6 | 1 
                wayland-1.18.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d2b103431f1227db5f8a021f908419961fd8ff96 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/51d5df24caf845e33dcdc19acd77f8aca2819e2d |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2a89b3de05d130a943ab5f8af51a8de0599e0b99 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/aa5e80415ef86325b789a56846ee9c35d50f7f41 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/b73a6f786839995ad5546bcd43a67ef182dd620f |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/711b4a4380ad5b738abed19bc992c71be9c06abc |     
    arm      |       c-periphery-2.2.1        | NOK | http://autobuild.buildroot.net/results/3d371f581d287c99e99fabe1541b8bb6bdc24df8 |     
    mips     |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/1c35cad0ed29fdebddfd2e1f3ea9c746b12a89e6 |     
    arm      |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/8ed41a7e113bef7608c98c62140d685e64e61278 |     
    i586     |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/bafc0ee2a3bcb2418a3612da38eb9dcd586b57d4 |     
    arm      |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/4cd73e2787f212d96d3f9a859bc30b75789d4370 |     
   x86_64    |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/098d760701b52f1cf6259ebdec3c2190d53b076b |     
    i686     |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/ffd8f7c814113b05a80c635d7ab6d23e3990e709 |     
   x86_64    |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/91d2a589050361fe149bd458501a5ff75b1de557 |     
    i586     |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/fbd503782f09944ac038fb3b5ec4b3e32b10eee5 |     
  aarch64    |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/34dd9504aaea2bed7f73a6a07d32d17b087f3c74 |     
    i686     |            ell-0.31            | NOK | http://autobuild.buildroot.net/results/cd4d45c0e6d944f1fea25dce14d137f18fcaea41 |     
    i686     |          ethtool-5.6           | NOK | http://autobuild.buildroot.net/results/23dffe2f9766c12badb6e42bf3f0356c6df0cbfb |     
    arm      |          ethtool-5.6           | NOK | http://autobuild.buildroot.net/results/394e846bb48a0cc8564ebc3e8d1179ccd1f1560d |     
   x86_64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/a677ea38e47f0beb9bc3cd5f8c90400735a436ae |     
  aarch64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/2691b90de291df023c3712fbf1dd9bf9d418d4ac |     
  riscv64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/95d824c556b31bd3c2697dfb99e967ed86949d2b |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/13ca6e32ffa2f04508114f5946ad71fe5cd6f918 | ORPH
   x86_64    |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/e9b361072a25f68a64226ed2903cb161c7839198 |     
   x86_64    |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/a61a91bb6e1156eff5fb756f9dccfc2bb6c0f277 |     
    arm      |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/beb939ec71eab7e15d74fc8ab6f21597f757943b |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/86be6ad5c15916868c664116006419ea3d2500a9 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/bd6603a49e189f8cd5247de27abfdfc3dd257ddb |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/049b518c6162cc763a66032f2ee185bee85422e3 |     
    arc      |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/4e24304531bbaebb9372cc79619c1dc10c144cf2 | ORPH
microblazeel |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/b74550185c85b51ca1b879f02e6bad4b560e709b |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/93592442a3379c0d1b37ce917234b1082e7d00e5 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/935450b7c784e4da37f81f6379b6a1fc51ae075e |     
    arc      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/536585579b83429459e2d12fd5acba041b2976eb | ORPH
    i686     |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/c20715181905c43e0ad0d0e4ae7d404ccbb486e0 |     
   xtensa    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/500e26cf1f410db8d9f71a489281acfe2fb2cfcf |     
  mips64el   |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/9fdc20df8759145fb194aa242ebfa752c6768ae4 |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/6399544316a2652b907675916fb0dfdfa250bd75 |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/aa88aa4e6a0e5c7de03d561b65f1c02b492f31cc |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/1c9a78ca25f2fd3936ee486bab2f0a9bd71839ec |     
   nios2     |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/416f1df828e76923c5afec951a1c5a3ea3775964 |     
  riscv32    |       libnetconf2-1.1.26       | NOK | http://autobuild.buildroot.net/results/f72fcccafe70ecb6b2ba21e8d19c5827a09ffec7 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/8ad97312dc0c23abf69585fd0577ac1ace1e719a |     
   x86_64    | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/bf305c78dddd035b97e88943a1d19a8ceb6b41f7 |     
   x86_64    |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/805d6e7f136c5b4e2506837e3b7649714c6326cf |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/4e061deceff202a005a2cd8c846f1bf7e55e433a |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/c33b14aac42bd8be5f4c58ca78b1ea6891797056 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/1f5af0fafde60aa05688ef6f91777b10267785d3 |     
    arm      |         nftables-0.9.4         | NOK | http://autobuild.buildroot.net/results/90e9aac972874e94e06de9f14e1908bff613a6df |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/d498db245616941703a7688d9c34efa61a424afe |     
   xtensa    |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/68c0b1f693a273c87b29519abc7f7eed1440f09f |     
 aarch64_be  |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/2c33aaf754027bca291a1d102fcb08730f68d70e |     
    or1k     |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/c47c61e8e2098c7557a499591ddda367077c80bb |     
    arc      |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/6c2c72e3ceed88447e117d86fe514651d04ac24d |     
    arm      |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/46d64501cf3fca75e583ee72776a3b8fc8dd280c |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c435c132e18f5e1b791c355be9d905f9cec16a04 |     
    mips     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/0ef613b744b2ba4182021c2fd083fd095ce2b935 |     
 powerpc64   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/0e68f81634c260ff95aa7e5c3499abef35e9c56e |     
    arm      |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/42ee866c81c36c89a0aac26452d8a09fbda00a7d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/13a34e240a5656dc8a011eae9adf326e720d7e2a |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/03023482981dc58632a05e67022191bfe0ae3ec9 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/07e5d158f804b4a3faf7793d4f9884de4116613f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/d23e3ba60a8ae76508dcca64715bb6ccefd9d4a2 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/11d389014d56c5ac2eeae4811928d748487d7a54 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622932  |      
               arcturus_ucls1012a |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622938  |      
                         arm_juno |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622943  |      
                   armadeus_apf27 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622944  |      
                   armadeus_apf28 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622947  |      
                   armadeus_apf51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622949  |      
               asus_tinker_rk3288 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622951  |      
                   at91sam9g20dfc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622955  |      
                 at91sam9g45m10ek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622956  |      
                     at91sam9rlek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622957  |      
                     at91sam9x5ek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622958  |      
                 at91sam9x5ek_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622959  |      
                 at91sam9x5ek_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622960  |      
             at91sam9x5ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622961  |      
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622962  |      
       atmel_sama5d2_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622963  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622964  |      
           atmel_sama5d3_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622965  |      
       atmel_sama5d3_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622966  |      
       atmel_sama5d3_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622968  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622969  |      
                 atmel_sama5d3xek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622970  |      
           atmel_sama5d4_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622971  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622972  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622973  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622974  |      
                      bananapi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622975  |      
                 bananapi_m2_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622976  |      
                bananapi_m2_ultra |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622977  |      
                     bananapi_m64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622979  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622980  |      
                   beagleboardx15 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622981  |      
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622982  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622984  |      
                     beagleboneai |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622985  |      
                      beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622987  |      
                  chromebook_snow |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622988  |      
                             ci20 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622990  |      
                     csky_gx6605s |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622992  |      
                      cubieboard2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622993  |      
            engicam_imx6qdl_icore |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622995  |      
        engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622998  |      
        engicam_imx6qdl_icore_rqs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583622999  |      
              engicam_imx6ul_geam |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623002  |      
             engicam_imx6ul_isiot |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623005  |      
               freescale_imx28evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623007  |      
        freescale_imx6dlsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623008  |      
          freescale_imx6dlsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623010  |      
         freescale_imx6qsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623012  |      
           freescale_imx6qsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623013  |      
          freescale_imx6sxsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623014  |      
             freescale_imx6ullevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623015  |      
           freescale_imx7dsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623017  |      
              freescale_imx8mmevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623019  |      
              freescale_imx8mnevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623027  |      
              freescale_imx8mqevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623021  |      
              freescale_imx8qmmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623022  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623025  |      
               freescale_p1025twr |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623028  |      
             freescale_t1040d4rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623030  |      
          freescale_t2080_qds_rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623031  |      
           friendlyarm_nanopi_a64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623032  |      
          friendlyarm_nanopi_neo2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623037  |      
     friendlyarm_nanopi_neo_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623039  |      
                          galileo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623043  |      
                 grinn_chiliboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623044  |      
                  grinn_liteboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623046  |      
                 hifive_unleashed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623048  |      
                         imx23evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623049  |      
                   imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623053  |      
                     imx6-sabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623055  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623057  |      
                        imx6slevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623060  |      
                       imx6sx-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623061  |      
                        imx6ulevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623063  |      
                       imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623066  |      
                        imx7d-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623068  |      
                        imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623070  |      
                       imx8mmpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623072  |      
                        imx8mpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623077  |      
                          lafrite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623079  |      
                         lego_ev3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623083  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623085  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623086  |      
                  minnowboard_max |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623090  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623088  |      
                          mx25pdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623092  |      
                          mx51evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623095  |      
                         mx53loco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623098  |      
                         mx6cubox |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623100  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623103  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623104  |      
                        nanopi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623105  |      
                   nanopi_m1_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623106  |      
                       nanopi_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623108  |      
                      nanopi_neo4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623107  |      
                        nanopi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623109  |      
                      nexbox_a95x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623110  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623113  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623115  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623116  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623118  |      
                      nitrogen8mm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623119  |      
                      nitrogen8mn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623120  |      
                        odroidxu4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623121  |      
        olimex_a10_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623123  |      
             olimex_a13_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623124  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623126  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623125  |      
       olimex_a20_olinuxino_micro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623128  |      
             olimex_a33_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623131  |      
             olimex_a64_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623132  |      
          olimex_imx233_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623135  |      
                         olpc_xo1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623137  |      
                       olpc_xo175 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623136  |      
                    openblocks_a6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623142  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623149  |      
                   orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623146  |      
                     orangepi_one |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623153  |      
                orangepi_one_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623155  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623162  |      
                     orangepi_pc2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623159  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623166  |      
                    orangepi_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623170  |      
                   orangepi_prime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623173  |      
                      orangepi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623177  |      
                     orangepi_win |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623181  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623186  |      
              orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623189  |      
                       pandaboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623191  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623192  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623194  |      
                           pine64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623196  |      
                    pine64_sopine |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623198  |      
                qemu_aarch64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623200  |      
               qemu_arm_versatile |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623201  |      
         qemu_arm_versatile_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623204  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623205  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623210  |      
                qemu_csky610_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623213  |      
                qemu_csky807_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623216  |      
                qemu_csky810_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623218  |      
                qemu_csky860_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623221  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623224  |      
                   qemu_m68k_q800 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623226  |      
            qemu_microblazebe_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623229  |      
            qemu_microblazeel_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623242  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623246  |      
            qemu_mips32r2el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623247  |      
              qemu_mips32r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623249  |      
            qemu_mips32r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623251  |      
                qemu_mips64_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623253  |      
              qemu_mips64el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623255  |      
              qemu_mips64r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623256  |      
            qemu_mips64r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623259  |      
                 qemu_nios2_10m50 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623261  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623262  |      
                 qemu_ppc64_e5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623264  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623268  |      
             qemu_ppc64le_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623269  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623271  |      
                   qemu_ppc_mac99 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623275  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623277  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623280  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623282  |      
                qemu_riscv64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623284  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623287  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623288  |      
               qemu_sparc64_sun4u |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623290  |      
                  qemu_sparc_ss10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623293  |      
                         qemu_x86 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623297  |      
                      qemu_x86_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623295  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623298  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623299  |      
                      raspberrypi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623321  |      
                     raspberrypi0 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623300  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623301  |      
                     raspberrypi2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623304  |      
                     raspberrypi3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623307  |      
                  raspberrypi3_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623305  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623309  |      
                     raspberrypi4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623318  |      
                  raspberrypi4_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623312  |      
                        riotboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623323  |      
                    roc_pc_rk3399 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623325  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623327  |      
                      roseapplepi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623330  |      
                 s6lx9_microboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623335  |      
                       sheevaplug |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623338  |      
                 snps_aarch64_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623341  |      
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623345  |      
              snps_archs38_axs103 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623349  |      
                snps_archs38_haps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623351  |      
                snps_archs38_hsdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623358  |      
                 snps_archs38_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623361  |      
                socrates_cyclone5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623364  |      
                solidrun_clearfog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623366  |      
            solidrun_macchiatobin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623373  |      
                  stm32f429_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623376  |      
                  stm32f469_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623378  |      
                  stm32mp157a_dk1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623380  |      
                  stm32mp157c_dk2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623383  |      
              toradex_apalis_imx6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623385  |      
                           ts4900 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623386  |      
                           ts5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623388  |      
                           ts7680 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623392  |      
                        wandboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623394  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623399  |      
                        warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623403  |      
                    zynq_microzed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623407  |      
                      zynq_qmtech |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623408  |      
                       zynq_zc706 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623410  |      
                         zynq_zed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623411  |      
                    zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623412  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623415  | ORPH 
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623416  | ORPH 
          TestATFVexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623419  | ORPH 
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623512  | ORPH 
         TestCheckPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623764  | ORPH 
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623513  | ORPH 
           TestCrudiniPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623514  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623516  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623518  | ORPH 
                 TestExt2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623463  | ORPH 
               TestExt2r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623467  | ORPH 
                 TestExt3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623469  | ORPH 
                 TestExt4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623471  | ORPH 
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623745  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623747  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623750  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623754  | ORPH 
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623755  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623758  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623760  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623761  | ORPH 
                 TestF2FS |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623472  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623426  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623429  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623433  | ORPH 
              TestGitHash |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623458  | ORPH 
              TestGitRefs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623461  | ORPH 
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623453  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623454  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623520  | ORPH 
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623523  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623524  | ORPH 
  TestInitSystemBusyboxRo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623493  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623494  | ORPH 
  TestInitSystemBusyboxRw |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623495  | ORPH 
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623496  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623499  | ORPH 
...InitSystemOpenrcRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623501  | ORPH 
...InitSystemOpenrcRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623502  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623503  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623504  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623505  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623509  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623510  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623511  | ORPH 
 TestIso9660Grub2External |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623474  | ORPH 
...0Grub2ExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623476  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623478  | ORPH 
...so9660SyslinuxExternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623480  | ORPH 
...slinuxExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623481  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623482  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623483  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623537  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623551  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623530  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623542  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623566  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623572  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623546  | ORPH 
          TestLuaLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623554  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623580  | ORPH 
           TestLuaLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623557  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623585  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623590  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623544  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623575  | ORPH 
         TestLuaLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623593  | ORPH 
             TestLuaLzlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623601  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623735  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623562  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623539  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623552  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623533  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623536  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623543  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623569  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623573  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623549  | ORPH 
       TestLuajitLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623556  | ORPH 
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623583  | ORPH 
        TestLuajitLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623560  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623587  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623591  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623545  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623577  | ORPH 
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623594  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623736  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623743  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623563  | ORPH 
                 TestLuvi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623598  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623599  | ORPH 
              TestNetdata |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623603  | ORPH 
           TestNoTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623456  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623605  | ORPH 
                 TestOpkg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623608  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623610  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623612  | ORPH 
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623614  | ORPH 
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623617  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623621  | ORPH 
       TestPerlHTMLParser |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623623  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623625  | ORPH 
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623627  | ORPH 
 TestPerlLWPProtocolhttps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623630  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623634  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623636  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623637  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623640  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623642  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623644  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623646  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623664  | ORPH 
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623648  | ORPH 
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623653  | ORPH 
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623658  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623666  | ORPH 
         TestPythonPy2Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623670  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623674  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623679  | ORPH 
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623686  | ORPH 
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623694  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623698  | ORPH 
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623702  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623526  | ORPH 
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623705  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623708  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623713  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623715  | ORPH 
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623717  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623719  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623722  | ORPH 
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623723  | ORPH 
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623725  | ORPH 
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623728  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623731  | ORPH 
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623650  | ORPH 
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623655  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623657  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623662  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623667  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623672  | ORPH 
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623677  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623682  | ORPH 
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623687  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623690  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623695  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623696  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623699  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623704  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623529  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623707  | ORPH 
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623711  | ORPH 
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623714  | ORPH 
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623716  | ORPH 
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623718  | ORPH 
      TestPythonPy3Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623721  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623724  | ORPH 
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623726  | ORPH 
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623727  | ORPH 
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623729  | ORPH 
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623733  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623436  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623439  | ORPH 
         TestRootPassword |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623450  | ORPH 
        TestRootfsOverlay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623452  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623737  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623739  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623485  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623444  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623446  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623420  | ORPH 
TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623421  | ORPH 
    TestSysLinuxX86_64EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623422  | ORPH 
...sLinuxX86_64LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623424  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623740  | ORPH 
                 TestTmux |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623741  | ORPH 
                  TestUbi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623488  | ORPH 
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/583623489  | ORPH 




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               asterisk-16.6.2 | 1 
              host-grpc-1.25.0 | 1 
             libopenssl-1.1.1g | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/6b0bde23bb8818991074daa0aa856cca85fb9e75 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e0947fda14a4a1fc05f316598bb355b5eb4e35f1 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/5dc6ad18e513d46d7c7b39421f1d8b42a458668a |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/66f3485e6516abdd2bc5836c3d6855fe04a6760b |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/17a35c723a7145f73487ba8e039083f4905f9e3c | ORPH



-- 
http://autobuild.buildroot.net
