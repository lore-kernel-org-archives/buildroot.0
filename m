From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 08:00:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-14
Message-ID: <20180815060010.27C5320802@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   0 |   0 |  19 |
   2018.05.x |  18 |   0 |   0 |  18 |
      master | 166 |  17 |   2 | 185 |
        next |  55 |   8 |   0 |  63 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 5 
               azure-iot-sdk-c | 2 
          openpowerlink-V2.7.0 | 2 
               aircrack-ng-1.3 | 1 
     docker-engine-v17.05.0-ce | 1 
         host-cryptsetup-2.0.3 | 1 
             host-gauche-0.9.5 | 1 
           host-libselinux-2.7 | 1 
                  mender-1.4.0 | 1 
                    owfs-3.2p1 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.11.1 | 1 
            qt5serialbus-5.6.3 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/e600284c24a95ab03095937ebf0a26f28984fe61 |     
     sparc64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/1607810685b3dc1a3e83af406d613739bc4ea258 |     
         arc |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/d3ff80b24381363b036daa52da16cd4d7b0c0d5c |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/067f474cd8df213fd6783696ea3027bfb472bf5d |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9abbca95daf4880eca3d41d986b86b3e7a44e5ab |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/218973e7c4acace9145ba63d63a7a90b248b94c7 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d76d0197dbbd7952571c653c4b74b507b875a2d6 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/f6eaa7e05ef6d80b09e401ee201351c2de324a3c |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/b07f8233228fa07ee82c7f25d9a01b44dd9142cb |     
         arm |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/6c6092d633400498ee5b8090733a949a9632e473 |     
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/51cbef93844236d205f2649932564b17a7a61b95 |     
        or1k |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/ff3011da3b519eb8978d460bfbd02d1cd62254ba |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/85cc881cd29bb2148488d42b33707c4111ab2bc1 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/39c4f57d6a0d51ed91951c791449ea51ee75a12c |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/6e68118dda9eeed4701a876a4bb0b671e7359ac8 |     
         arm |                     owfs-3.2p1 | NOK | http://autobuild.buildroot.net/results/4f3dfb3cfee1678e6d5da03d09e236d0f4b55b9f |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/9bcec294f911a99a0f3434b8cab405313edf8dca |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/13f376128ace28c1c44abf5d66dfe59575a14adc |     
         arc |             qt5serialbus-5.6.3 | NOK | http://autobuild.buildroot.net/results/7c10e940dedca524f309e2c3e80935bb229f69cc |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 2 
               domoticz-4.9700 | 1 
            micropython-v1.9.4 | 1 
                    ncmpc-0.30 | 1 
              python-pyqt5-5.7 | 1 
                  samba4-4.8.3 | 1 
           uboot-tools-2018.07 | 1 


Detail of failures
------------------

       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0c49d0edb74f5a5cf557ff3140f89f0625953dd7 |     
     aarch64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5a7752e02ac9fb73ce06be0b9180d6631b1ae09d |     
     powerpc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/fa63b3580ab68e97da5d1dcd1db4b041d536e768 |     
      xtensa |             micropython-v1.9.4 | NOK | http://autobuild.buildroot.net/results/407a862e7ba12f079b1fc3f4f769807113aff7d2 |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/405c2a677def527b02ad09b19a94ec7cab2770f8 |     
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/e4f4d787168de8f00c2f98195b7d2160c8b4eb1c |     
      xtensa |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/249c1ffdf58d048fa2f76782f9d22fb977a007ec |     
microblazeel |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/ac41e963a806b8d538c7752646a1c98b427a92ef |     


-- 
http://autobuild.buildroot.net
