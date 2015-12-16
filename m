From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-15
Message-ID: <20151216073020.EB4841026BA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-15
===============================

        success : 172
       failures : 142
       timeouts : 3  
          TOTAL : 317

Classification of failures by reason
====================================

       python-pyasn-legal-info | 53
                 libass-0.13.0 | 11
                 libeet-1.7.10 | 7 
                  boost-1.59.0 | 6 
       python-webpy-legal-info | 6 
                  ffmpeg-2.8.3 | 5 
host-gdb-6be65fb56ea6694a92... | 3 
                 openal-1.17.1 | 3 
libbroadvoice-f65b0f50c8c76... | 3 
                    ustr-1.0.4 | 2 
               libcap-ng-0.7.4 | 2 
           libvncserver-0.9.10 | 2 
             bluez5_utils-5.27 | 2 
                  gauche-0.9.4 | 2 
               arptables-0.0.4 | 2 
                   glog-v0.3.4 | 2 
flann-04b4a56533faf8c8228d0... | 2 
canfestival-7740ac6fdedc23e... | 2 
        portaudio-v19_20111121 | 1 
tstools-08f6be304040e7b8476... | 1 
                   libnss-3.21 | 1 
                   mplayer-1.2 | 1 
             ipsec-tools-0.8.2 | 1 
                      time-1.7 | 1 
             host-nodejs-4.2.3 | 1 
                 lcdproc-0.5.7 | 1 
