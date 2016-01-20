From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-19
Message-ID: <20160120073022.201FA101A22@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-19
===============================

        success : 200
       failures : 89 
       timeouts : 2  
          TOTAL : 291

Classification of failures by reason
====================================

host-vboot-utils-bbdd62f9b0... | 8 
                  boost-1.60.0 | 6 
                   mplayer-1.2 | 5 
                bind-9.10.3-P2 | 4 
zbar-854a5d97059e395807091a... | 4 
             bluez5_utils-5.37 | 3 
                 libdrm-2.4.66 | 3 
                  ffmpeg-2.8.5 | 3 
               trousers-0.3.13 | 3 
                      qt-4.8.7 | 3 
        ltp-testsuite-20150903 | 2 
                 setools-3.3.8 | 2 
                  trinity-v1.6 | 2 
                     vlc-2.2.1 | 2 
                 fio-fio-2.1.4 | 2 
               nfs-utils-1.3.3 | 2 
                nodejs-0.10.41 | 2 
freerdp-17834af7bb378f85a3b... | 2 
                  connman-1.31 | 2 
               valgrind-3.11.0 | 2 
                   erlang-17.5 | 2 
                 opencv-2.4.10 | 2 
                     mc-4.8.15 | 2 
            gst-ffmpeg-0.10.13 | 1 
                    ruby-2.3.0 | 1 
                       unknown | 1 
             util-linux-2.27.1 | 1 
               lighttpd-1.4.39 | 1 
              quagga-0.99.24.1 | 1 
                    faifa-v0.1 | 1 
                grantlee-0.5.1 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
             stress-ng-0.04.16 | 1 
                   assimp-v3.2 | 1 
                   redis-3.0.5 | 1 
