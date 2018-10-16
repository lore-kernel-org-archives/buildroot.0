From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Oct 2018 08:00:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-15
Message-ID: <20181016060048.4F46C20717@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   1 |   0 |  24 |
   2018.08.x |  27 |   2 |   0 |  29 |
      master | 192 |  17 |   0 | 209 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arc |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/33038b1c3a950ff3ad4c9528b91b4e2740cc0d89 | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 
                qt5base-5.11.1 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/05281dd25840449a973ecf778b45c803c9b9df35 | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/728bb7df4b0cf5012eed9f81bcb7f98995207438 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     vlc-3.0.4 | 7 
     docker-engine-v17.05.0-ce | 1 
mjpg-streamer-f387bb44e6c08... | 1 
                    php-7.2.10 | 1 
                qt5base-5.11.2 | 1 
             qt5wayland-5.11.2 | 1 
runc-69663f0bd4b60df09991c0... | 1 
             util-linux-2.32.1 | 1 
              webkitgtk-2.22.2 | 1 
              wireshark-2.2.16 | 1 
                  xerces-3.2.2 | 1 


Detail of failures
------------------

      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/f21c161838e1e59f4355ff4ae63d7b71d37f6bb7 |     
microblazeel | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/fefedb6bf56ad9ac36efb0abcc0b4b4aa4427d9e |     
         arm |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/1d1522e5cbc0e39cf14b7bd759f34f29df12a03d | ORPH
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/d2b38023274473c22a054ce250df322928e9fd1a |     
     aarch64 |              qt5wayland-5.11.2 | NOK | http://autobuild.buildroot.net/results/8bd71b45f636d0ed8d7f2a20b831a93e55cf6747 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/f2446a85c0bf5625c7b6dab3ad5b8e74eae49fc5 |     
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/606b90eced8de1273f5e244bf4e7d2e893d0f5d7 |     
    mips64el |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/4f6c6295272acfff28249369fdd964b7f9b44f2b |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/7bcab343b00935a0a202a05399bff1e7a88c682b |     
         sh4 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/643d529cebc33df76da6e7725ed027648ac46cc9 |     
microblazeel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/7ad1862d52f337f0e8ec0e14cbc28074b56fe1c8 |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/239089a9d2128cd4beb79b028feeaf64c09cfb72 |     
         arc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/4e04368f68197dabd2ff4ffd720c382ab5ca2354 |     
        i586 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/1cf2875becef7cdd902d973c0307c9f94ebedc70 |     
     aarch64 |               webkitgtk-2.22.2 | NOK | http://autobuild.buildroot.net/results/00c1a8ea23a99728a4f3f4478705f2383414ae41 |     
         arc |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/39265de9ca9e8532ebdb81e2083ae17738a3b747 | ORPH
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/37159892cbe78fee467909b9640c7f3fca5545d2 | ORPH


-- 
http://autobuild.buildroot.net
