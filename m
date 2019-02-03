From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  3 Feb 2019 07:00:36 +0000 (UTC)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-02
Message-ID: <20190203070036.8A20F227C1@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   1 |   0 |  21 |
   2018.11.x |  21 |   0 |   0 |  21 |
      master | 199 |  18 |   1 | 218 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/d21e9d9d955bf0b1270fa51aed0e25b7bf2060dc |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-3.4.5 | 3 
                 haproxy-1.9.1 | 2 
   libtorrent-rasterbar-1.1.11 | 2 
                   netsurf-3.8 | 2 
                collectd-5.7.1 | 1 
                 gnu-efi-3.0.9 | 1 
                host-libsodium | 1 
                  libssh-0.8.6 | 1 
            mesa3d-demos-8.4.0 | 1 
          shairport-sync-3.2.1 | 1 
               skalibs-2.6.4.0 | 1 
              swupdate-2018.11 | 1 
                upmpdcli-1.4.0 | 1 
zbar-b3b4e32b55f570372fc3af... | 1 


Detail of failures
------------------

     riscv32 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/6bc1592ac39c620c274ddb8dbad61ed3da8fae3f | ORPH
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/a22b0720b29a35b79b10d22ec9bfb84a7e62d7ae |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/45b9593a96ff917d8642f27df3f11d440a2d3c81 |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/3f8df64acb3b4c1f032e1206ebb9311e04673a05 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/69e73833c43a8c4a6b17368d0ff34e599721324d |     
microblazeel |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/876e43cbc52937cb64303ea2838221919b6e12f9 |     
microblazeel |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/dded1ffce9d9ba33c8bdbcdb5208aa7bb3c96e6e |     
     aarch64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/3385f663ce5fff0fa5d910ce5ce47251da9b9e3b |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/db8be0d52b0ca2b030990490c6dd8b30a1973f9c |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/ad9305d5958155b9bbe36bc6fdd512a8c5a48dad |     
         arc |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/bfba22c49cfa0f3daaa4d915442e406eb3b7d16c |     
         arm |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/5060676d127490b7c8255d98d2a7ad0b1ec99be6 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6fb2b0dd9eabdc05e8b43c4eee2ae1903b573167 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8c8e1f60eb274ec15639bcc0dabc229392b7416e |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/bf5dc09ef44569b239db996c925d71699c2d19ed |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/dd15100c2aca7ad4b80f4cf613235b6150e10d33 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/2b3197c74dbd99c57cd2f730f8eca628b425b3bb |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/fc7a08709962be65931dbae745df3273a36d4f53 |     
       sparc | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/2467e6b1f0ea719777dad02271245d38422cf39d |     


-- 
http://autobuild.buildroot.net