make[1]: *** [libleveldb.so... | 1 
          chocolate-doom-2.2.1 | 1 
                host-gmp-6.1.0 | 1 
                 mesa3d-11.1.0 | 1 
                sqlite-3100100 | 1 
       openpgm-release-5-2-122 | 1 
                pinentry-0.9.4 | 1 
make[2]: *** [code/CMakeFil... | 1 
              gst1-libav-1.6.2 | 1 
                iptables-1.6.0 | 1 
               dvbsnoop-1.4.50 | 1 

Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/6c76a8db372b43de1036beff67ed6e40955d1546/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/0880b40d3ee293ee5214e8dd8822fa9adb1af1b7/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/7e22228ee978430089d4a04d2c50a3dfe445d407/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/9ba95a3ac06ae5581ab1bd4dec1439a7d8798b81/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/1f137a0d1068ba0604de8a4d6d46792a8fe41338/
     powerpc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/97b4127cd58acbb9daab9d56f872bcb2a6a5b78e/
        mips |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/ed8706f796edcabecfb02cb10b1666890fa9c681/
        mips |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/a524ea9a6f3c71249c84968b348697c55acc9323/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ee8747053535f0b640e3024f199330fbd604da62/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9d7ff71a2532b63cf6ab96f97288f858adad3990/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3dac88a690e7d834bbeb883336d1390b5d9708e9/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/36c3c3d91373dd4af60d3e492dd758f9bcdbacd3/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0c2687cd1506c0dc24063e126b284795f2f936f6/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/023ba1205806300d288dea27594aabae15c83f29/
      xtensa |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/4ee7033fa08fe55546a3319987fb92a1409a6cbf/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/66fe9826467a54f8330d3404363e5b139f6dd5dc/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/7917c654f15f845582e33ffe3b8f2a30882a5283/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/1661324cc8e05adc271f2775479f508cdca8bada/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/5d38061969247aa88ef915ff4ce223abb8e04064/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/3595058717721c8f8078b3cdb18fdd0e30cbf1e9/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/b9899b80ef6e83cb52b04c51318057b1095f15bd/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/67827e876bdb1f4cc5c44bfc770c70731ac8af3b/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/48d9e5be89a12a520c1c63eec2fbac14f99242f6/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/ab95efda213aaadeb83950de7c6a5139acaa39b1/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/5f5bb575bafc76e903daba6ded274f01a501e122/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/e8bcefa1c70bc2a49dc9349696f1775b5512beca/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/934f403bd7f952676a0191bfad728de04ae5b8bd/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/94151f32fba58dba9883d10eaaa9d3f3464c0872/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/473eeb55b7c1f6e3e91f680b10aeb47a175e2173/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/e54f0f9aa8fbc1760379ce64d17422810864b56b/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/0ae63aa75177b3a8c1881c1cee1829f3e4660cc0/
         arc |                 host-gmp-6.1.0 | NOK | http://autobuild.buildroot.net/results/e66939df2180cad986bb92732cbff919dee162ed/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7a02ff049fca45b0d13cb2e26f3adf56a2dde2a9/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/193ad3fa381f1df355f705835e783c5b9cb9a97d/
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1b2f4960202a50a320915f14a2fe1927bc2246f7/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2d9ace52a5660923e1ef9cec088feae4e9243a53/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8200630b8c44b1b84e84369a4cf40a07678968f9/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0d8e9df08f84f7e7f3a0d585e4302315f21b21b8/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4a2a2c2673fb810c8d62e84febda27ad9b3f21af/
       nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b8704da9bce2eadae7553afe104ec5d15285be19/
        bfin |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/4c5a90baeb58e92b76581064c942123adef54d4b/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/b134fa28d080577804225356744944114bce2196/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/e2bf4e0c99fce36cbfe1b8697373b86a4a1372cf/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/e25719b8257d9f5285a847d5165cd2b5e786237b/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/dde514653ea6306613e4a7963aaf6ff4c1fad6bf/
    mips64el |                lighttpd-1.4.39 | NOK | http://autobuild.buildroot.net/results/c73ef8ada4cfe033ebed9201b788642541c78648/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/9bf3064d5dabe8a5dd92c380133ced7433659258/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/f505835bd71de5be2d8cbeb1f20ff7f7332454ca/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/673f436021c61c343ad5f5faae7b7e0d89c95e19/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/85e6042862ae2874ee47fd96e18daba0360bf971/
      x86_64 |                      mc-4.8.15 | NOK | http://autobuild.buildroot.net/results/63f50967ad74e79bdf309e5dd1266bb3e4ab2682/
      mipsel |                      mc-4.8.15 | NOK | http://autobuild.buildroot.net/results/d8984471ab14223327bda279c6bfb3a2fc1829bf/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/60dc2da1a2fa074b89c180206848e735848f89b5/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6bcb90c618105e0b0ebe05a95c79a1217d7f7d64/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a33aa2b6fb9f2b6ad9ebd29c5c6474cee59474c7/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/98df701caa90fb02978ec159f1438b696b02dda2/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2157731b95c799b4996b82433728e870dd3ec79a/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/98b7ae7ae01b303c27cbd11b77f0f090cd7b57f9/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/a602b02479fd70ec3f65357ef8a697ba9d2e8006/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/af86144c72c077fb92c7d94cb6ddce1df68070be/
         arm |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/61a6499f1f628983b335538ce67d9d45f15a7f0e/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/f0b9a8eb60908243ffebfbb4de49a59288ab8ea8/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/32526d9daf755c062c58885cd6cd7b352b44c203/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/4528b676c48abb37f99dbaa5272fd43406fac341/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/854554827ead82f29b293ddceced6eb7fbfeec27/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/8dacd444d96c6132946353bdedd168c5ab79452b/
        i686 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0315ad542cb99a2d4fc21ea8453b8d5e3c2166a8/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ce9d2d72ee5f727bcb24d4de9ec6bc490d2b5f95/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/471dc15367b8ad539fc19d490a9a909bdcd57414/
         arm |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/4a516822c3d0801eac0b05aabac18052b5e24381/
       sparc |                    redis-3.0.5 | NOK | http://autobuild.buildroot.net/results/a61886a866dd61f5559c1639bfd76ecc33777774/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/171503116bc05a0dcd3914876ab44d1fe8226d27/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/6b650e8082fac423813d74d91380e09ef43b0718/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/be2d6a63d4fdcbcbbe45f0e2cd58359f761ad801/
        bfin |                 sqlite-3100100 | NOK | http://autobuild.buildroot.net/results/23b7471a8bbdd9e8f858d9c84232ad82846c0db1/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/6853327d06148cbc7d10ca81f08a5cc2ac4d0063/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/1bba67c31966504bbb832a77a6427f5537a7171b/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/d1bfa1c6788f4dee92cd2bcc84acd6fe67792745/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/574f10634faa2b9a01ffe82f79beb557bdb0461e/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/946dee1ee1591443542f6edee89a74af1a322814/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/85fa65c399248202c0adcdcf8f13ea05c1377f5b/
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/f619c013af2131cc6d31fdbf22ca1c0aba06fd7f/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/7da76b6ce2f19d822ec1f3b224c379853a08c508/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/aaf66c1ac201c7611b031c020208af1e9ba38b00/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/0607204505ffbdfa717f3eb3049f4d6925bf2d90/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/c8c0ef631c3a250270653300b43e87247c9e3bd7/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/fab5a6759c40e4f36c96d3246bebd0a8220d2b44/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/dfa3b4597fd0055807526dd15b84ef932b752387/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/a58f228cfa090aac19b4257916b8dac6dcbf2acd/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/7bd9225fd4d7bd641924dc2e6cab39f7247f27e6/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/fb6526b47f3165b659dd25b5956a67dfac9ea597/


-- 
http://autobuild.buildroot.net
