From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Dec 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-04
Message-ID: <20151205073021.C9CF31024EB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-04
===============================

        success : 213
       failures : 271
       timeouts : 0  
          TOTAL : 484

Classification of failures by reason
====================================

                     crda-3.18 | 67
                 pixman-0.33.4 | 38
                     flite-1.4 | 18
                 libeet-1.7.10 | 16
                 libass-0.13.0 | 13
                    gcr-3.18.0 | 12
             lttng-tools-2.7.0 | 12
                xfsprogs-4.3.0 | 10
                  gnutls-3.4.7 | 9 
                  ffmpeg-2.8.3 | 8 
               wireshark-2.0.0 | 5 
              alsa-utils-1.1.0 | 4 
                   bdwgc-7.4.2 | 3 
              host-cmake-3.4.1 | 3 
                 liburcu-0.8.7 | 3 
               arptables-0.0.4 | 3 
                  libnspr-4.11 | 3 
             bluez5_utils-5.27 | 2 
             util-linux-2.27.1 | 2 
                directfb-1.7.7 | 2 
            netsniff-ng-v0.5.9 | 2 
freerdp-17834af7bb378f85a3b... | 2 
                 dropwatch-1.4 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
          modem-manager-1.4.12 | 2 
            libsemanage-2.1.10 | 2 
                  libssh-0.7.2 | 1 
               libbluray-0.8.1 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
tstools-08f6be304040e7b8476... | 1 
               libcap-ng-0.7.4 | 1 
                pinentry-0.9.4 | 1 
             fxload-2008_10_13 | 1 
iucode-tool-1cbd73013cd4c6b... | 1 
make[1]: *** wait: No child... | 1 
                 fio-fio-2.1.4 | 1 
                     mc-4.8.14 | 1 
                      qt-4.8.7 | 1 
          binutils-arc-2015.06 | 1 
                iproute2-4.3.0 | 1 
                  gamin-0.1.10 | 1 
                   erlang-17.5 | 1 
                 qt5base-5.5.0 | 1 
                  nodejs-4.1.2 | 1 
                    dash-0.5.8 | 1 
                 setools-3.3.8 | 1 
            gst-ffmpeg-0.10.13 | 1 
                     tslib-1.1 | 1 
             stress-ng-0.04.16 | 1 
                  gauche-0.9.4 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
             host-nodejs-4.1.2 | 1 

