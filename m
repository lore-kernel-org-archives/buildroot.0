From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Oct 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-08
Message-ID: <20141009063013.9E84010154F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-08
===============================

        success : 148
       failures : 31 
       timeouts : 6  
          TOTAL : 185

Classification of failures by reason
====================================

                   ulogd-2.0.4 | 3 
     x264-20140930-2245-stable | 3 
                       kmod-18 | 2 
                  botan-1.10.8 | 2 
               alsa-lib-1.0.28 | 2 
libshairplay-64d59e3087f829... | 2 
                   nginx-1.6.2 | 2 
                 webkit-1.11.5 | 2 
                 opencv-2.4.10 | 2 
                 pixman-0.32.6 | 1 
               valgrind-3.10.0 | 1 
                  nftables-0.3 | 1 
               polarssl-1.2.11 | 1 
            gst-ffmpeg-0.10.13 | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
                      qt-4.8.6 | 1 
           libmemcached-1.0.18 | 1 
make: *** wait: No child pr... | 1 
make: *** [target-finalize]... | 1 
                       unknown | 1 
              host-cmake-3.0.2 | 1 
                upmpdcli-0.8.1 | 1 
                     vlc-2.1.5 | 1 
                 cdrkit-1.1.11 | 1 
freerdp-440916eae2e07463912... | 1 
              wireshark-1.12.1 | 1 

Detail of failures
===================

        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/26c87d9469ec8e3475506c8097dd396f18a27764/
        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/3a88ba1553a150768af3f71be7a5abf56cd4474a/
         arm |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/62bd0a7ea2481eefc22f33a71f924ca46b53b2c3/
      xtensa |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/69fdecb06a03e6a95adfab70adf8ebf45971f0da/
        bfin |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/a2ad841630b411df3fc26461a868fe796a8b67ff/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/7dfe5be77c9e0565624766ce765ce1cda471c4c8/
        mips | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/cd0f3623e31e317f5238264c987b2c55f65a5048/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/2dc4c06bbf9ab5b04cfcf59348497d59ae0963b1/
         sh4 |               host-cmake-3.0.2 | TIM | http://autobuild.buildroot.net/results/5dc1672736644139cb7c2fcb2ac137af8934b489/
      xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/558b8d95941f2cac0e5a07e3c0ce56cadcd7e5c7/
     powerpc |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/7a70b179f17070d0a0883f71c60030dd7d8a9102/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/470acd78ad6143922918aac3daf450a565b4d6f6/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/8854148b8d25a4df0c49b053ceaa11a128558cf4/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/ddc73846ee96347cf51003b8ee7a18f7fa0e13c4/
        i686 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/a2d65e50475668f65fcf224708fa44913947507c/
         arm | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/7562f512b3c38680e8b03e48c5eba12d761735a3/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/1bd1c8887db6c69edc266a0425d1ff91f99d04b3/
     aarch64 |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/23cc1db792749b5c818474da59892b18c5c52de4/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/666d780bf61e10c9f89f765bb04ddc1afc11d0d1/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/ffc1e749e11dad8788d5c723092cf9017c9379f9/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/22987f41e8f9ca24528f3e1077531f8c86cad481/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/2f2ad417ba68802e18c06ae89a319ca245dcd39e/
         arm |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/82d10f8937c1be09029b7c69037e754adb3c3e68/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/b5aa2059dc8a23b885049204a6a5429dfb822e87/
      xtensa |                    ulogd-2.0.4 | NOK | http://autobuild.buildroot.net/results/f1e85c3b49c00d782f5b9cd7d7f1c7f2a1c70b74/
     powerpc |                    ulogd-2.0.4 | NOK | http://autobuild.buildroot.net/results/9ca43764c7363f9a00b8a0c7df20a492c00088b5/
     aarch64 |                    ulogd-2.0.4 | NOK | http://autobuild.buildroot.net/results/6990f312372e4770852616ab11b21da1c458d1f4/
      x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/eccee448ff401eb9bde6586a25f761edac29e516/
       nios2 |                 upmpdcli-0.8.1 | NOK | http://autobuild.buildroot.net/results/ff9f1638b9d187c8a0e14e2447b460e8be591cea/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/225b3619b6400437bd55e769253899f9795b1cf8/
    mips64el |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/06174eaeb7f2b8a591395e607912ad72623b79e3/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/00d8313469a2f74299124d399b5b11c4849bd458/
        mips |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/09ed6a94985b43dfc06badaf66355e55df805251/
    mips64el |               wireshark-1.12.1 | TIM | http://autobuild.buildroot.net/results/274cdf171e38b363961087b70088fbefcd4a557d/
        i686 |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/1daa096e42dfd0a84bae9cc4e9b1d5ed9280af3c/
      x86_64 |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/405703d2b0818ae1c26981bd59393b7a54749481/
        i686 |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/d37856be02bdff5711fc5d6fb1f3d4614fe5fed3/


-- 
http://autobuild.buildroot.net
