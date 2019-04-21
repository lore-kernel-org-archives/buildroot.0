From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 06:00:28 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-20
Message-ID: <20190421060033.0F674870F6@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  13 |   0 |   0 |  13 |
      master | 102 |  44 |   4 | 150 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 12
   libtorrent-rasterbar-1.1.11 | 10
    libtorrent-rasterbar-1.2.0 | 4 
               domoticz-4.9700 | 2 
                  libnspr-4.20 | 2 
minicom-19ab49422f3431102c3... | 2 
                       netsurf | 2 
                  davfs2-1.5.4 | 1 
              ghostscript-9.27 | 1 
libcamera-d5ca33f6c7b0cd1ca... | 1 
        libcpprestsdk-v2.10.10 | 1 
                       lmbench | 1 
                    postgresql | 1 
               postgresql-11.2 | 1 
          qt5multimedia-5.12.2 | 1 
               qt5webkit-5.9.1 | 1 
          refpolicy-2.20190201 | 1 
              spandsp-20180108 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
              webkitgtk-2.22.7 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
------------------

      xtensa |                   davfs2-1.5.4 | NOK | http://autobuild.buildroot.net/results/f11a9289f800e2a880cc3b405d625b16273a151c |     
    mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/6e5071c2ba75398e148d6c65c75cb90f95156304 |     
      xtensa |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/b606568a69d8f415cf8587bd0bf31708b57eb1a7 |     
     powerpc |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/2fb2e4512f562942ea111e8750cf116479b7dfbe |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ecaf366e4d2cdafdb53a98b14894a63328bb0fb3 |     
     riscv64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f1f29f12f5ce5d8e2c63661242b46cd3a1507c38 |     
        or1k |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f752524c42d755f517f3bff246ea401ce455bb7c |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/6f024ca0cd0716e932246c7aa43a47ae0859d90f |     
      mipsel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/30415d1e86c015dfc8bb731c3af2ce7f59831e40 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5b8edbd29b6384eb03c68409c7aa7559fb8cc665 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/1cc5fed34d1d1a3d049d8d2a9424ac3f3a11017c |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/0317987a71e4063ceb49c8461d2ecf8613c3d008 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/78d1e68925ee49c9bc08a8aafa88d70c59263e17 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b97a851528de3ea4bc3dab67da240bae3397e9cb |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/fb0d66667d862c6cf54d126e9df3d6bd071bca6e |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/fa84ba52e4aa970facb4dd9e0c543ebcc48fa916 |     
      xtensa | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/03beb465b0976d80e257fe830c7050cd00a4117c |     
  aarch64_be |         libcpprestsdk-v2.10.10 | NOK | http://autobuild.buildroot.net/results/34bc326a034adb4cce75e7cbec2e470ab00569ad |     
       nds32 |                   libnspr-4.20 | NOK | http://autobuild.buildroot.net/results/aa7ed9c89be671b9dabe0efe91d25bb90cda386f | ORPH
       nds32 |                   libnspr-4.20 | NOK | http://autobuild.buildroot.net/results/ee5874ffac1ddbd3a1f4f598a80ce7961063e6af | ORPH
        mips |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/ff1da74437de5a901a22001b344870bad009a509 |     
    mips64el |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/99364d409efd1cfc38eb26d45162d345935fa660 |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/50f3db27570fe1186cc35b59e4ca6b6272205b44 |     
     riscv64 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/ed43fb27a37ecf13e9b6c1014822bae9cb109004 |     
        m68k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/10a3cbcebaa923a75e7bc77d3f731c2dc317c7dd |     
        m68k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/935751446ff785b8a7f3894b51cf503991c805b0 |     
       nios2 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/b9f48c1319a2e16892d92dce3cb6e783ef7a5f99 |     
     sparc64 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/de9c9cd4fcc8440e6ca991597532622f58266d35 |     
microblazeel |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/d974ba8b906fed0d7b3ee37393a53518adcaff69 |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/09f3cfe75c30026098f8fe974d582f7fb4c75cc1 |     
         arm |     libtorrent-rasterbar-1.2.0 | NOK | http://autobuild.buildroot.net/results/87a12bb9c35b16b389aa4a1402d6c3c418f03a96 |     
         arc |     libtorrent-rasterbar-1.2.0 | NOK | http://autobuild.buildroot.net/results/27d811c999295a259cd55ef599b42863d518741f |     
         arm |     libtorrent-rasterbar-1.2.0 | NOK | http://autobuild.buildroot.net/results/7643cf295789e712fc763ed694e9d0ae64cfb630 |     
     aarch64 |     libtorrent-rasterbar-1.2.0 | NOK | http://autobuild.buildroot.net/results/37063077a1ab2350d35bf7964fd7e814a2b2b74b |     
     riscv32 |                        lmbench | TIM | http://autobuild.buildroot.net/results/b76128432e1bc64bc6a74f29be659bbcc6baf6a2 |     
       sparc | minicom-19ab49422f3431102c3... | NOK | http://autobuild.buildroot.net/results/a07a71a6dcf106037aeddd1d9de1eb2276e7eb23 |     
        m68k | minicom-19ab49422f3431102c3... | NOK | http://autobuild.buildroot.net/results/e64cdcf648764be53a3e951304bb89dc9410db23 |     
      mipsel |                        netsurf | TIM | http://autobuild.buildroot.net/results/e29923e521faa563c82ee3aefb451f4e02eb53ae |     
     powerpc |                        netsurf | TIM | http://autobuild.buildroot.net/results/3df0395f9b5a2469041d9b1e6dea25a75c49a29d |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/bd4260f2130a2e92b0a52fbecfb34ea70899d8ac |     
         arc |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/0d35378b8bdcfffb0cefd264c95ca3617034559b |     
     aarch64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/46bb6c94457e41853530697dbb999c17b43c9242 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/9d9140b2b566509831b698a86562f7443cf43b25 |     
         arm |           refpolicy-2.20190201 | NOK | http://autobuild.buildroot.net/results/d3876b2a228909fb6e441e55c5e5317c586c9704 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/72f974d0fcf1b4d151de2ac98a6c8d1f79b05881 |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/6dc4612b0bd80dd1216cc3cf2f3cfea0a7ca5603 |     
         arm |               webkitgtk-2.22.7 | NOK | http://autobuild.buildroot.net/results/fc5887fd37d10283b1a4ecf0500b689fa877d27f |     
      x86_64 |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/cc47a39d134fbc80426bab6fa3662150374bae35 |     


-- 
http://autobuild.buildroot.net
