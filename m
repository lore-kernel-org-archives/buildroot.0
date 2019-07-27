From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jul 2019 06:00:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-26
Message-ID: <20190727060039.05F118797C@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  14 |   1 |   0 |  15 |
   2019.05.x |  16 |   1 |   0 |  17 |
      master |  80 |  24 |   0 | 104 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           qt5serialbus-5.12.2 | 1 


Detail of failures
------------------

microblazeel |            qt5serialbus-5.12.2 | NOK | http://autobuild.buildroot.net/results/45431ac0184ca3733c50613435fb2efd6d50a133 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.9 | 7 
           can-utils-2018.02.0 | 3 
                  flashrom-1.1 | 2 
               host-efl-1.22.2 | 2 
               log4cplus-2.0.4 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
                harfbuzz-2.5.2 | 1 
                  monkey-1.6.9 | 1 
                qt5base-5.12.4 | 1 
tvheadend-8f1de1621d78c9143... | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

      xtensa | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/d72eb18007f79276eca7f8f65aaf29ea64af4060 |     
         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/e3d82fd75c4a1b6dfaca8eb7a857e2ade3b1d719 |     
     powerpc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/9d4e49e00b9f119286e168c3fb33dc64d187a9b8 |     
         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/6a77cbafda19cc12669dc06fd864d119ee035e1d |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/feb13762a80689519c31f674cbb7f777c951c2f1 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/7d8ff74927de0865b24d38d60d119d9619a743af |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/0058c288273a69cecd4b3696cebdf03da673cc3d | ORPH
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/13c178cf791c9fba69e2c39223b527c740d32af8 |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/9f26ad5d86846353edb6883f7cbe44369d61cbc7 |     
         arc |                log4cplus-2.0.4 | NOK | http://autobuild.buildroot.net/results/7d78217c873051f6067617fd0575bae53653b29e |     
         arc |                log4cplus-2.0.4 | NOK | http://autobuild.buildroot.net/results/705d9a6e05a89c906b891093c603eac51a0ddf74 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/94eddbafdea765a4f534f62ef99082ca3f18e269 |     
    mips64el |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/a7bc7cbede4cd6c0c29ff344fe59e80be2b5a5d9 |     
     aarch64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/a84a40fac01cd9a52ea36c532e7b30e498dc9143 |     
     riscv64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/436d733f89f5be06785dd4f099d1d5f53c52f922 |     
     riscv64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/4f77960e855cbb7c6704139587a639837ee385c2 |     
        mips |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/6f09416fe052784bca65c5f8d0ffd09a1b4d7244 |     
    mips64el |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/9b94b4c15311d76e0c4f69547e46760abf3d34d9 |     
 powerpc64le |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/cb378a6e1b2448e103a8166e0a14b08265b845ea |     
      x86_64 |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/15b1cb5e77e3153b9d4696870916c05c1cf56cf8 |     
      mipsel | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/883c1b60a62c1ea798a58877a4477a8c110ff23d |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/cb2b1a9980de3cdfcb4c2b866c6014fd779e4e45 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/f2c8191c9f5b884a2601a0c92db267dd7f687a90 |     
        mips |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/471e86a99c56124e1cb9a19c1ced4700d5f70546 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/30a864f095c7ff6482804e49f94c9f91f7a83cb2 |     


-- 
http://autobuild.buildroot.net
