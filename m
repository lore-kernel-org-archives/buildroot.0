From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 May 2017 08:28:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-06
Message-ID: <20170507062830.8FCA920820@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-06
================================

      successes : 185
       failures : 65 
       timeouts : 2  
          TOTAL : 252

Classification of failures by reason
====================================

           host-protobuf-3.2.0 | 19
                wpan-tools-0.7 | 16
                    mpir-3.0.0 | 9 
                    mpv-0.25.0 | 7 
                 qt5base-5.8.0 | 2 
             rabbitmq-c-v0.8.0 | 2 
                    ffmpeg-3.3 | 1 
                  hwloc-1.10.1 | 1 
        luasql-sqlite3-2.3.0-1 | 1 
make[2]: *** [all-recursive... | 1 
make[7]: *** wait: No child... | 1 
                  ntp-4.2.8p10 | 1 
               opencv-2.4.13.2 | 1 
                openocd-0.10.0 | 1 
                     qwt-6.1.3 | 1 
                    radvd-2.12 | 1 
rpi-firmware-4b24a81a2ce94a... | 1 
toolchain-external-codesour... | 1 


Detail of failures
===================

        m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/f3bb75c0d74b30f2fbf0bee7e749e3849fc0306b |     
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7fd142e3b0a008411ff470553bb6dfa71f0a8986 | ORPH
        sh4a |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a379205c99ff73a4ddfeaec8d0cf6673c1c15706 | ORPH
        m68k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2126fdec1ff8e9b4095f2cad3fdc1f85e1892185 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/67bb6651adbcfe505fa1f331dbf718ce582428c0 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5a731a3db6c3e55680787faafe5bb0f96456bb5f | ORPH
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/e9af46cabe8e2c5647e13f4c7910990f7eeb5b9d | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d2d57c082a81cda4db16dcd112c15259337e3a13 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d9c4d9c0641443b005cd6cbdafaf32a657e7261f | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/acf6055d851c627467b5f98ad4b3c189d54191f0 | ORPH
        or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/9f32d44eba42958be29d19a640a71b3145f40d8e | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/adbe264094194327fc9ba9759cdb29dd4868993f | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/31c7ff69656608641931a7033da4d8060e392950 | ORPH
      mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6e54d8256a0e468c89a42db27fa7f6bd1ce6714e | ORPH
       nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5c128d44270e8c7319dfb7f6dfd8c8052d2d6ee9 | ORPH
 powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/37acadb766ec06fbc0294dc336d5ac2a327a157f | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a5d96a5733796a8b7c4afd8eeae0606c31d9f3f0 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/287ef253a5e9988ec3a98c174378e6ea8182fdab | ORPH
     aarch64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/e0a05342095e23a79c69feb24bab3b6fe23340ae | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b51fc7f222e2b38bc4a0411d90719bead0c95a99 | ORPH
microblazeel |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/3952669e7e8dfed12bc5a4fb418388249b45dce5 |     
      x86_64 |         luasql-sqlite3-2.3.0-1 | NOK | http://autobuild.buildroot.net/results/85f7a50a8361c08c3b8681c1a019538e5f831aeb |     
microblazeel | make[2]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/835ee3b033b9064ee07e6b459c01304c63482a4d |     
microblazeel | make[7]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/caa08c2dc94d3b5cb1d58beb69b88581ad588418 |     
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/e533f509869905868112037835d48355d9562c64 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/2e4a27af60065db51aca9e69701bc191d24b2209 |     
      mipsel |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/db2542a2ec3029eda81738a7ae5faeb9ea4aedee |     
      mipsel |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/20142c0e8bce01a1bcf7c8dc26bda7056f6dd1ee |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/50b94e6d0dbc33664c6bfe06f83b211083aa07f7 |     
      mipsel |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/883a91bd074a856316a4d34f5f2d7d423d03d4da |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/76400ca71a3fae036d19cf372d5a08dc6679737c |     
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/919bb689904f71971466fd5306e3bc3e35dc4610 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/4d7f2a1326f75e11693bdd51ad274079b0dd0ce4 |     
        m68k |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/8a98b5ccc226bc144dfbc0f459406eb36da289b2 |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/43c20fc53b83705c187f65b2abbb5f469e3b4a4c |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/478a3ce6fc22d6e46bdd8f5ed1c94818749e4655 |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/8f59ba376f0716dd3a0f1f9ccdbf184c2516a15e |     
 powerpc64le |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/ddf6c369c5292fc4cf99cd2fef1b056b39d3d20d |     
      xtensa |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/db3ae59fa0b65cc4a2e583223c46fc674d4a80a5 |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/9197058ad174f1cf435e15020ad315e5006c857d |     
        mips |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/0ea378c62538b22219aa7a22d69a581b6713ec0b | ORPH
        i686 |                opencv-2.4.13.2 | NOK | http://autobuild.buildroot.net/results/a2ba77af71663ae6f6adac1ea3d0e6838fbc92b5 |     
        m68k |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/17b745dc753c6e7bf65d4568171ee034662d1b76 | ORPH
    mips64el |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/7de25a4d981d3762d994882a2fef5696556e662c |     
         sh4 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/02f20929aeb4c901feeeb95323223b6ea17396dd |     
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/0d6ccc8836f2a66d1e03403aaf01b4e73820aa87 | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/60b6868c34352673f6005d68f1e1dfcb765acecc |     
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/dee07b3f8489bc403c4a8d35b311799c328145e4 |     
         arc |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/70420df605009c9671afbf4aa9909e6fc000daa9 | ORPH
     aarch64 | rpi-firmware-4b24a81a2ce94a... | NOK | http://autobuild.buildroot.net/results/c3c0b05a12beca45d6a2737ab620a7a1c6205562 |     
       nios2 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/6cf67b3ada9c175ff269ac3eb99f3d5235a78c3f | ORPH
         arc |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/a655388c9e227ad832ab839bed65ab951b6961b6 |     
        i686 |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/b32efb9c7e40d835c628a151fd1171304874623e |     
 powerpc64le |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/d30e8bd06da6be70e9a361b7cfab41843f82675f |     
         arm |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/d3010f82be70b4114d0025c5e3fd02a8c5686fa4 |     
         arm |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/472488d24fdacd58cf1b15565e9c5a17f0290e4b |     
     sparc64 |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/cb7870ab04c741df9c6153f0656f9449d377ef34 |     
        or1k |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/4680e17c3b9bc6714bd511d5beccccdfb976b6f9 |     
        sh4a |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/ee5f56243a8d7cb5da39b7d12c76d33e00a31e93 |     
      x86_64 |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/17858d6bb3ee52e2e2fc2958d9066cbfb1f9333e |     
      xtensa |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/d7802061b289bb0d2cb5d43cfd7a340614c89461 |     
        sh4a |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/6daa4f4b4e8be662c25b325c45354cc1e3f7b5c8 |     
      mipsel |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/c3c8bb9044f2151ff042f2018d4479b37113f9ca |     
    mips64el |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/6172d75e97706138020f03b29362142fd3095e69 |     
     sparc64 |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/cd608042d851cbaf223f41b2b8aa728fa031051e |     
         arm |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/ed25f2c92a65e715e32c8a619253de8d88dabcd0 |     
     sparc64 |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/b533aea23ceb62e7c97980f3fbbf8c59434000b9 |     

-- 
http://autobuild.buildroot.net
