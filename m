From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Jul 2019 06:00:30 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-15
Message-ID: <20190716060036.94FE184854@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  11 |   0 |   1 |  12 |
   2019.05.x |  17 |   4 |   0 |  21 |
      master |  82 |  86 |   0 | 168 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 
                 mesa3d-19.0.3 | 1 
                qt5base-5.12.2 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/d2aa91ff8cbf0a8ebcf655c9090447c167442095 |     
         sh4 |                  mesa3d-19.0.3 | NOK | http://autobuild.buildroot.net/results/cb12a0c8327c4ead640ea902d3ce7a47c49ae29f |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/807a0cb906c7ea09a1b31ee580adb6ba638dcb21 |     
       sparc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/2d2db6ee556dd1d5e2ef8580f4889b9bc067f134 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             bluez_utils-4.101 | 14
         xkeyboard-config-2.27 | 12
      tesseract-ocr-legal-info | 8 
     glibc-arc-2019.03-release | 7 
                       unknown | 5 
             bluez5_utils-5.50 | 4 
             gstreamer1-1.16.0 | 3 
   vdr-plugin-vnsiserver-1.8.0 | 3 
           can-utils-2018.02.0 | 2 
                harfbuzz-2.5.2 | 2 
               libgtk2-2.24.32 | 2 
          qt5multimedia-5.12.4 | 2 
                   cups-2.2.11 | 1 
                  dnsmasq-2.80 | 1 
                    efl-1.22.2 | 1 
                 gnupg2-2.2.17 | 1 
                  gnutls-3.6.8 | 1 
      gst1-plugins-base-1.16.0 | 1 
                     gzip-1.10 | 1 
               host-efl-1.22.2 | 1 
           host-nodejs-10.15.3 | 1 
      intel-mediadriver-18.4.0 | 1 
               libiscsi-1.19.0 | 1 
               libsigsegv-2.12 | 1 
                libvips-7.42.2 | 1 
                    proj-5.0.1 | 1 
                 python3-3.7.4 | 1 
                qt5base-5.12.4 | 1 
           tesseract-ocr-4.1.0 | 1 
tvheadend-8f1de1621d78c9143... | 1 
           udpxy-1.0.23-9-prod | 1 
                   vlc-3.0.7.1 | 1 
               wireshark-3.0.2 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

     powerpc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/1b965c5d9c782d6689041eeeb7be3be4a4854346 |     
         arc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/7b712e9802975829d645c8a21218e28874c53bb1 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/0d1d8832b9b6810a41625a51cba1fc26e0e07a13 |     
     powerpc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/7b9bf56a6f58b3f41cc25da3fa21e138125bfd25 |     
     powerpc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8b657beb2bc09f343cb223fcc5acd8ccf63aaf84 |     
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/763b06d424258d51c06349eb08dd218dec707f76 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2345fd398a8c84aa064ded330778866aef22121f |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/206a0255fa2fd887bd86b59f128c10978372b038 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/bbacc9c9d0871a143a8be8e8b31b9dc800629983 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/72b6039ee4ba28e67d5ffcb5073e669e8d740e14 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0c9dc4495b033e80a41df7c2a7016aaa66edaa5a |     
     powerpc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0cfc51dbd91de577715c90ce1036ffb7eefde83c |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0e4db924646ea1c8f47861abcdfa35b387dab4f1 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0e1e41971d200ead3d69d8ef304a51b4c2f1f923 |     
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6af45867a9a62ec18cc856df5bb3cd8721b23c6b |     
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c9018505cc1e38af4ed48ca4ef63ac2956db60c4 |     
     powerpc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/be7dd161e64e90e054451d8ab75fd3eec6cef696 |     
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/825068400d1b3c21a467174ac74e0cb1b9786fb5 |     
         arm |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/8c528688e263daac0cfce9e820df278dbde8ad8c |     
microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/307c2d0ec4ba347474e85d4baaf3f93839d13888 |     
       sparc |                    cups-2.2.11 | NOK | http://autobuild.buildroot.net/results/42c8803b98e38ebd48870fe6b1a20a1d6c351e5f |     
      xtensa |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/1d269984168193e592f85c0fc9c5ca6aeea19092 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/8cea038e604d5d444d0a6223aaa8c252c2d38df8 |     
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/113a52541c2c7a89acabe81aac044dd4cbf6e2ee | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/e8c10c3f4e05fe9dc6b5ca7fb25a1dd16a7f6867 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/b8a6235125814250932fdfdf09232a474c3d1ff5 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/484663a8a78ea17e19134c13a36cdc7b62ac0d8f | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/cabb2b18a2c6f15513baccec90aa5c893e19e3ab | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/6f461d7539d877adbe44ab5fbe9e5b489957870b | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/2d1a0b73d2f446242d240347abc9d22605aad50b | ORPH
       sparc |                  gnupg2-2.2.17 | NOK | http://autobuild.buildroot.net/results/a1e96d02d41f7fec0f5327f65fb34405f963a1e9 | ORPH
       sparc |                   gnutls-3.6.8 | NOK | http://autobuild.buildroot.net/results/1c7541fc6ac4b52d1dfe02a9a7d61db90f4521eb |     
      mipsel |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/9d1131b386fa84c3bce5356a764b93c4d40359f6 |     
        m68k |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/c677cb2b412e269fc432b7cab077247c9d199880 |     
      mipsel |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/9f301b4fe97cb6e4dcad5236c506ebd6075733d6 |     
        i586 |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/9068b4f9778a0849788d7c6438ba8e11711d7289 |     
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/5aa1167885fab04674bc9ca513d56ea259bd2572 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/afe4f33262a61075c9e2e933e7e78319493d5c29 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/db070ae6c415ba3ad93a4cd7520fd338412043bb | ORPH
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/a36cc40ae5d1cde6980f6a028a327471569b62df |     
     aarch64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/832aa1fc8a1d90a2b3044d43f42ec4ae472398ee |     
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/5315a3ef16f84e9a5b1d209658def707c6ae0178 |     
      xtensa |                libgtk2-2.24.32 | NOK | http://autobuild.buildroot.net/results/cd2de36ff9ac0eff7ad120084ed5c4df458dd551 |     
         arm |                libgtk2-2.24.32 | NOK | http://autobuild.buildroot.net/results/f1f6a5983ca5a287cebabb528a6be7d101dda7bb |     
         arm |                libiscsi-1.19.0 | NOK | http://autobuild.buildroot.net/results/1d71c95378a6ef9774926bf7431c1a315e4a1b3e |     
     nds32le |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/4ea2ab9976a654e28e92684ac6403a9bf7e8df2a |     
         arm |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/45e988b9ad4efc37efe81d291d0aa9d2765a13c5 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/8e70ddee16bdfa9fc4edd6bfc34e3ff36329abec |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/97677b92b042e72841b26731cc6dfd7d798a9939 |     
