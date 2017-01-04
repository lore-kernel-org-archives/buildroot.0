From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Jan 2017 08:30:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-03
Message-ID: <20170104073011.715F22076B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-03
================================

      successes : 161
       failures : 79 
       timeouts : 0  
          TOTAL : 240

Classification of failures by reason
====================================

                collectd-5.7.0 | 25
               libglib2-2.50.2 | 12
               sdl2_ttf-2.0.14 | 10
                 gnutls-3.4.17 | 4 
               tcpreplay-4.1.2 | 3 
                       kmod-23 | 2 
                 libraw-0.17.1 | 2 
            lttng-libust-2.9.0 | 2 
                  boost-1.61.0 | 1 
                   cmake-3.7.1 | 1 
                    cups-2.1.4 | 1 
                espeak-1.48.04 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                 libnss-3.27.1 | 1 
                  libsvg-0.1.4 | 1 
        luasql-sqlite3-2.3.0-1 | 1 
                  mpd-mpc-0.28 | 1 
                    mpv-0.22.0 | 1 
                 openocd-0.9.0 | 1 
               polarssl-1.2.19 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
                rsyslog-8.22.0 | 1 
                    ruby-2.3.3 | 1 
                  squid-3.5.23 | 1 
                  stunnel-5.36 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

        i586 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/e8bf1804917171e53210affcaa91b0209808ab03
      x86_64 |                    cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/fb1fe2abc6628d16939afa9be515530e9240cd94
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/658fb37e42d3bc8ce074549e5a32d6e2f41155cf
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d3921474cb4ece9f0b769606fc9271327edbbc71
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7f2f6460790293913a3e26ad7c9e4b4976709b45
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0adebbd53e4bf3ba16ec331a8bcba82084f4cb4f
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5af1fe388e99e9bf6ba256f66ecd2ea163000cb0
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/88e3f4db0e5fad44476b064773e9e95ca379f7fa
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8e3b6c435b3581270001f215e25bf5d325129d30
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f012bed97f9e8ff9febf7737eb6fd24a3e87eed4
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d661891c7a111a22473ba6423e555b9d3b7c5d2b
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8ad7a8dfc864c3308b7421a0291026ee5255c501
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e3fa8f954303105fd1df96c5fd13831730d80a18
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/2a4420c49cb875871fe4a5582dc8108aac1159e4
microblazeel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4c9a10bc3223f006fe0c1a3e1b8cc3d9cf611107
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ccf2c17c5cd21a9ca7a13b1bccef3774ec582a68
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8bfe2b9ba2291415eb94e8395275471d2a6d99fa
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c92a64f0ef76bbf041a70701b1c7c001b7a2d491
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/350319fc31801044b42213a3ca2c6002106ef6b0
   powerpc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/70c5d9ded19d2b632b4dff3472be328831fa4bcb
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/df8d91b7901e6fb8eb55014d5911b34af48ff791
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/2223ea5ad2f54a6804564ee5c26e024a8ee7bb3c
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e633be48d0ccd075c8dbb95b04cc2fe30b6d65bc
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/282a31c6648e5635c580cd2087f7891ea6d53dc8
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/aa7fd9cc585539cdbf401b620e38948412d799ab
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5c361151322b02872571131b7a3d46ebdaf93598
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/01877432e7c6469447284919b9e91bbb5310169f
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/24b5efc7769020b942c657af037af72f2f1a7164
       nios2 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/0c90584f26530eded3f3ef12c0af2214e2399438
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/c2d35c281f86799a3287aa1ca3cf40f7e2edd9f4
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/d0ddd8d28fe05d8b22210b37d27d73f02e010e00
     powerpc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/19e8d316ee356bc8a22b39a4166a19d938669b5c
         arm |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/6ff7774e1eea406467507a296f6d29f66dc0bcff
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/fc7efeef20c56311ddd4f8bbbf6a912ecc60965e
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/582fc94b3e27f912e353886223e8252de9f39842
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/6772c98e7e20a3beabc25ac83dc31acf628a3a96
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f3465d29570c150a58df213b123652d8a2081e15
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/2cf40ea802617729123f1d68495251c685701bf8
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/730c507e78ec35e5e66cd2f53f8a8e73086c0e58
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/c2b1c6d789b2df3db40bbc63e3cbcc849644125a
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/b7ce266582079d84ea9c19a24dbc496f3af58e01
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/67aee5600b20ab66fc6b2565782ac78449d8e05c
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/ed86b3d6d948062c597e8ad949fe5db08d69e7df
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/266988a8ea533bc17f3e4b473b7b98c9bdcbc709
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f2389336b01079ba850ece040dcb8470ad8b7c02
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/c8ac66af307362c6355e4b55865581bd68d5d9f4
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/8347d1f898e0574ad2fecdd90b344442a0eb16d1
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/7f6c616c0abcdcf40edaf5fe050a364a0ab0c7b3
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/efba3911588f32cc92cbc5d2122d66068186babd
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/54be575498a25c6348ad067d3872dc9956fd0d06
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b21aecfc94af7ce9904a858eb34766632214f33a
   powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/eb2cad8bf10efe95db2027ff5fc9e95b77988012
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/0e9156c40ba10c98c8bdcd3133e463130346c48c
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/a240c7b188152009d9328665d0cfa78e0407cd30
      x86_64 |         luasql-sqlite3-2.3.0-1 | NOK | http://autobuild.buildroot.net/results/0a47f30c59246b2376232c0eea3bdacd7806f5e6
     powerpc |                   mpd-mpc-0.28 | NOK | http://autobuild.buildroot.net/results/d5fa3578eba54945aa965dc4f95ee8eedab9df47
   powerpc64 |                     mpv-0.22.0 | NOK | http://autobuild.buildroot.net/results/12659a06211b475e2a427931eb472b18e05a7bf9
   powerpc64 |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/15423295bfca4157407728ade2e5aba656910ad0
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/2030b306c6c6c287cbc5595534cc4480643484dc
         sh4 |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/0ce69d90ce599076766a8ee43f5ade9d87b8046e
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/3cbad0097d262c0da62289072a7bc580101c2fba
         arm |                 rsyslog-8.22.0 | NOK | http://autobuild.buildroot.net/results/527a06828dd73e55d013ef49ee6083d875a17ba7
      mipsel |                     ruby-2.3.3 | NOK | http://autobuild.buildroot.net/results/e680f42b7f69698b358e03f20ecde39a5b52e923
      mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9600a6568a2b898727227b8db39188908cd4b9b4
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/350907e6b379b6ba7e77b83c5981a7c6f6cc3df3
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ae4ca8cdec793b52f3a0311a9c37e06c55c4fb09
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/cca04909b7839f0ae92d6241f0f0c982743b9d3c
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/3e29534f041caac3bae3d40ea898699147090cb7
       nios2 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/15a9f74482781a522772f23e05763926140a1364
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/66ecbc1c7d9c2dad11b99ff56ea0636ddee485a2
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/c5466b186e058240fd9eaf60727786a47e3c2dfa
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/161e6880a41efb2356f8bb4e48dcdcebb3fc7646
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/880899b249dd62b0eff82ed6cee371de3d891cba
         arm |                   squid-3.5.23 | NOK | http://autobuild.buildroot.net/results/d83792d4e0ed7ab0f3b8932246d65fd20b6a542b
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/e0289b25cca5933b188af57be0cf559cce46fe12
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/95e3b404609fceb904072bb1359ecd8b8e46553a
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/d157ceda959c5ef5618c944383a7f0948fa02159
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/454d1a180e6dc4ece0c94ca533dfc041f0f1ebfa
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/33165ace9141d1de68466df2c0e80429d2e4763b

-- 
http://autobuild.buildroot.net
