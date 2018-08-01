From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  1 Aug 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-31
Message-ID: <20180801060018.8F84C20737@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-31
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   2 |   1 |  27 |
   2018.05.x |  23 |   4 |   0 |  27 |
      master | 121 |  63 |   2 | 186 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.54.2 | 1 
     qt5xmlpatterns-legal-info | 1 
                       unknown | 1 


Detail of failures
------------------

        mips |           host-libglib2-2.54.2 | NOK | http://autobuild.buildroot.net/results/ab368aa6eb8fd32ba668ee49d229947869ec6dd3 |     
        i686 |      qt5xmlpatterns-legal-info | NOK | http://autobuild.buildroot.net/results/8a9e40a8c56f2bf1cbf2d2dcab4a874a3fefa367 |     
      x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/ff6cd5a4a8748574e1826f253f31719f8c364398 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 2 
                     php-7.2.5 | 1 
                 qt5base-5.6.3 | 1 


Detail of failures
------------------

    mips64el |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/74c32c9ec29b43e499e4c39fed5af5972e98426e |     
    mips64el |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/351f72787ac8f80cb7a9529450ece5b765e06468 |     
      xtensa |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/6d90eae47a4289174d938d2301bc07af3469084b | ORPH
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/277c84421d87490f97dee6b268097bca008dfc2e |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 12
                       unknown | 10
     linux-firmware-legal-info | 7 
package/linux-firmware/linu... | 7 
                  boost-1.67.0 | 3 
             gnuradio-3.7.13.3 | 3 
                    ncmpc-0.30 | 3 
               aircrack-ng-1.3 | 2 
       firmware-imx-legal-info | 2 
linuxptp-303b08cbf55096aba5... | 2 
                    f2fs-tools | 1 
         host-cryptsetup-2.0.3 | 1 
           host-libselinux-2.7 | 1 
                host-libsodium | 1 
            lttng-tools-2.10.4 | 1 
             lua-bit32-5.3.0-1 | 1 
                lua-fifo-0.2-0 | 1 
                    owfs-3.2p1 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.11.1 | 1 
            qt5location-5.11.1 | 1 
                  samba4-4.8.3 | 1 
                 wiringpi-2.46 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/df1561da3dba4493183c610e8a365e47a616339f |     
        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/89e061c02acf95bde6e4bfe5ac8486c88cc67331 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/647c6994b716af34f8ca94b680c8b712ca5e022a |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a3c89e849bff1884114c7fd8ab77e24763404434 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a20d9b8d9664f823b43dea37b324a10d97cd211f |     
         arm |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/976365a61f4cb6ec49d232a727a42fb4f008e4dd |     
         arm |        firmware-imx-legal-info | NOK | http://autobuild.buildroot.net/results/144c3ac1902be605ca221e5685b13ba22db9a70e |     
         arm |        firmware-imx-legal-info | NOK | http://autobuild.buildroot.net/results/c8f787cc5309a9d216fb74b13e700e520facef64 |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/172b1213ae4c4a9c0196c67fe187960d995a8772 |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/7472e04a9c9651d49e610c3d39939146a13c3e5d |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/766283afaf9fba1d51c59212f54db9acb0951ac5 |     
         arm |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/747f4dad301fb76d1611ae917b75c5d5d5dfd9fd |     
         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/74ed8a09f7ec77e3fe5ae457af2c559492f19f3d |     
         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/34c8ee794c6b01246dcd0725bd33abe6193d1550 |     
    mips64el |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/998f224a5d1f57acb1662f2683a5cbfaa5b25679 |     
     powerpc |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/8bca8a40a83344042f49703ba0c0c0055ccd6794 |     
         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/38f3d9e999fee3bfab11e0dd55e053353388f0b8 |     
         arc |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/8db2c6c50cceb8c6a59a8f85de2b2564a007d354 |     
      x86_64 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/9194ac14fc6b7ee9501e04e067679eccc99728fb |     
         arc |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/64aa8aa31df25b592c4980810edf2a56c311665e |     
     powerpc |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/04b98a0b5c593c0525ef39d03c1ee7c2bbf5e44d |     
         arc |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/fec294fb879de393a5ece4493466938a0c5cb246 |     
         sh4 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/76748b490c82e7116dc4f822b09a4e287d21f749 |     
         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/15eb0b15f801364463ae403b8b9e88b3edb73d6c |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/8b9afff8e16c0663a5c3fd05b77ed29deb75ae03 |     
      x86_64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/a49b985718fd6291c12af91e06ade3ad8fe3a618 |     
