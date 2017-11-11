From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 08:00:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-10
Message-ID: <20171111070013.6AED02083F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   3 |   2 |   0 |   5 |
      master |  95 |  33 |   1 | 129 |
        next |  28 |   2 |   0 |  30 |

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

                 mplayer-1.3.0 | 1 
                     php-7.1.7 | 1 


Detail of failures
------------------

        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9860dcc852732e4da381028f1ab07ce3efed3c75 |     
      mipsel |                      php-7.1.7 | NOK | http://autobuild.buildroot.net/results/b2b0c707dd3fd1185a922bc31bda886197e38611 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-3.3.5 | 6 
                      qt-4.8.7 | 6 
                   mp4v2-2.0.0 | 4 
           python-numpy-1.13.3 | 4 
host-vboot-utils-bbdd62f9b0... | 2 
           oracle-mysql-5.1.73 | 2 
                  boost-1.65.1 | 1 
                busybox-1.27.2 | 1 
                  cc-tool-0.26 | 1 
             freerdp-2.0.0-rc0 | 1 
                     gpsd-3.16 | 1 
              host-erlang-19.3 | 1 
    host-libevent-2.1.8-stable | 1 
           host-mono-5.4.0.201 | 1 
                  libpjsip-2.7 | 1 
make[5]: *** [profiles-do--... | 1 


Detail of failures
------------------

      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/b1bb818a4ca913221577dbaf3ac7948cd86d5fde |     
microblazeel |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/982b8cc843389bc0680b1f3ff120c2600717522c |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/de63ea250ef2108421b009dca044b92e34d3786d |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/7a2a22fceca8fff441c2ff489092eb3eedcbce9e |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/f923b4c18f8f649edf89e1e844b7813de711d2c1 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/044ed608543a997f73d3531907451bd7113fb99e |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/8e7bf34ac08c17405421927eb0cc3f620387035f |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/9251f557579de6b8bbed88cce751a60fe2d96ad3 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/87a3cb3e16a9a2ecea072c1459306557d84c867b |     
      xtensa |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/bde3097c5847eca987eb9c51aa30119f07919144 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/e72e2768c285d5e9758ce0aa0f830523c127ae6b | ORPH
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/c0a535f39956e30cb1217d5bfae6216da97be26c |     
    mips64el |     host-libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/a36abb1ac556a8b50e140ea1851955744b152608 | ORPH
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/a7a1f539b69f8b7432f165310d97cbc6ead80faf |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/eafde457696c4210b07177905348156bc16006f5 |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/90cebe2b3e96f969d348aed3edf1fe25f325a604 |     
        m68k |                   libpjsip-2.7 | NOK | http://autobuild.buildroot.net/results/a4c736ab6f35416304b7447af399b4aa6a34b037 |     
         arm | make[5]: *** [profiles-do--... | TIM | http://autobuild.buildroot.net/results/c6d8215098c7ec99330539f8d26116cbb6d48777 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/e8a9b273cd2bb346cc7bb59a50503cb6a50044cb |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/374f95786c3dc30e0e12cee3066dd1537b9eb0cf |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/e7aaf104301a3e2729c928eb01bc005518a45179 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/b50c9aa341cb049556d447057f98b69165e74dea |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a10d395c8a692e6df7ac67ca875a7eb7dcd59d97 | ORPH
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/4b2523bcdae55f9def8a2f813fd0f9364a4d716b | ORPH
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/7bb85381481de5da5bb696f9e8b4c5a39cd2bf14 |     
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/91932f22b85bf2cb505f242ba6aa4013b0fce3fb |     
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/ff01cb5d27a2a3cb8ab6620479b97236f5fab77c |     
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/7b784cd782a27160e430f2269787db052db21b10 |     
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/96f4945d663ccd65aef64e3edef40222db03c744 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dfeb15065239b11eeae62c9201642b5224b46c65 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fdef7ede48a6059c5326c35ce29e640c9ee8dc48 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/da571445f89dbab7046e57c26d987441f1c60468 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0b35347289df4069d9cfc257a2476fda084ddb73 | ORPH
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/63bf867ae1bccfde0d610b3a0614d799f3fba70a | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              buildroot-config | 1 
                 libdrm-2.4.88 | 1 


Detail of failures
------------------

         arm |               buildroot-config | NOK | http://autobuild.buildroot.net/results/ccff191044d53be63ad81f0a3ab975ad82423af5 |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/cc19d6eeab1c5d9829903e2c4ed70f812de0f000 |     


-- 
http://autobuild.buildroot.net
