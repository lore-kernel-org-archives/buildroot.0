From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Nov 2013 08:30:25 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-12
Message-ID: <20131113073025.D898952C60E@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-12
===============================

        success : 97 
       failures : 41 
       timeouts : 0  
          TOTAL : 138

Classification of failures by reason
====================================

               libglib2-2.36.3 | 4 
                 qt5base-5.1.1 | 3 
                  tstools-1_11 | 2 
                   attr-2.4.47 | 2 
               alsa-lib-1.0.26 | 2 
        gst1-plugins-bad-1.2.1 | 2 
          enlightenment-0.17.3 | 2 
                 fdk-aac-0.1.2 | 2 
                 ffmpeg-0.8.15 | 2 
                    crda-1.1.3 | 1 
                sdl_ttf-2.0.11 | 1 
                     nut-2.6.5 | 1 
                      gpsd-3.9 | 1 
                  nettle-2.7.1 | 1 
               libsigsegv-2.10 | 1 
  toolchain-external-undefined | 1 
                rtorrent-0.9.3 | 1 
                  python-2.7.3 | 1 
                   squid-3.3.9 | 1 
                directfb-1.6.3 | 1 
                 libnspr-4.9.6 | 1 
                 binutils-2.21 | 1 
                 netsnmp-5.7.2 | 1 
           argp-standalone-1.3 | 1 
               iptables-1.4.20 | 1 
                 webkit-1.11.5 | 1 
                     rpm-5.2.0 | 1 
           binutils-2.23.2-arc | 1 
              vim-699f8d8f096d | 1 

Detail of failures
===================

      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3345f37b49162e96104bf12b18c640feca249a77/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5451ccf1857d65c0daa09ea0d6950533092cd586/
      mips |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/7d1091e5a06525dc934dbb71c57cc6c987268622/
      mips |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/00a2e4efb9795d229fbdc6ee07fd76d3229e2b00/
      mips |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/28bb7adad2b035c7d8890a259d9da8a43cc067a1/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/fa469a2fc88c41ad7efd6d6f39ba39c22f73b3f8/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/62b900776a6960a4261daae7e22c36ff5cd3d925/
     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/b2f89d1a5e2ebbab3d25dac9934268a28a8ad18f/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/37c29819d5e3fa65c3bbc6e0f25143d656ec4e19/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/8c0d27b96a1d178124ca05a2574207a4383fb9e2/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/1e6b938da4a59cf15af63d1a202429bfc2eacf53/
  mips64el |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/fcdf1ce3fb4738bf206bc36a060d1e378d52a697/
  mips64el |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/d204e190d668cef096b141b07c37850042ae3b41/
microblaze |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/458ec2ae153cf0bf37c74f742e2e5ad56d87cf87/
      bfin |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/ec67e449d5548d14044182d20be1f873b17c240f/
   aarch64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/9040928d9981797ba3a1d038cff6612e688bd3d6/
       sh4 |         gst1-plugins-bad-1.2.1 | NOK | http://autobuild.buildroot.net/results/1022c68e708e3985e13d10f8493acf34f0cd92c7/
      i686 |         gst1-plugins-bad-1.2.1 | NOK | http://autobuild.buildroot.net/results/49674c8a8bffd15a2e083170172152006f932723/
   powerpc |                iptables-1.4.20 | NOK | http://autobuild.buildroot.net/results/90da2c93a83361efc257ca165186fe20f772d684/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2a2eaec90db4bf1ddf8526debb2a3f95318c0fab/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2f7ba4925e4cdb60198ea3d070e00898f344da7a/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/483b1b072cd9a0ddbdbdc10adaed756bd87cfa8e/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/3610bc6ad3638facb247ac7121eec8b0b454f53a/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/5552e2bc31494c9800931fb01be5b6626cdf5bf2/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/1659f78ac12f7d414a33cfef7aaafe1a65879f41/
       arc |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/6854c06c8e69730eed54373f0bffac94acc20a3d/
    xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/18a01f8898c080dd6dde6706dd590eb7f5939c81/
       arm |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/f5b2c38d07d8e855d55a918e12fd639f0f98ea0d/
    x86_64 |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/cc4a0f399d50bd6b4832c86c220a751ada90530f/
  mips64el |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/a07c1825a5295a8343cd89f0901d9a74a764d804/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/d5ccd68d4a41774d16be01039ce3025af97fa2d8/
    x86_64 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/b57e4f3a4bfaa9862aeaec8ed65f6a8a608d68d8/
   powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/b31d100556bd399e543287dc12e108708aed0d0e/
     nios2 |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/608b1a511d7fe08917ded2b69be9114b931f61e3/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/abeba4e27a3add54ba732662cab4e76402626089/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/2d8a11d156caaf04fa04dc386d14a4055aeb8ea3/
    x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/755437c4994aab21171e55b306059bc294589536/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/c45bbdaff6cff56b5646add38032f29bb5520f16/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/00f2b6e471b66f80718f8edfd20988ad7e4ae3f4/
       sh4 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/21b5a910e6a27fa1cb12d0002ffed7e6ed9d6c83/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/789c9d424ec8cf57e7a96aa567ffad0c089ffb8f/


-- 
http://autobuild.buildroot.net
