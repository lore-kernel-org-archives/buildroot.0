From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 06:00:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-12
Message-ID: <20190513060042.2B05F852CF@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  30 |   1 |   0 |  31 |
      master | 177 |  11 |   5 | 193 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                mono-5.20.1.27 | 2 
                       netsurf | 2 
                          atop | 1 
                     gdb-8.1.1 | 1 
                        glibmm | 1 
                host-libsodium | 1 
                      iwd-0.13 | 1 
                  linuxptp-2.0 | 1 
                   netsurf-3.8 | 1 
                  rpm-4.14.2.1 | 1 
              spandsp-20180108 | 1 
           tesseract-ocr-4.0.0 | 1 
                   whois-5.4.0 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

microblazeel |                           atop | TIM | http://autobuild.buildroot.net/results/94aa00f776b8a3491ac0b3212c95f5e666c5a29a |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/a81eb395bd95306fcbb07c1443c9134fd63fa379 | ORPH
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/e196d77626b877dc3454d21febe20a04877c02a9 |     
 powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/30bcf2ab8f95574b20ac2833ce237b3a885c01b8 |     
      mipsel |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/176a40dd27ad92e5ad07eabbacdddf4e95edcba7 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/3896b76ea6494222e062369e537a76da577f502e |     
         arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/ee6d037154127cc6572f06e9a78bae383ea381bc |     
         arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/e505ec5aed040b34754d75e91f9de7ca334f2da9 |     
      mipsel |                        netsurf | TIM | http://autobuild.buildroot.net/results/b454b00198ddd6601b2238f9c1d0bb2154c1901e |     
     riscv64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/fc1ffc5c3a006f66b11de0e0127e4224aec1aa2d |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/04ac3da1d9584095f57f3ea07de73e06449618d8 |     
     powerpc |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/a1446b419f5f59f65fe80849182e38457de203b5 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/674ef1b8791c7f9dbdf4e7a0f84192abb59c21ae |     
      mipsel |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/dba4cf210815c66aac5474fbc05f418a2cc98bf6 |     
     aarch64 |                    whois-5.4.0 | NOK | http://autobuild.buildroot.net/results/d272b906cc0a1dcced2b8d48aad77b272300005a |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/07dded285364ca342c3270ba71bdc8ef72e1db26 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 1 


Detail of failures
------------------

        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a2097f0bf03d8409164cc8ad6dba6775c49d3f91 |     


-- 
http://autobuild.buildroot.net
