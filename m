From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 09 Jul 2019 06:00:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-08
Message-ID: <20190709060047.92B1E879A7@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  15 |   1 |   0 |  16 |
   2019.05.x |  23 |   1 |   0 |  24 |
      master | 130 |  41 |   0 | 171 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.2 | 1 


Detail of failures
------------------

  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/42b1ee865e7be20ed083659a0e65210293efed94 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  dnsmasq-2.80 | 5 
              libsodium-1.0.17 | 4 
                    atk-2.30.0 | 3 
               libgpgme-1.13.1 | 3 
   vdr-plugin-vnsiserver-1.8.0 | 3 
              iputils-20190515 | 2 
               json-glib-1.4.2 | 2 
               libcap-ng-0.7.9 | 2 
tvheadend-8f1de1621d78c9143... | 2 
              domoticz-4.10717 | 1 
                   gvfs-1.31.4 | 1 
                harfbuzz-2.5.2 | 1 
             host-cargo-0.26.0 | 1 
               host-efl-1.22.2 | 1 
           host-nodejs-10.15.3 | 1 
              libarchive-3.4.0 | 1 
                libnice-0.1.14 | 1 
           libvncserver-0.9.12 | 1 
          modem-manager-1.10.2 | 1 
           python-numpy-1.16.4 | 1 
                 python3-3.7.3 | 1 
                       unknown | 1 
               wireshark-3.0.2 | 1 
                        zip-30 | 1 


Detail of failures
------------------

        i586 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/12122cd5bb2dcbf2c81f6a27462e181351cbe0ba | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/6ecb1ab0ad0509fae00e41ee3816f14de9182d91 | ORPH
       sparc |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/f4b1fb392128e44881d767581f9803b119dbb18d | ORPH
      x86_64 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/cc9d1c4adc9a4644cc8a02bab41075c48fb19622 |     
microblazeel |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/e54cc87ca1556ff2fb7ed3fa07cb9886671042c7 |     
        or1k |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/f5b169fc250330ebc913953fa9171e8e9b29102d |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/90fa0bbcf944d6f7d3be29be46acb9f7143c1fb4 |     
 powerpc64le |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/d114398b902a31d3c25bd05aece731ee5640c6a2 |     
     riscv32 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/9e05c5348f69ee624a1d5c9cd14a738bd7b39103 |     
microblazeel |                    gvfs-1.31.4 | NOK | http://autobuild.buildroot.net/results/5d3203f02726dd8802a068ab4a544b9d171055d3 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/162984ee29131a4dcecf09530d52c7079303da18 | ORPH
     riscv64 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/459604bca16d27d8536a6e69b871c4435845c322 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/75b671fc2dc293cb587691178bcfa1c589dd4d9c |     
         arm |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/1c8508420fa34a7378272d254b9b34c461386706 |     
      xtensa |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/ce4b7b7b36fbd4ef2b1a7115c6e143335d66b45f |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/d5c3d48673a9db0d2d316a8e2e9e020019ff4baf |     
         arm |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/32ec9e87161dd797b366e2f357e5be2a7ce5f877 |     
        m68k |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/0d8b038a55d8115f37a12c383cbd814631614737 |     
         arm |               libarchive-3.4.0 | NOK | http://autobuild.buildroot.net/results/d116d3ace93784722a0914f73dc402746d04b439 | ORPH
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/edb592e0916628adf93f7adfd269bb0a60b612f5 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/7a8a6cc9567948ec317fd0c871880e85dbbc6d84 |     
         arm |                libgpgme-1.13.1 | NOK | http://autobuild.buildroot.net/results/8191a732918c6987b84309df3dfd66ab54b43fb7 | ORPH
         arm |                libgpgme-1.13.1 | NOK | http://autobuild.buildroot.net/results/75617aee53a6f2b009a0d4ddc5b9a8c4cd406895 | ORPH
         arm |                libgpgme-1.13.1 | NOK | http://autobuild.buildroot.net/results/6eed9cae57af445f53c9854e007815b882c5c65a | ORPH
       sparc |                 libnice-0.1.14 | NOK | http://autobuild.buildroot.net/results/9a2f3b9e919a191fac680512320be53c7f7d0107 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/3fd8088280f4bf49b80082d8639231313ff0b075 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/28a8fbdf8edb2c11f98a55426d89579f47ebe2ca |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/d09ac8cb33bb0e66036ea103ceaf61139c18b962 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/e3f86cbe5fdad62465099526b60ec6b15e1b2c88 |     
         arm |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/aa153d4e9a55ae4ba262d6a8b033210b9f8ef897 | ORPH
       nios2 |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/604ca0935c9ffd7e019a342b7bee71d292d19bb0 |     
         arm |            python-numpy-1.16.4 | NOK | http://autobuild.buildroot.net/results/fe57bdd5775e54c347d0b2e0dc9edde0c34850cd |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/eac499b69415d36c490b38d10e7ba2f8c3d7b88f |     
      xtensa | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/6a82e48cb47761ca4f5805bab6d8eab2ba390d23 |     
microblazeel | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/001046c5d0bb03839d575faf2f0f091d89530410 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/20c6acad4f75c367c6ffac1dc8fdcb20ce538579 |     
     riscv32 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/0cb4d48d3fda939ce355f9100896c06285fb679b |     
       nios2 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/bf0dca419205e1e9cc5d360365083755286ea7db |     
  aarch64_be |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/01db87901b40f9948e2dfb86a82e1b442b011db1 |     
         arm |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/31811d2b4f8899ce6ec044b4c4029f843937ba1a | ORPH
         arm |                         zip-30 | NOK | http://autobuild.buildroot.net/results/a5ccb9c2bee46282b68c089d1f918d419b255c81 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              spandsp-20180108 | 1 


Detail of failures
------------------

        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/e4e98c083f5de6b539ea9a2b1c2de3480250b143 |     


-- 
http://autobuild.buildroot.net