microblazeel |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/c0df0998264931638fb35134b4336a5d681f5cd1 |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/b018873f5946b5da2cb4f8a88cb189af9dd21647 |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/806cc7359f9b10f04b30bc5e969a04fa5a0907c6 |     
         arm |            tesseract-ocr-4.1.0 | NOK | http://autobuild.buildroot.net/results/126d2fa15a7791ffd027973050c6e83c08738919 |     
     riscv32 |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/a3cff9747be539bdaffde3926f995467f33428c0 |     
         arm |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/b22890333c43e1da6227e2b3a48559a436d39640 |     
      x86_64 |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/a94ea8eb4cbe1dd871c339802a1f895ea4eb8c60 |     
         sh4 |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/5a0d192641027b7c3b64139a6799f11330f268be |     
  aarch64_be |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/dc1b85e8bd06f7a60b65d1ab41a2f7e70e92b952 |     
   powerpc64 |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/24225316209c02ac06053c957de1e708ada5f01b |     
      xtensa |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/a75adced15e7e172dfdcc8a647bda664e4dfef17 |     
 powerpc64le |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/5af91d0a886ec592e0f0978e84721e9c64c6d1ef |     
      mipsel | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/d5ece192116f5aa04d046f05b2137f6d18aa7763 |     
        mips |            udpxy-1.0.23-9-prod | NOK | http://autobuild.buildroot.net/results/9c902b79ca9154b709e48a5fb5d8a62218f63ac9 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/76ed019afd865f027c8f18da07d4a369ca444fe9 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/4a51a81b8dc1e579e6dfcfc6e934e5806cde76f5 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/1ab1da4fa3696ac2856cb2434e3ae4d1fb7039b8 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/5d92e12a8bdf0f7348e47d69f0dc6c4f9937c55b |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/d22305dd550da878b0b2a4b0c4c946513497fe9e |     
         arm |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/330e174c75f8a8359ac2de2a9ce8d266b4e69b86 |     
         arm |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/88346b799e7d6d75f00b3731f095dbfd0f05f47b |     
 powerpc64le |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/2c0079013dfaa42462fb1139a8ab71c1a7fc6cd7 |     
        or1k |                    vlc-3.0.7.1 | NOK | http://autobuild.buildroot.net/results/382910b485ff99894a78b946e1fc30396b6b72f7 |     
        i586 |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/54de4df92420ba25460673afdf7335a4193ab592 | ORPH
     powerpc |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/368c4fb5298da59dfa1eeadb8fc8dbf3698ffc84 |     
 powerpc64le |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/036408673c328fd841355d89c632cc67db8f344a |     
microblazeel |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/3fa31d41c1f454c2db8e6b54ab3d50f93b9d8337 |     
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/afba1df763a60b253b7b2ffa9689d209dc900aa9 |     
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/388b4d91d5e6f4d07de7ef812d1e7cf0a5296ffd |     
        or1k |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/a19de8ebefd8ead42e2110ee06cc4894fabb95b7 |     
     aarch64 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/ab2304cc87055484b4ebb3c42d9b54100218b3f9 |     
        i686 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/b6ce240f8a8575ff30cc9b03a82ad95704b07c95 |     
  aarch64_be |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/c0734c3e90c7b5586e6521363dec6c852d9f0230 |     
microblazeel |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/8f9fce34ee743bea04df7dc422a7f9034776e60f |     
      x86_64 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/76e7872c3e7441ee8e13a391aa1c22808a7f26ce |     
     aarch64 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/50c0f457b829dacf3dcc6c08bd40ced4aad4a8b5 |     
      mipsel |              xscreensaver-5.43 | NOK | http://autobuild.buildroot.net/results/029ab289021edaf9820b47846e5d107cab6f3e28 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

          libtorrent-rasterbar | 1 


Detail of failures
------------------

microblazeel |           libtorrent-rasterbar | TIM | http://autobuild.buildroot.net/results/d40f319a0538c1bdb41ff0d98eef063939c712d0 |     


-- 
http://autobuild.buildroot.net
