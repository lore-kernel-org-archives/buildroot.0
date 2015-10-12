From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-11
Message-ID: <20151012063018.81C74101B38@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-11
===============================

        success : 157
       failures : 63 
       timeouts : 2  
          TOTAL : 222

Classification of failures by reason
====================================

                   mplayer-1.2 | 7 
               alsa-lib-1.0.29 | 5 
              swupdate-2015.07 | 3 
                pulseaudio-7.0 | 3 
                    ruby-2.2.3 | 3 
libbroadvoice-f65b0f50c8c76... | 2 
                   attr-2.4.47 | 2 
         liquid-dsp-legal-info | 2 
                 mesa3d-11.0.2 | 2 
                   systemd-221 | 2 
                  libftdi-0.20 | 1 
               linknx-0.0.1.32 | 1 
                  mono-4.0.2.5 | 1 
                  monkey-1.5.6 | 1 
                  aespipe-2.4c | 1 
         conntrack-tools-1.4.3 | 1 
                   czmq-v3.0.2 | 1 
            shairport-sync-2.4 | 1 
                 sudo-1.8.14p3 | 1 
              libraw1394-2.0.7 | 1 
           argp-standalone-1.3 | 1 
                  gamin-0.1.10 | 1 
               libecore-1.7.10 | 1 
                harfbuzz-1.0.4 | 1 
           qt5multimedia-5.5.0 | 1 
          openpgm-5.1.118~dfsg | 1 
                coreutils-8.24 | 1 
                   perl-5.22.0 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                   argus-3.0.8 | 1 
               dvbsnoop-1.4.50 | 1 
                  libnl-3.2.26 | 1 
canfestival-7740ac6fdedc23e... | 1 
                   tinc-1.0.24 | 1 
                minidlna-1.1.5 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
                busybox-1.23.2 | 1 
                  apitrace-7.0 | 1 
                collectd-5.5.0 | 1 
                           all | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                    gmp-6.0.0a | 1 
               util-linux-2.27 | 1 
                   erlang-17.5 | 1 

Detail of failures
===================

      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/2bda58abcca8e90a8ff8f53e7222b12708d28d79/
microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/40ef4992a75e8a0c7fc9a83bd01f277edd908057/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/63c3d33f65ccabbdafc95071a645fb86b4406695/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/b59995e4a083a9a4b3f029669cff07ac5ac4afdd/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/cba1ccf8096b07ef5284964d0c29a07202bd6259/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/6e28ef0c89ec675f981669dcc924daaeaa00888f/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/aedfcdf57aba950b8d4727dbfa5cc1bbb106832d/
     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/a868e27a2bb085f6899b795abb5c4c83742bb391/
      xtensa |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f0a5936ef251afb5eeb10bb0ba351398d9b3482d/
       sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/5dfd3acf5d3a86ef05bb23728edfa3d10d26d76a/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/556336602f2c4bab9f0cf122722484a967f468a9/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/32c79dacb54e052a1af0bc0c38369924ce5d29b9/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/cffd424ecaac81eba7d6de8924e4c21ef212991b/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/ec3e61c5e4abb3130d41085c5349d30d8e340330/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/232dac10825ffb15d5203fafc65ba396a9da2c9f/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/ebe92a1ba0f180c9135fe833f03255fcc7f6f627/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/cfbbfc303828ed24558d2cf670be8d21d29fe3fd/
     aarch64 |                    czmq-v3.0.2 | TIM | http://autobuild.buildroot.net/results/64eb8099a273f81dd9d486c8e2435337a4239523/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/1b86b6cfc07cb8a8767ed1f9cbd83066e3368de4/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/d56a03699b277f5fe78e9ca0cc528fc1b554a5e8/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/0b7fc510e1caef8d8879f551b4c4dfd8f8ed77b9/
      xtensa |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/b5386052230b5a41d7bda440179e5393bbac564c/
       sparc |                 harfbuzz-1.0.4 | NOK | http://autobuild.buildroot.net/results/f5383b32c5065ca0935bb5d3aa5c5f582042b752/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/5e39eeb0c733cdbb4ecf0b34412117dc8bd1a2bf/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/a0c41737ce164d790ebdc0599b8fc8d76a78bdef/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/d584c5b83fea52398faecaf6553a6d4a55f35c67/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/60c05656e9ab6c1e893e1c98a07389dd8c3f6f66/
      x86_64 |                   libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/3072c8199848f569c6805331947aa29ca56c1087/
      xtensa |                   libnl-3.2.26 | NOK | http://autobuild.buildroot.net/results/6f7f25540c603b231db3000275b801a34870bdb7/
         arm |               libraw1394-2.0.7 | NOK | http://autobuild.buildroot.net/results/a3a568be04e894df54b408776e5320ee4d71baa7/
         arc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e16ea650d931aaeafb82e0539154118c837738d6/
        sh4a | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/dabee2c0f7b7670d8f8295e5b8cb91c6eed24fe4/
        sh4a |          liquid-dsp-legal-info | NOK | http://autobuild.buildroot.net/results/9c76ce4f9d69db1aa67cc9c07e4c5c2e5e8d93e0/
    mips64el |          liquid-dsp-legal-info | NOK | http://autobuild.buildroot.net/results/c82baa5549bdca405e0f077c7ab8c77dcec9a582/
      x86_64 |                  mesa3d-11.0.2 | NOK | http://autobuild.buildroot.net/results/a01801beaa28613cfc0f699dd52400f5b1f59603/
      mipsel |                  mesa3d-11.0.2 | NOK | http://autobuild.buildroot.net/results/5204b46b15f0048073ca289158ff43a137868ee9/
         arc |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/3ed5f6dcba96ecb86902b1172ef663dbd8d4a696/
      x86_64 |                   monkey-1.5.6 | NOK | http://autobuild.buildroot.net/results/21b6fa8b2586f318ff071085f2b204bd555b425b/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a91e1bffde8f773ec22d2a2e9d5958d0887ecb43/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/432d68dc6ebebf36c264036e8201fcab283c5b42/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ee56549f6f02e88f46e1a7fe9f75979d36204991/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b297618e003243e17814289e0df3242eead7b838/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6d7228697ecaac498b0f64a4d165bb7f5dffb630/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3f309b46891c7c54c37cb70dc4157a312675209f/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8a87ba7350232e7045816a1fe26180ee55782e82/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/496fe954f2d02e5a588eb4d12e20fbfdd735f640/
      x86_64 |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/013b5eb197869667d2a71b92b376c15d097aa009/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/6688ea6ba2a31abb0f0af0199b35d803af51538a/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/2e8f8f2e7a38531dea13c54f11530222a5d7080a/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/ddb16eccad46844d9aaaa064b17189c0f2b2a7d6/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/50102b3c5c4ef7208ed55a98be386cccc3756433/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/a2f15dbee2500888c83a717c1b058c0b88179be1/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/bdf61307803bb9387e936a0da2ef533f48a1981c/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/509c16cef8a2a71f146285249d83baee40653597/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/68fbfef1f074e0ab9cd44387b397ebbd3c3d5758/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/30996a8be03fbd033c77a8111107919911d7535f/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/028563bfac08e0f817841d55b15f1e5aaa468919/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/70f34deece533cdc4592de0d4e55067e020d0e7e/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/e9014928f44c71a8cdcca486b2a778e63e064180/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/59398d7ccd00219e35cd3434dc2b1a2b51908d89/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/65beeb0b21943784b080b375b00078fbca6e7e27/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/7e3eb3f2d158eed96ccd1a9c6c43dedc548c33ed/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/8b6ed1a5bfa71819d2a61749c4195e695eef8a94/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/d4a2e4ac59cab2215ef68481d706d945509d512b/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/e19b55a415fad23fe41cab9ff2ab01a68a9e7a44/


-- 
http://autobuild.buildroot.net