microblazeel |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/2ecb2f0eba45e51c741b0a03bfac9c9d56fe57ca |     
  aarch64_be |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/22c1eeb975bb999a5e6c1dbb8fe8eecb63ee05d9 |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/1283f06919ef7baf0193b30d4b42867ff652eb8c |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/9795ac912d1bbe66386be9286f1703cdbe0a8898 |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/06be73a74d4ac8199ac60dfc790e043e6c006661 |     
      xtensa |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/d6d729c36a3865df7349c72a767a2dc92a5030ed |     
     aarch64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/d0bfac7ab50e2338e4ccf8778a6c20bb9af80022 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/13416f42559883f3459a1478fdc853ca3142f551 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/cd424c048d7bc3993deef83faa54b0e5d027d068 |     
        i586 |             lttng-tools-2.10.4 | NOK | http://autobuild.buildroot.net/results/09d6d5e2d1c50dbd6c026e12aa245fc90687eb19 |     
         arm |              lua-bit32-5.3.0-1 | NOK | http://autobuild.buildroot.net/results/f4d1cb053e791ed007ebfc680ce2d02af7efcdfe |     
      x86_64 |                 lua-fifo-0.2-0 | NOK | http://autobuild.buildroot.net/results/e0317a57beae60fc399115aae85c5f14f4b18688 |     
         arm |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/189e4034e913122d7880c2a36cdc6a4f97d7cb51 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/1da41e9ae2b4fd5f36c63b03c56c6661749c275a |     
        mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/f08d64e16b28f33aa526cb8974f4f63ea61ba005 |     
      xtensa |                     owfs-3.2p1 | NOK | http://autobuild.buildroot.net/results/a4c3677d36a22e975e0783381dd2be1c19f42f75 |     
         arm | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/e4f322cad7f99bfee1a00d82601225fac486e3f4 |     
     powerpc | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/937084569c9ab94c8ea534142b098bd186954cfa |     
     sparc64 | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/c7786579534e6ac9c3bd37307164d49535313bb8 |     
         arc | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/2b2784428bc6cba25675f13d574016a026a6848c |     
   powerpc64 | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/30c2595b383196ca229292a99153420dca657769 |     
      xtensa | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/401faea3c4eec91ed16d960e2e5972168f0065cf |     
        i686 | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/1470bf832508ee950a54a8c2de61225004079267 |     
        mips |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/74bff8f622d9d366b7d255f74090297e46ced448 |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/161f34ca1710699c81400536640ea4f8e8c1c246 |     
         arm |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/5fe91fd762c5d4eda01378947b13f7ffc084a8be |     
      mipsel |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/f5cfc4bab5c74a46153103a3ef7c7033142a2b0c |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/ed32cb0efef3d8da087ba2be334d55ec81a42deb |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/699e902465e9f781b4b98e750e9d528878bb94f6 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/b4d67968dfd0144f81cf921557dc2fecfa9d6020 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/4b34e632078baa388f881184dcabb32faa775286 |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/f5deec443553690f6e648e393c5a88ae542007d8 |     
        mips |                        unknown | NOK | http://autobuild.buildroot.net/results/7701b711656227baf377817dfeb9f8c195bce30a |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/7dd3efc4ce69b53db31a5bae613bfabe22d64c10 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/9d9f08b371df7c499272754d7fb31908a75273ff |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/cbbd3534853427711c484248a6747eba0d5bbaae |     
        i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/d2c2a318228e17772b830bfc718dfcee005117db |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/9f8e1b7f104c6c5b160386a90e0b84f5eb1a2d75 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7d14d5bc535c95e3944bc6a3fc251df81b7fd563 |     


-- 
http://autobuild.buildroot.net
