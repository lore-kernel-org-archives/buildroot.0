From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 08:00:54 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-12
Message-ID: <20180513060054.813E9208BB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  35 |   0 |   0 |  35 |
      master | 260 |  23 |   5 | 288 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 host-rauc-0.4 | 7 
                     znc-1.7.0 | 5 
                cifs-utils-6.7 | 2 
               asterisk-14.7.6 | 1 
                         boost | 1 
                  flare-engine | 1 
                    gst-ffmpeg | 1 
             host-gauche-0.9.5 | 1 
                     host-mono | 1 
                        libnss | 1 
                mono-5.4.0.201 | 1 
                    parted-3.2 | 1 
                      qt-4.8.7 | 1 
                qt5base-5.10.1 | 1 
           uboot-tools-2018.03 | 1 
          usb_modeswitch-2.5.2 | 1 
                   woff2-1.0.2 | 1 


Detail of failures
------------------

     powerpc |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/b295029ffb743634c6bedef7080dfbfdf029332b |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/24136391b7cd5517f3de2fafdcccddca3cbd4c84 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/0e0533f992a0bd24817450398ded143b794a0bf9 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/e831501aa3c07f712afc6212db957268ca564436 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/c7fa449e7f85aa735f52c370737afc860badd152 |     
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/a36fe5d78f87e2a3d6de477ea05d5ffcba5bb68b |     
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/88d83a4f9c328d1c03664dfb49cb4f9a6fb4c0b1 |     
     powerpc |                      host-mono | TIM | http://autobuild.buildroot.net/results/6237ba23a0e6f6493053c15a884dd73528f4ac9d |     
      mipsel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/52ca760f0227075ca988754bb9eb8df0ea3e1563 |     
      mipsel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/4ee750b871a17ad36489256acc80988ebf0d531f |     
    mips64el |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/2d2cc58ace4b68da008f8d66c9a58fec349161a4 |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/cd5e552730243bbabeffa69bcbfb69a6fddce25d |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/5387f54d3217d30e67fe524a4c5014f71a347cc7 |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/fa0114134ed5283fd5dc3472fd36c2dbe41d4caf |     
      mipsel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/7b54a16e9a0b3fe5d5dfb6c24856f5eaa31edf8d |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/158e8ebb39713e1b436a5cc1a1916f46c30694df |     
         arm |                 mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/9bbb0a782d144e5a264c9ff58575421a25a7cad1 |     
    mips64el |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/fd72216955a69152655008fa641bf538f9a50d13 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/85bad5084c5abe91d01dc08507020d304c825e8a | ORPH
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/f531572e0ed6ac538e5757d9485819b45f0a6658 |     
         arc |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/a95420551f0771b158829276fb91f266b0a7d20f |     
      xtensa |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/9ddacb545741802c1dab35b41662dba32005fe75 | ORPH
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/3f041d9a46e8eefb6fd6f1addfec77b8be21a199 |     
       nios2 |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/ebbfaae07fd9f0a3db1c7c1e9c3ae4042b669299 |     
         sh4 |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/34631a761098d56990a937b5ca9202be25009be5 |     
         arc |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/666498789d2bfbeffeca1e0704f5fdb2352e7dca |     
        mips |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/68a9bd67beda9a007593997cdf07f11186041638 |     
         arm |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/8830e432c658fd88232caa8fb07cbb269eb274cb |     


-- 
http://autobuild.buildroot.net
