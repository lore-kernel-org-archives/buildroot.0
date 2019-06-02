From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 06:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-01
Message-ID: <20190602060046.B20488683C@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   0 |   0 |  21 |
      master | 216 |  14 |   0 | 230 |
        next |  58 |   6 |   2 |  66 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 2 
                cracklib-2.9.7 | 1 
             host-cargo-0.26.0 | 1 
    host-mender-artifact-3.0.0 | 1 
             iputils-s20190515 | 1 
                       netsurf | 1 
                          opus | 1 


Detail of failures
------------------

     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/3000e56216e7040c85d3a0a8e35c2910730ca90f |     
 powerpc64le |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/99aefeb0fb30cc7cf73256c6683654b4764056d7 | ORPH
     riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/947bdfd5301f76c2b09fed3985270ad14c359611 | ORPH
      xtensa |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/48c106e650bc85b5ce67bf4d8995adbf95184c9c |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/c7cecf8946e9d4b4ae118b5f7597638c70decd3f |     
         arc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/ccc8c682e25279b0a0fc40d90d24c535f6a35fe5 |     
        i686 |                        netsurf | TIM | http://autobuild.buildroot.net/results/ac65bd15d1e002d23d16f5b8c1a1cfa011e52750 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/4c66b979f47ffa3c75283ab01714d805dde06ad5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                   dvblast-3.4 | 1 
                      gzip-1.9 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.20.23 | 1 
        network-manager-1.18.0 | 1 
               opencv-2.4.13.7 | 1 
             openjdk-jdk-12+33 | 1 
                qt5base-5.12.2 | 1 
            qt5location-5.12.2 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/7d6c7cb04bfdf52dc1a70d94457ff43fee03903d |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/8bdd81d70ac1e72ef859ce0f312bb63a7957db2e | ORPH
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/39a8cfc8455a5482c7c1da0b046ae21ec0dcbe56 |     
       sparc |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/60c721a82ffd668bebf02d80bca83780d6cdb2f2 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/45bb4b4b8a7e297fe6c3d0c58bf88933d76b5545 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/20a0d71a2d1d34f3f72b1ff219aafbb772f708cc |     
       nios2 |         network-manager-1.18.0 | NOK | http://autobuild.buildroot.net/results/3beced68b8745a70feabd789a45141f52f6e88a8 | ORPH
microblazeel |                opencv-2.4.13.7 | NOK | http://autobuild.buildroot.net/results/de9e9feb1706f7d07554ce0ff6d5e09ae2edc557 |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/6becdb0a457c274d217b6eeb51abf782b99cda4f |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/a5ca38db8fc6398ba1f233a908948ae62e1d6b9d |     
microblazeel |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/86d386c02b676c847332765cd3179d4cb2fb0896 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/50ee5774ddca5c4e175f06d6cc2241e532fa5b53 |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/458cfd2027482d46ae5f0c5ea27d54705b4bf199 |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/8834f8fd7e00a4a2fe98a4c17cc26c5f1b6ef6e2 |     


-- 
http://autobuild.buildroot.net
