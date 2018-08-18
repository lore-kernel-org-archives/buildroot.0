From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-17
Message-ID: <20180818060019.8702120DE6@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   0 |   0 |  26 |
   2018.05.x |  19 |   0 |   1 |  20 |
      master | 173 |  15 |   2 | 190 |
        next |  37 |  11 |   1 |  49 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 


Detail of failures
------------------

       nios2 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/56f77e8a32d10fa0d4ac69ca00f3accef255bf1d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 8 
             host-guile-2.0.14 | 2 
               azure-iot-sdk-c | 1 
                    f2fs-tools | 1 
           host-libselinux-2.7 | 1 
            micropython-v1.9.3 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.11.1 | 1 
                  samba4-4.8.4 | 1 


Detail of failures
------------------

      xtensa |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/bdf0360b0407acdbcf494e6efb4d76f772783f94 |     
      mipsel |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6d3db8a67a1de75920624b3e13e8110e783ddbd9 |     
      mipsel |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/253bde162b4419a282f58f7932b0c6027ec6c742 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a256f3bfb9aceb3ed122beed39d9555a5cb07274 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/212651b677cfb0763b34596d4f999103039d89bc |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/77f538992ea5f58245016f1a09fa5048895be19a |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/97f9b0636d692571b9dcf38543ca79fc9de55bb7 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/37571087efdb4e1785ea94af8c56eddc1305f881 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c830dc9cdbd4e08eda4ced4fa6213bff60c6706e |     
         arm |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/7d578300ff2c6c5e236c18eba7290739da245cc3 |     
       sparc |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/8546b7559e96ab0f3d2508722fd299e103e3457d | ORPH
      mipsel |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/ba8a7dc1496ed9a63d408eb3d2683c485c273135 | ORPH
      x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/d037515c949a377d4ace48b81675eb79e5964790 |     
         sh4 |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/2b18b9e1449f91d0c8d72ceadf298b5b37f5c9c4 |     
     aarch64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/36598fac615b3f138e41e8dd1df903558cde765c |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/a3535cdf5e91df011a59a4b9f60d69195f5efdcb |     
    mips64el |                   samba4-4.8.4 | NOK | http://autobuild.buildroot.net/results/1404a594583ff192d70086ef590f924472465c89 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 3 
            host-lvm2-2.02.180 | 3 
                qt5base-5.11.1 | 2 
               aircrack-ng-1.3 | 1 
               azure-iot-sdk-c | 1 
                  mender-1.4.0 | 1 
                     php-7.2.5 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/d16ef6ca4968c3278ccba251aa8fa8be5f648c41 |     
      mipsel |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/13bb3f9302f8bf0bf3af9a5f248707596ea3520f |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7165805e56a7f214e05253fd4c0a5ae1880d49ee |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/646dab37d383c7c539397fc07ef2b8a36163ceb8 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fb046c04fe18bec973d120e4ab33971f32ba5769 |     
         arm |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/33b567399d74d255f729a10bb3b2339563feef27 | ORPH
     aarch64 |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/3299f39cd8b5c0bf70d7af0c496574fb4d8cc19d | ORPH
microblazeel |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/c3a0b2fae9a8f5353a0863b5812feea853d10fb8 | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/42a3f597d17ed4875f0d841f9c689a26d12c2086 |     
      mipsel |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/9eeb555ada9f4fc001ebfeba76994768684bc5f0 | ORPH
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/b8192aa9cdd64ff6bb5bda57695f47856c3e7c97 |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/0ab70adbdb48f94ebedf337e3ad49f05ca9050f4 |     


-- 
http://autobuild.buildroot.net
