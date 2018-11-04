From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Nov 2018 08:00:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-03
Message-ID: <20181104070018.2596F20812@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   2 |   0 |  15 |
   2018.08.x |  13 |   3 |   0 |  16 |
      master | 172 |  15 |   0 | 187 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
               host-efl-1.20.6 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/f08b5905548dd7ea3440b9aac4df040b1ec23fe7 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/15a70c6ede81789fbf67b1ef33fcb59aec5de495 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 1 
                libmpeg2-0.5.1 | 1 
               openswan-2.6.50 | 1 


Detail of failures
------------------

      x86_64 |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/c19554dedb10326e2f711861cadec9b5744496e7 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/842405fd39fd3aff98437f8d3fe53349a53b8f1b | ORPH
         arm |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/80d34ae7d9c57f91c6de30565ffaf590594e7565 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 2 
               valgrind-3.14.0 | 2 
               boa-0.94.14rc21 | 1 
                   dante-1.4.1 | 1 
                  guile-2.0.14 | 1 
                 libidn2-2.0.5 | 1 
                 libv4l-1.16.1 | 1 
                   luvi-v2.7.6 | 1 
               pulseview-0.4.0 | 1 
              traceroute-2.1.0 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
              wireshark-2.2.17 | 1 
                  xerces-3.2.2 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/35e73150bd6e641496124c0724b4e11e67c76061 | ORPH
         sh4 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/524335cc55587a268b051052b2130aff087c0193 |     
         arm |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/60f9523a06e331f90b9939be84c5a69b47f4d0a8 | ORPH
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/bf16340a018651a2798ce63438715ebc06bac408 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4c322f96f6659895fe388ece54414f4b9cb28bd5 |     
      x86_64 |                  libidn2-2.0.5 | NOK | http://autobuild.buildroot.net/results/206a7facd4ad1432405bd658f98dcca7eb62cf97 |     
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/d38cdd94a020f56744de0bf17d4df6a7bd959ab8 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/e481fe1b5f585c233b4e1e0e0a64ab2cb72faae9 |     
         arm |                pulseview-0.4.0 | NOK | http://autobuild.buildroot.net/results/263a909a8bd825b6841c5f901330d07cbfb3385a |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/e941f45a630c59227ebcb9ce8134ad4e3e17b9fe |     
         arm | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/8ae43818624f6b1c55d6e6dd0b1569978f5f9f1f |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/fb1bd5bb355ebe608c56c71ed09f5b7a9dff6c80 | ORPH
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/c767f021bc67814229d8a3f67daeb6783c63039b | ORPH
   powerpc64 |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/a27fac772aa0b4004f0d21a2a0c76a10b263a6b6 | ORPH
        m68k |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/e9d3f8d45af4a3086373ec5bbd942d97de26a0b7 | ORPH


-- 
http://autobuild.buildroot.net
