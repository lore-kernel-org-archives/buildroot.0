From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-18
Message-ID: <20151119073014.0017E101A9A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-18
===============================

        success : 136
       failures : 45 
       timeouts : 1  
          TOTAL : 182

Classification of failures by reason
====================================

  toolchain-external-undefined | 4 
                   mplayer-1.2 | 4 
                    ustr-1.0.4 | 3 
           libfreeimage-3.17.0 | 3 
                  qemu-2.4.0.1 | 3 
                  ffmpeg-2.8.1 | 3 
                 mesa3d-11.0.4 | 2 
       kompexsqlite-v1.10.12-1 | 2 
                  mono-4.0.2.5 | 2 
            libserial-0.6.0rc2 | 2 
             lttng-tools-2.6.0 | 2 
 make[1]: *** [all] Terminated | 1 
                coreutils-8.24 | 1 
             util-linux-2.27.1 | 1 
                   erlang-17.5 | 1 
               libgtk3-3.14.15 | 1 
                  apitrace-7.0 | 1 
                minidlna-1.1.5 | 1 
            xapp_sessreg-1.1.0 | 1 
             host-nodejs-4.1.2 | 1 
                   mpd-0.19.11 | 1 
                    sdl-1.2.15 | 1 
         conntrack-tools-1.4.3 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                   slang-2.3.0 | 1 
           host-openssl-1.0.2d | 1 
                  gauche-0.9.4 | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/ac790191127cf4d8b19d0c7c640981264772f503/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/3d36403ba80089faea5dd06bc7e4414d593bbfc1/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/0b29531f2cdf6d141cec5373fbf876e7fb9961eb/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/c1cf967adb6014e3a15f0dc75dc1aeebf66c6d1b/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/1f97a7063ed9cbddc893b82595966748ec2c9784/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/1383e403bdc92cfc42c768e593be263657bd0392/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9d7d38093bef41961484fa728f928db0767e6c03/
        i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/93a11a24edc999ea129922ab1505f65a110f908c/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/79a6d94cbe221592b943e7b6dc957537fd94a307/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/3fd1d18f0535bb8b969f808a5837c4a8111e69b9/
    mips64el |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/4deb1c7b901d993fd4b50142fdc972851837caeb/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/ec82752a6b20ed92beb703f68f591faf27b7724e/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/763d9aff86085b67077fc665e462cee81962246d/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6adb592c80c8cc32abf2c16f8cf28ed372998d69/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/1bf04bb4c3266023bed2753be41f7ad3fa7e8cfb/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fff9b710f329320e535ccb7b8026984932c17d9d/
     powerpc |                libgtk3-3.14.15 | NOK | http://autobuild.buildroot.net/results/aae4266c16189b295cc7ceb60000c504ebb60752/
     sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/a8dd84320e98d9a5021a7d9e69be1bd48352a55e/
     sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/5caa3a9566acf21f10a0ac2b66196fc8aeb68f38/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/fcf029714e5ba93049fe64c593ec048b2452aea5/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/0f1e015a0c5a5ac2beeb5011d31a1e0058a32a0d/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/6e4a9ede477b031f47f7e271c38f67f432a3573c/
         arc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/6baca535cf492f23112e39e4ced677a969e15d64/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/5b50695350b48cff6ac2eecd4cf9d7b2fb5c1beb/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/e31d8f707ba7e976c84f860cbb944946146ef940/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/8502e0d7bf88ab417059eae38c30ca629baf3077/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/669da3f122600ada97f47899ab6007d63d72b6d9/
       sparc |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/8dcf5f73904de835bf66c46747cd544efc9d3a22/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/963fc29a13ac5eedc31a6bc7fae3cedd22df2fcd/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/cb0fe5b1c1dcdaa17b0290e5f1dca4bdc44036da/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/69a31bd69feb00da37cfa692ebe2f70ebf7e6092/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/dd599d83135ab25aebbdaf20e71d57075c9d5956/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/6ec4ed18cfaf46a0cfcbab8f1cd91f51aff72ea3/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/84f1cebf5d7852326b26775c1f533c34109ce3f6/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/db15632598d65044e63bdfe0ec4143db75a13d7d/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/73330e51b3c099d179004db0b9522ac13358b8f7/
      x86_64 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/bc3cca6e6a906afa4c57dcddfb4a9ecd0cb44398/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e279f503b9c9d91e40b4009ff56f6f8ddebe10a1/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d6731774fe1a459dc42a213766ffba021c4e3129/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c0150ea76171b5b068bf3a1f58e99ad44a48e2d5/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/422e226f6c83d51fc6e4dbebea7ab980856050d1/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/150fa803fc3b65f75dce2847907ee768fc94c7a7/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/fc97e1ac52d40ced6a5f9cd980d7f448c98e5c78/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/64dac2a7e5a757ed23060c550b7d56f54659a368/
         arc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/75960db671807091fe9155aee9e46a6245e32590/
         arm |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/420aa5dfc4dcac0f2fb4c7305bf42c249a335084/


-- 
http://autobuild.buildroot.net
