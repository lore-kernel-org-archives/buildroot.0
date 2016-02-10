From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Feb 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-09
Message-ID: <20160210073021.BC62B101E87@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-09
===============================

        success : 172
       failures : 133
       timeouts : 1  
          TOTAL : 306

Classification of failures by reason
====================================

                     kbd-2.0.3 | 28
                pulseaudio-8.0 | 10
                 libraw-0.17.1 | 7 
                  boost-1.60.0 | 7 
                numactl-2.0.11 | 5 
                   fio-fio-2.6 | 5 
                      qt-4.8.7 | 3 
                  gamin-0.1.10 | 3 
iputils-c8ff6feaf0442f8efd9... | 3 
                 mesa3d-11.1.1 | 3 
                    sox-14.4.2 | 3 
               libgtk2-2.24.29 | 3 
                  trinity-v1.6 | 3 
                  cairo-1.14.4 | 2 
               pax-utils-1.1.4 | 2 
                     vlc-2.2.1 | 2 
                 libdrm-2.4.66 | 2 
canfestival-7740ac6fdedc23e... | 2 
             util-linux-2.27.1 | 2 
                 lvm2-2.02.138 | 2 
              libraw1394-2.1.1 | 2 
               nfs-utils-1.3.3 | 2 
          chocolate-doom-2.2.1 | 1 
                   tor-0.2.7.6 | 1 
                  stunnel-5.29 | 1 
               qt5webkit-5.5.1 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                   slang-2.3.0 | 1 
        lttng-babeltrace-1.2.4 | 1 
                 igmpproxy-0.1 | 1 
     host-google-breakpad-1373 | 1 
                 libcue-v1.4.0 | 1 
                oprofile-1.1.0 | 1 
               trousers-0.3.13 | 1 
              gst1-libav-1.6.3 | 1 
                sqlite-3100200 | 1 
                  lshw-B.02.17 | 1 
                   qhull-7.2.0 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
