From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Dec 2018 08:00:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-23
Message-ID: <20181224070018.9F6F520BA3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  12 |   0 |   0 |  12 |
   2018.11.x |  14 |   0 |   0 |  14 |
      master | 101 |  33 |   0 | 134 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 12
                  ffmpeg-3.4.5 | 5 
                   netsurf-3.8 | 5 
                  linuxptp-2.0 | 3 
                    php-7.2.13 | 2 
               asterisk-16.0.0 | 1 
                  dhcpdump-1.8 | 1 
                libmad-0.15.1b | 1 
   libtorrent-rasterbar-1.1.11 | 1 
              lua-curl-0.3.8-2 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

        i686 |                asterisk-16.0.0 | NOK | http://autobuild.buildroot.net/results/bfa2fc3fd08bd885f70c833d63908be93254c371 |     
      x86_64 |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/7231170d3d3e3637f02382c1a0a96009b0527618 | ORPH
         arc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/6ebe85dde14b8aa43e7b917f29cb6585083ba8b6 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/22c4984a745d90d7d055ccde9617d1e1a3b1f1d0 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/5285fffa237c9955003975e3a4eb0624e7ce13f8 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/5f4880a90b4e2d1858c1482afca2f390fd28b36e |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/d7b345724bea01ee96612c3e3c86e9a0d020026e |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a16fd5b5a8087d678593e84eba393285f3fbb9c3 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/2423ffc80e057b8c9dc17adfbec1085d0bcfc3b3 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/64ee3fec36707eb5893ce70fbb17862033fedbbc |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4a877f9ceb3bed86dcd482f1ffde8b540e3ea6ee |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d3a428b447fe3cc8fe01b6294e3ac32d4f574d8e |     
        i586 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/0b10073a037c21d21e7d6001dfb36f2c6550de9e |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/09a0b6a8ba462932070671433175e4a156ef39dd |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/cf57c59d2101ead23420131edcbe3c5f2d7bd55a |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8565cda89e0f281b49af9bcf4be08f98ecfe8c31 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/dea422c23e9e7d342a7edd3b4c005937ec18a99f |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/28371fdc0425d9cd5b4bc5a36ae968d321732035 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/3d862effce894bf407d9fff7f8172870132a42d0 |     
     riscv64 |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/65f297a7da43ccc9872e09dad00fdcf513438d40 | ORPH
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/f83ccc4bf50f1d3097437e4d347e06bc6c3ee121 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/253f73445263bee29998078a02bda54c0a6fc0d7 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/ad752abb9110fd7cf8d13220b8e13aab8d5f3a0b |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e1084e6033412237bf998e9b3b1adbada1c2c455 |     
         arm |               lua-curl-0.3.8-2 | NOK | http://autobuild.buildroot.net/results/f3c0c1aa8f860fddc1312823530ab369b198820c |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b774df9094d61239775c788e05aba32dfe17faa9 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4e18dfdbb9830e768971e01c773494be59cf4138 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0144ef5b28c1c067cd0a0cc0a9d2d0da46e3239d |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/26460a310b511d81c1db8af2123748d49e6a57d5 |     
     sparc64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0ed8591f1abb19d5ffe732a0aab2ba25989a6750 |     
    mips64el |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/6f2406f3a4068e763c49ddc549e847f814cec55c | ORPH
    mips64el |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/6336c698b4256e54181882a3d03cbc0de040721a | ORPH
         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/36144fc5e12236f65609338b226836a0a9843e8e |     


-- 
http://autobuild.buildroot.net
