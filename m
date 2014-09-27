From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Sep 2014 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-26
Message-ID: <20140927063011.A9A881007B9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-26
===============================

        success : 188
       failures : 24 
       timeouts : 4  
          TOTAL : 216

Classification of failures by reason
====================================

               valgrind-3.10.0 | 4 
                 gnuplot-4.6.6 | 3 
                busybox-1.22.1 | 2 
                 libssh2-1.4.3 | 2 
                 python3-3.4.1 | 1 
                    neard-0.14 | 1 
              uemacs-4.0.15-lt | 1 
                 webkit-1.11.5 | 1 
           libmemcached-1.0.18 | 1 
                elfutils-0.155 | 1 
            host-heimdal-1.5.3 | 1 
freerdp-440916eae2e07463912... | 1 
                 gnupg2-2.0.26 | 1 
            host-wayland-1.6.0 | 1 
               mpdecimal-2.4.0 | 1 
                minidlna-1.1.4 | 1 
Resolving www.spice-space.o... | 1 
                   czmq-v2.2.0 | 1 
                libcurl-7.38.0 | 1 
checking for prototype stru... | 1 
                host-gdb-7.7.1 | 1 

Detail of failures
===================

         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/f73879b3c72fdcde43d92a09a18acf196de0879d/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/e5656946005919777fdef02cf9e532cbb2f30170/
    mips64el | checking for prototype stru... | TIM | http://autobuild.buildroot.net/results/0154af52e95f4fa6590b4dabc78ecea30ea2bc3d/
         arm |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/ad205ea4fa09ffd6b1204ea3c62240e8f35c8131/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/1f5c2c40efebd2d6b23d1f1733bbf08f2b15e40c/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/0bb4c7ed9cd19906489a14b5e8ab5def8a479e45/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/34c26df74364a418ae035aa3a49525ffdd641c4d/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/1690585cf0178b3b185e8157d97c058116469e86/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/57a0792801fbda8102ef5df9e0111407d5ce32e7/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/81e9cd8f122284c9f5e05177dfd79b71e994ec9c/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/858516d0be0eee5b9531b547e844645a6a91588c/
     powerpc |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/2a14533d1f09436e8abac34e5eedbb614822fbbb/
         arm |             host-wayland-1.6.0 | TIM | http://autobuild.buildroot.net/results/0a601c4f72bf42ded972db728b37b2468fc54405/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/fc12e88fb789e2b68d427c37f39789954309b05d/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/be99b3b82898b3427ba527a6b7b4609fe4eeab17/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/cc11a7e75c65d7c6fa87f962b78379e06f6f0aaa/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/40a5350c9b581d8ff637fc9282d4c93e20c5a4b9/
       nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/08f92f9bdf1881744a2b03c748eb72ae9c1904dd/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/efb24e404bd4509d99a6327c2142e1525c64d1fc/
     powerpc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/8aad654ce2d48e8697ba850710f2be0a45f5a430/
      mipsel |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/55883700741916d19a359fde5c3cbc517f06528b/
     powerpc | Resolving www.spice-space.o... | TIM | http://autobuild.buildroot.net/results/625e3291bbe0944ecbba912ebd2d86801ff9afbb/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/1bce550212d29c766038e362d9aa06baf617b83b/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/b8273342262cc773db9e8d13e58a48891c918e71/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/6ff8f14ae98e47c2e141740de80b075aca3cd78d/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/3d8f2a0ed6e8acc34eac5e936801ede807c81cc8/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/4756e37b96a75fb656156d071207784df69353be/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/914253c27cb5b0043c3715d026ff9c22a94354f0/


-- 
http://autobuild.buildroot.net
