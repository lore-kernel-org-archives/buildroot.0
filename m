From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 May 2018 08:00:38 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-21
Message-ID: <20180522060038.2D49D20828@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   3 |   0 |  24 |
      master | 232 |  19 |   2 | 253 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 
          host-faketime-v0.9.6 | 1 
                   libnss-3.33 | 1 


Detail of failures
------------------

    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/b8a758a79de7e73cba22894510017a01f71f0d5a |     
microblazeel |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/8990e4ca21b6588d8e5f5fa69336e388fd40bd36 | ORPH
     aarch64 |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/58dfb04e298cd775ca94b4dd51b859017f98a99e |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 5 
                  samba4-4.8.1 | 5 
                    quota-4.01 | 4 
                         boost | 1 
                  dash-0.5.9.1 | 1 
                    gst-ffmpeg | 1 
               log4cplus-2.0.0 | 1 
                   mpd-0.20.18 | 1 
pixiewps-9e5bdc6c86c8487b2a... | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 


Detail of failures
------------------

    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/ce2f5a78f115d2731dfe2e5fa5778a71e8704d6b |     
   powerpc64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/017045a816dff29e89d23147bd6674dc815620cb |     
      mipsel |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/6fe828d42a36b660c611f2c8181e74410c567403 |     
     powerpc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/b8f98689d429e475d773bda0ae7a117a1dfe2461 |     
         arc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/fdf02bc5331fbefdac0453cdc15dbbe187a0a2fa |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/40d33ff9e3367a22253c58b388c77d9858981bff |     
      mipsel |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/fc4e4ab47455ac47dd4a3a60083cec2848e74dbb | ORPH
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/d20700bd538ba1e9d45ab8a61ecbbba1a320ef38 |     
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/8f73ce095894f4bcb26df7fbe38e2503445159cb |     
        i586 |                    mpd-0.20.18 | NOK | http://autobuild.buildroot.net/results/edbd0d7d5436286086dd9ad548596e8644eb843c |     
      xtensa | pixiewps-9e5bdc6c86c8487b2a... | NOK | http://autobuild.buildroot.net/results/8d7457da469f2234530a619806990860ab11e886 |     
         arm | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/a4a1da836441236bf075f1d3568bfd0b026244be |     
        i686 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/b03b29b901111c1e86b3aff3fd1e2f82db65d42a |     
       nios2 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/69218f49292b16d129efee2a386deb947ff01982 |     
        mips |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/86df4e6915468be4010269f654647789d9470ed0 |     
      xtensa |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d6ff654c5fc0a91823e9c1f9c4cd9ec09bac7c35 |     
         arc |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/2d7f06ee202a123a081e7f5ba06375b9f66c1c18 |     
      x86_64 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/f83115bc38c1bdd9757b417b475a46bcbc1679ea |     
    mips64el |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/71cdc325cfe8b6cdb149bd2b6fc0ae161fb3d912 |     
      mipsel |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/65710264c1eae90c5a67349082c2bc42f6829b98 |     
         arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/7c116cacd6fce16720a1c88b8d09d376075a027d |     


-- 
http://autobuild.buildroot.net
