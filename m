From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  6 Nov 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-05
Message-ID: <20151106073017.54C7310240A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-05
===============================

        success : 90 
       failures : 64 
       timeouts : 0  
          TOTAL : 154

Classification of failures by reason
====================================

                 python3-3.4.3 | 10
             host-gauche-0.9.4 | 7 
                   mplayer-1.2 | 5 
                  gauche-0.9.4 | 4 
                  ffmpeg-2.8.1 | 3 
                  qemu-2.4.0.1 | 3 
                    ruby-2.2.3 | 2 
canfestival-7740ac6fdedc23e... | 2 
                   bdwgc-7.4.2 | 2 
                directfb-1.7.7 | 2 
             host-nodejs-4.1.2 | 2 
                    ustr-1.0.4 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
      kismet-Kismet-2014-02-R1 | 1 
    python-protobuf-legal-info | 1 
                coreutils-8.24 | 1 
                  boost-1.58.0 | 1 
                 fio-fio-2.1.4 | 1 
                   mp4v2-2.0.0 | 1 
                     fastd-v17 | 1 
              gst1-libav-1.6.1 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
               libsigsegv-2.10 | 1 
                   jimtcl-0.75 | 1 
                 mesa3d-11.0.4 | 1 
  toolchain-external-undefined | 1 
                    yad-0.31.2 | 1 
           bcache-tools-v1.0.7 | 1 
                espeak-1.48.04 | 1 
                  ltris-1.0.19 | 1 
                   argus-3.0.8 | 1 

Detail of failures
===================

       sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/d5d750add0c3d723d5f4407389c44778c3f9d490/
     aarch64 |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/f43ab44bb7453b34b3ff50c02319bbfae2183af2/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/25175519b357d4db49566ed2db6d696b0a45071c/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/acf8564104c2b37ec649cccade1945e9f425448c/
     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/efdb84c890dc7c8e44dd2da929da41bb500e5696/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/10fc9390c3489544e6121e0e9d86f3e3f82d3f94/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/543026cb1f506608959e4b4d4abe401d0453b654/
     powerpc |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/cb6e344be593566b678b0b37aac802a84e179289/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/a4e8df673eee2c164fec1d6197d9e60f9d2843cd/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/c0b66c718ffc5a9c3ca3b6d564729135a56ad3cc/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/71cb2780d70d0a12927923d362f521d667daa8de/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/57d33165aa0adf370db8641c0cb0dbd8b3b33b72/
      x86_64 |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/2371c98112a416f4d9d32576f207dad8d80ac537/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/10311a9a02badb636013415f8af8ec5b31221a59/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5ed6561af3dbfe8c8b2d470ee2c9404374d16865/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5873002c9530b78c997f72e4867751a8c72ce9c3/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/1b88d1b0f59791ce240c9ccb76aaa742f3795726/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/a582ef5fd4d95cc1c676e307127e4c3e7bc24181/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/8e75f54f96878e146d0cda2f9c1777c70e7d7ab1/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/aa00eca18e2517a014ee9b4064a51b92f939cf94/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/4416cbb5abf81cda3704b5b6e56d00d8326264d4/
      mipsel |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/62df4e7877beb082109d8700bf5ad3ddefa405f5/
    mips64el |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/16836c6f28419dee67e7274fcf997e9b6ce60948/
         arm |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/1d7c92cb81aaf343cf15501a07691a110a1fd7be/
        sh4a |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/c9f491d74c4c5f33b748c504fd953f268f4a04d9/
         arm |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/770a01eefa7e44ff899a75877948da74ad21685c/
     powerpc |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/ae1c5ebe647c0674f7426e9ede3687cb0b5956f3/
     powerpc |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/9b4615d447baff0758c0774d30d109a28cc20e48/
    mips64el |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/4269c465312ddcc801289914fa29427798ef7783/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/55bca04c0ac1074d0eebbb6227c0b31bf61eb762/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/3570c3f1363edab9cce93c15708889303f013850/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/b2dc3762e854fda30c0c1f5ccaf066e0d0b3295f/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/3eb0e6a7827aff22d6ba375c8bcea5cbaab39bef/
     sparc64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a7492b3a5e783905279f1ab73ee91f14e811df83/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/24d1830929f9d35e63d98ba24492bb9aa985ef94/
        sh4a | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/dafca8538513df592f6215f9f99df610b7ddfb58/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/781e891e8a59dab29b0ec37d43cd03107f6cce5b/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/74ee1da11f2b968fbd965fec0538fdb52e313259/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/ca970c93a0bc2b6a1c0ef38ba27e059ad8ece7a1/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/38b1278aed80af42d85f5fea67f2a0fd7cfd8c09/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0e63d707c716eff016975533d0db5fbd041fe053/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a0da41bb734dbcdb17e13d852cfbdba5e069429e/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7a9b2c77c849c2898b2227a8ca1009a98eb48fe6/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5c36ff26485429eb45e2d56b4dd964f9f943ddfc/
     powerpc |     python-protobuf-legal-info | NOK | http://autobuild.buildroot.net/results/4282281e5582b0da8ed3ff44f4d6d86f716ea333/
    mips64el |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/0240dd9560ffa1ef74bd9b89d7546c0631fc0f0a/
      mipsel |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/b34260c1ffab02bba6df1f24d339229dcea5cffa/
         arm |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/ac22223e5a75f688a7a95228bfa00737499f81f3/
      xtensa |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/4510bf36fdd8acd3af515b762e63ee444ffc3f78/
        sh4a |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/b78d6093c81bb692952435c7838dad44c71e8a07/
      x86_64 |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/f0b11ada0989a1f59d1a6180d3178e690da79e52/
     sparc64 |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/cba61b953931a5cfcd62b356b729250679834b9b/
        i686 |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/c6698d501ee45c9381fcf18c63ffcbfc6f3c33f0/
         sh4 |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/923c4242dbd6d277c1d88f663b5916ceced985d4/
      x86_64 |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/0fcf6c524331e7383906ade6eeda49a394580182/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/db0d4d4348d441cdd9c30559010d36cefe050bd7/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/b5f15068c0c867ca4f07d77daba899f3893954c5/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/3ced43614bb3ce5452dbe02bbbb2872f4a8d336b/
        i686 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/2fd0b1b2ed49b17acf91dad9249e3ac4b668a045/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/a4e8f5e37a5006aaa99b7bddc2edff4bb9383139/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/1e2c76e60dd9c3001dfc9aef75d819cff8c4dbc8/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/d7d550ab748017bfea42200ff16ed53addb73716/
     aarch64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/5b206fe209a4cd8f7d64797344f2d2bfbdf98ccc/
         arm |                     yad-0.31.2 | NOK | http://autobuild.buildroot.net/results/878761df9aa467f4dd572f8c2fc17c5cecdbd27b/


-- 
http://autobuild.buildroot.net
