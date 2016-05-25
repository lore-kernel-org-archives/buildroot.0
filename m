From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-24
Message-ID: <20160525063019.D17B6101EAC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-24
===============================

        success : 170
       failures : 31 
       timeouts : 0  
          TOTAL : 201

Classification of failures by reason
====================================

                     vlc-2.2.3 | 4 
                  ffmpeg-2.8.7 | 3 
                libgpgme-1.5.5 | 1 
              gnuradio-3.7.9.1 | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 
                 libdrm-2.4.68 | 1 
               valgrind-3.11.0 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                 lvm2-2.02.153 | 1 
                 mesa3d-11.2.2 | 1 
xdriver_xf86-video-openchro... | 1 
              strongswan-5.4.0 | 1 
                    mpv-0.17.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                   mplayer-1.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                oprofile-1.1.0 | 1 
             lirc-tools-0.9.3a | 1 
                      time-1.7 | 1 
                 host-go-1.6.2 | 1 
                blktrace-1.1.0 | 1 
                 mpg123-1.23.3 | 1 
android-tools-4.2.2+git2013... | 1 
flann-04b4a56533faf8c8228d0... | 1 
iputils-31d947cf7156cf78d3f... | 1 
                    cups-2.1.2 | 1 

Detail of failures
===================

    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/14f1f70cef0a776f6fd145c3771c901f2264102c/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/fc8e340d4e7f67d6738366091f847c8c33bd25e5/
      x86_64 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/d8e49a4e71d4e5682c9719fb7b8fb6dd110f407b/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/4c529fcd50f87adc907db692da76231cfd904926/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/b33c5695efd9a2e43017d2dec217487ef5829537/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/7fd8187c0110cdcac622e667f4a81d2db84f11ef/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/a53dca851d3cac57c85cbb20bf609e221cf75a95/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/be4af52fdb528c4def30546bd1bb8b7becf870ef/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/d7509d9fdf8f86332a023358a740975f535eafef/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/30bf25c0261ee4b07ee17d7f51cf540fad19e296/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/2cb581be93292bb4247aa6bae5bf48e227c1353d/
         arm | iputils-31d947cf7156cf78d3f... | NOK | http://autobuild.buildroot.net/results/b04c0c75c00acb406b9f8f394cd7f2db4baa74fa/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/9261ccb8d8902b452ee2756b1c7e61df805d8121/
         arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/6566a1c77983404d90920997bfd15bd98c7ddde7/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/eb47d57de8182d25b1dacbf0ac3726ed20063d04/
         arm |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/005a57ca66485e6916a66a47358f2d686eeca0d6/
        mips |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/03ac671d0fb7632b82f618024099c78058207375/
      x86_64 |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/b2bc143fbd0b34e75a44af41ab6899dd9fa3c21a/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f6e1bc015345b52a16815fa917fec3f4a32677d0/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/336593141e108d0cecff3c503dc9e58807ac3d55/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/9a872ddc906e9d552d30762e849a1b537b4e5095/
      x86_64 | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/37b3a51221ecdb0709fa6a0587ba816725200418/
      xtensa |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/e0997001ef52d2b32b94efa06b9791249f351b92/
       sparc |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/7e090237801874fb889c76f84863dc4c2ca20450/
      x86_64 |                       time-1.7 | NOK | http://autobuild.buildroot.net/results/a0e64faba69fa86755c693f575fb258a77e4e9d1/
      mipsel |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/c3de1a34c54852e720006f648c91d956bbf58eae/
microblazeel |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/1cd7f5b1497e407aad1ba31aa48e79aa8b2efd87/
        i686 |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/4f72f7115af8289daea06136b35cf873ece18768/
         arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/22d9e3150a237bde47f40491bf410be16d31a83f/
     aarch64 |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/04a97fdc847d537f1a5d371272c223e3ca2f1a59/
     sparc64 | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/f9231fa410dbe40aea6d806d27668c61ba5ecbd4/


-- 
http://autobuild.buildroot.net
