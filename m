From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  5 Oct 2018 08:00:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-04
Message-ID: <20181005060014.739CA207A3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   1 |   0 |  14 |
   2018.05.x |  24 |   0 |   0 |  24 |
      master | 136 |  67 |   1 | 204 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 1 


Detail of failures
------------------

         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bb04e53241bfde75bac194559aa1fec9e8a7f470 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 21
                blktrace-1.2.0 | 8 
              ptpd2-ptpd-2.3.1 | 8 
 Makefile:709: target-finalize | 4 
                     vlc-3.0.4 | 4 
package/linux-firmware/linu... | 3 
                  boost-1.68.0 | 2 
     linux-firmware-legal-info | 2 
             perl-sys-cpu-0.52 | 2 
           dt-utils-v2018.05.0 | 1 
               host-efl-1.21.1 | 1 
                   libiio-0.14 | 1 
                 lvm2-2.02.180 | 1 
                  mender-1.4.0 | 1 
                         mimic | 1 
                   netsnmp-5.8 | 1 
                 qt5base-5.6.3 | 1 
      qt5serialport-legal-info | 1 
             qt5wayland-5.11.2 | 1 
runc-69663f0bd4b60df09991c0... | 1 
                     squid-4.2 | 1 
          synergy-v2.0.12-beta | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/c039b85668e5b82b52a6dbffc90b863ddeef5cc7 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/5eecab649d9c619ddf466f78591d8b8933b6fd47 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/2a799563a8f10eba9a4d52c1d12066e642affbef | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/e2e9023a02d9785310e35fa7ca8aa1323e0b4133 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/5bda5bcf576440037d830997f9fa7f6046aa8444 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/df52f8b1e2a405e223a6bc1c3b805d1e76dbd69c | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/1a39e67b1aac9d28c4bdd86a8af4963e8cd43ab6 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/dddc6f855a472610d97734290f260ae0c7e829e4 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/e343580b4872e83a8e8162898b9220ad7fc22511 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/d4c7c25e7940d7a376f0c530ddd4ceaec799760d |     
         arm |            dt-utils-v2018.05.0 | NOK | http://autobuild.buildroot.net/results/93b28a2397e30ea4c2f7b4b29419f9e71eaa25a3 |     
         arm |                host-efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/b78a85fc7ef80dd690511006dd8b4ced5d406aa4 |     
         arc |                    libiio-0.14 | NOK | http://autobuild.buildroot.net/results/7fb60a974677f88b739efc73ecb7acb457815381 |     
       sparc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/0a34eb220af4af02c055495744ce006e973ac992 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/aa89ca74d8d497a77e75967e25743eb5bc39908a |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/e7c83329601bba4c5e12160f67d287624dad6766 | ORPH
     aarch64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/4bc6283ead513a33508174cfe7775484f46485ba |     
     aarch64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/69e2c03b69153e0e9e1ec077e4391f1909d9a906 |     
    mips64el |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/2bad3633830eefaf0e92ef599eba3dc48bbca007 |     
        i686 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/bcb3bc032920218d3649ae80d97d8b0f1969050a |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/d0bafed06322bf311c854a197f95d3c550909173 |     
        or1k |                          mimic | TIM | http://autobuild.buildroot.net/results/33f6b68e53803bac61776e7fb26697c8151eab46 |     
         sh4 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/528f96fa767914487da561ce2f9af8ad4867c3d6 | ORPH
        or1k | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/7d9b83091b6cb22fa0330a465255d400ed0f777e |     
microblazeel | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/4ed0bbc2878380504acf999c0ba7126eb859eb3f |     
        mips | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/c33a38bd4aff0c1bb31e074da7db2ea05cdf80e4 |     
        i586 |              perl-sys-cpu-0.52 | NOK | http://autobuild.buildroot.net/results/a87116b34ee0c660537430638e38f7ebbf052024 |     
      x86_64 |              perl-sys-cpu-0.52 | NOK | http://autobuild.buildroot.net/results/0d472d8b2c548afd88bf5858c67d3620c716973f |     
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e06ce3b97bef7c60a3c88d86fd915e98cc5a8651 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1600abd06a418bf03f12a9fc815c03bc3aee2de4 | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8e567793f1264917793e4f2ff49f704a7d03acb8 | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a355094e867edc8a5f8c3cd353358e684a56da70 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ec0ab335b151f3b3c66c3a73432c63c9d5ed68a6 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/f2563a1d995b4175685f25d20860fd37990f4040 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/18fe22955a4cfb639e8e16e65087657f0baaaeb9 | ORPH
   powerpc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/306468851cf362a2290da581ba9e94bf8fa04890 | ORPH
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/bdd1e0c2d1680c7cc8c116ecec28067b901e77f2 |     
      mipsel |       qt5serialport-legal-info | NOK | http://autobuild.buildroot.net/results/1bf3f6f7a423afe2392c0a4a04b46b90bcd039f6 |     
         arm |              qt5wayland-5.11.2 | NOK | http://autobuild.buildroot.net/results/0d31817bb4d416d01f4d1bec3e22ce0e5b2ca1c3 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/e5fc53c26fdee9336bbbed3148c0831fb3698399 |     
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/7951e3151f6463d4172f0dc30ba22a3a5b2df80a | ORPH
         arm |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/14ab029d7249ad0573b745fdeaef1d1bdb2980a3 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e6cfde1131b900a60e52c35ff256a7f224ae98a6 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/33506e33caa822f6cb1fdeed70b9a2f7db6c0de9 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/2ff314ed515cc97c1ed6e3b4f005f575669bad7c |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/cf779adf1e361933bf39ea470900acc9c5947b8d |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/eb9b1ff7fa33563b15b8dd4c69d0369b2d27792f |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a2f2632f21856f719c09ceb550084191dfa4c0ff |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/d4af58b7e305b9972781d42ae90ee66c91195f9a |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/694b78a56b5173da1409de9802baf1f76afaa447 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/82f7a9d86c447a82fc8126e0c8efaa8648c13ae2 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/423d480271b8bfdd9319a11cd97f9229681478e4 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/38167105cc56935569f6d2946882960c64e817f3 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/882fbc1ccde403f70b208a9e4ae87ce7674332f0 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/af53676c0ef0dc2e795ce8218162afcab09ccb81 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/91a85fec08199771c4c4b42bb21dcea7ba7b37af |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/88ffe0f3caec977dc5a755d11a768fa1d0c285ee |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/7fa36eec86042aed19c5d4bbeba0efcd3bc2d327 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/bcc07964989fd9b96b615ee153ecbeaa6c358346 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/db571031cbc9264debd6ddca4f1a74a8fcc89813 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/0ede90aaf45507564e382ba09974454349ef9dab |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ad2ef3b764390e7f6f38c5180e9d7f853e055db2 |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/cb317ed198a2fb7188aa926299fdd65ae2566746 |     
   powerpc64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/aa57ee97951211cbaa82a531bbfab57b191dce23 |     
      mipsel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/4c9219be08fe26c31041d5c3f72a786b7cd6c3ea |     
    mips64el |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/bfcb14ed22a877047db00d8f8c445e35b6e0803e |     
         arc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/82e7a56705b380361f2b68cd74f6dbee96ae9c04 |     
    mips64el |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/e7ca19933cd2de89bffda43fbe9882ab7a4cf093 |     


-- 
http://autobuild.buildroot.net
