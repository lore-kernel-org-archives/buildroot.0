From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Sep 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-17
Message-ID: <20150918063014.A88E3101C74@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-17
===============================

        success : 240
       failures : 30 
       timeouts : 0  
          TOTAL : 270

Classification of failures by reason
====================================

               util-linux-2.27 | 4 
             bluez_utils-4.101 | 3 
                directfb-1.7.7 | 2 
                  connman-1.30 | 2 
                   perl-5.22.0 | 2 
             webkitgtk24-2.4.9 | 1 
                   mpd-0.19.10 | 1 
      host-gdb-arc-2015.06-gdb | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                    iostat-2.2 | 1 
               iptables-1.4.21 | 1 
                  whois-5.2.10 | 1 
                   erlang-17.5 | 1 
                     nut-2.7.2 | 1 
                   ushare-1.1a | 1 
                    php-5.6.13 | 1 
                 cdrkit-1.1.11 | 1 
                 gnupg2-2.0.29 | 1 
                busybox-1.23.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
canfestival-7740ac6fdedc23e... | 1 
                minidlna-1.1.4 | 1 

Detail of failures
===================

      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3c1a5efff21d67749490fa39fbd5ab069d8c12e5/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/9861a8f87f08032a3dad3eabdfca6ab1bc0a715e/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2d5462e2ffb6ab23325a447ceb5e756020045722/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8aa44d5121b384a2a692a6203ccea83fa008322a/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/73e433ed980b2f30e3c7b00781e255d0cc22cbba/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/f2a059fe25fe15e9eed3da65fa4aa118bb83629c/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/009da101827ac55577961169ba74ae0c8a8fa8bf/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/8f4527d126f3cf0121f071efcd52a7d65b8d5935/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/34ef20c624eabbe0621bc4a54c4478432fd2c72b/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/d05af1e9dee49ada131e4b36b7f9e96340e3792f/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/bfcb432142ec25ff8dce58655dded150af7c2562/
      x86_64 |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/9f0c1f98b88502e624357a35b341faddccdc1f7f/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/4f15779ee18d7ac152c206186e312da380df4d7f/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/bbc930618a92b799f89e11635e4008046639537b/
      x86_64 |                     iostat-2.2 | NOK | http://autobuild.buildroot.net/results/fe3907858f90f766f1949be631427dbb079e08ed/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/6ca22d8a1d2b1423164e05fe81b8d662977893fb/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/6ab78da9056c0fdd03724e0028afc153064f3145/
         arc |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/e5e3b8c4a9fd1e164a1f991e5cd1a5d47f55cb8b/
       sparc |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/df760a17ab27d8955caeedd5cdeaebb1c862f510/
    mips64el |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/5a4cea9f8de76aca4bc6fc8934b9dd1eec0517e4/
      mipsel |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/e0f6ce111fe1dad062abcf851257b3d19c5ee216/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/65dfc9139fb6e34a91842545c76d90a6e53bccda/
         arm |                     php-5.6.13 | NOK | http://autobuild.buildroot.net/results/7ec28c23b3f12e5b7e2376c7913329d2a38dd232/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/07c3f820f3edbd3a8aae376f5cc11ff29557ab0f/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/7d8f38d04d3fc34c9c341ce5bf9f18122a1c067a/
      x86_64 |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/00a7f625549c0e06440a0334f144f9afc9fe646d/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/c295eaa9e137b55056deac017cdf596fa5679ab3/
         arc |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/93d6e922c16573762332348eea66dce37f83bc4b/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/0323d549cf71edab8fa1b5a9f012ee6e540348a2/
        bfin |                   whois-5.2.10 | NOK | http://autobuild.buildroot.net/results/0741723fc260be172a7022cb40b32941c9b2d8ba/


-- 
http://autobuild.buildroot.net
