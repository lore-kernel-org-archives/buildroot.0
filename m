From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Nov 2018 08:00:26 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-02
Message-ID: <20181103070026.079B520736@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  10 |   4 |   0 |  14 |
   2018.08.x |  16 |   2 |   0 |  18 |
      master | 158 |  18 |   0 | 176 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 1 
                     gpsd-3.17 | 1 
                p11-kit-0.23.2 | 1 
       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

         arc |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/e2f080fdf2913e93e2649719b6e993c084c3edfa |     
       nios2 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/00e419bf4f01a9361d8f45c86d9ad8657e454ba2 | ORPH
        m68k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/91cc3718a0c72585047711b54439213cd4b06664 | ORPH
         sh4 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/ed39ef0b8f4957e2e2ac2c2732e0b31e70f2d0ed |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 1 
                p11-kit-0.23.2 | 1 


Detail of failures
------------------

        i586 |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/9e725605681f38eba4e6e3fa9685d1126fed5664 |     
      x86_64 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/d12d0dd43d69b058ff5fc6f7ae5c2080421646ec | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   luvi-v2.7.6 | 5 
                  libffi-3.2.1 | 2 
                 libv4l-1.16.1 | 2 
               boa-0.94.14rc21 | 1 
      docker-containerd-v1.1.3 | 1 
                flannel-v0.5.5 | 1 
           host-protobuf-3.6.0 | 1 
mmc-utils-37c86e60c0442fef5... | 1 
                   mpd-0.20.21 | 1 
                    mpv-0.27.2 | 1 
                qt5base-5.11.2 | 1 
                     vlc-3.0.4 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/c936d913e93289450701c565987d538c4229bed1 | ORPH
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/070bccb2145ae977ba972906f4543b5ee01ee81e |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/84ca481ba83bc99564460c1fb800645f7a85a533 |     
         arm |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/5260ac22b8d223ec4236466b2a4770e44d60f373 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/537a10a28bf5361c3493652c5d92d279ec4b8fbe |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4c7a0cbae990bb601ed2bbf9c8c535990a9cd0e6 |     
      mipsel |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/c18fb7f1ac81496db9c3a4e91ea028a26ca600b0 |     
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/d22c0939eed4bc949f7eaeae7595d01ec45cc2cd |     
        i686 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/99d197f458c1b9da8c283f45be560aba45640ae5 |     
        i686 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/4d6a0c78d796ff54482dc923e117b87b449f1c74 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/8f017d1054cb6f4fd7664f577ba1fcd282f5f7b4 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/38b65824239a638ff4c99ce1a2434006bc60a05c |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/259cf5544bb0923b511d6be0af428f4e3054a102 |     
     aarch64 | mmc-utils-37c86e60c0442fef5... | NOK | http://autobuild.buildroot.net/results/404bfbd095a7b80273391ea36ea81ba496164b80 |     
        i586 |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/b0a0c20ad1705e9fa7ba4a12eb9c182e8077ab0c |     
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/0be6e359d46a8a701006305c32b514687854b035 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/9f5c046da1b6be3bd3b1b3a0081c847aea4deb58 |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/b9baa727efa308b61cf512fd07954097b1e554ec |     


-- 
http://autobuild.buildroot.net
