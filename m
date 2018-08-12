From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 08:00:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-11
Message-ID: <20180812060015.A385B207E5@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   1 |   1 |  21 |
   2018.05.x |  17 |   0 |   0 |  17 |
      master | 186 |  21 |   2 | 209 |
        next |  38 |   5 |   0 |  43 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

         host-cryptsetup-2.0.0 | 1 
                host-libsodium | 1 


Detail of failures
------------------

         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/fb7f3cc1f313e91fb0cf5820e715594b4e4f618e |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/a05429a86fcce6ff63346a0775be1fbf8ef5c497 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 7 
                    ncmpc-0.30 | 3 
              python-pyqt5-5.7 | 2 
               aircrack-ng-1.3 | 1 
               azure-iot-sdk-c | 1 
         host-cryptsetup-2.0.3 | 1 
           host-libselinux-2.7 | 1 
                linux-firmware | 1 
            micropython-v1.9.3 | 1 
              mjpegtools-2.1.0 | 1 
                    owfs-3.2p1 | 1 
          shairport-sync-3.2.1 | 1 
                      x265-2.8 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/87e82a5e8d0b1c1ff10ec3e59d25bcd56b329075 |     
      x86_64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/43b9bccacd88397d732fda16d998fa7dc001f900 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9dfffc1dcedefc3c4baee412ae36ae297f15cdba |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ea533448148a2728a3faecb9c67fae849f17e62b |     
      xtensa |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/704d54409644e7e5ad0064029edc1b8020df1b80 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/81ae35780e16c5c458e06228da180cf2d83eadf7 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7049a7ef91a7984848a2bcf67df792ed4dbe785f |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4f3ff822f0f057bef22c1a59deae429d544be29c |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/71006378450b5687240c455a72b5cc314704b776 |     
         arm |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/f46ef6123b5fa92753ff534b4ef7bea3f53ac388 |     
      x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/e48c974980b8228302a76ac5b6afad14e7ce81c1 |     
      xtensa |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/34b8bb8824d369e5b53e2a4effd1a8d18df07aee |     
       nios2 |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/276e07067ad630ce39b5e43d7e90cb8bd22a1925 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/d63727755d671ef6ac484fe26a79793123976651 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/d8a7339d8bdd5cdc6bd1716585d4bcf15a2e8015 |     
        mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/5af01895e0a58751ef342001bad5e17caf742b92 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/b9857a5b8b4bb6f8a47e78cc14ee1f81852f6867 |     
         arm |                     owfs-3.2p1 | NOK | http://autobuild.buildroot.net/results/c30201b79b6e36df4bb14281036dcb23eda1edf6 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/ca3fe2e816ceeacb8218c0085bcb37413ef381c6 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/48b7ab85de68e1972853a10f5999f4240c5efd88 |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/60576363adfca404c3a7883d5d46e8a4a9ee8171 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/da246c496854a3cec1cb4be3589264abd6f2c6de |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/295710ddc7ac11a88a2e8986ad35ac1803c7fe12 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 
            host-json-c-0.13.1 | 1 
                    iperf3-3.6 | 1 
          openpowerlink-V2.7.0 | 1 
                    owfs-3.2p1 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8c7d8df2b957698ced006915a4765366260de1df |     
         arm |             host-json-c-0.13.1 | NOK | http://autobuild.buildroot.net/results/c57c84fe5ad44101cf6ed7d13b73061126af248f |     
         arm |                     iperf3-3.6 | NOK | http://autobuild.buildroot.net/results/ba56d132c5994486066c304fa1f3872bb0f3ee32 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/109e5696f929f3c1d3f9a8a6f86d1eeb776a3ab1 |     
      x86_64 |                     owfs-3.2p1 | NOK | http://autobuild.buildroot.net/results/6f36f249b8d33def49deeae010672b4cbd45f79b |     


-- 
http://autobuild.buildroot.net
