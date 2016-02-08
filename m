From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 Feb 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-07
Message-ID: <20160208073021.9FEF61013B2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-07
===============================

        success : 179
       failures : 110
       timeouts : 2  
          TOTAL : 291

Classification of failures by reason
====================================

              procps-ng-3.3.11 | 16
                  boost-1.60.0 | 12
                   fio-fio-2.6 | 9 
                     kbd-2.0.3 | 4 
               pax-utils-1.1.4 | 4 
                   erlang-17.5 | 3 
                       unknown | 3 
                 rtptools-1.20 | 3 
                   mplayer-1.2 | 3 
                      qt-4.8.7 | 3 
        ltp-testsuite-20150903 | 2 
               valgrind-3.11.0 | 2 
               libgtk2-2.24.29 | 2 
                  trinity-v1.6 | 2 
                 opencv-2.4.10 | 2 
                  gamin-0.1.10 | 2 
                 opencv3-3.0.0 | 2 
                 mesa3d-11.1.1 | 2 
                   tor-0.2.7.6 | 2 
                pulseaudio-8.0 | 2 
                    ruby-2.3.0 | 2 
code/CMakeFiles/assimp.dir/... | 2 
             util-linux-2.27.1 | 2 
                nodejs-0.10.41 | 1 
          chocolate-doom-2.2.1 | 1 
