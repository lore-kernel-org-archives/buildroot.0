From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-25
Message-ID: <20141026073015.6AB71100CE8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-25
===============================

        success : 203
       failures : 43 
       timeouts : 3  
          TOTAL : 249

Classification of failures by reason
====================================

                pulseaudio-5.0 | 6 
trinity-d68d1f7b9ab6c65a379... | 3 
                 webkit-1.11.5 | 3 
               alsa-lib-1.0.28 | 2 
          linux-headers-3.17.1 | 2 
                coreutils-8.23 | 2 
                 libhid-0.2.16 | 2 
                 pixman-0.32.6 | 1 
           heirloom-mailx-12.5 | 1 
  toolchain-external-undefined | 1 
              libsvgtiny-12121 | 1 
          shairport-sync-2.1.5 | 1 
make: *** wait: No child pr... | 1 
                 libraw-0.13.4 | 1 
                      qt-4.8.6 | 1 
                elfutils-0.155 | 1 
                libnspr-4.10.7 | 1 
                       unknown | 1 
                   slang-2.3.0 | 1 
                yaml-cpp-0.5.1 | 1 
                gptfdisk-0.8.6 | 1 
                 schifra-0.0.1 | 1 
                 rt-tests-0.83 | 1 
             e2fsprogs-1.42.12 | 1 
               polarssl-1.2.11 | 1 
           libmemcached-1.0.18 | 1 
                  prboom-2.5.0 | 1 
          libmicrohttpd-0.9.38 | 1 
                 opencv-2.4.10 | 1 
    xserver_xorg-server-1.16.1 | 1 
                  thrift-0.9.1 | 1 
            host-heimdal-1.5.3 | 1 
                    fltk-1.3.2 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/618d1773497d31d3616e72e95bd1684120bf4fb1/
      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/83823af39158ae3593393d71b5efb0696abd0e09/
      xtensa |                 coreutils-8.23 | NOK | http://autobuild.buildroot.net/results/44a37e3b3c6fdbb401268718a6fae7cfbe28e5c6/
         sh4 |                 coreutils-8.23 | NOK | http://autobuild.buildroot.net/results/c768e2af7c126183d8650fc9db22d13a916d5e9f/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/29483a378a8be5c387f34e56ec8d8949b049384b/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/35d4c201c4877ca5801e4233eedcad7eb5c1befe/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9667bd312cf35cd77965f4d73aa58c704785e0c4/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/4aacfdcafb58ee6833e0025c6e82fa49462ac124/
        i486 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/dd9a555e84db0c42679c5938b9bb60bc29a5c7d4/
     powerpc |             host-heimdal-1.5.3 | NOK | http://autobuild.buildroot.net/results/2b07ada75f8cc9b6dcb5e59ddb96132bd82f5407/
        i686 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/92a11c8cf3517f50fdd6ca8751df7df7700f448b/
         arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/5bde41d523b5d61fb6114c973bc2ee34fc12d456/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9da2c3a2289da947b8e0941364520a002be61f53/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/f14281e93f8ebf70e06b9b2a4ab064f7fe086d61/
         arm |                 libnspr-4.10.7 | NOK | http://autobuild.buildroot.net/results/cab19721c43b3256dd51ae511016bc9ea440512a/
     powerpc |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/2c8c9edb43d1a6736ed7d87fbc674556e13949e3/
       nios2 |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/3ed69838ca9aa07a66c7c4eaf59c889ae7cd5bc1/
         arm |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/735772bd7216cdecb2c0e4c46986c972d2c0244c/
         arm |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/579a40aa52100cc524d3961ab58a9e41dfa4aeea/
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/f4f5a132ed69ce9919f00bba526db972a0e454a2/
        mips |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/b0996267197a9016d29d6070804ebc0cb7853548/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/1b32a12915dff243c63540209068849210b4d159/
         arm |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/b230b8de71653636ceff5d6e9151ae1e2f9fb8e7/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/07fd9c51cfe7a20fbb3645662ff6b7108a440671/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/9d9ddea26a5193367a80eede1be1122cec5cd939/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/e280bca6d77d37e5180e1cd437ee59b88458cb7f/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/540b499d5de34768a6cab915172264b744ca0c3c/
     powerpc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/ccf31740a0e730f2626db9051931b1e0703c770d/
    mips64el |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/3fbbdbf39e29319b349b2cf155397a121f24bf28/
     powerpc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/68638999b7ad13a52fab3188e393eef63b690a2b/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/d488d09bb22f4e7b80b4c2c6ac69d058b3ffaa39/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/bf17238724a28abae81abcaf5ca341e3c1ca394a/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/1bc887c7829a4f721a870049294341c089debcd2/
     powerpc |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/b74c764e9527ce1cce8825682285824a519ac2cf/
         arm |                    slang-2.3.0 | TIM | http://autobuild.buildroot.net/results/54b0bfee647b21d2680bfc1864fb64dd02c550bf/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/5b4fba4c2baa5de2dc2b59e069f480d535305c88/
        i486 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a228b86fd44c10185f083b3344e9e6b6b9d9d85c/
        sh4a | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/fa03bad7961d4023594d108e114dfd298116f559/
         arc | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/ce4aaf85757718dcec4ff7ab9e2e3a7fa853ee42/
        sh4a | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/9bb068f9d8b86e362280b615ad5ad2580768f7a2/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/1e680cce90e67863966e16ce144e6e9c5ef04a3a/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/f5e78ea7fd117644b0dff39a86ad1f4d5bc0a8be/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6cb3b99a7f30db5d726168bd5dd9ab89272131de/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/439e6f751255114365b36a9cb45a68ae8d8784d3/
        bfin |     xserver_xorg-server-1.16.1 | NOK | http://autobuild.buildroot.net/results/84b8f19221a5c841de3016959c99b92c96c57e81/
         arc |                 yaml-cpp-0.5.1 | NOK | http://autobuild.buildroot.net/results/826e6090f1da052309015155098955bd9aedbd8f/


-- 
http://autobuild.buildroot.net
