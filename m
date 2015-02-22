From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-21
Message-ID: <20150222073017.CC98B101A17@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-21
===============================

        success : 323
       failures : 20 
       timeouts : 4  
          TOTAL : 347

Classification of failures by reason
====================================

                  thrift-0.9.2 | 2 
                 mplayer-1.1.1 | 1 
               alsa-lib-1.0.28 | 1 
              wireshark-1.12.3 | 1 
neardal-33b54a55032b047fd88... | 1 
                pinentry-0.9.0 | 1 
                    fltk-1.3.2 | 1 
              strongswan-5.2.2 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                 numactl-2.0.9 | 1 
                   duma-2.5.15 | 1 
            gst-ffmpeg-0.10.13 | 1 
                    qemu-2.1.2 | 1 
                 hplip-3.13.10 | 1 
                 libpfm4-4.3.0 | 1 
                       unknown | 1 
                    vde2-2.3.2 | 1 
                libevas-1.7.10 | 1 
             util-linux-2.25.2 | 1 
               sdl_sound-1.0.3 | 1 
                beecrypt-4.2.1 | 1 
           libmemcached-1.0.18 | 1 
           heirloom-mailx-12.5 | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/2556773e06452eb908fa881080da1747b5e36383/
         arc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/043fcf9f57bf9f28bc79ec65bac610f0074e582e/
         arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/ec28ce6a2bf1fb8b57e9adde4045a37e0642c0de/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/8d1b202a182e3fb5dee21f20afc9f749c2defa1a/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/d3fb5dcbfea7dd3fb9c9189ea00565807be3a87b/
    mips64el |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/8be21f7078ce0d40ae6d4007ca2ce8b339e726bc/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/339d3c03490ded359ccd919370dc20fc6ddbfb53/
        i686 |                  hplip-3.13.10 | NOK | http://autobuild.buildroot.net/results/92dfce86af050a7e95c1c5d6d4c6dfe7852059e3/
      xtensa |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/34821cb5c073d65b3e5f1129ca08777de57f5b40/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f9e2a1073170f9c1df1edcbfdeb61c95675558ed/
     powerpc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/fcea34bc2574317f2af66bec865914f37e3a22fa/
      mipsel |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/0fac4039f57d8697030c9de21a68a149f5a2229a/
         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/3eabd3a2cea0d5863b1c0dd8f55c73f34a684f79/
        i486 |                  numactl-2.0.9 | NOK | http://autobuild.buildroot.net/results/8979bdf03b9d746b80439b1136a6aade749c0bc5/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/a0607d83822b53c9a301d8be79476ebb315123b9/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/b66afecea96e2ea99117767e4fd44731ad7ee4c0/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/fa3e6ee812c4c528f605395af5312b1e7465ae15/
microblazeel |               strongswan-5.2.2 | NOK | http://autobuild.buildroot.net/results/d489959392ea217e6f2490e85ff76f98edde4b14/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/e1546f29107eef5717ff9f75ca1b5f62bcfe8450/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/236a7f54a2b95ff843cc0979951f6d8e75044744/
      mipsel |                        unknown | TIM | http://autobuild.buildroot.net/results/3b3ec065d4c7856b61fb13d7b5a09c30a0902170/
         arm |              util-linux-2.25.2 | NOK | http://autobuild.buildroot.net/results/7c02c0de18059bd1a633267b43a8a5e9ee2fdfdc/
         arm |                     vde2-2.3.2 | TIM | http://autobuild.buildroot.net/results/d546cc51504205513471d5e92bbad6be835cc95b/
    mips64el |               wireshark-1.12.3 | TIM | http://autobuild.buildroot.net/results/d5428252b980c6b23f7047e6fb1e8ff5367085d4/


-- 
http://autobuild.buildroot.net