Detail of failures
===================

         arc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/a8cbe0c173fe17f373c51d19eb4df6d5bfdc663d/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/7af1cdd83d430dc4bd8037a8f0eebe1d2810c70b/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/d79104081b88511ea642714ed7520360aeff2f7c/
     powerpc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/45f5339dcaa946971ecd1ccb1d151fecd8da72c0/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/1e6b243c99a9211d952c6c8b90dd69679bb7178b/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/32884d935cf2cd5f398f8bbe696f8db56f0c5ac0/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/d5c2a006aef96990a6e2c1f12da8f18310b953e5/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/7cab95f1b7c4f3a3826f450c31f3b6d6984471c5/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/1db49299c2af5bd31f22fcb62eb9df16d400f177/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/02542eb56c24232eb254aa2667f6f1fa52bdd1b9/
         arc |           binutils-arc-2015.06 | NOK | http://autobuild.buildroot.net/results/1c71011bc8f2a46f60706f240af78fd88b8c8eeb/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/152d94c1585e183fe03b4e9cb33671bd32752042/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/99e0d8b7a0d3ed8e227ca7b8dd0787a9668ed0f9/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/407b2b8fafeddad8feb0bdf13f94a118dea44ed1/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/921d7f05dfd7e5e636e3a1db0565c35b5cded232/
        bfin |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9829c588501734d4072814e91219969c7e41da19/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f22529ad935ea4f3208c52eca64a59ce7191e8bb/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7609964c9958a6a37abd028f5ab6fbb157259cff/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/28caf4c24e8b4178a5909c1fce915a3e56b925ff/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5e1de7fd0316179a80091c73c2985764ff9499bd/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/29025e9a9b3d4073de6a4c7a26525a7b5b8e9bd8/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7aa01d703df3b1e012bb9495d4a9e29c8a5f837e/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ecb4022c6f408d54e8dd8cb7151577dcd476eb08/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/da37096aa67880028e59b755d3e3adf62139607c/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e775fe8f0c40ef7f7b0ad35d5a43287d9c169901/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/0cbc2e0030c48e2a597a1f24a8aafebd1fe8cd96/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e7dc9dea8fb45660e65b0d5e6099d7d472b95afc/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/427cebb011e7146e1d718d6c3b0ec90c7098bcbd/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/d9c2410841778062e3ca244fecbaf804c1659ed2/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/516a2ed44b2301efe8f0806dc03d7f89acc1e3bb/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/0b02745c557eb7912d300e51829d4fd59b1b1eeb/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/44b343f839dc10e3de0e791a247dfc0b9cf3ed54/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a2f424666f0f54c4a15998e7a05fb8510c85c621/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/3b4127bf7a39dd10ab626f8d98fee13bcf9dbf95/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/54dc5da74b0cfe808f6423b923a446eaeee6182c/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/10d191d0639c8796bdd321c1269d9199ddb6de1f/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e8d0985814927302c5e7f321573bb34fbc506bdf/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/469da5cccc83e90d2969d35c39c7480e2a187c4c/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5e21d2bdb4f3a53771813b17a79bf0f3933f2754/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/be8334c505f7521225ea4868adffd3e18c9e0f11/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ae4153b340d771ba926aa8759553254ce5346205/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/fc6497ed9ae2b8922e98547e3e6857b5822b21fd/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9e6ecaa745a0faaf97219216585f7de4be3055de/
       sparc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/336df3a544e6a68548ed9898333e5ffe78fc0c25/
      mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a49fa2b31ddc6ef41bea86f4e2a2e030bac85b77/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7edcdac802f402bb7b81ea12e9abc2a11652c391/
