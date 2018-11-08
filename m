From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  8 Nov 2018 08:00:39 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-07
Message-ID: <20181108070039.3833C2072B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   6 |   0 |  25 |
   2018.08.x |  14 |   4 |   0 |  18 |
      master | 162 |  19 |   0 | 181 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                p11-kit-0.23.2 | 2 
       xproto_inputproto-2.3.2 | 2 
                  boost-1.66.0 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/cf63500de2d19a67f2992cce531aa269d6785cd0 |     
        m68k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/cfea3172fe9f9541fcb99b5dcd2926288d449183 | ORPH
      x86_64 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/a0ae58531f7ba46a6115022739996eb0bc24698f | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/82e2f7d000eb759005f3c325ede7020eb661652f |     
        or1k |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/9e92ccadccf76ec64f56459432c90b7cc7179ce6 |     
    mips64el |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/d39df78e9cce3699c27cb3a7d9785fd45e1c129c |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 1 
                     gpsd-3.17 | 1 
                 lcdproc-0.5.9 | 1 
                libkcapi-1.1.3 | 1 


Detail of failures
------------------

        i686 |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/9e759853dbf4ea71591de0e6a98fe82679d03e59 |     
    mips64el |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/a37780bd8af15b454abd5abb7b929455a9c44a11 | ORPH
  aarch64_be |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/a3ee29917ecefb0269d936523a2f415681db864a |     
      x86_64 |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/0463c7980f0fbcb1081572e3ad06e44f94db8491 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 6 
                   luvi-v2.7.6 | 3 
               valgrind-3.14.0 | 2 
               boa-0.94.14rc21 | 1 
                   dante-1.4.1 | 1 
      docker-containerd-v1.1.3 | 1 
                 libv4l-1.16.1 | 1 
                qt5base-5.11.2 | 1 
              qt5script-5.11.2 | 1 
runc-69663f0bd4b60df09991c0... | 1 
              traceroute-2.1.0 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/45d328a94f36426f792e013e1eaeb199e7582059 | ORPH
     aarch64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/56bbf0130db9cec10ad31b4fb93374669108881d |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/a909d5fa39545f0cad4c2a87d3a13fa0e801684a |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5c21938652f9506577ea9b618790b93425e00f25 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a3d2d3c875b61960e5af44ff99ac8c093ce798bb |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8593aed0eac5295b3340878c91b6301e18ba4d00 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e998ba05852c83a31a7b1ea791ea95123d536a1b |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4502e217ee32a5fc18cea739398f8f1ec94a2518 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e9fd8548fcb13166fccb1bc915606fa92be8810a |     
     powerpc |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/442de57cb76a7b38d71d690490faadc641036374 |     
        i686 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/893999a7c497ddd545a034a9d2834e13e6d6689a |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/b6d071f44900a132ebb275e2738a9d40f36cfe77 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/f58af91067761df3bafc6fc885239537117c1372 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/bdbd5bdd054fa53a80e1aeaa2002430ed472f6b9 |     
      x86_64 |               qt5script-5.11.2 | NOK | http://autobuild.buildroot.net/results/e8d9f8de5121d6c88779ed7f90d34f3d5a447001 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/8d6f65b53fd1f8fc2e73faaf581385994fd9de37 |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/11f0ea3ec053230f38ff0d6b137129c49dbab3ec |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/34f6e2352f1559f98c724fe5394db0035b42ddb1 | ORPH
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/dc52088222e9fbedcebffc1c39be6d2fecfffe5d | ORPH


-- 
http://autobuild.buildroot.net
