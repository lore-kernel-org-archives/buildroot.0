From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-28
Message-ID: <20141029073016.28E5B1008B6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-28
===============================

        success : 190
       failures : 54 
       timeouts : 2  
          TOTAL : 246

Classification of failures by reason
====================================

                  avahi-0.6.31 | 5 
                    qemu-2.1.2 | 4 
trinity-5d2dfe9727eb9c8dc44... | 4 
                      mpd-0.19 | 3 
                 samba4-4.1.13 | 3 
                 schifra-0.0.1 | 3 
               libglib2-2.40.0 | 3 
ltrace-0896ce554f80afdcba81... | 2 
           libmemcached-1.0.18 | 2 
                   mp4v2-2.0.0 | 2 
                      qt-4.8.6 | 2 
                 webkit-1.11.5 | 2 
                  autossh-1.4d | 1 
          shairport-sync-2.1.5 | 1 
           heirloom-mailx-12.5 | 1 
    xserver_xorg-server-1.16.1 | 1 
             alsa-utils-1.0.28 | 1 
              wireshark-1.12.1 | 1 
                 cdrkit-1.1.11 | 1 
                 omniorb-4.1.6 | 1 
                     tcl-8.6.2 | 1 
                  tstools-1_11 | 1 
                    ruby-2.1.4 | 1 
               sdl_sound-1.0.3 | 1 
                elfutils-0.155 | 1 
                xapp_xfs-1.1.4 | 1 
                  prboom-2.5.0 | 1 
             host-mysql-5.1.73 | 1 
                 libssh2-1.4.3 | 1 
               iptables-1.4.21 | 1 
                busybox-1.22.1 | 1 
              uemacs-4.0.15-lt | 1 
             bluez5_utils-5.21 | 1 

Detail of failures
===================

     powerpc |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/82dd8a423951157bd2f6f3691f839134364ea516/
       nios2 |                   autossh-1.4d | NOK | http://autobuild.buildroot.net/results/d0e3b73fbd357ac91ccf786867830931760bb79d/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c908d3ee492280e9297f588eb6abe00508307469/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/b2998f00815e0e16f5fdf60705c85b7986032018/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/447d0cee4c8d2c99fe5a8a771ea29356381e66fe/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e25eaa8c5f7d563cce13c542a1b37127fb8938c3/
      xtensa |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ed83cd9fb9af8aa8c14653efd772099ec4e04385/
      mipsel |              bluez5_utils-5.21 | NOK | http://autobuild.buildroot.net/results/7cd87c9e9b8b41ee01413050e554b5422d207e70/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/0e68eec82527b248205e9325c0bb0e9270dd25e1/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/ec96f11b085258b2ce278212f1a0b03781718831/
     powerpc |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/62344385579220afbb3088aeb00cc8bf35e1a6e8/
         arm |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/96d6e5e55005f8a3e5770251d3bb70671b70da9a/
         arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/21e86c7fc9612a49637234436b181a9512b6d01c/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/a570a4b0210f14fb9f5cbbf25b00935674436b6b/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/345b05912b640f70c8b02f4e99cacb618fcbcefe/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/803699a1a59c331ac62dcaee3d6080d66c8354f4/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/a7c91b9bec6760b4c92b2b90325e33bf420e6c8d/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/66c0437c6e010015875033296e483f1297076ae7/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d01989b33f9999cfe91e8b6f3df6d5b71cd30066/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/72ac138066e49a38b6984065eaae4f1d21ff9bdf/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/b6a3c8a4ff7a66e11449e133a8a8719eb5ead2ce/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/267702da3f0848ca9305ec2c87af5d49a73bcf35/
        i686 |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/4fe9e74f49a2c3819ed4f721f2ac8d947e48f597/
     powerpc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/e93653ccc815c805f4af55910c2995372587e7b4/
         sh4 |                       mpd-0.19 | NOK | http://autobuild.buildroot.net/results/7ff28551b9c72658eb75394e7cbd1904861f23e3/
         arm |                       mpd-0.19 | NOK | http://autobuild.buildroot.net/results/af0e19c19670262982ac0a0b982795bee43fbb09/
         sh4 |                       mpd-0.19 | NOK | http://autobuild.buildroot.net/results/db2ffddad3107316fec637e65cdfe71cf220bf4c/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/c99cbb3c302298b0f1680431d86afbd918510f00/
    mips64el |                   prboom-2.5.0 | TIM | http://autobuild.buildroot.net/results/c818e9e3f7a54f84f7470254c2fef557d27ac2d4/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/72e3cc246090ebafa84381e7d0e2a3cc035f1578/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/9d164820e99e45518a21831e86bfe3bf5df60047/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/d05dbb2b16a4fba8f7ed308e9bdb8ddaee06611c/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/e2548222b4c82687ae36cbba0559b20160b6fa2d/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/9e5d05226e1bae942e0e36ed835ebd5fbb0e83fc/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2d9775e98d1249f7d3a505eb3a53d040d12a2bec/
      x86_64 |                     ruby-2.1.4 | NOK | http://autobuild.buildroot.net/results/e2f8e55c9dfdc859274a2aff9a09ea8c4b8a62ce/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/878e0b7339c52e9692408290ba38a16a22ae6cbf/
      mipsel |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/1df5a975f0d0ed1e929e8df230415601d7259a3d/
microblazeel |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/0d384a5214a1e6df7576cb39a82b6ec016fccab1/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/cf5615fb10b51c01791b58fefc4656b590f176cf/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/5fbe160ab81ba89015ee77d921325324c9d6a72a/
      mipsel |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/739d8107e2b51cb1f5e80aa080c247c7b9d40153/
        mips |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/1fd9ea849839c7edf6377092d360bc7a719cc8bb/
         arm |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/cb41980f2fb416d627bea0950e1dae727eae0ca6/
         arm |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/7f76249c20dff2a317dd3332eebc533c53cfb3ff/
      xtensa | trinity-5d2dfe9727eb9c8dc44... | NOK | http://autobuild.buildroot.net/results/fa35e00abf6995b168979a42fc486aab81f18552/
      xtensa | trinity-5d2dfe9727eb9c8dc44... | NOK | http://autobuild.buildroot.net/results/d3854781c928fa2b41c0399fefd949b8466201ab/
microblazeel | trinity-5d2dfe9727eb9c8dc44... | NOK | http://autobuild.buildroot.net/results/bbda5ad482485a0347a5d43f1ff827f0abf45874/
         sh4 | trinity-5d2dfe9727eb9c8dc44... | NOK | http://autobuild.buildroot.net/results/98e661090ae350fa819e7f3244dd07e4ea1c4615/
     powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/d0fb0b64d7574a5ade8c4efaf24fe89a0c1f47d9/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/8d26c16fa97f3e98b7f1d664809949cf1aa3c49f/
      mipsel |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/50ea4a9bd74ecbd420f65e44752cab83dcfe31db/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6f1b5edb729e7ead6be790d42229d45bbfe4b801/
        i686 |               wireshark-1.12.1 | TIM | http://autobuild.buildroot.net/results/b052e77980249ac52aa9e97465b170fbc7670bdf/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/093c8eaeebffe9a7c3d178c4e041b6fed540503a/
        bfin |     xserver_xorg-server-1.16.1 | NOK | http://autobuild.buildroot.net/results/d279dc35bff53b7f939af02bee70b1ed3014e49b/


-- 
http://autobuild.buildroot.net
