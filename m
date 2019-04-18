From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 06:00:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-17
Message-ID: <20190418060043.93BE185F49@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  23 |   3 |   0 |  26 |
      master | 195 |  30 |   4 | 229 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                cracklib-2.9.7 | 4 
               libffi-v3.3-rc0 | 3 
                   netsurf-3.8 | 3 
                host-libsodium | 2 
               madplay-0.15.2b | 2 
                   mpd-0.20.23 | 2 
               binutils-2.31.1 | 1 
                   botan-2.8.0 | 1 
                         clang | 1 
                    git-2.16.5 | 1 
                        glibmm | 1 
            host-thrift-0.12.0 | 1 
libcamera-d5ca33f6c7b0cd1ca... | 1 
        libcpprestsdk-v2.10.10 | 1 
                    ncmpc-0.33 | 1 
             openjdk-jdk-12+33 | 1 
               postgresql-11.2 | 1 
                qt5base-5.12.2 | 1 
           qt5serialbus-5.12.2 | 1 
                  samba4-4.9.6 | 1 
              spandsp-20180108 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.1 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
------------------

       nds32 |                binutils-2.31.1 | NOK | http://autobuild.buildroot.net/results/1b18acb11db4d6c4198deb7385aff3d4d524c37e | ORPH
       sparc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/ca9dfcfd34365aa1476b718d4897a2e75f6983ac |     
         arm |                          clang | TIM | http://autobuild.buildroot.net/results/197a88ab6cad19511f6f2f08f106e7a98ed1a620 |     
      x86_64 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/8d2509b682d94514f847617fd4acab81cc01bb02 |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/02c422f485b18e6fe236d77728c8749bd89127be |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/2fcfb79b9575b0fdaed6b12e3a7aa6d61103ed33 |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/3013bb878adcac73266437aba48042c8425d3491 |     
         sh4 |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/8eeac7f7ddd97576eaeb87311bf0988d59d8b132 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/6b9f021906db8e72eec4d1f759a7bf36dd2106df |     
     aarch64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/4417ec6362913d800f251d2aa4399f76ddbc75ec |     
       nios2 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/3617742768e12f8efbe1bfbc85d25a868b6d9e39 |     
      mipsel |             host-thrift-0.12.0 | NOK | http://autobuild.buildroot.net/results/a069ede42c31b5c1456ab34f38be6891439d613e | ORPH
        m68k | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/10c9351bec66350e91f3eed10026e9a482f4ed7e |     
    mips64el |         libcpprestsdk-v2.10.10 | NOK | http://autobuild.buildroot.net/results/36ef83aefd24bcc6bbf58812aa07aa0f6072cd09 |     
       nds32 |                libffi-v3.3-rc0 | NOK | http://autobuild.buildroot.net/results/0e70fd01ff8855edec7407b948a4273a666a4136 |     
       nds32 |                libffi-v3.3-rc0 | NOK | http://autobuild.buildroot.net/results/62c62b6d16f1a0dd0a9389672d28c07cb7cec4d3 |     
       nds32 |                libffi-v3.3-rc0 | NOK | http://autobuild.buildroot.net/results/12803a705586e82fdfb49013da2eb3b9879ccd45 |     
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/bc9432218933f5b739cfc1efdcb92a67bdbcbea7 | ORPH
    mips64el |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/80d2602f384843e9639dfa77074ec09603cb52f9 | ORPH
     powerpc |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/6ff39019e09fc1272e0d50a19561d71db83446cd |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/045f7b52129266bf075eb7f7460259dced3bfa86 |     
     powerpc |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/40dbbfc045ed2e5aaecb23a567fc43267e464671 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b487c8e643f9516a10b488d4418fbea3dd492394 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cde4dbbd88e2776d478ce45dafb77b449d2c23e3 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cf5f688a1093cdfdc18b07200ecc0b50b7abc539 |     
     aarch64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/844960f15c5e39f6613872616c0c4caa74046390 |     
         arm |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/467e4bc340f4c8af05e8d4ebbb98cb723cb3b611 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/e4105d29a3a580cec472781015db612d155dbae2 |     
microblazeel |            qt5serialbus-5.12.2 | NOK | http://autobuild.buildroot.net/results/df11b332bc8d909a4dc2163d4eba53829ddb32c7 |     
         sh4 |                   samba4-4.9.6 | NOK | http://autobuild.buildroot.net/results/b5214e71498fffacd9b82b4b24d070e2b576b3da |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/81434ba401347ef0a727952a23be424752f52547 |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/33acaf170911d1ebea2301775e698e95f22aa6ac |     
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/277a24ad543a8f54cc8afde4f359f5d77b42eb7f | ORPH
     powerpc |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/6061f7caae1bf0fa33237a261ece87cee8442f52 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 1 
                qt5base-5.11.3 | 1 
                   sudo-1.8.23 | 1 


Detail of failures
------------------

        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7c8c85d4a1deb7398fee5b13113178a04cb258a4 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/ce736654a16132f245cc924b2501290a5b6e1683 |     
         arc |                    sudo-1.8.23 | NOK | http://autobuild.buildroot.net/results/0c57ca804c9eb2aabb1b6652ad4bcd13acbd2d6d | ORPH


-- 
http://autobuild.buildroot.net
