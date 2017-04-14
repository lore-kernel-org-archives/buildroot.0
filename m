From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 08:28:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-13
Message-ID: <20170414062816.08B1F20863@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-13
================================

      successes : 244
       failures : 59 
       timeouts : 0  
          TOTAL : 303

Classification of failures by reason
====================================

                libselinux-2.6 | 17
                busybox-1.26.2 | 6 
           uboot-tools-2017.03 | 6 
                 xenomai-3.0.3 | 5 
               hiredis-v0.13.3 | 3 
             rabbitmq-c-v0.8.0 | 3 
                     php-7.1.3 | 2 
               pulseview-0.3.0 | 2 
                    qemu-2.8.0 | 2 
                  arp-scan-1.9 | 1 
                 binutils-2.27 | 1 
                  boost-1.63.0 | 1 
                    ffmpeg-3.3 | 1 
                   mpd-0.19.21 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.23.0 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                     pcre-8.40 | 1 
                poppler-0.53.0 | 1 
                 qt5base-5.8.0 | 1 
                  samba4-4.5.7 | 1 
                    sdl2-2.0.5 | 1 


Detail of failures
===================

         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/dbbbd5c30669e733f281125fd531f05f827f55f6 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/a6c05eefa329bfbaa7710a1f73891b7427a4f30f | ORPH
        or1k |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/d99f1f8dbffb7d96dd962a498ba9be7b6bd90238 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/b6152a6ec26fb27fc3db6fca7c4cde0042990392 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/4c71c0559575f9e1bc36875eb86256500e22aa71 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/03df65770f460c9d97efb828d4bd789b098a159e | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/b904def9ea44c2e1de6400840c06d09924a58128 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/3c2a8035e932bfb06431c72cb24d49953ef49d2a | ORPH
        i686 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/c05d448d44c7aa786b58ffccea71e0d2a3f22802 | ORPH
     aarch64 |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/fa46003249664b1f97f6c18253c84cd3d6fb9cdb |     
         arm |                hiredis-v0.13.3 | NOK | http://autobuild.buildroot.net/results/23a50b2d38f9914bae82357a3db367d0bac42b69 |     
         arm |                hiredis-v0.13.3 | NOK | http://autobuild.buildroot.net/results/c2901a4e9f5e7447b10fb1eb60c56bfb66e6db73 |     
        bfin |                hiredis-v0.13.3 | NOK | http://autobuild.buildroot.net/results/12dbf91cf1ab89fc0e233dc65e4bb7df1c4a4fdd |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/38886eab38bb8a6a7d5b069a109ab333ec869ba0 |     
        i686 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/a25474b0a195971809b202c421f87c63eebcb3bd |     
     sparc64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/967b74d0ae5b4b83ea2729217b005a3e1e4514d0 |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/6bdc919fc20463fb3d4014aec1f75f0e804a0375 |     
      mipsel |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/f4c5e26936635009827ad969c7f103737757d104 |     
 powerpc64le |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/e737054655611cb3a890891b20d2e79b6f055868 |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/14d175963739cd77a6efe01687ab073ceda8bdb9 |     
     aarch64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/557b6596c7ade044ca4f0de77842311938942b3c |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/03c9812b53433603ac9c76725b32ea5ed7f2a686 |     
     aarch64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/7d731862b64a427dbae079e22235c0accd86ce19 |     
       nios2 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/e8eef0791eb80ace36369ab8212d1d02dbd6c4f5 |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/f4b8decfb464e9a6e287637e4cfb7b31d0871df8 |     
      mipsel |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/f7e0d2a9e641848d5cdd7381b4ac06e66e079eda |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/1d3264c95ec5ec279fd4786b5b5b5e5a74ae529a |     
 powerpc64le |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/3b7253beb0059c5fd10aa70a0d20d4dfbb6747a5 |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/6e3f4d4d17735a874a8cf5025e6d601655dd91e4 |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/099626e02e67c942170cfda5d780f0152fba4459 |     
         arm |                    mpd-0.19.21 | NOK | http://autobuild.buildroot.net/results/cf0e856106f967c92e9864e0b6bf25e6db19a156 |     
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3639d5f8e941ad9ca35305a968d869802bc3a2bd |     
      xtensa |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/38426499161c2afa8ab92911d515f7edb5b097ae |     
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e2197a4a543db66d820e07f9e2adb319016005a0 |     
         arm |                      pcre-8.40 | NOK | http://autobuild.buildroot.net/results/11af2c0462a6fdfa3723cf6c4c3f659972998224 | ORPH
         arm |                      php-7.1.3 | NOK | http://autobuild.buildroot.net/results/ddf49d1189af21a93d572fa084450014a33316e7 | ORPH
         arm |                      php-7.1.3 | NOK | http://autobuild.buildroot.net/results/940fd8059b74398ff1cafd44215ad265c0925d60 | ORPH
      x86_64 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/7465678f6d8d29f13d78f304c0e4aa33601871e7 |     
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/5c72876450c58a15cb46635a9c0bc216c787350d |     
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/242f955edbca6ab1a0eeb447279d9823a695117c |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/287016372959909ec4a8795476cc0a8bb9ca98b6 |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/908422ea670b14dd6e3e212a5e4201e0c9cba1d6 |     
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/428eb99bc79b5fe673e1b75f9f442a9d75e5ee89 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/1a7a7504992de5c34edbd832dcda9eb22c01c8d5 |     
        or1k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/958b397c9883f4722368ade6c60a19afbb00a105 |     
      x86_64 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/c031bbb06833be3efc37f46e5a6ca4c26732a916 |     
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/e542df3d0935ad4f86835e5f5537a2fbfa07e694 |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/93d524e35af08036afc1ec0c2cd711cd1ef2789d |     
        i586 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/2f677ac6b0d6b949ef75a1d5f06c69e909e6d1d6 | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/0fa91bf5cf6003dd1498b38ea25c344e41aa2023 | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/1dfe06e3f42d06fb6b58e50ecd6e9a13303ece9f | ORPH
         arc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/2a596baeb95bc9a83230abae8be7ac5b5b5eaed1 | ORPH
        mips |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/463a1da5ba920fc7673aa21e5a03483425a270e8 | ORPH
        i586 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a03ebeaaddf7b613f06e9dc63e1355a81a3c64da | ORPH
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/c4b992e1813e6b766ee6723dfc3a5513ec4bdf4a |     
        bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/49fa320e0254709079f140e750ee1e633e3941c5 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/f60d5a4ee20a7ce3ea8ebc12040753a22f0e0239 |     
      x86_64 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/0cfe411fb0f9e4c47c64516f2a7d149ae49b1d05 |     
        i686 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/b91f94cb2746e088a188a91431dda596110adda8 |     

-- 
http://autobuild.buildroot.net
