From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Jun 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-19
Message-ID: <20150620063016.F0ED5100BDB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-19
===============================

        success : 185
       failures : 48 
       timeouts : 1  
          TOTAL : 234

Classification of failures by reason
====================================

              wireshark-1.12.6 | 8 
            python-tornado-4.2 | 5 
make: *** [openvmtools-lega... | 5 
                 setools-3.3.8 | 5 
               upmpdcli-0.11.0 | 4 
                pulseaudio-5.0 | 2 
                      qt-4.8.7 | 2 
                     lutok-0.4 | 2 
                   glog-v0.3.4 | 2 
                libtirpc-0.3.1 | 2 
                    cramfs-1.1 | 1 
                   ntp-4.2.8p2 | 1 
                     gpsd-3.15 | 1 
               libsigsegv-2.10 | 1 
            gst-ffmpeg-0.10.13 | 1 
                minidlna-1.1.4 | 1 
               sdl_sound-1.0.3 | 1 
                 qt5base-5.4.1 | 1 
                    qemu-2.3.0 | 1 
             berkeleydb-5.3.28 | 1 
pulseview-198f9bc74d6c955a7... | 1 
                  ffmpeg-2.6.2 | 1 

Detail of failures
===================

         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1772bf3510d66490db214e2b89a9603fb50b53e0/
         arm |                     cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/ce6b695f62387365d0996b9b10bd2b9c30fe0e61/
      xtensa |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/a2785a17bc6c5b6a0908cd19c363b0b7061d1e90/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/7e42eaf46d4f57e0b9f5a5a000167a9277deff07/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/cff917c42117eb87be4a7eb454e68c5508bedda0/
         arm |                      gpsd-3.15 | NOK | http://autobuild.buildroot.net/results/493ddaf63f41918d718b5c26e2db258c67dba0a6/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/97b9b82a7284797b3dc1b42ab34b0d8efc0a7591/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/56215c7bcc1e1a11b2d85045ee256e2c08ac1ae5/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/52f2e08b1fe4587f93655970cd7d7ce894b20b7b/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/4193314423334248e31b4577fe8a06533adcc1cd/
         sh4 |                      lutok-0.4 | NOK | http://autobuild.buildroot.net/results/6743051eaedebc3e4b678d5751d0f24a92a3c281/
     powerpc |                      lutok-0.4 | NOK | http://autobuild.buildroot.net/results/e66c617122ec8b542aa942e43bb14345b34dbe3d/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/7293a8a208dfd18f04931238292fab0ab24b46a4/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/f2c4169de2ad20e6de3347c18ecd7a3673d0b26e/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/f91a6f0ebbd1642eb0efbddcc4269f412b78176f/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/23f7c07d7baf2fff0a9547fcbc64565693d21251/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/e69a19a749860c5a579e33acdee7275433f4da62/
      xtensa |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/e794491f6560dafc386e37c09bec9e23083c6db3/
         sh4 |                    ntp-4.2.8p2 | NOK | http://autobuild.buildroot.net/results/bd0a42b30bee1e931eb4dc81ab48f7ff3ad30b54/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/c0e701c6eb81c8277d35adbeb547edeb6c279521/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/c606b6558abad54a1181ed3f5a6713bdb2129562/
        i686 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/854a53e886d6aac2f1153b05daedc53ef09888e0/
         arm |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/a1a5aeb46d8aaccea5cb62be9669b27c7f2d105f/
     powerpc |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/5187f1593422e9cb96800b52064cbf471c6f340b/
     powerpc |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/d24c73b81890d1e6c7c0b9f17f12c88bed5c80d5/
         arm |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/c4fd55160188362203410b281ebfc6471bcc5763/
        i686 |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/f839d3af39424aa2bd82e26c6d8c5335249e25f1/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/37557a194057727d75359382d546c0b2af2485ef/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/835abb013aaedf4197061a70130fa2848ae7f553/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f426019d7dbc9a8647d41b92711c3ce2ec2f5be9/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/2461c66d9d11a12c8bc0ec00b88daf13d9548954/
         sh4 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/2fdbc72537aaa864451f3a27eb65e09e7d88c35f/
         arm |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/68bc87814b2166a7bcecd4bf04f42ba0b7d399b9/
         arm |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/230f565d6968e48ceea68f6bc8a7bf04659adc49/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f7abeea6f5f280aa7d6e0ef416dfae52b611a527/
         arm |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/ef710c002a6f8759bdf67634c632c608e6fc616f/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/d3558cc5ecb7d82408215d2ad2fc2ade494f5be4/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/2dde6f969e4173e0e3df87954fc03e84b3871b80/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/e63fa491b73f61755d8a5e63e512fb65ba585451/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/eedde1bbfedbae422569e880e1fceb14b1cd1160/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/f49a6fcb6b417472979ddc74db90fd2677b1b889/
    mips64el |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/78e9c425f3838fc639f5ffeefb982adcbba9972e/
        i686 |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/6e8bf80c374f44e2110d0adaf804c1f6b50a5e5d/
      x86_64 |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/7f83346a0c661a4a3588796691b72e549b02aa64/
         arm |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/dce778081ddee05e2bdd231c5cc8dc876043180b/
     powerpc |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/4d2c875a5f0195c2bde56031271dfe40b217310d/
         arm |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/a72d22a22f3c7179338a43d9fa6e7b37b928c3fa/
         arc |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/69bf9840d5eef05864cccdcf5715b1c5793865fb/
         arm |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/96464dc6f1a9927419cc65dd74b6dd2ae0bb448c/


-- 
http://autobuild.buildroot.net
