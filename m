From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  2 Feb 2019 07:00:47 +0000 (UTC)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-01
Message-ID: <20190202070047.154AD312D7@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   0 |   0 |  20 |
   2018.11.x |  14 |   0 |   0 |  14 |
      master | 168 |  14 |   0 | 182 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-3.4.5 | 2 
                collectd-5.7.1 | 1 
               curlftpfs-0.9.2 | 1 
                 gnu-efi-3.0.9 | 1 
          libcdaudio-0.99.12p2 | 1 
                  libssh-0.8.6 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
           python-numpy-1.15.1 | 1 
             qt5wayland-5.11.3 | 1 
               qt5webkit-5.9.1 | 1 
               skalibs-2.6.4.0 | 1 
             stress-ng-0.09.47 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

     riscv32 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/1100519fb5a511a41e18196dbae6d34b5956f8b4 | ORPH
     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/ec207bd2242bf56233b01a96289897d4bb52e77e |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f1b11c6e6699557849217041b0bbffc289932ff7 |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/b35a02f2161d87c8f5635c0fa1e361741f7e3cf9 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/57ba088dc4deb6769bdad4d45e549563a21722fa |     
         arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/b266ff5d3e5188bd4c257d3c14559186bc3ad00f | ORPH
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/04f1f7a468f357a3796c4e3fc830ece2f02c33b8 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/09be60dcd3bc2e03ebff716c20cc198a1c2daf5e |     
     aarch64 |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/27ef331f15bcfb6609842d2e40fd3e1043368fb5 |     
         arm |              qt5wayland-5.11.3 | NOK | http://autobuild.buildroot.net/results/58081ffb845ab94f30185b806155f5dfd6bb366f |     
      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/aea749c24433ae69acd79bcfeb5c652a14cad08a |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/6f3371a5b02baddfcecb39b6dfe8d316800f3dfc |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/cbcad789d69d9ce69d89968f193f04389d34f63e |     
      mipsel |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/c958556dfca109323745cc9a294c952b4afffc9d |     


-- 
http://autobuild.buildroot.net
