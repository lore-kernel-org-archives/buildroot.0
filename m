From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Jan 2019 08:00:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-24
Message-ID: <20190125070030.D6F25207B6@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   3 |   0 |  23 |
   2018.11.x |  16 |   0 |   0 |  16 |
      master | 181 |  37 |   1 | 219 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
       host-libunistring-0.9.7 | 1 
                   systemd-237 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/f676005caad52bc946f850159cc28ae80b6916c1 |     
         arm |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/f95aeb377570428d93494f4563deaf22fc2e2f08 |     
     powerpc |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/f48aea5c79580b1a70054884012aba4af4cccb1d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-3.4.5 | 5 
             libva-utils-2.3.0 | 5 
             host-grpc-v1.16.1 | 4 
                 gnu-efi-3.0.9 | 2 
   libtorrent-rasterbar-1.1.11 | 2 
                   netsurf-3.8 | 2 
               skalibs-2.6.4.0 | 2 
             stress-ng-0.09.47 | 2 
zbar-b3b4e32b55f570372fc3af... | 2 
                collectd-5.7.1 | 1 
               curlftpfs-0.9.2 | 1 
                  daemon-0.6.4 | 1 
        glib-networking-2.58.0 | 1 
       gst-plugins-bad-0.10.23 | 1 
                host-libsodium | 1 
                  libnfc-1.7.1 | 1 
                libnice-0.1.14 | 1 
                  libssh-0.8.6 | 1 
                     php-7.3.1 | 1 
                supertux-0.6.0 | 1 
                upmpdcli-1.4.0 | 1 


Detail of failures
------------------

     riscv32 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/160269e56aecb1872e449704f86d22e407c2253e | ORPH
     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/9c98a455f4da7ed7ab7a3fe9ff5751c02d174dd2 |     
     riscv32 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/61fca37f4e83b4fc52cb74c334705ceb77c68538 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/23553482e26df41320a0346b018adeeebc8cfeb9 |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/d52a4a6edbc4b05a5589602c5b05ac09f90a58a3 |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/52423af16bac972fedfbffa80f2388b595fbf560 |     
     riscv32 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/a71c57f89208a0cb45ff025eca0a4c870b022dcd |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/138b6ce93bc42521f52e528d8543305f7cd0d50f |     
       sparc |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/5a612cbb22df506147f9ec811962f8dd53804018 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/168e52f96aeeb801d3c032e70f5fc788ab1875c0 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/0850419159cdd89ed46d304eadfa42bedcb8bdbf |     
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/c7a0acc06e52bb3a1a8c090a5b330f2bd0ba801e | ORPH
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/548711f529aacee86837e723615cd344357734eb |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/1ea88de6571fab74f1fd06bdbfb464dbdbf97b09 |     
         sh4 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/8d59ab8e9c8ac31e6d088684e03cae3a8ee6d0c0 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/ae774204c69b8ecbd01912cf25fd43af013c6a50 |     
      x86_64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/3d39fada5976452ed895ab3073728baea90833c4 |     
     riscv32 |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/45d745efb7f2f63878945cebb3b7bab76402cb24 |     
       sparc |                 libnice-0.1.14 | NOK | http://autobuild.buildroot.net/results/bc59cd4b852ac4939177bb265d3c93f9383531b8 |     
      xtensa |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/5423b834db84c00fd3d21ce9416281591352c0a7 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/c0d620e5312bebfaedaacdc4fcec8dab70f6a264 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/6000c030c715f5b99ef9cf34d4aa7d5d43e5eb8c |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/5007b8a4bd6df641abd554b7d14dfc9f8e0cc4fa |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/56ae6359ae810073724b21fc93390d2f50bcde38 |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/644c6730339a26c4de8fbea3dbba8ddd41c07d25 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/cbe0d714a636039ce57958d84261b6ada98e4b57 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/f5766ec9279c57189c3a390204a91ac0cf955b7e |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5de66ad4147eef775e271efdf4220d031688f512 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/3d4145d9074ee443b3dc73085024f7a94dd8f505 |     
microblazeel |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/78019f5439f45ef7d35780ecb718761f907570cd | ORPH
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/dfd5c9e212c91aa49366cd03171b52762dfe5ac8 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/02a293ac2a093d4b9d12d4a2521c6ecbdc14d35b |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/316033690d5557f7308c015ea522b06df0afd6bd |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/42c33693aed54fcdece73fe478643dedea9ca7dd |     
      xtensa |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/639443ca37673e386aba7889621d12d4e9d5c07a |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/6c601ffda72a45769b6ce989577f2c856720c894 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/acf39e4754508d7ee49e21f08ff0a1fcac4fb7cd |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/47a34371b165569c8608ecf5199084c3eef7e46d |     


-- 
http://autobuild.buildroot.net