make[3]: *** [.obj/qabstrac... | 1 
                   luvi-v2.5.1 | 1 
                     flite-1.4 | 1 
                mono-4.2.1.102 | 1 
 netcat-openbsd-debian_1.105-7 | 1 
            gst-ffmpeg-0.10.13 | 1 
                pinentry-0.9.4 | 1 
                    ruby-2.3.0 | 1 
                 openal-1.17.2 | 1 
                  connman-1.31 | 1 
               valgrind-3.11.0 | 1 
                   nginx-1.8.1 | 1 
                  psmisc-22.21 | 1 
                   mraa-v0.9.1 | 1 
               host-efl-1.15.3 | 1 
                libgpgme-1.5.5 | 1 

Detail of failures
===================

    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/729f5e2413c573b9e21cbf81a24837dcca4a0a89/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7c54eed32513f9cd27707e2f694679c370743efa/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/094af1f5abafd94bd11e84775b9ffe8aeeed31ab/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fc402a45ce1b0c593be4a8b28026c59d13fb48c1/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c71f8d323854170433da4d4b75420b656aadb069/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/18446143c7954298b681ece86cb539f1b0ce5078/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/622688dcfd274a624394d8095763eaaec0c842be/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/f5ef7746eae0f85682b755af481194cd1e96c480/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/0d4e5f5243db490f4ca2f7ac76741593d54f38f5/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/c1fa191f905422fdf1b1ceb58c4b8a86d08be854/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/c15d61fde2f54a95df20f8ce139ebbbf8a716f86/
      x86_64 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/a94704be4a541085eff126beeaa3dbd146dde71c/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/550aa1feae9abc9a7de202c8469b52c680724bdb/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/10437e72018f5f156ec2e8935dd67b0f54ea1c27/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/8f747d4f0ce281c4aeb6691a85c898dde39c1c9a/
     powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/1a507d060cc490a724d89c8eb06d13b33bebaf5f/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/073a8ed79e847678fc91b82a4cf961d21746179e/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/69357818eb1b42656885e6c412321dc075f4792a/
      mipsel |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/0e0ec600aecf3301c6df7162e08e3d50efaf9d79/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/c43118ad56e11564b0d1bad4ad02771d3042d461/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/f412f4b03ad2f2497005cb003fe00a3422cd73db/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/e1352ee3eb0dcd75779c4e77a7adb3c7a0249eaa/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/59d55ad94d7b12574a6e29328a6280b41bb3cadd/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/089912a6b74aa0af8776af409205869437324cf2/
    mips64el |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/69fbb8b898bc94a18e25cdfe58af6a765e024ca0/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/b1f16b132926f4f5b967fb7296f9a918b8a50c66/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/fc56ef0ba0f50664457364382d463daa27cb5205/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/88bce9df3d69fecec251c5695170a4a66c8a0a44/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/e4c3cf6889b30af9e12a0b5332c6f3e810e542cc/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/4dd252c30d7dc2eb554a33cef2b087a6e537506f/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/ddd904a531ab892173405836ad4fb9d2350f9252/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/829375db68136b36fc31d7354b70183623c731ea/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/c4aec91f7a4aba7b8b74e67ecfdd58e67eae56dc/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/5436978299df4e1ae381b6006a7ccb2fba95c69b/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/ad4645852c7b82359b4e76aefe312e511be4b2e1/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/7139bd0145f0c72603e03a01f663e268dabd7933/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/65dc456014e57f61b30a118cf95c645d2b75368d/
     aarch64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/14465e049d72b8a6cb0daf197fa922a91c75deb9/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/0e1540227865e15333910ca97350c1cbc09eacfa/
      xtensa |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/22af6a1617968220126de9ebe6af2c8b11a3abaf/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/aeaaf6b300467fa1e5fbebe8b8746dc9f68b61b9/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/d9104c29a9fa3e4e758f1090db1c4d4a0922a0c1/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/148a37c43e8f6a1aa741cf052ceab74fff76c62a/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/8bdbeb1e32ad5ec67311657ebbaca75db2240ee0/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/3b7838bd28e13a21e342799c5c130a7db066eafb/
     aarch64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/3215c0d4d82642b6df5117c32b1a970d55d11c1e/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/3d93c2a647afa5f77500241feec812eaa655ba01/
      xtensa |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/65d5fd9b39fac91cf204d00e06e0394a5eede77a/
     aarch64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/e7333b3d677e0f77ef6305b575a1e426060418c8/
        sh4a |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/4cad3abf9bba5260a558d1e460ca1867005189e9/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/ee3e01c7f7b15cb85afe0b5f6cadb1ba2edfafaa/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/91fbd87936ad13ddccd2620c4eada8aff99b4712/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/227beb31f331b251d2a75413f8e9e2b731adcfbf/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/0c5a19302897e49e541392d849813f09f66c28ea/
        sh4a |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/87ea83ae4e7b7640651acd5031a624ca42e5b348/
      xtensa |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/d633337d3f7a67ac743171c71cc8fbc02dfeaee7/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/532684b98e050cf5b4c50786bc9e8825eab21f97/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/060eb6786e88a47aedc83c91447aeb4876320961/
    mips64el |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/9500a289e5c320e2896424b4b5d1e3342c5bc42e/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/0f6579fd31b7c6033c5f6bf589df3084b384aa81/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/4dee7f94a37e7046025f4cbbc1d930dffa1c9ffb/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/94e8f5313fea15f01c121387525cbf4d5a9cb90f/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/18aa83d405a1c83949ff0d0f51c4edb645dd773c/
         sh4 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/3191ffafee12671bec35a1243809da4afcdd46ef/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/86d95e544810628d198d2cb580d767f31a6fc649/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/4721af32d8a24ef3c596fdfe90565976f22b2beb/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/f70ff87972724b0796fcc20bf753afedabd971ee/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/4975f7ca8441653a78ddbb154c25f14bc73343bc/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b53dcef9dc8d46483bcb35ea27278c2ce239a7f7/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/8d9c975b8fcd0612e46ca80c4eb3d7844842c3db/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/1ee1ccacb78268afeed5c00c3675ec2030d24ae9/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/7cef84bd44ebd1dc5a2f1a6d1dc33fb0e44922ab/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/4a1678131a09c140388673b201b5299305b7bb20/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/02cbbc73c8657f66f5ec064ffbf5224611921b94/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/cef17590286b05419efa4893d192cd67431f493f/
      xtensa |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/a69bb4ce29ddf9fd8212936719c5f39a3d07af2a/
      mipsel |                    luvi-v2.5.1 | NOK | http://autobuild.buildroot.net/results/cad9a64d353a106a0ccdebab91310a9e3550aa10/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/356b3657a2553121a9c10c232b7a44551656b50f/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/935fe83df55a8597a65d1a82ea88d0250ca35056/
         arm | make[3]: *** [.obj/qabstrac... | TIM | http://autobuild.buildroot.net/results/58df0f14caa9e605b6907c9bea5e13949b6ea493/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/c682b4b7248f27a843659aa369a67acb1ef2dc21/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/f9f71d8aeecfab5ee2c1581b1430dd0a2a0c4a71/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/6a9a47b0b42d9e8d4a1d0b544086b8f5d976c686/
      x86_64 |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/d91588a79107a4531d6116304a299c2df1abf906/
        i686 |                    mraa-v0.9.1 | NOK | http://autobuild.buildroot.net/results/340574aec9c9d65d3dad2297f87c65b96acb474c/
     powerpc |  netcat-openbsd-debian_1.105-7 | NOK | http://autobuild.buildroot.net/results/78eff576be08f7d9fa30e6173e6a24e17d43d9ae/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/19c05ec6f5ae81679133a3f16204a13a89b552ed/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/ce1d4eaed32a11b647d32cc3d7548e5d7a1d7f39/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/858ffa907bcd97aaa4663d6b9db45fe4c50e9077/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/08b67e0b3666d22b15b9d1c80f7cee7befc1ce98/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/dcb8b6dcf4f1491b027dad2f6d5eac27a9b33f82/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/9ff3f43584170703e58e54e78dd555769fb98fd8/
        i686 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/39f8003133046a19ea57125efb86082e5124ef36/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/98b446df968d08e7e929089a7e8434acc2d4d6f3/
      xtensa |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/25f9205e2d24ec4f09a1e9e005d2a6d4fdfe64f1/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/85e11660ed6a52a1c81bfdaaf26ee8b651479bf0/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/1a5496217a16eba3cbb1643a022fc63fc31af0a5/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/14d45397025d9eeaa8b25d3482d6b1a1ce826629/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/d3f18f85aab723ae76d1f8c3c6bd372116e9f6f1/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/c7435c3a30e2e71036ec73bc1840541b7d2a4b6b/
    mips64el |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/b61f4336b97739dcc8bb98d5c48225356bfbce49/
      x86_64 |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/2444849ea059a7a54b3e679721a6ed075f6580bd/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/a4f7ecdfbf822936f15e8018c043e2f955695acc/
        sh4a |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/a7fcf2603f3fbdd95817956ef2e1bb7829a30b8e/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/0ec35d56b079843020b0f6cb94860db9bb68623b/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/990af2ab22c08db36099b7a87d409eee97ed4325/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/0747eaec970afe9b3bbfe5f878a5701928f80ae3/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/b40629051cbc6bd872bc5f9bdaa542df0321ba31/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/c9c1a459a6f27761aee875df7d1f3ef571ff4700/
      mipsel |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/42a4d25746350db83c4b90f98226d3464dea6d18/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/2cb8cd999648216f9ca07c35b2f68e5531abd4f0/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/7c6cefc74301c1ba5f77cf8f91bbbf2422872754/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0bfc92fa3bce6d72656ce32b81b343dabfa26b7a/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7a255468a3d06e0b074ee9a299fc15e1136a2208/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2b9c34d2027c3793690bd58d846f22f342cbcad2/
      mipsel |                qt5webkit-5.5.1 | NOK | http://autobuild.buildroot.net/results/85e7c9fa4e437863eb59a91932abc0b1b923b4d5/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/c3815eac205c1061983218178eb6e2fd4d610167/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/54ee9a5385aec151384279d0a7ea589041774451/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/a9ac9bbe2a5a9066fb59393a24b94be1adb043d2/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/0c451712b7d31ac67af89dc98d8c05d311a3261d/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/2cd76446c11d129c1e90d301fb0a91ff2db20c6a/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/74d0f3ce1ef4b556fcdfb7f0b3e3d09aa94b5506/
        bfin |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/fe909de92aa6d683f2ded9dd0220863ac960fa16/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/f7c8fc060346c8a21f2167ee0a5baa13ba7de530/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/3f9c29d7125448bee4da03c59efab4b451c6bba3/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/5a340783fbdc360bb8296ad67a3d1c93104ff301/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/99e572579254909f11d908f9811eb7c95356fa77/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/cb8aa24237b026583a369b675fde6c52a595e2e1/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/d92f70af48cc0aac10bf6383edb42784773bfdb6/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/e8197a003e454cf51c60e0cc9636f19998360be2/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/69de7aaa96f816fba1e812bb393aef8b7998d35f/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/f5f7487ad623795fd614209f72fb7a3f522d40bd/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/3d57081c87e98e1a78a6d299a833c34a739b40f1/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/4a3cd91c56b104264c865f2a29e7ab6d02bdcb03/


-- 
http://autobuild.buildroot.net
