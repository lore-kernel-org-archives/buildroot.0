From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 08:30:27 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-20
Message-ID: <20160821063027.4A4BF102EA3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-20
===============================

        success : 188
       failures : 50 
       timeouts : 1  
          TOTAL : 239

Classification of failures by reason
====================================

                  ffmpeg-2.8.7 | 5 
              lirc-tools-0.9.4 | 3 
                   ncurses-5.9 | 3 
                 jack2-v1.9.10 | 3 
                  lshw-B.02.18 | 3 
                  openjpeg-2.1 | 2 
      kismet-Kismet-2014-02-R1 | 2 
           linux-headers-4.7.2 | 2 
      trace-cmd-trace-cmd-v2.6 | 2 
               binutils-2.25.1 | 2 
                 lvm2-2.02.162 | 2 
               libepoxy-v1.3.1 | 1 
               host-efl-1.17.2 | 1 
       directfb-examples-1.7.0 | 1 
                    qemu-2.6.0 | 1 
                 mono-4.4.2.11 | 1 
               host-ruby-2.3.1 | 1 
                 mplayer-1.3.0 | 1 
                 clapack-3.2.1 | 1 
                libaio-0.3.110 | 1 
                     pcre-8.39 | 1 
               domoticz-3.4834 | 1 
              libarchive-3.2.1 | 1 
                     vlc-2.2.4 | 1 
          janus-gateway-v0.1.0 | 1 
                 ibrdtnd-1.0.1 | 1 
                  squid-3.5.20 | 1 
 make[4]: *** [all] Terminated | 1 
qt5webkit-b889f460280ad98c8... | 1 
tstools-08f6be304040e7b8476... | 1 
                socat-2.0.0-b9 | 1 
                 synergy-1.3.1 | 1 
           dmraid-1.0.0.rc16-3 | 1 

Detail of failures
===================

        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/fd1c94f639c3478376a006f58b37f3712be46f2c/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/398837c1208a5110a6784ec94aa6b6413ad4fdee/
         arc |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/fb5d996508ce55b17129e9dc03cb8124c1a2361c/
     powerpc |        directfb-examples-1.7.0 | NOK | http://autobuild.buildroot.net/results/9154663713d17e1fd1bd888fb5113be6dd01b17d/
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/841816a27bc95072d568b76c44a85ec6f7b0e244/
     powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/b2fb18628151055dbced4e21912a683868f13b17/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/5e73a91ecd2680d27a290a0dfdb45bb62ded0df0/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/65a342cf338558b15585e378ed0446b77d07f98c/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/df73e19032de351f9c75c40b08051050b312f0ce/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/8cd80d046a85fd4242b544a574d42929862e9c66/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/2411444030df21c3d7a9c52a6738390530ca57c1/
         arm |                host-efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/65a5359f7ca2c96cb3605587c7e8cf62936093b2/
         sh4 |                host-ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/6185c6861c9a383ff954d49c9aa27246f6c42aa8/
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/497277c013c1a63cbca7c006e677cfd2e86ec400/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/a19a52bc7eda3e270dccfb4222e497a31fd2da12/
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/cfb88aa276cf4f5db0023132c35ae85d83731f28/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/1e847e9d9f8210ff62a73345b68403108fbc2038/
       sparc |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/2c306082208e6002c43c7fd9ccfffb43410b5c23/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/cdfe181e8d3486c65f140b62106a1592a30fd084/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/8ebe7bc047cbedb2652ce6eccb1c6d629c35c082/
        m68k |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/a2857fcab0d9c0d7e88f0648b9df7478caf17ccd/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/42bb149529148007a23ee6debc684e6afed0c50d/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/98481ba6cf915007877a995952e2759343e06626/
      xtensa |            linux-headers-4.7.2 | NOK | http://autobuild.buildroot.net/results/dfc80f252fe0bfe2c7a7b7f9177c0a9cb84f9570/
     powerpc |            linux-headers-4.7.2 | NOK | http://autobuild.buildroot.net/results/3a1b552f7978a58a010c19360c198541c40df2ff/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/0397553d7c2d61812da652efc9c51c9ee72bc693/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/280cdb54f0ccfe616d074ff021f87b5ac3f44a62/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/96969e685ea387112adb10ddf257019af4549203/
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/1686e3d8e3fb80f3c911fd9d66d681a5e941453f/
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/10a2256a6d9dbb6c640995ad1309679f5723ff66/
        i586 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/9f417ccd6f5b0fa2c885cf7be971fb90666de005/
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/1d0e49e3d91be2e586325bb532ea376230b30b77/
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/7c1279d79a92604ae2fbf53dab3509a9d9f35896/
      x86_64 |  make[4]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/db0ea7f10bf335a7cb5b01106e58788792d0dce2/
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/af3716352eb64ad175ef0bd38c640f1f29afcac7/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d0c8ccc869286ea541da9ea301686c0fff3f3978/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/d5c787d34acbfc0c0c7bd8cc0e15b5bc2460d88a/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/140e61f5b4f1cdc71135d1697ab404d7eec93649/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/c447ac9bde017935341e42282d6d87715cfd1baa/
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/529ca840d11bf69cbaedca4ad542e5eb7fe4c43b/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/1022611c17a81ba2089a0b0fb97cf32e47e56c9e/
        m68k |                      pcre-8.39 | NOK | http://autobuild.buildroot.net/results/5ffa7694e063fc46771e594bbd0d975bc25c5c3c/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/684bd6f9f6764559c9bd8550c4f688c6e5109ab9/
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/15c49d16dc1910e0d09cb30780f5f51a17d9e346/
        i586 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/56468e136613b3f1220ed8557358c2bce5da93a6/
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/ed6b891ee4f0ed0a0217484a547a1eea2760d335/
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/b7554816ea72145e784b460d997c4c30b66f3d97/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/fe9db825ed62ea438da8beb689eadb19fd8c3bb7/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/bc8688db0eb04bde544225e31fad86e979f4f616/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/9882f93e11dbaba8c6973bedc9d00dbb238a4c06/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/534aeb47423470e9643217102d365c38ea3402cd/


-- 
http://autobuild.buildroot.net
