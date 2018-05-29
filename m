From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 May 2018 08:01:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-28
Message-ID: <20180529060105.9DB5E2085B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   2 |   0 |  23 |
      master | 209 |   7 |   1 | 217 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 1 
                   libnss-3.33 | 1 


Detail of failures
------------------

         arc |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/0fdd4d5a3dfc404659e02846b716efe22a9c9407 | ORPH
         arm |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/9193f2cf3d81482cd8bafe3b2127b9539ff16160 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              wireshark-2.2.14 | 2 
                host-libsodium | 1 
                pinentry-1.0.0 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
            qt5location-5.10.1 | 1 
           uboot-tools-2018.03 | 1 
                      x265-2.7 | 1 


Detail of failures
------------------

        i686 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/64fee214581e41a9fff919cc7783bd5723d3d7be |     
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/fc9ac65a43192352d204e423cf3048e10f419687 |     
         arm | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/2f453dae7bee1f41ba467236a0ffd63277011cc6 |     
    mips64el |             qt5location-5.10.1 | NOK | http://autobuild.buildroot.net/results/c15f0d133f96a91a8b047c4f7fc14f2f7386909e |     
        or1k |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/ff914d0d17502060b23b09cf42fc3e7d1cce76f5 |     
     sparc64 |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/a283db85a287230486b7c841aef65af4d724a03c | ORPH
         arm |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/0747fda77c202a355be2c796c9c38937fb151134 | ORPH
         arm |                       x265-2.7 | NOK | http://autobuild.buildroot.net/results/cc35a77e136322b3eea574ccce31e6542f1d475d |     


-- 
http://autobuild.buildroot.net
