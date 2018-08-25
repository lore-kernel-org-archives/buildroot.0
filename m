From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 08:00:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-24
Message-ID: <20180825060023.82F3020729@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   0 |   0 |  20 |
   2018.05.x |   8 |   3 |   0 |  11 |
      master | 169 |   8 |   1 | 178 |
        next |  38 |  31 |   0 |  69 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.7 | 1 
            lua-flu-20150331-1 | 1 
                qt5base-5.10.1 | 1 


Detail of failures
------------------

         arc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/959e73b38fe1c8d8f7952497ff17131edc7c7ee0 |     
microblazeel |             lua-flu-20150331-1 | NOK | http://autobuild.buildroot.net/results/9bfbc23b918d9301b94d7055401b3dcbf618c17b |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/e738722bc7575255e877bf82bf30dd828a22dfb1 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 3 
                    brltty-5.5 | 1 
             host-gauche-0.9.5 | 1 
                libmpeg2-0.5.1 | 1 
                linux-firmware | 1 
            micropython-v1.9.3 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

       nios2 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/4297f73a3bebdfe287f0b0a8fb02acdcb3481325 |     
 powerpc64le |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/c2a887642ce173fb6fd84297af258eb4f73719e7 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/760d845a4fcd75c1b27067c1c73317a2352bd935 | ORPH
         arm |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/061fc0b5c88682141227ce8bb9259ead68578be0 |     
microblazeel |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/569ff4454895654945e622189c7910488fa6f25e |     
      x86_64 |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/cfa738d63759a83c680d0184fb318af8001cead1 | ORPH
      mipsel |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/9abe27583b4d6770aa370ab1cb71e80ea7696c33 | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/4d263a0a3493691f44fadedc9f7a9ee5830fc80f | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cbed85b7ffb94cdc3602c53892d1a0ae0b5cf1ec | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                rtorrent-0.9.6 | 5 
            python-pyyaml-3.12 | 4 
                    ncmpc-0.30 | 3 
             python-lxml-4.0.0 | 3 
python-libconfig-b271c3d9da... | 2 
           python-pyzmq-16.0.2 | 2 
             util-linux-2.32.1 | 2 
                blktrace-1.1.0 | 1 
              glibc-glibc-2.28 | 1 
             host-guile-2.0.14 | 1 
                  libssh-0.8.1 | 1 
 Makefile:708: target-finalize | 1 
              mjpegtools-2.1.0 | 1 
           python-numpy-1.13.3 | 1 
              python-pyqt5-5.7 | 1 
               target-finalize | 1 
          usb_modeswitch-2.5.2 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9f7059dfc25cce48b44d72cfc2b5984a6740a0d0 | ORPH
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/3fa3d4e0ea96720e3cf225b6ae6809fa6283cc66 | ORPH
    mips64el |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/aaffe7e8d78dd1d9055aae832fdabaa858902c01 | ORPH
         arm |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/d5c08c585aeccb024742cfe2527409a84cfccc73 |     
    mips64el |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/e83c7a28f74a8a3b096fa28b6d7cb9f80efa1df0 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/0ecd210fcb09dc0bc44c099fb379282dbcfc6a8d |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/27dce85fcd4ac64a698d460da2b104e3ad2253c7 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/06edd7c3583bf83b1306c576194aa5c17a793e6e |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/8e4c65c769eb925e2b6df1fda0e7afe18fb749f9 |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/32f7e38895e7c491916bd69ed91bbe016e8b3ff6 |     
        i686 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/2c654c4367f33afcee81ad10ef4cf24b94076804 |     
         arc |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/01860a56e282c82d521abec75fe5eadf6e7c3066 |     
      x86_64 |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/b4bbe6a675c586a33632fc934cc88f5f1f108450 |     
      x86_64 |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/0f243de8fb6d4dfead81f0c4e3dfd60411009213 |     
      x86_64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/aab49866e54bea16509a582b72f311c7c6ebe738 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/dc5be47568edcf7b7cd1884bfacc04a8c12e11d6 |     
     aarch64 |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/5e5db2719945a20003417ee9e6fe0ca63b3759f7 |     
      x86_64 |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/c38b0277721d2ffe695d84ffa294ea32afbcaeb7 |     
     powerpc |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/b9ad26e906a67fda211a09a6eb998105525b3e5e |     
    mips64el |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/0d5084ab5ea78f5e735bc4669581bae1df072171 |     
      xtensa |            python-pyzmq-16.0.2 | NOK | http://autobuild.buildroot.net/results/0fa4b8c8212fa0a9a92075cf95e546fe2fdd80af |     
         arm |            python-pyzmq-16.0.2 | NOK | http://autobuild.buildroot.net/results/8c6c5b458e73ce0ebcea6c5804afdeecb4871cdc |     
      x86_64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/75e59ac0fed9b0ad201fd90dcd71dba9dd2d4ddd | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/9ae51572d782adbb856f5fe7bca0f35d18501976 | ORPH
        mips |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/4df6c7cb40de8433a98ad6be119d6f24b069f2a9 | ORPH
     aarch64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/364ef37647e2ecb52928d88c286d861411fae3e2 | ORPH
      xtensa |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/1e5f798b07d859f8e4b921e128f748bbfdc6ee03 | ORPH
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/ea7bbcd35babf9025f21f012616ea448924c1eb3 |     
    mips64el |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/a3c9fbe699c17fbba5ddce43f0aedab58d44c0d0 | ORPH
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/36743be53b40180c7b9d92735a1af3a31e2f1b01 |     
        m68k |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/8556f402a699256a2074c215c295d32e5cf8c7ec |     


-- 
http://autobuild.buildroot.net