make[1]: *** [libleveldb.so... | 1 
                libgpgme-1.5.5 | 1 
ltrace-c22d359433b333937ee3... | 1 
                  connman-1.30 | 1 
                moarvm-2015.10 | 1 
make[2]: *** [DerivedSource... | 1 
         qt5connectivity-5.5.0 | 1 
       openpgm-release-5-2-122 | 1 
              gst1-libav-1.6.1 | 1 
                   erlang-17.5 | 1 
              squeezelite-v1.8 | 1 
               linknx-0.0.1.32 | 1 
               wireshark-2.0.0 | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
                collectd-5.5.0 | 1 
                  samba4-4.3.2 | 1 
                 dropwatch-1.4 | 1 
                libvips-7.42.2 | 1 
                    vpnc-0.5.3 | 1 
               dvbsnoop-1.4.50 | 1 
make[4]: *** Waiting for un... | 1 
                  gnutls-3.4.7 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/2dfff1c8aaffb6a1c2dcf535b26bde6dff309083/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/8996d65bfc756cb90971b4e140224d4ef396f952/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/56b71ad890303edf92bb0a016d70daea43ef34c3/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/c723ee64d06e9eea26cee9524245612666ecae9d/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/ad1938a6c4023cf680b8f83f0fcfb25fbe8c0bcc/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/2bd517c555861218d934189b16c7cecd4ec17067/
        i686 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/0b6d1495722e3b1a00cca8ec208bc5309020b176/
      x86_64 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/7887d37500555d39ca185fbae351ae36aef53f07/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/f49fe67737270b4a09aee9d638234ce2502a32e0/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d020dab302854c016306b40946ca2328e51aaec5/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4cab76b8a270adf2754010be0995ca0c6644656f/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/c23eef2b517b66be7345bc4980ffee7529e94fb5/
       nios2 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/9122abe92ddc4d9668202ce8b2c1dc3b06cd66ad/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/ce245952e8515daa37c5d6ae781ac2fe0676497d/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/2011f2fe492f170b93c949a0da762cf098166665/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/13861cb4a1852e29a0d39e1ac6fb3bf8ea1b72d8/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/43cfc5ee6d204636dd8d9574bfb828f2ef6cb93b/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/1e5be1cd8e7f2e32cd771d39b990c97d4baffaaf/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/14988c8cb536891fb2f6d3f5c614e4b4e0448ecb/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/d48cc30157030d67ce651ca75d58c363dd50b050/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/0bc81f2a10cea6518cfbc190963f4b541a2a2148/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/511a5cfb0eacab660ea8897d4b0f94269c6f1a67/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/2fe751b2afcb575622a85c2b805fd08bf5d5411b/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/9f2dc92d4d3db9c3331315a02a51da379c770e7f/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/4111ea586143410649b78c8dfc737f0f83d78441/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/b19dbcc7ddf0f24472afcecf4c684915045550bf/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/d83cd9c3bf0c687c146075f1bdf2e783e429b2ce/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/8fd8646206d1107f6f56b17102c1ab1408695a50/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/ca743bfce40385c447c433be36e3fa6e9c084ca8/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/ee5e498eca53f40de3ebe52e0211641871440116/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/12327d3f4e4d21b310fa5a38f8ef730e92040e37/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/a32192f79d0fb17e4fa94f8a90af41799021e7b6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/3a54c9d652c18c470924138a047d065dc3957cdd/
      mipsel |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/f4f8cd6773698c4e947b4ca01b0cc39722bd5770/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/dc498d846ad541d18937237d7b2907b4b105c0f8/
      x86_64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/55c5a146ffc3ba947f6038d6c306410af970edd7/
     sparc64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/050bb7212f2ec1220ec7d2b9e3bff8b906ae2bc3/
         sh4 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/897611893c64a5acc4e6625d178021c4e2156a54/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/c1d0b54087daa7208f7d199e5484a1718e429051/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/75832c78db664097757b8756813421fc293d56ae/
     sparc64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/a5d4d7e50349464bf21db41e265eb0daf47809b0/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/0965bb2d38a25ac30fd5f1695aa867e6839574e9/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/5fe088e0ddbc2d3486dc28b7b43fbd0eb5981c42/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/98b70b5bb0bd89d065aa5b68c62c2f931ab1cbf8/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/98440d8e51da562b227e7e498ea7b00f1e8a0c19/
      mipsel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/cbf74cbff4521b2e28d50a1cc1f779472ef00120/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/08507aa9053cc9ab86db18cbad1c56453237eb69/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/6f4761efd207d9c89f118e458febaa22f6a637cf/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/3e578ff9ecfc74203981e012d66b6d1998408bf0/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/79ed5f1d0dd0cd3037e7ea44e0b71e1ba3c7b078/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/92d2679bfaaca2f670e47d6225431311b7f8e737/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7eb0f262b627d258d8cad6ee11e5e336e5432bc4/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c1e5818de7c42d5acfcfbdc4c3eb09232c6e885b/
        mips |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/79c67c43e91fa8aa62c9a39daa39cfe24c6c432e/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/ff9f9219193f36f68a1486ce4b056c59afc36e8a/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c7465995c7a7917c7d8136c7a88b14fdf121e9dc/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9ba2cbfeb1aee2a22f4fa13ee18f4fa95a9ee19c/
microblazeel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9ab3fd1608500a1e7b2e9310c943e8757bceb91f/
     aarch64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/85244e87000069f15ff380b62aa3f9a73a2b5808/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/c66be4cd99d7a355e385dc69de43e342a6ef2782/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/092d593ed8eb48ae97361fec2f7fe5bf9ebe4b6f/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/e7627f01f8a2893ab02779ffd7a334b4a4b104ed/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/23fe13f66b60a9447546ad929bba4b44f38d793d/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/901f8233373f5b7268f74cd57de0480475029166/
        i686 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/cbc353a409b883650f93c1a0433fc02ff1f1c540/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/d5cf4e125a39ce29c65bab6e1987c3309e81b449/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/a941287bed63a693b463b549025f2de46ef3e3f8/
    mips64el | make[2]: *** [DerivedSource... | TIM | http://autobuild.buildroot.net/results/361af69cbccd2e2216ab0f47996a0264ca570bdb/
microblazeel | make[4]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/b8714d32f95c34d32a15093a65dbdc6a3625e7e6/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/f4e17215f97d5e50a82872f62c56c3c51bc85d95/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5ced0d8141f66f7e3f2bc1ffd6a3ead78bd8b5f3/
        bfin |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/ac621f84577bd585cbb08c579eacc9787c53bb77/
        bfin |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/b24a0983a8bb557399939d8c6d436830e44aaa4d/
         arm |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/b56dae4e82b05f73203ab501177153af96d3c881/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/22bffd8b55fd3577545691df558d5c6f697c7744/
       nios2 |         portaudio-v19_20111121 | NOK | http://autobuild.buildroot.net/results/23904c080287c9a2f4560f9e95b7762b3417ae12/
      mipsel |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/935c7134cafd178acf6d750b6229f32777bddfe9/
        i686 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/b40020226a8904e981958a9a0cf866a96e1b6d82/
        i686 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/0e6d35d79f35e57212866f04c3a73082ddbfffc1/
      x86_64 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/e61a8919d17e1141f76a011536593a9f3919d9d9/
    mips64el |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/3b4cd31c634d1bb41095c09a33319a03416e1692/
        i686 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/4d12d32d652ea2390de4b8554cdaa02007b1b129/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/eaf1178e83a15958e6960b1278314a9255211519/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/a429989201e3dbc0f50b1f02568dcec531c5452e/
         arc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/44f4e8fda27ffd47621406df2c52541cc6a1988d/
      xtensa |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/e80be4129a201359f20567101e5ba3f808f5f4e1/
        mips |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/1b20de3cf6a0798a59af353a06d54b4b1a47264c/
        i686 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/3e64e22b019ec9b44d50e18e0fc0afb123ccaa42/
       nios2 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/d300005a9a07aaf6b1b7ea57ef891e9ade5104df/
      mipsel |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/e35c075dcf94f3695b27d799baf6e0d7bb5de4bc/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/25946af83160b1319cd176fe4497418ccff3ad68/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/ab152a499e1b229ef16ea30fba8fec81a6ad9209/
        i686 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/53dfa59c28e3b26ac17098b442b69aeaf2579acd/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/453e8cef55ab326baca1bb4f60627fd74b5e4144/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/f5a82cc3cadf5227bba257a58c6545b6dc03b526/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/c8d95c35a03dca256433507b5fb01f5584d6fe24/
         arc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/cc8acdc91d7845a426dc368d41b8eb461284e965/
        sh4a |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/060e56de43d2462bee676b424a4ef6ef12a2a4c5/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/849cb639c1b1676a666946c53223757a30a30c72/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/20d0f30059a18d433c2bc7d9489f394b6664d46d/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/e3dfc7bc1151054f028c5e2ab14bec4a295a1047/
    mips64el |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/2f60318fa4b89f309a8f91316ff37086f9463402/
         arc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/c4e071ff57300b59119fae71ec960bf627770061/
    mips64el |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/425fca2c4a94a0ec32117533b837a6da1b5b2c28/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/345f2213da9f03c50abf09330f79191e9aa63162/
        i686 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/aa085d06b14f6457637ec594688788325aeaa0f5/
         arc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/a83d62d14df58d674777276bb7b254a53578e658/
      x86_64 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/a51a4c1121a2043bc23f262500ffe6bbd162797d/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/2bd6ba3e6b33cba0abb5d6934b3f2088e5844c78/
        sh4a |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/5d1667b644139234464ba0a4090510de0ce5d8cf/
    mips64el |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/870f44ef1097e1e5f9df7af3888c7b3fc09d7425/
        sh4a |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/48fab320cd8c01dc11f4297678121006eea802d3/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/db006e32f734a0c2356d91206e8870cc49824710/
      x86_64 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/14a97e55584ebf54166ef489e1f4711957ad1a7f/
      mipsel |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/37f2c03791b397258577abef7be2bce4e62cbc89/
     aarch64 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/7b1faf5c8be3f15a4acd4335f2d16f06dfd2fbdb/
    mips64el |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/d293f35d8034eaaa519565b14641d1b56206cbc8/
      mipsel |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/5d84604b45e347ae8b4f7f3ee24bb0fa190dc96d/
         arc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/7f68d12cf49fa383027738bb26df4a9d6cb40836/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/afe047953bec780dda982b862c08995ca145e573/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/993ebd318d37a4b01f15487a153f13e63482273b/
        i686 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/e2614c6706075463640a53ab90509d218ba572e7/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/14228a24cb4056667f007b1fbf8f1c3ed150f295/
     powerpc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/f5dbb6135c61e0b6406e0c70e3eacc76742e0890/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/5ecb1b69cc4f0144c93da639b4cb9dd5d266b910/
         arc |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/c8b98c96a7367e2c4a0d63edbb81024fbdef4259/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/3c351321f9d98dc4ef96a1502b845231c39dd747/
    mips64el |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/bd89ec8a1f6c13a522a5c05b731631ecf719841a/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/3b5edb16b38d743a9fc273c4f0f4b5536b733e65/
        i686 |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/0aa7a57dcfa6f43520c0a68f17306411bf6e30ff/
         arc |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/d60eff8441bee22b95055f47e5aad4afcf300d9f/
microblazeel |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/8de7e095eb34a33108848a2cbc40fca0ba9fb607/
microblazeel |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/3259e8c701fe9615b0b2addf2df88fbcdacb87a9/
         arm |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/0746ff28923026a41d841e9674f829f2b0b6c3c9/
    mips64el |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/815cb5a4484134e4307a95ecce7dd19a54df1f57/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/f803ae435cd5af00ddcac0665f714b7d6eda087e/
       sparc |                   samba4-4.3.2 | NOK | http://autobuild.buildroot.net/results/6f89b5f5dbfea9306a5083b7bb3835cbd364e00c/
      xtensa |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/e0d83ee0f1fa68820377463752585a7197b69718/
         arm |                       time-1.7 | NOK | http://autobuild.buildroot.net/results/7e505b5f40250a122ac5c83606ecc5c0c207b1ea/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/0c9c45a483f44f1cb4b7c3a5d51fcfb75b9664e3/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/fef61dccdd501e85f0774d8246ff66897eee9e8e/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/0f2b64678f518a01028b5998232297892203e933/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/843928ec2c6971cba9f7dd04192abab807324092/
        i686 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/9f2704b99a6b261b82368cba17b61d09cc767b12/
         arc |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/9da4ffdf1c4ec78ae37322e253cb769340116035/


-- 
http://autobuild.buildroot.net