microblazeel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/4e3a5c324417c6477ba0a21a49b353667c4ad584/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/26a58e0265c9343088c0acb3e066cb92fafd7e3c/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/446dc2588b477ba164ae9e45a018066c3f739ade/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/660363b821b603f563566ce9d96421bc89b4eb57/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/0184eb8583b659019f3af6d131beb40617e9bee4/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/2983dd6a8e84094754271a2cb09727e8a1ab106b/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/3b0a34f7b0b6066c91fb829e9a629ad8b3456e98/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/1fc793027b70831fe4ece04f4158185835157070/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7258bb0dfd759cf740bfe83c38092755de580f0b/
     sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a69000399e402e45d03c97c87669aff4e2e62de0/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e0438d8371a5d71e85328bc6c765cb1e70a3aee8/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/0c540e8251ef6c4a6ce03a82b800ff51f1b66a19/
         sh4 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7fdb6ae30032590fc48366d33900cfbded906cfa/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e11ce20065eb3484e80545b38440d54f988feb33/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/d890c18e0dda86c39b0446c8b3495cbdb5f28dd2/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e8478f8554107e42ee80d9e073c6412c94d300ce/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f960b39fccf82c2f6a2e851a0f25dc2f3b94d90a/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/06bddf81ef421bde32fc1a5cd83eda156664bad2/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/54e677c9b8369b1ce23387afc1a3a479632ff256/
     sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/14f19c4ae5c10b85077176d62fe2fcd309255187/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/96487d7947f2dd1bca0071567abfcd422dfe28d3/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f058f21ed2c06974e3b7417a3b529a9871100e99/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/35b334b41131a58d8121638f3b6196403c073568/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/124f9ac1ca88e897f04b1d636add682a1fd3c7d0/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/1f15b516861ceec9c03b6087bebf4a1a95b0c9f6/
      mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b04a5cee1fd814d5836ec49fb0ec952d72d6e390/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6cb21bbceb860c0763980b91278811e81c26fb7a/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/4a70e86c4b7abfa10da557e3fd4ca46dbe5840f9/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/cec16f927b7f781e603b899c9408db91905f4cde/
      mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6487203691754676ad2fd161c87728ba125144f7/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/15003eb3eaf340d3be20a7b1d50ab89b5294f3f3/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e11a7f73c42bf805eee637c01da021e42a90b44c/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b2e2f6ceac8ed291eb23249279016b1fb68a3e89/
     sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b5a53ff5daf438646b8204acf08d39d923af397f/
     powerpc |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/7f3a8511231e250113f4f270f2c9ba5735bb0e75/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/dce528c15999fdac0355fb17bbcb8e085954506d/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/8f190d6f632f6f0ca5ab000d52e8e240fd7f3b8d/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/aa4a2322b729e8730f13929748bdf677b5ba343a/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7055810a86748350fff02d9e461a821a7c351a1f/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/cea4831f5d261a5ea1f92a605a0665fa1cce18cc/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/16bfbf530e30bc89518c431a2258efdc8cec984e/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/6dbf0dca90dd197bc2b6d3e6d41027079dda6767/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/7d3a22420e0dc079cb773bf0e0e351c5d9e2effe/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/d5b5043890fb2716702dc0a8be0b67542046817f/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/767438834ac0756c62cfeb4ad04ee8a473683968/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/11d0c380885676641c3c63e3bbbfd3e35c23fa9c/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/6b6b1ac08f0fadb3d63866ad9e6140168be32c7c/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/3d7a0e4f0f13906f30640c54961d11325cb0fe3a/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/6111cdecc75b9ec837251254ae84b096328a79a4/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/9a68f19f6e8d35bf3436e7ae4ee1864c6f47b771/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/105c2ff34b77cbdaef10ce1d3ace1ccf62449a12/
      xtensa |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/13af341f04d48e8963c30a1a31eb38ba46ef95ad/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/bb06439be133d9afa9ea95d5f33b164c78dfa523/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/93483ab1fc4db14ab7bee2646367a000dcb3774e/
      xtensa |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/22b63994468b39e5af375940dca6f60b5daec1be/
     aarch64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/68aa8b06e60f3cb252c0268baeb9382bb20f829d/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/04dd280864e5da9ab89053c4b06934ce49fc8069/
         arc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/d5dea18215ede252f7a3d35d276b42d6117de4d2/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/b50bde486e80a942f85067b2efdfcaef02d9804d/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/e63619c7e93be600a042f97a87c7b11cf23a1e34/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/2a78079f60b9127e020d2c8afb21a5373e22bdd5/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/e6e9fd15d28161f9cfeeabe504b492e700105978/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/038069e767d89dd38f094035536ec13fdee189bd/
        bfin |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/71a92826d5fa4da78f22b65734fae7a553a9a1bc/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/f8a9fff89e8eeee258d5bbe436be1025534d2cac/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/a0d0381bb3aa20bf74755c12f2d5d026c3fb3123/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/f3b2029e83ec9bbeedb64dc41a8a99226a54cd33/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/9eb879389aa318f09583a4852aa54538083db112/
      x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/e5128efddaf6b7b8ff46d3650aef4bf3062902de/
      x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/9eca1afeefbe2ad1cba35760142878ba38ac9f84/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/fd2b948a4344bbfd17bb0a6a4a0ca667ae85633a/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/8d06ca328248c8375be3ca5aae07fd2050045d2c/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/22328dbe8ea86c59ceff3ba40da1d9ef39e10533/
      mipsel |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/bcbf1ceb93b503df9ac5c8aa413994996ca22e2d/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/e614a9e3368416bf77a19726e5ae193514898e7b/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/1240e0911715c31e89c5ab59b14cac7448a35659/
      x86_64 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/88642e16f3c40d9fb72f84beaab06e188f10f4ce/
