From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-09
Message-ID: <20180610060020.41274207AD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  33 |   3 |   0 |  36 |
   2018.05.x |  29 |   0 |   0 |  29 |
      master | 269 |  21 |   0 | 290 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 1 
                    mpv-0.27.2 | 1 
                    quota-4.01 | 1 


Detail of failures
------------------

         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/40c2a6329a14167de0480795ff0cb44d7dff2af1 | ORPH
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/99da55a946380f034ad8441e34fa4b9abd4921f0 |     
         arc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/978ce51f631f67fff15ea813d8ce9d2bd0175618 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            host-flatcc-v0.5.1 | 6 
                 opencv3-3.3.0 | 3 
                qt5base-5.10.1 | 2 
               aircrack-ng-1.2 | 1 
                libmpeg2-0.5.1 | 1 
                  mender-1.4.0 | 1 
                 mesa3d-18.1.1 | 1 
              mjpegtools-2.1.0 | 1 
               mono-5.12.0.226 | 1 
                protobuf-3.5.1 | 1 
               qt5webkit-5.9.1 | 1 
                  samba4-4.8.1 | 1 
       shadowsocks-libev-3.2.0 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/ace1e0218acafd641c3d4bc6cc2e3264fd159900 |     
microblazeel |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/2fb09bf9035c027aa58e4988f6abc2ec456c70ed |     
    mips64el |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/cb6d0361ccfb1ac1f15f0ceff6ff251eb781c9b4 |     
         arm |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/b0fad59043cbcc2ce2d58c54577d10219642958c |     
      mipsel |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/cc00979da3d00187e93ef92fdaa0e743f39e4c30 |     
 powerpc64le |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/1636ec6ddad92add95f42451d941156451c6d936 |     
       sparc |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/66d07002c20b77507e60c236fbb9be78e0216136 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/b4bfddceeb0fe0020de5419548daad7ee2058427 | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/27ffa84f09270d9108d687cc6edf520350867c5c |     
      x86_64 |                  mesa3d-18.1.1 | NOK | http://autobuild.buildroot.net/results/ccd07150e459b2b2caba6e561ecc6eae60c83ef5 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/8a1c30a9c08f76a09c1d6130ec088d2c82dc55dd |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/33f7056a2da883d3b1e1d6a4cb776695fd8c1a31 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/9416c5fb7c16ba2c6fcb930a3a6347f6d40f1c45 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/f8e70791485653e6c433e271bcb2812212a9e372 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/6f48aa9821e4fa5184ed583916013caadc0704c2 |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/6c05d9920422ffacb0819b4046c7ba3fb4dfc02a |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/c7eb81fd70b1dcc35985af69e2196caa8f07fac9 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/95f22d805f16864e8e922ff3a14de98136a8351c |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/00c64e227dd3fc35a606d462fc915632ccd65a65 |     
      mipsel |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/7a5a2faed4ee50b0a7bb2cbe0af4b4ef42306c3c |     
       sparc |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/552b09ffe951c429422529c895f4c3ec723cf5ab |     


-- 
http://autobuild.buildroot.net
