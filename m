From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-15
Message-ID: <20150516063015.D2BB91018B2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-15
===============================

        success : 336
       failures : 30 
       timeouts : 0  
          TOTAL : 366

Classification of failures by reason
====================================

                ipmiutil-2.9.5 | 4 
         lua-periphery-1.0.4-1 | 2 
                      qt-4.8.6 | 2 
               qt5webkit-5.4.1 | 2 
             fxload-2008_10_13 | 2 
                     php-5.6.8 | 2 
                 cdrkit-1.1.11 | 2 
                pulseaudio-5.0 | 1 
               host-mono-4.0.0 | 1 
                   ncurses-5.9 | 1 
                jasper-1.900.1 | 1 
              xmlstarlet-1.5.0 | 1 
                   zmqpp-3.2.0 | 1 
                tinyxml2-2.2.0 | 1 
                libedje-1.7.10 | 1 
neardal-33b54a55032b047fd88... | 1 
              lbreakout2-2.6.4 | 1 
                 glibmm-2.36.1 | 1 
               alsa-lib-1.0.29 | 1 
              lirc-tools-0.9.2 | 1 
           uboot-tools-2015.04 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/a9d4f87cbb1a792d4718ff409250c3aa24f812b9/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/e9b4242b75fac6068622517cbc53b49b5811584b/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/1de9b41835f8466a58708b415d213c90adf52a21/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/0bab8ace014ba7399678a6b263617d900ea27da4/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/1aed89109f5e298f6a182ca1950bf78106403e81/
      xtensa |                  glibmm-2.36.1 | NOK | http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/
      x86_64 |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/b05b7829770deee1a554d110a2ac92324cb56cfa/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/aff55e4714376197afaefa839fc1afe7a5aea748/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/9fbfc2a12120da53a2caf1217b653e5c296e4ab4/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/39966761b41aaf259cedcc241dab3d87f18871c8/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/87139c988e170a69e5caa5bc63304631b4786154/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/5d17055027055ffd33fcd28b208130afb26343c9/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/d4a1d890b4f8f12492de91eeae81f7b439c5e5e4/
         arm |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/62abc3eb74077f509b96bd7d249d5f61deadf633/
         arc |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/2ac6a4f946d48cacff85d44d662e1c103f7443f8/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/e32a5eebc61f840df48b050fc6399f2b6a861578/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/8b0f52768250826d3ec924283a192bbd492076ba/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/ff865d106d7ec7ca8890f29448f4dea6aec478b5/
         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/c3ea67d9b341749b9591451da3f3b0cb4a9fbb74/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/08eed81cc6650d15d7319cc2b9bbd0400721ce12/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/a22343f0fa41e821a4f08184243bb314493b3757/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/f4a22344bd5c8f59e6f8cacb6a549f8d8fe99af2/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/3f7a39e06f9266b39a87d6e382c145ea036f75f8/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/235be65404d19fa3c21df741f86fbc0a9b32157e/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/b24e4804e9f8505db51b5d2c3fc9fda6c9147c73/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/b9425ab39efae75bba72adee07e6746b1d545d25/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/05563df889346fbed9926fad6542b25f26996c2c/
      xtensa |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/97a3070356e557a41b2a6cfe152884a3319eb823/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/931dede013d94f88fcb5185dac494775603063ec/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/1424d0f57631c72a45fce89fae24c472af5c896f/


-- 
http://autobuild.buildroot.net
