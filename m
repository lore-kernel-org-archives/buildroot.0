From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jun 2018 08:00:42 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-20
Message-ID: <20180621060042.5829F20DC3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   2 |   0 |  20 |
   2018.05.x |  17 |   0 |   0 |  17 |
      master | 100 |  13 |   0 | 113 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 2 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/217119d57bfb847173cdce2c41ba39234c6cd210 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1320c76315b83530fa816b8a0d6232dd9d59f63a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    host-rustc | 3 
               mono-5.12.0.226 | 2 
                      x265-2.8 | 2 
               aircrack-ng-1.2 | 1 
                 expect-5.45.3 | 1 
              mjpegtools-2.1.0 | 1 
                 opencv3-3.3.0 | 1 
package/qt5/qt5base/qt5base... | 1 
                  samba4-4.8.2 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/c1032bd195d46d39a69deda4e4988c00c6331ca1 |     
        i686 |                  expect-5.45.3 | NOK | http://autobuild.buildroot.net/results/139c32d90f10b399046ea9697374bbf85938e3d3 | ORPH
      mipsel |                     host-rustc | NOK | http://autobuild.buildroot.net/results/64abc2b5fd432220bb092b1d8198a30f0fb6f93b |     
   powerpc64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/d5fa7b164b600d375643f8964d4555450425d9d3 |     
      mipsel |                     host-rustc | NOK | http://autobuild.buildroot.net/results/507b4f86f9d9288ebd899390f547ae3242769272 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/eb719da18bd385fbcaac7c233ee7ff6962c92b58 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/85d1e36b62a0a4a5aedf1fab5b6ba286446d6d8b |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/84d161dd14d5418726abc8fe34672c7ac290de98 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/0b1cc240bed97733c0236a57d461cfa59d2a18ef |     
       sparc | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/277496ff320958a85ca6c4beca32ae149429ef3c |     
    mips64el |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/2fe9fa8214a209431a5e897eee2e5a18469d6e93 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/f2026139e38e0e24a237e83d8bc83b4038b38e4b |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/0fc38594ce010706fad7dee71bc6911241af1154 |     


-- 
http://autobuild.buildroot.net