microblazeel |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/7ab2f21bebdd122abbaf3cf512d42583ac91e092/
        sh4a |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/f92bfd8784e0f4a21e9bfa334ad2e9d38dba0c14/
       nios2 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/ef57af16cecb986e64c5a36f1e7eca3399fc4d10/
     powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/e7d76d263258bc3a72af3845f1a2bbcfeb971c2e/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/2592b366171bbc7cac80762bd2187ecf453fe2bc/
        i686 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/894af20dd12c6271c15a25a823891209206afe5d/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/dd4a2d5aa308948159853c57a4353947e495aa70/
      x86_64 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/9ac472d790fb34510c49a3ee99467eafd5a8fd78/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/fa7579fdf0256ca247ddcd4134be02fb9d93b4f5/
         sh4 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/fdecf9522dfbde16eebdd0f2448f6641c387c93c/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/2d98fced7ff7c3b5c39a97eb1c8db7dd651fa86c/
         arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/96f33638573cf52e7412123d12f41ded5c29e13c/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/45bd7f5b7094f18ae71e3d2bbd74650b85b61e2c/
         sh4 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/24d00eb36862b871cc7783c96eb53b9552a799ef/
         arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/d1f40db31881d6d4711e8474427d7d5ba134b81f/
     powerpc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/a89ca46877d29ca39de740fc2551df64dbb5051e/
         arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/6135d3716170f4ab9a6583c6296a61ddd35e6ed8/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/3718518b90038a89afc941e46a69f21f704035a7/
     powerpc |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/5fbce16f4575c18c79800a59f42352f26e21e9d0/
         arc |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/1139805eeb2c0e9e424d9e147dc8defbe680c486/
         arm |               host-cmake-3.4.1 | NOK | http://autobuild.buildroot.net/results/b9869729e3bf0824c5393e130b4872acd6285c46/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/eb145a2c5ea255a0e37f0e713ea981df58d78b8a/
         arm |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/b4665d8c79b38f211a0993f70df4e990b66c5469/
      x86_64 | iucode-tool-1cbd73013cd4c6b... | NOK | http://autobuild.buildroot.net/results/a85130f66379f65be7d097dcb07fc8f9a66eb38a/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/55e4d427a99bbe605e9657b17e2fa01e148f1e43/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/e36fc58e509cc5fe66fd4ad9728ac813eb174f76/
      xtensa |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/b8cf556b685b0ed00d26d14e021cf0060e5db86c/
      mipsel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/3a4c07a0a54d5497fa8a4be2191856e286729637/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/654319a8042e80d93cbcf81b24fc76f329bf1ca3/
      x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/8ec00c8c9572822ddf5d50952a772c63763c3f6a/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/78d2db9b50c543073b5af2d4257cba1918a73382/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d079267b9ffb590ecdbb1a3dffc40710c5d86ae1/
      x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/1b9b962f37cd31ef763c8efc429a5bd144da3cde/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/e7580ef71b4768aceca85a1a7890243a3861c7ed/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/4bf4acc69b5bcb8db064bf7d704a23e1201c4e18/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/30cc07fc205e635551d68de75a37e5d3781227b9/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/4bf145e5fdfa800894dbee003b0a001b3742170f/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/7bd2d04e0e86fd2a1c2aa69832ba39a463ee56e1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/485d4cfd95b2a29f10af05629e712d8bd0c58b74/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/2737c982bbb254e61bce4d2c9613ea31e6d5f99d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/6d10ee38e5f3b24df10f099e72b9dc77009d07fa/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/3004ebe060f6d142196d1ee36274c968223de95b/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/b6eefea2b536e1d25b72d200b64cb14b0ed5f098/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/06c2dc34035a2b51e2d93d1be2678d09ec1d765b/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/e4797b366a0413a644ed6df1b2e42035e9758411/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/29ddc771cd851d0f56706aac9dadfeaf47d9a9a3/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/b22e4267125e79e1ddbd5c75afb5c488b69f2771/
        mips |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/0297c695f4707b6da093b2bf5550ec7993c61973/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/3738712c370794c33bd0514f0e62a5af91770779/
        sh4a |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/33f29c0d7dc57cb6fbd32266a33e853973bba8dc/
         sh4 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/32ca5a4cc3a647d6df41c44cd0b4a6c6874c8ba5/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/cd1236e903bf3e281be2dbf063029c45dd239e4a/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/3d6d7db36cefa381aaf4c756c07b77ccc5a467aa/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/bd3a9fa2221f1c9c5bc87aa1acb81b0d40f5ea02/
         sh4 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/6b3c4c9a0e9e80b84e1e0a3f32a17bd965d54d4f/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d70c177da5e2f723a5d5bb6a0b9ec5586fac396f/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/1c0083069055d7a95e06743012fd69570041b9e1/
      x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/85ae0643905ae1943d6d5d0fe8ad224982e5607f/
         arm |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/1cbd60bcd373bd8b22534a26fa49139c5dda9c81/
         arm |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/db1f132d3fbfdcb7c3c48d0d7aa894cc7abc16fa/
      mipsel |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/f9833ce60ca40eab294a6817ad07584cbcfa0aa2/
     aarch64 |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/da5dad442fec21365a7d4d67d5654a82c7ba4c53/
         arm |                   libssh-0.7.2 | NOK | http://autobuild.buildroot.net/results/7ba9064831b5b5de8db77bbd8b23e0ae4a63337a/
        sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/78ff8013fe965fa48edf14ce603b8c4851ac0767/
        sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/3df62e241e6da30e4bdca1c053a4a209e2cbba7c/
