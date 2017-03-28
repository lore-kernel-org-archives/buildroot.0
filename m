From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 08:28:59 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-27
Message-ID: <20170328062859.9F1EC207EA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-27
================================

      successes : 119
       failures : 29 
       timeouts : 0  
          TOTAL : 148

Classification of failures by reason
====================================

                 xenomai-3.0.3 | 9 
           uboot-tools-2017.03 | 4 
               sdl_sound-1.0.3 | 3 
                poppler-0.53.0 | 2 
             rabbitmq-c-v0.8.0 | 2 
            xenomai-legal-info | 2 
                  boost-1.63.0 | 1 
                libmpeg2-0.5.1 | 1 
                 mplayer-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                rsyslog-8.22.0 | 1 
          shairport-sync-3.0.1 | 1 
uhttpd-a8bf9c00842224edb394... | 1 


Detail of failures
===================

         sh4 |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/c4671f2253298e40ab050ae6a4cf363a0b57103f |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/28360d5b38c4531f3dc26e1e3ebc726bc2880af2 | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/33f09d8e868282ca6a72abe7f473e97a61dfb92a |     
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/255bf5a79ea27572143564fde0442e065b1e6797 | ORPH
       nios2 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/ea43a91f95ed1564d79605bb2bb93cf55cc6cee5 |     
    mips64el |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/91392414be096dda08aadf05c84db7f2d5f4b7d8 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f9408ccbf7406d3a8ba7292aeb8aca4913c352f7 |     
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/0a0c6a82a41f4e2994646a3b81c14618fbcb7667 |     
         arc |                 rsyslog-8.22.0 | NOK | http://autobuild.buildroot.net/results/6c99b54bc4411c6898f4bc82050766f3ac987362 | ORPH
      mipsel |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/1dbcc5d2a0da457fffb7c5b02eb0c4703319bb0b | ORPH
     aarch64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/851eb24b1133a2a373f4bfe5cfc921eb5076d8fe | ORPH
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/a7062a316f1474e96b38da2ad77a76f092de7503 | ORPH
         arm |           shairport-sync-3.0.1 | NOK | http://autobuild.buildroot.net/results/bef5fb328e6688107496cb213d8aeeca527abf03 |     
     powerpc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/5bc02a4b841945aa7494a0c6375925ab105c217c | ORPH
        i586 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/5b815817c8ef1ef6b35bc17d4d38fdf970e3a79d | ORPH
      mipsel |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/c63785a2c3d1e44f7da3b9e6b132212825c63086 | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/3fe51ff1a1b91491b12e74ccfd21a96adf08e643 | ORPH
        i686 | uhttpd-a8bf9c00842224edb394... | NOK | http://autobuild.buildroot.net/results/56e0727ccd1255b05e03d1b79dc238bd88701230 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/c39a7fab1490351e3bd9e4dcd3ca16d04561f2f8 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/b60fdb6019b152d41da4e1722add9d7362d9efed |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/ffe660db34c2faab2bf7dc852644627df809f27b |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/4ced9f8859c4828eb449370661db107df74aba99 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/de7ffec69609a22b66604d3b39678fa6a6f51dae |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/7be5e799ced41cdb45e86b705654723cf12d442b |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/f2ee384f9f2a4e006f560ed291dfebc93ecd9c71 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/759a762742a737e6a8f4e47cac4184e0a4a75126 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/cb2970eea8124f75f0c21f9bada2159e522cb06e |     
        i686 |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/2673c73d89ec05ce9c190e5d016b3425d194f432 |     
         arm |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/cb48bc531b3dbfc30dd47d9b8aa709aed4a403a3 |     

-- 
http://autobuild.buildroot.net
