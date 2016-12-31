From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Dec 2016 08:29:47 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-30
Message-ID: <20161231072947.CBC37206F0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-30
================================

      successes : 183
       failures : 86 
       timeouts : 0  
          TOTAL : 269

Classification of failures by reason
====================================

               libglib2-2.50.2 | 19
                collectd-5.7.0 | 18
                 gnutls-3.4.17 | 4 
                 mplayer-1.3.0 | 4 
               sdl2_ttf-2.0.14 | 4 
             host-nodejs-6.9.2 | 3 
            lttng-libust-2.9.0 | 3 
                    rpm-4.13.0 | 2 
               skalibs-2.4.0.2 | 2 
                     vlc-2.2.4 | 2 
             berkeleydb-5.3.28 | 1 
                  cppcms-1.0.5 | 1 
               domoticz-3.5877 | 1 
                   dvblast-3.0 | 1 
                    gdb-7.11.1 | 1 
                    git-2.11.0 | 1 
                 jack2-v1.9.10 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                 libcddb-1.3.2 | 1 
               libepoxy-v1.3.1 | 1 
                 libv4l-1.10.1 | 1 
                   mpd-0.19.21 | 1 
                    mpv-0.22.0 | 1 
                   open2300-12 | 1 
                 openocd-0.9.0 | 1 
               polarssl-1.2.19 | 1 
                    qemu-2.7.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  stunnel-5.36 | 1 
         systemd-bootchart-230 | 1 
             transmission-2.92 | 1 
               util-linux-2.29 | 1 
               wireshark-2.2.3 | 1 
 xdriver_xf86-video-sis-0.10.8 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a5f5db4096fcca90750dd5a5260003b3326ef036
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/85ab7a9e25367716534000f8ba73f60dda475d32
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f0e3005df4457cca57cb3079f919fd3ef81fb777
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9f5beae5b098d8ed855f6951b6c52a2bb6016e37
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/440bda5b646b0fb774994917838f9261a19a8ec9
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c7da95abdd95d72862604f073e9f09228372648d
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9d678d58ff6915c155c44db7617aa54eecf2c94e
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bc29360e3f24511936839150c30ade256524a7fa
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e8de978e3ee0796eddf7a4fb08b0ee77b93a58a7
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8ffb5a5c59f9b8f8bec87600327cbcdbddc81324
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/48d437b93d0c96f03ce6c9b9ca215f1f714fe289
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f6c623f01fce079aec26ce43e818f7d4f21a69d3
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b709c4795b0e76fa14df0aecf58ce78fa6082e5e
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/64640902eab3e1cf6eb1c16ea9276e9b5f9df6fc
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4485904a612e85b544aeb2165fa4512b6eba3d39
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c13333100379db60094e2ff01907dad30a02c4bc
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/02e9dc3a54c882c20052c61da2875c2ade217f32
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e082eafddfefb55e83c1793abf9dcca333714ef5
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7772b584e0994b8ab6899b185d3715165dcaab50
     powerpc |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7a3d1b94ca776abaee73adf09cdfb8ac4fcd1770
      x86_64 |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/3c359799fddc46c7c14c3975701f5b9a32a9a56f
     powerpc |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/0557cba7eb1cc5a7d1df7850412d385fb1a7be19
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/0c96a8237dbb2dc9d7e2eab27acc2250aa537883
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/ff503c1b6ec49959594439fe71f263790e11f5eb
     powerpc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/087bd782e543f98f4268fb92a0d06d117eaa152a
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/cdd3fc2c5370de75f80d34cc7fd1920051317622
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/5faf65e9631ef81e03e1cd719cefeb522ec31aaa
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/182e8a58f61e12f51ae8ccb3498b649d4710851d
        i686 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/2032e132c709c24fe0dea5016608f0767a4dffe6
         arm |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/1f187934d6321ec6dde664a8d268819591cb8b54
      x86_64 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/f302d91d051be44a335fb0ab9d18c0ce7c5f4272
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e75c54c155792e061b33177c665440fad9c41278
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/25134c8d138243e644d5fe8388ceaa3d2ba78bf4
         arm |                  libcddb-1.3.2 | NOK | http://autobuild.buildroot.net/results/adebe17cf7fc5c4ec82f7ac355967dd302ed365c
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/087ef7947cfa341238e7dfd4c732d4726c76f15d
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/427f5a465103000538742e4f2e70bf31e4bdd71e
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/354df4560b6f9a0dd5df9df99a12f11bceec7d3c
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/5ec344296246fad28e563473ae54c9ba1a262dc1
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/1a3915670f9125dd361379fc32e4e7e2340672ab
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/1cbae252fad1cdfc289b951269e1f1b2c95c84c9
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/81e95452e1ea41af8750e9bb0a68f8dcf41bf664
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/97f051fcf0d43fb2bcae7c3d4b98fa65ed3d7f6d
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/32ba593c11498bbf2e8ad3a5428ffecdfe573143
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/aad304b9b9c1aa889545e0656597d470ac6aff7d
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/2b9c9ce487e60b1b7b6348598d74234bd0524636
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/09bb824f0383263068dbf2e77c5136f6d245ebfe
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/739310752e5618b66f3f9ae01e73c7058f23d204
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/174126630d33b52aef2d465f17e7dfaab3cc15e3
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/1b862902b7d8b37559a3f6be2bd6a8276ae926a7
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/4b71a9d4c925d06be4d90c2fcaeb1db25a7159a9
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/8a81b947c70b0c79b2c6ede49e8f7eeda8b57a89
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/22996bb36f9c0a0e83b8e0c513410d47cfeb8193
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/60bf513b5d72280c4903641a76372410a9697dc4
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/43673a1d157df2dee2552858878c983d90536a32
     powerpc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/2e9cfd1ac7c67784486936a5d5c671c32b21038b
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/728d3f0e45a2d4fcd4de8a196d0f0ae61735f7d7
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/53cdb5ae229151754279fbb77bc9df5cec8dff9b
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/471c89a753bf6d8d1871278823ebf03ca178c8df
         arm |                    mpd-0.19.21 | NOK | http://autobuild.buildroot.net/results/6f64bc9ed43ce6c56223adb9018a15c911dda247
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b4dce2e86d538765877504a38ba0154e9d2a323e
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c1f0cfd31462e09a838370da5094925b53bab4d1
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/24f9fe0052d9f3e02609e0963d27936685076830
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e9dab536023b7fc6a7b82c38e2011aeed54234d2
   powerpc64 |                     mpv-0.22.0 | NOK | http://autobuild.buildroot.net/results/1e3ef17049574e73c7953ceda16e34c981692f55
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/c4d86cad20251a690a1d99af3740f44435f6de13
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/74d5a1275eebf958ba03bfccc42477d57e223ec5
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/11d666f5ea66c42938f3a0a3364494f0722205cd
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/633c074bf66aa85f04d92cedff3ee9e947ef473e
        i586 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/5f338660a57894a4091757f46a1bd3215c0f1bf3
        i686 |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/82ec118451bab137e5265c3c61bf57a4b43b8bd0
         arm |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/f368e1e7310a3cf8266fd351b8b76496868af7e7
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/210c6f8599b5132c7cc8691ba100da10fb3782b8
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/b3a1e5df8133b76980e2aa06783107d73c2533d6
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/baf52aa038b6c00a3b4df665d47cf4b42669abc6
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/3d967da2b43d52bc39079464ed3231266e277336
      xtensa |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/d17bd959cec65a3e20b8353b8993645763124668
      xtensa |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/6d5a625bb98b85d6abde5b99dd6bd76ec3af9920
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/f97920eba08ca9c2add6f6f60f7513ea5d0c7efc
   powerpc64 |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/696254009f830134ef9398369ca2cbb257b33f52
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/9c2895406c6fcbebce91b6e59a458ba98b0ac1fc
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/04b8ded421e1da1aba774282a74be002c162b322
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f7cdf516e84fe9472fc80950a015630bb6f9796b
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/377ad320ee249f0f3bc93416b9a05454a2b0e023
        i586 |                wireshark-2.2.3 | NOK | http://autobuild.buildroot.net/results/bcf23e45d09e9e521233d64a18093f31abaa611f
       nios2 |  xdriver_xf86-video-sis-0.10.8 | NOK | http://autobuild.buildroot.net/results/ad861cb34c15a91e511042d8e47e2c3132cd5898
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/560d8ad4a4d5e1682519a1471e5a14dc977865ee

-- 
http://autobuild.buildroot.net