iputils-c8ff6feaf0442f8efd9... | 1 
              gst1-libav-1.6.3 | 1 
             bluez5_utils-5.37 | 1 
                 libraw-0.17.1 | 1 
                    cups-2.1.2 | 1 
                moarvm-2016.01 | 1 
                   slang-2.3.0 | 1 
                  cairo-1.14.4 | 1 
              rabbitmq-c-0.7.1 | 1 
                   systemd-228 | 1 
          libpam-tacplus-1.3.9 | 1 
 netcat-openbsd-debian_1.105-7 | 1 
                 libdrm-2.4.66 | 1 
                   nginx-1.8.1 | 1 
               nfs-utils-1.3.3 | 1 
                numactl-2.0.11 | 1 
               trousers-0.3.13 | 1 
                   hostapd-2.5 | 1 
                     vlc-2.2.1 | 1 
                  lshw-B.02.17 | 1 
                 setools-3.3.8 | 1 
                sqlite-3100200 | 1 
                iprutils-2.4.5 | 1 
                   assimp-v3.2 | 1 

Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/694d80c0c573b83b7470bbcc6585d5a3ec0274f6/
       sparc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/4984850d872448c5702eac79b831891f77ad3cf0/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/43f33992160115d764b492584b7a78fab3768c11/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/28b630fe767c4c08f64f23bf2f101205561ec126/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/69e44847e706a60a8357ed519be94934c71543c4/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/aa16885917fc18b78448fd14408ed35992e289f9/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5e0f0d68b9d8c9077b51b9e8c64330dcd3abd07e/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8db798c1d1a32400fd7aa14d762bddf9b3b6a3a8/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/29beb96cb0b17d780f9c14414d3c51476f20e486/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5b11cc7ec8f928a39376cd4b197ce07028c001a3/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8af6d14f73cce24e0113acf33a2be11ebebf87e8/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6adf1a632ccd274a67b069327f39974301b39b1a/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d90e8db350910bb3254e89cbbef05a26305629d4/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/79bba9bb029b8bc966e0e1b47ff31a2df83b5f3e/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/9047c0a5e5d9c2443c74378f28e07e8e302aaca1/
     powerpc |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/52fe7b3ac21adfa8b34341b64b512f1502d5a789/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/04bc314007dbe719771eed2fa6a50197acaa15a4/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/cb2a71af37f72cf2163f0fc60f34f479e5598a92/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/750e6042aa39a9fcf557ae6fe6610e3dd19fe5d6/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/a72a827aa5896e97995935ef76225eab896022cf/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/bd7389130a63c91500797f7843df6046206d120b/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/02b4e8fb637e2b1644aceca5d327ca9422e9b19e/
       sparc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/6167fce22dc7586e65cae346a2eed347f1c049ff/
       sparc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/3d084ab64d7bec303769b6b276f6980e4bc3d7b1/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/096ed7e20f1c033dd73d9bc33adfa8c685332277/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/578ae9da10d017ee9e2c15d37014f31a1114ef3a/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/b91e3ddf8416fb76f43a5e8795f59c7d39bfe7db/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/2629189e4333a9450269755b6cb2be64e3bd3c0d/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/6213b0ffc082f0214e94d2df5313cfbc67d2d57c/
       sparc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/692fe7999efb63a2bffee02f84b9f636afcfe5f4/
       sparc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/974651975a86d5b7669f83cb7e95ff61448671b1/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/b46b119d7a24f872c3d53bfcf0a69c5274d8a165/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/64c8b3b7ff6e429c3785f92fbdce5c0856e467ec/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/dc4def9469d692cc57f42b2ded854e31bac6d830/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/359026e8d9e2e0d312880067f3ea7e9745b087a0/
         arm |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/e83ef38ec4d2bdb47b8dcbb9a0c700e0124f44b9/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/19a2a19578c16ee590012d01bbfaa7ffa22303d9/
      mipsel |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/9910059b6b61ca5651509ad59bd218bcce0e0e90/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/9a519800f3f8bd78cecaf0b8cf9c885e77f75c10/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/4c872e6abafd12e141e3a109f8fdb3a8f4d2d09f/
       nios2 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/fecd05a3927566cf84122e477c6222fd34636215/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/55733eff848d0df1f6e09c2418df678bc1c2773b/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/a5e1550f1b44be9d0051ee92491f2563232d6607/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/9db5ace4eab4f1eb163c62f5290ae83e80912add/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/1496ffbf366709bd05423778b00c9e2f953d7137/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/6428063d66e0be7214dc12bcf24867065deea267/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/dc813793e01b913ef44511336967b0895605db18/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/6425f8bc657ddaedf085df04bf652ee34d5eae65/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/548bf62982287137f6d8fcad3a7e7bd49fd05d04/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/c428a725d8eb80c3e1ec2c59459c0854704ab1d1/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/70d18707fb8fa1918aff7d8d0752b0aaa4a7d6f9/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/3183fb1634aa60525e8265d3a42dbc7898d9dd81/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ae15f3410e5d3ba8308af19005f9a58127adac98/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6f109e4427399407696c4c093b79eaff7a7b947c/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5b2b4b72afefa487f75260bc09556297837ac1be/
      x86_64 |  netcat-openbsd-debian_1.105-7 | NOK | http://autobuild.buildroot.net/results/cc346861c60e33c904795a1553f7f52a0f5832a5/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/20883e61c50778f9bf8489999c71d89cc2ce8958/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/6f06d5c2fc208b580793fb323d982d89b15770bc/
         arm |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/314a0a937ede18ae9d6e102884a78d937a62cd74/
        i686 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/36af01fd857d3aca418abc03cbed9af6a7f9e446/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/94e29e135e15d5098a2c5434eb954708ca870d8f/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/f67adb7244491f3445bf44de57a43e11fa6aea90/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/c6aabba1b404924342c6cdb54a559e3fa65346bd/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/25ccf7b22dd954b553ed80b865cfa5b7720ea180/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/ed96b193b70792bc81b526da6ea1895657cf849d/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/278962c4618d7df21acd3d124b213e571c9ee482/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/b895bfa45f1ce00239a7b9e02a3ebfa9631a1989/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/3a4ba3d6c962638e212b5d495a3cf54d488cab95/
       sparc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/c123d54dd615bce05ceadbf2ff39b9c2f81184ad/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/7b4f25e5accbc02ebdc62834c24db6ccb7d8d8b7/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/9e19347275bf1693426218db2590b8f0caa4a8c8/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/4c9bf16ffb08aa8cb19df3ff6d5dae43ea698276/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/b22a9b399f83f3763d2dd52d0adf451f971fc4dc/
     aarch64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/16b96ebc0c38363feeef2df1d8029367c42a8a33/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/a33e2c80da0cfc41fca391126a3bd23ebfa53838/
      mipsel |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/790e494821b768ceb178316bfc19efcdedf3df3e/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/d6d8cc691a01d35f124b0a2ae6183a112b6f0b38/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/76bcdb59cc3b9f259e204a1d4627ea271e7ca5e0/
        i686 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/ecb33f7cf1e4299ceffc36aae4417e68f54b3b74/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/349f58178f158ebdbb082b5235e5d779954bfc39/
         arc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/e208ca11c6464286aa8b672683477829aedb086b/
       nios2 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/278e3a30173e241561336476cc484f1224ee71f9/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/675ebf7c85480b90b3a278dfc2e22744cb0bc179/
      mipsel |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/e9566815652aea7c597d30117ada202ba3a8f7da/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/38cf954b7985f14e2daf95a11f50b8a8a46df62c/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/87675a7b2cb7fe3e81b0f49e17347f3970ce0613/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e5f113e8e0f87e5707ea45d6da90076a512968f2/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/80094a33602574731c70ca25a63a0332edd114ea/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/435765651e492a36faf215a37d13c02c57eace85/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/31a0f904e7bd1028f0fc142d9dca7908232e4160/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/49cf51bb11e2777aa5d326ee4cea4989a3d9d306/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/45b8da5b6e0d61582b5d458304e9ed3c17bb78b5/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/f9ca70174ecb82cf875023d2ce69d49c6311a3ea/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/8a60707570032f465f6029e1f3714d8503a83d42/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/9af62a771b5fd869f074468e7f75926750724124/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/81cb0a7f4411a3bf7a33de1105fea0306f03ed75/
    mips64el |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/52874f96ffc829f737cd8d1ab86160a5949269b8/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/556c54e1a2c1e1617d0793e364cae5c14d832c6a/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/a94475d7500726c1dfed82a757cbe7b8e1355ded/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/5ec8963b1987c8bc20d1fd7f972d8af83d5eaef4/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/e1e4214c900c7f4968a8a1ec8c72748e79efd0ac/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/fb87a0eef65e230fa9ded8b4438b5ad1db64e280/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/c91f8d207ffa13b98865e3b157b9dd5513734e4e/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/29424d3e82c5b85a9b46cad9ba929a3a9bd863d6/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/ab31431f87313317233254273931e4ade0c22e4f/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/aee4a895c74647292715705bfcdf742f3ea2f76f/
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/0490f206eb9bf6ae8729caceaea274bf7912413c/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/15cc1db4ab4557f68e19e0102c31523e43dbf177/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/843ecbc09c9ba17b072011110297c9aff0f105f1/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/7097dbfbe6824e71ad5563034d58d505e699b468/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/5df9aee4e69043675ceb48c492322335d5e52286/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/ed03b4d5f7a81b589a59bb010511b3b3fd1c60e7/


-- 
http://autobuild.buildroot.net