microblazeel |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/8295b36367a51299698872f65d1672ba876054d0/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/05b648bd38af0bbe212366e5adc48b14d7383c03/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/2e79b70c0b6bb798c9a2641762f5bc6f000cc005/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/cae8215c32c53e52fa2d60a2a6e1f80c4f9dc06f/
     aarch64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/3dbaa59d225e93e6e52ab6e0d4fa4b4f0e9d7620/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/ef89e570e66560ebc6d5e27585bea41e29d90e48/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/09932876190d5593f11e77ae478e0a97697a1999/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/f4f0dcaafe658a8c631bb9789b8d8d4555d1c776/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/e704190450a83dda335992dfa1f5fe445d808619/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/558ea318f0a38a367cfa0f80634a762185d48348/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/3da300150dbaa915942a70587bcfa9787320b5c1/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/9174c3f7980fc354d2f4c5111c733f9d611c4488/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/5b92fb5cdedc40582f2215cba157300ffa2a16dc/
      mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/861310da97825cee18158e7e62622dd60e26316e/
      x86_64 |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/361c77d5baf0bcfc700aa721f0bdc905d5d645d1/
     aarch64 |           modem-manager-1.4.12 | NOK | http://autobuild.buildroot.net/results/e40d0084dd592a346f039dd783cc3c2981e74177/
      xtensa |           modem-manager-1.4.12 | NOK | http://autobuild.buildroot.net/results/682637d232904f0035dde2f7ebd95852e9794620/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/886da538504cb2051b619ab61567de9caa34e6de/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/dc589d60cdbcd8985ded13a94de1a04b2b687f31/
      mipsel |                   nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/91085faa51d3dcc3adacae1a6c33e6f4a51b89ac/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/9c26ebd6b13e2e98f0df7b7f4aa89360f29fe0e4/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/1f96bd7f1eb6a75f44fe2eadeabd3269453f554c/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/dbd22b75433ea4c98dec074e1bc9e10a4bda3d80/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/9e19f924e4387eded49e36a343542781d3eaf8b5/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/152100a832386d2fd33fe3739c2425219b900d8e/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/59bd75f229592a8b704a7cdbef7b84449ad2f9f6/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/99ba2c0efd5297f9cb5937d675d0df4beb0d04d5/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/deb57f924536d257c1eeb47a271904960c112bbd/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/e87c3351ea38dc7990d2243d80c10cc47899fcf9/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/969313038c1be5dd7daa852bfb8e3ca61dc352b6/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/b9175a628afe15fcf9818028828ff18c04c8ef86/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/4d3be10cf92688d7541f98339c67e28134b8142e/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/b762e653a0ebe324fdac13ae0e8a8a49084ae94a/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/04dfeaba14a67c4fdc7fb7c835c92a985f418145/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/bd00975b2b498181a24978a1f6c067dedbb620e9/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/e920b4b57af7ae49e105f2d567f377e6cc854324/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/c786fd20a361108b03a101f7f0fdb1264ca353d6/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/33c9a92cff31d2f106fae03c0cc0c5d9bf4cccc6/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/157a239ea22c4691c5a7f9120cc2ac4f707684b9/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/0d8251d821b928b4441cce0321ad1937f1987802/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/99d5b3fadbd3bee954c2266cd93c36f4a4ff4e99/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/22f09d86df042e81a975f9e1e926571059f76206/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/052369d843fefa8e549db0e67b1f0b1364eddf61/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/34c0f48d93d07c540aad405a79486d1d95d6b26d/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/47c1455b7dac452c5765dc9b4b4ba86e473deefb/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/d5c574f243f853f803892aa09bdd52b341badc9b/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/12c1a51249458ed0733d5de01c6837ca59ee34bb/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/4db5ae28664c9dde42da173ab35351263d988d85/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/21414eda52f811783f4801120ef1b0e41b97c25a/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/da461438472c70102e21cd3526ac4f79f66f4ffb/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/b1b451bc2474f4d3feadb8352acfa6565008ff6b/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/8895c59366584b7ebaec01b34ba40699b5dfcf0a/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/84232ef86f69f9c6e0f0973e78467d7b70e0552e/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/b2ebe2c8fb095fb45475123e366e8494b3a16225/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/1694c0c238e9d9db0131288333858dc2b8f8571a/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/8c657fb7f313f7aaa7435075ad3373da15d919f0/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/dca84607da6b1ce37532fc8232033db42b8ef065/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/db64c00461f09d526dc6a7bb26c79bffe1503089/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/e573bdfe7ccddce2726ed3567145be1c3d828e67/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/72f56e3abd5b66ec8a6c046cac3444914c0adf03/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/afcb0c60d9c80e37bef14f933986e641aa660c35/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/183f25c716c5f3182baec75745ed040917e96870/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c3406bc958b8379dd70c124cc42223ab9afd7769/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/320feccbc19b3ef41961423385305537df96a042/
         arm |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/0457a166f58297748983951af4daa60a6b0b0d97/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/01bd753a6fc9bdaf46289053ca3a9efccf189d18/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/049ec60ea056dbe282c49209b14fd06f4cf48f44/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/5e18d3d2a4a9625760ac96d6a1dd23cc1df0b854/
     powerpc |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/5d640f9d3d42895dfee3891546391ac37b0ba3cb/
        i686 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/e09ed38665a196dd81beb13981658de81a72d734/
         arm |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/360c3279db2c9a613473115329a10d23a7e1e80c/
        mips |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/6e3c5e2bb04db10d4c08e5e19755d128732639a5/
         arm |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/bd07cb2b601ebfa3d09f88923dddd6d501c30135/
       nios2 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/0649bc00b563d77a3ed32679ab4e21d428ddaff1/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/b98e389a913092eedfed2ab0b4bbbbfa3b8e5444/
     aarch64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/c48452a5329543f18de490621b0f8247760875c6/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/0ae9605b5dbc8be759e94e2279d843e236a4b8ab/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/633f701aa1a8b3c368defc48fe8ad7b0efd5207f/
        i686 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/8b7d5b680138452b1d56afd213f5472d81f16a1a/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/752419880343f7cd7ab96bf752a445689baf2aeb/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/90cb3e5e62c04ffe7e8599284de7da59ed3e0bf9/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/8bd46a0679cd0f15f458206925730ed494b77b2e/
        mips |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/6f27b68ef641a7ce8e2d7eca3ab35fb9ac061ba4/


-- 
http://autobuild.buildroot.net
