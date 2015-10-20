From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Oct 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-19
Message-ID: <20151020063015.114A2101605@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-19
===============================

        success : 171
       failures : 51 
       timeouts : 0  
          TOTAL : 222

Classification of failures by reason
====================================

                  ffmpeg-2.8.1 | 5 
             python-spidev-3.0 | 4 
                   dvblast-3.0 | 4 
                directfb-1.7.7 | 4 
liquid-dsp-df5a459fa05dba41... | 2 
                    ustr-1.0.4 | 2 
              swupdate-2015.07 | 2 
                minidlna-1.1.5 | 2 
                   mplayer-1.2 | 2 
               syslog-ng-3.7.1 | 2 
                  boost-1.58.0 | 1 
                   lite-0.8.10 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
                 jsoncpp-1.6.5 | 1 
                 mesa3d-11.0.3 | 1 
                    sdl-1.2.15 | 1 
canfestival-7740ac6fdedc23e... | 1 
                   bdwgc-7.4.2 | 1 
               util-linux-2.27 | 1 
                    faifa-v0.1 | 1 
                   nginx-1.8.0 | 1 
               linknx-0.0.1.32 | 1 
           qt5multimedia-5.5.0 | 1 
                  libv4l-1.8.0 | 1 
                    ruby-2.2.3 | 1 
                openntpd-5.7p4 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                libnspr-4.10.9 | 1 
                pulseaudio-7.0 | 1 
sconeserver-3b886c3dda6eda3... | 1 
             irda-utils-0.9.18 | 1 
                busybox-1.24.0 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/8dbed387ebcccb0891f58a3c9e5c24c55e8b1804/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/c53a82aa62b4431512f1354b832a35926d7ef6de/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/a199e1cb5d59ae862cb482576b594edae1868491/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/9b8fc8e1713df693728dfb1fe12e86992a4ae39f/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/9c037e845b8909a2225b54af35bcc11395548e56/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/f13f4c2436b988c4eee36146ac598a695c07b16c/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/232f2a26c1c2e09bf0f23b4aa9fb065f15e29de1/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/a08890b145d4ddc4a82cf2afd6a22e7bbdc5e1bd/
      xtensa |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/243dbf8cd47252ac6635f8b0d254d2a0040e71b5/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/180156f9cd2ee595dfbd028bdad4e43aa34bb8e1/
     powerpc |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/bfcea77e26fe3c781658284a5f1d60e1306929b6/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/b9d2b0f17199e9b63c2203e19ded9874880360a8/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/d611398a70eba438c7014a0d8df152fd8594baa6/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/1098229957549e3214c30846661ef9c58d529925/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/51b444325f6088665e0dbcd91af337ddbc5f1172/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/bec2235dc5ff8485f4f5aeb1a09bb68c3c612984/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/bd34d1d2f2d35455d1ddefa1ec247c78f341603f/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/4f7c87e47e763ce656c50b5862408b18e6f185ab/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/4c258aab2ade32cd14f3c9a4fb4037913d65884c/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/f9be8b2a041509fb4037fcf87ec6edaac6a6f958/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/5885d33b8d9f17878f565f3ae5371017dc89aede/
         arm |                 libnspr-4.10.9 | NOK | http://autobuild.buildroot.net/results/06d004ef8553d91b85f088b244b0d5f1c15f544f/
     aarch64 |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/8674fd8048f23060e9eb73599752866cbf5596f6/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/0fcd7246160592bb8789774d64c9ec9cba44b587/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/33eb0dcd846806a8a3f9c0c4810429020523895f/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/c24bdbcbdcfbae32135fd12454a2fccef1f4e670/
         sh4 |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/aca634dbed6d00511f6694b6f74be67e812b4da8/
        mips |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/5101e25cd27073c229ccd1975dcc1759fbf5fda3/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/2c0f29d7805fef16b12e2feb229dc939d6ee1ae3/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/04ff02153d14753f049bb59aead215e88d4bc1b7/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4e0a3643ced66e6a3cca56f14a77a8a73e73d586/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7003b782de3a3cffa9e5e1920d9e911cf968aa41/
         arm |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/9276050a91f46ffb6496f375f9694778a012f02a/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/f73b9c8a30e4f16178a2fb82e7a167588c16a10e/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/5fcf59aa394beb159b6a802cf635aaae2255fa8b/
        sh4a |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/b5c376bf397c24b793b882c06f5922f50eed788f/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/80ef3b16ec508418672d0b228d2e8c2c28eae58e/
        i686 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/14c916feaef2e8341aeff19fc5acd7eefebfe59e/
         sh4 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/01869bfa14fb5d98885e9bc8d59e34c3983933d3/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/069f564fde821b55e710fbe93fe30a5cf11a6da5/
      x86_64 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/403f39c2e07e1004ef82232ddf8d467bb9921f69/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/854280884a33929b8c6a3215f49e9f712d3667dd/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/256e9a097e177dd20251a9ba1e4181260ab26a00/
      x86_64 |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/57762ed3ef890d58c4119d51f3461913adcc8d45/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/954e176c0ffb513efccd5d6a3130956c4501c804/
      xtensa |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/445270aed4c79cde75d54d49d13ffad9d684c61b/
      x86_64 |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/b8224ea52d962c62ead367343d68bf98a4b9e883/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/2c82d09c642e07bc388c8dad4a1146c7f87d6b23/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/bc68aa54b5dd4314eace8eb39a6e31f1cdeac206/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/080727d7d51a15e35cd254d4be2b59f518f25f38/
     powerpc | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/d16c7044ace7f84b61edf1dde52c2229d4a5b65f/


-- 
http://autobuild.buildroot.net
