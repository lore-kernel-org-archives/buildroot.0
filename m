From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Oct 2018 08:00:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-24
Message-ID: <20181025060031.7D5A4208EB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   0 |   0 |  24 |
   2018.08.x |  18 |   1 |   0 |  19 |
      master | 200 |  24 |   0 | 224 |

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/b8b81e74c422cec78934805cd3cbe204d65e1a4c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 8 
               postgresql-11.0 | 3 
                  cc-tool-0.26 | 2 
                 dc3dd-7.2.641 | 2 
               libiscsi-1.18.0 | 2 
                flannel-v0.5.5 | 1 
                   luvi-v2.7.6 | 1 
mjpg-streamer-75c6c4a7809c7... | 1 
                   mpd-0.20.21 | 1 
                poppler-0.59.0 | 1 
            qt5location-5.11.2 | 1 
          shairport-sync-3.2.1 | 1 


Detail of failures
------------------

      x86_64 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/77e984925f86f48040d732c16682051a7d0e69a2 |     
      mipsel |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2f448e26ddf05c1fb1ef9a4143ce118f0d51406d |     
     aarch64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/5adfa093aed456dabc4a6decb14ed00b15e12adf | ORPH
     aarch64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/9629379f19e3feba1671769263b3ba5fd30bd5fd | ORPH
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2864ed535abd8fda1b25f1355474541298ba9f98 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3b77a6b89ff0270a95a610fb2e1bc20d3157cdcd |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f16e0b40fe1692a14fda81f63497f8c4360beac3 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e889f4e1bc038a10d6f0dd4afc1ad6105fd12ad8 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/db770c734aecd3cffd7521ecb591c385c9539902 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/96d26e0353ff183984ba227fefe198653d8ddf1e |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/105b25afb5e738cabfa4e975b68406f1ff1837b9 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6b110a3baa8484f075942fb5c28da5bb169a3d3b |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0bac6243001c9e33ead3aeda347e5eb9727be99b |     
     aarch64 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/b4e50d5d71321a535e5f5d5ce3043dcced87c5a8 |     
     aarch64 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/67ce2dcc1ac5818dd3534e5d10da7f0826381399 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/0a121e667fbf08cdd1fb6c9262024662cea59c33 |     
     powerpc | mjpg-streamer-75c6c4a7809c7... | NOK | http://autobuild.buildroot.net/results/72f560b03cab96161f6d8d127f99150ba3e48aff |     
         arm |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/34122e25ac446603b85c6e318b68b426c31481e1 |     
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/003f6666820975589e32e7d4e9d0997e92c9d5e8 |     
         arm |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/810337ced32a71f0a51f46185bb5c2e59bf10bb2 |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/14f9f44d7eae5ff5905b0e87bee1e6cbd5ffab2d |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/3b4fafbbe057ceeb97de4ad9f91426bfbbc3e129 |     
         arm |             qt5location-5.11.2 | NOK | http://autobuild.buildroot.net/results/761d1effe619a3096e96d09c6bd5f4785b72d4af |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/c0ea43d8a94de7b3a9d2004fa3b1d57733b24823 |     


-- 
http://autobuild.buildroot.net
