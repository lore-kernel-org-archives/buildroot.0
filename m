From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 08:28:58 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-11
Message-ID: <20170412062858.01D0F207E4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-11
================================

      successes : 203
       failures : 33 
       timeouts : 0  
          TOTAL : 236

Classification of failures by reason
====================================

                libselinux-2.6 | 6 
                busybox-1.26.2 | 4 
                  arp-scan-1.9 | 3 
                 binutils-2.27 | 2 
                  ntp-4.2.8p10 | 2 
             rabbitmq-c-v0.8.0 | 2 
                  samba4-4.5.7 | 2 
           uboot-tools-2017.03 | 2 
             bluez5_utils-5.44 | 1 
                 lensfun-0.3.2 | 1 
                libmpeg2-0.5.1 | 1 
                 mplayer-1.3.0 | 1 
                poppler-0.53.0 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.6.2 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
                  weston-2.0.0 | 1 
                 xenomai-3.0.3 | 1 


Detail of failures
===================

         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/c0ae9132ea078124858a4ae6205d9c105262dc5a |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/2525be51aa458e96c79365d6bc4191f28e8b6665 |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/e3728c55dedce3600131249cdfba06072971de67 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/ddd9f18b9ea0d014e34c411da5ea52e4e0968670 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/3b1e35830d5586a5dba98775a9831d6423390dba | ORPH
         arm |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/5fd9b975fa462876b7457cd06dde81f55e3ee91a |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/ad6c1df3a37ae0f4e9377ad6af4d16aac8aef555 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/472a5eca5c4e840cdbf63d9926b58a53da4c662f | ORPH
    mips64el |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/6795984656895cde9c4b45436ce436bd35db794b | ORPH
      mipsel |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/caf0fb573e00f99f8e042bc4d0cee09d52cd7bdf | ORPH
         arc |                  lensfun-0.3.2 | NOK | http://autobuild.buildroot.net/results/5a631ef52903a4053c4bfe6a1b273a20bbc5a65a |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/6345e5f9dfa271baabe00bf27073b22139640cdf | ORPH
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/43af81bff94304061e54eec5bde163a09cf01a99 |     
        i686 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/59483f11e46b9590acde143c5d3a51648df58b29 |     
     powerpc |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/4a4c7d3bf3433188bc0d273dace60cab44ea66d9 |     
        sh4a |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/bb9dd41debdde15ef040649408bdfbe5460cfab9 |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/db1e6f3054092fc5576ccab8e04a3b9d74ca9a8c |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/354d5449d47140af6a9d4c7fdd6feff8bb002a10 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1a24381e252a8e36224817452e08c99c0737f337 |     
    mips64el |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/c9a1e27bdc5be6283f7d4b320588472df9e31fc7 | ORPH
     aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/8b6a819f26773086aad201ab6387ec85321cf534 | ORPH
    mips64el |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/4a26ce25377aaa9ee431937d02c9c69c3a5683ef |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8092b18e83e2239f3b722bd5d431f91c32b500a4 | ORPH
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/95ebd131b5fdeec9a05cccf6b8494ab56b808766 |     
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a4c30983032a4d9659e2cde736185371228db2b9 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2f27e327f0d4e8e0fdd47f2d420aa9cbda278537 |     
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/d11b620ef95bdca23a10be0b546b3a195839f23a |     
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/23d57342bc76c3b69b645de26ef2d18578b49c61 |     
     aarch64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/8a5c74875c935e3cd21fa6a5be4251d3f555d5d2 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/28d7c8cd815ef6d5c85f04a26f21255b834766d1 | ORPH
         arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/c82e14c9e50c0da9619be4ed321f5302456c1543 |     
        i686 |                   weston-2.0.0 | NOK | http://autobuild.buildroot.net/results/0d1da7fa32b2f659816c51a05de96f26fef163e4 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/606cd1f51ff6f8321a28c26f3606d61f45a00eea |     

-- 
http://autobuild.buildroot.net
