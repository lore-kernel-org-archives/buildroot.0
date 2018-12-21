From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Dec 2018 08:01:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-20
Message-ID: <20181221070109.4D0F920734@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  12 |   2 |   0 |  14 |
   2018.11.x |  13 |   2 |   0 |  15 |
      master |  70 |  50 |   0 | 120 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 
                  cc-tool-0.26 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d096a4765db229e1ebded97867096e45d4181557 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/ed74f6628c5417779a1b184dc192f7bd09a2d1c7 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

             qt5wayland-5.11.2 | 1 
                 socat-1.7.3.2 | 1 


Detail of failures
------------------

     aarch64 |              qt5wayland-5.11.2 | NOK | http://autobuild.buildroot.net/results/28566094148be40eddb358ed70aea4aa850f5bfa |     
     riscv64 |                  socat-1.7.3.2 | NOK | http://autobuild.buildroot.net/results/d9f012c4d3c82528d5f3aa6d956c8664e59d32de |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 15
   libtorrent-rasterbar-1.1.11 | 3 
             bluez5_utils-5.50 | 2 
              drbd-utils-9.2.0 | 2 
      libva-intel-driver-2.2.0 | 2 
                  linuxptp-2.0 | 2 
                   netsurf-3.8 | 2 
                    php-7.2.13 | 2 
                xapp_xgc-1.0.5 | 2 
              xapp_xlogo-1.0.4 | 2 
               asterisk-16.0.0 | 1 
                  brotli-1.0.7 | 1 
            btrfs-progs-4.17.1 | 1 
                 dmalloc-5.5.2 | 1 
                  ffmpeg-3.4.5 | 1 
                  grpc-v1.16.1 | 1 
                 libidn2-2.0.5 | 1 
                libkcapi-1.1.3 | 1 
                    neard-0.16 | 1 
             qt5location-5.6.3 | 1 
                   strace-4.25 | 1 
                xapp_xmh-1.0.3 | 1 
           xapp_xvidtune-1.0.3 | 1 
  xfont_font-adobe-75dpi-1.0.3 | 1 
        xfont_font-alias-1.0.3 | 1 
  xfont_font-arabic-misc-1.0.3 | 1 


Detail of failures
------------------

        i686 |                asterisk-16.0.0 | NOK | http://autobuild.buildroot.net/results/4b51116655d944bc631e30b87afc26e2953c270b |     
      x86_64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/64723ddf1c23f9d393c904c60229d05d9f8f08a2 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/f80d1a3770e1233cc4692431edc36dc93a1050f6 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/0d07579f1d24e1cb605b01f035fb30691d2d760f |     
         arm |             btrfs-progs-4.17.1 | NOK | http://autobuild.buildroot.net/results/28765e5060f3970021fcba2bdd2ea994927fc80f | ORPH
      x86_64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/97ec8c34e1a175701d36d4e679f7feec8e15b682 | ORPH
       nios2 |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/6b3d323abd725e0a3d9c8f30b79ec54cde7daa30 |     
         arc |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/6c078c3f882bfd388bdfc93b13113ba687d0fe83 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/2cd856c42f4f11336cf34858c845b01066076c19 |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/535e4e5e86ec713831dd8b3411a10aa82ae77645 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/eff21acd95be98927e1551b0aab4a235d643619b |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b96ef78308019d983c7018a576888ce722953c08 |     
 powerpc64le |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/fc823ad5da3a9a1b061016bb8c57285148cf05f0 |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/bc136199e3d6bc4ddcbfe5da412c4b6c05839992 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e6c634becc6cdb13548c7cc05e5b488f383dc2f8 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6d2dd16ab8d97ab1bc7ee9bd634b22fa23e83724 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f819ec234b01fc66a56fcdd3144e69fdd711e6b7 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/336e39467807456347004b863760d4d462ccf347 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/33313f49a36beb2b274aa4e974d0b0519cf65117 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/aa199f176337e68c5ded4d52c2a085b8972bf57e |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/04e61d98406113ca9ce3293aca451d6e77d96476 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/c6be9851d070a33aaf76ebf72d4311916577d645 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f1c281cb1d3cca6c6c6bfc2fd97a9b860e9f142a |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/97a250fcada7bd9cbeb0cadc80fd336876e56d0b |     
      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/0f44af1cba8fefabed539bff40dba1c67eef50c6 |     
      x86_64 |                  libidn2-2.0.5 | NOK | http://autobuild.buildroot.net/results/606072d0d33506090aa6c688f70b84eda67412c9 |     
         arc |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/218a7e0c61eaf805a0dec03eaf185a880d63dbb4 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/95c8f973a7645c21cf6adedbff7fce7bd1339d28 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/bd435845913e921dfcd510a01da8f055a480e41c |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/090a4ce70941493c03ea1c1713030ec487b3c241 |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/220924c5320474f38b01956ed3051d3bc8368fdc |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/f91088b91d2296b8103748fb59326b3210f2e26c |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/ffb9ba39d7080c2b00ca2ed7d6304e7d8bc5f985 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/103137c660066c81d4f52019f73cf4558e7aad69 |     
         arm |                     neard-0.16 | NOK | http://autobuild.buildroot.net/results/935b540ad69952b678e8b2de07abb788ebd778af |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4852ddddf31a6b92bf9d895ff0ec338634ae1560 |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/31dd3a7f426b463d6064a3a1f760175f86d0a970 |     
         arc |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/68d4c4cefa3c18f62373c33b29367aab7e68f512 | ORPH
     aarch64 |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/2f800207c4932916a0b6b939ef981e15af0899cd | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/adb9eab8c990457833d6870e7977d8bdd11d0123 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/255f7e8f2701c73c8efad8ae9ffd4f3a16f27b2e |     
      xtensa |                 xapp_xgc-1.0.5 | NOK | http://autobuild.buildroot.net/results/f2696f3262081a3e3cfb09b92a983ef51d579b6a |     
microblazeel |                 xapp_xgc-1.0.5 | NOK | http://autobuild.buildroot.net/results/31a7b0dfb35e22fbaf145e29718b72f29117e84e |     
  aarch64_be |               xapp_xlogo-1.0.4 | NOK | http://autobuild.buildroot.net/results/ae85043d2e90e94c31265b008941576a2f9f972d |     
     powerpc |               xapp_xlogo-1.0.4 | NOK | http://autobuild.buildroot.net/results/5b8d61093a1b86c401fef3a6cf1ff9df55dabd6c |     
        i686 |                 xapp_xmh-1.0.3 | NOK | http://autobuild.buildroot.net/results/fc3b6e778931ae9d28bf5edd0aaad71bb894121a |     
         arm |            xapp_xvidtune-1.0.3 | NOK | http://autobuild.buildroot.net/results/00d1b6669d2d81a37319e2db239160c004a4f2b4 |     
        m68k |   xfont_font-adobe-75dpi-1.0.3 | NOK | http://autobuild.buildroot.net/results/aaf1856130084c606ee2d855fea29f1d7f748475 |     
         arm |         xfont_font-alias-1.0.3 | NOK | http://autobuild.buildroot.net/results/fde5221d78db198d3db27941f061d20edddb01a1 |     
        i686 |   xfont_font-arabic-misc-1.0.3 | NOK | http://autobuild.buildroot.net/results/f685eeafc6aade2b04ca8355140a480c7d0b0ea8 |     


-- 
http://autobuild.buildroot.net
