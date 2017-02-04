From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Feb 2017 08:29:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-03
Message-ID: <20170204072913.0F2D620DA7@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-03
================================

      successes : 133
       failures : 32 
       timeouts : 1  
          TOTAL : 166

Classification of failures by reason
====================================

                 libnss-3.27.2 | 3 
                   ortp-0.27.0 | 3 
        riemann-c-client-1.9.1 | 3 
                    ruby-2.4.0 | 3 
                 sngrep-v1.4.2 | 3 
               openswan-2.6.46 | 2 
                  boost-1.61.0 | 1 
                    gdb-7.11.1 | 1 
               host-gdb-7.11.1 | 1 
                       kmod-23 | 1 
             libsidplay2-2.1.1 | 1 
                 libv4l-1.10.1 | 1 
make[2]: *** [CMakeFiles/li... | 1 
                    mpd-0.20.3 | 1 
                 mplayer-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                  samba4-4.5.5 | 1 
               tcpreplay-4.1.2 | 1 
                     vlc-2.2.4 | 1 
                 wavpack-5.1.0 | 1 
                xfsprogs-4.8.0 | 1 
    xserver_xorg-server-1.19.1 | 1 


Detail of failures
===================

        i586 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/98bea32bba1489fde2cbb3903b774d49449d3fd5
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/240b2ff22df8019910af33378571f6e3f7480ef8
     aarch64 |                host-gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/f564f1964d50ed6620f2ce2270969495072b952f
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/148398b6be479cb159620b5c3150eea98a0e02a1
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/b1b5e19caa116432e3431aeb7a4c44f9f45ed86e
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/881c5b6355e89175708e4997972d6f801b5d824e
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/53bb091541d0b796d78e5bf0c81ff5d97781fffc
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/862a8cde4e7a2563bf08577ce6bc381a082b8d6b
       sparc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/c8decb0aec7d44659af62925b8ae634a9cea9216
    mips64el | make[2]: *** [CMakeFiles/li... | TIM | http://autobuild.buildroot.net/results/5467932508276842d9a70989633dacd3d13d8d0b
       nios2 |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/203c9dab6900386319757363a03f9d0b83881aab
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/232a6aea2a517032110565053e7d9c9d510bec53
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/88402ea90c1b9d1c85b8e518fe8205860c1d3a8f
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/dd636db2e0be94c042b533090add5eaedbd2e712
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/6e8c415fd866d0eed70016fb44e27e73f24a7c16
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/289db628bd87377b0536dafec54f94267ccdbb91
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/bbc5e9c7aa76dd708ffa621ea1829dc8f1ccd840
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/85ee3a4e817bb1490ca900d8ecc505a5346e8e31
   powerpc64 |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/38fcf3c81e4df3b43987b2623ce6e25bf1e24827
     powerpc |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/42195b82b2d0a5da4af301ae79f98d975097d8d3
    mips64el |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/1a638bfb65b0bcbcb4f8c28097e5053ddba76664
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/059d4b14fb45707c93ed321b996d90f9a4445422
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/62643396c0a3c54ee71e310a326924a070dfd73b
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/c4298031db2a7475dbaf103b050fc6e788f3fd31
microblazeel |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/3515f14bd58f820228551384c15baf26ef9e5b5f
     aarch64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/30595252ce32b9fdc33a1867b7e8c7235da6bf8c
        mips |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/b1d9ac080dc2f98df3d530c6f71ea46811f2de0a
       nios2 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8693ee89dd0b45d535d908d1ced743a712ecf7f8
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/db0285e9370ee59b1b103648cc0b0182d4fc21fe
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/907d5ad2460471eda000e92be8844fbb141f930e
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/481374d328d7a9a96d74bafbd5b506f11975482a
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/f957b037986009798b66d2de7f5b2856cbf313e8
       sparc |     xserver_xorg-server-1.19.1 | NOK | http://autobuild.buildroot.net/results/9e47e20f32fb96382feac1a1ac0ad5f07c5545ac

-- 
http://autobuild.buildroot.net
