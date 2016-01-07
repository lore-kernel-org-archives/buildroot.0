From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-06
Message-ID: <20160107073021.EA2B5102939@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-06
===============================

        success : 200
       failures : 134
       timeouts : 0  
          TOTAL : 334

Classification of failures by reason
====================================

       sp-oops-extract-0.0.7-1 | 19
               tpm-tools-1.3.8 | 12
                  boost-1.60.0 | 12
                   assimp-v3.2 | 9 
host-vboot-utils-bbdd62f9b0... | 7 
                  libffi-3.2.1 | 6 
             bluez5_utils-5.37 | 3 
                python-nfc-212 | 3 
               trousers-0.3.13 | 3 
                     rpm-5.2.0 | 3 
               nfs-utils-1.3.3 | 3 
               dvbsnoop-1.4.50 | 3 
flann-04b4a56533faf8c8228d0... | 3 
zbar-854a5d97059e395807091a... | 2 
               libcap-ng-0.7.4 | 2 
                openssl-1.0.2e | 2 
host-gdb-6be65fb56ea6694a92... | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                   libnss-3.21 | 2 
             host-boost-1.60.0 | 2 
                 opencv-2.4.10 | 2 
        ltp-testsuite-20150903 | 2 
                      qt-4.8.7 | 2 
                   systemd-228 | 1 
            shairport-sync-2.6 | 1 
                     gdb-7.9.1 | 1 
                harfbuzz-1.1.2 | 1 
                   erlang-17.5 | 1 
                 mesa3d-11.1.0 | 1 
                iptables-1.6.0 | 1 
                    iperf3-3.1 | 1 
            kodi-15.2-Isengard | 1 
                  ffmpeg-2.8.4 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
          libedit-20150325-3.1 | 1 
                  weston-1.8.0 | 1 
                 setools-3.3.8 | 1 
                rt-tests-v0.89 | 1 
                 dropwatch-1.4 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                    ruby-2.2.4 | 1 
             host-nodejs-5.3.0 | 1 
                 libdrm-2.4.65 | 1 
                oprofile-1.0.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
                moarvm-2015.10 | 1 
         qt5imageformats-5.5.0 | 1 
             stress-ng-0.04.16 | 1 
                pinentry-0.9.4 | 1 
                iproute2-4.3.0 | 1 
              rabbitmq-c-0.7.1 | 1 

Detail of failures
===================

        mips |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/0eb5fa250c75480ee581ccc67c17d7616ea3a983/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2dd30bde8a0042dfa4bd1ea65adf5c5fb159325b/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/43567b73139f74c9f32661f1468593b86210484e/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/7fe5760f2096dbcc7d69de508d1e865ea4094c5e/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/49aa46875659dd2ef35bd5cb0611b12873974325/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3ef2dedc374004b4013ac5b3669780d330dd6e3a/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f14b028c819cf3ccaa3747a8c3783e543bb131dd/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3fc165a89e8469e5ead1b37cdadf3f77e103e3f9/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/eb6c408064fd483e1315d9d57cfe4d8ade893b3e/
    mips64el |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/036de586cfb7f9b1efa6aab995dbba0c9ac29533/
         arc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/1d03ccb40ad9dd5e4f6bab49c9f0cdffecab00b2/
         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/d12b4cc02afd8e8edb85c245fb12738175776b74/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c7c8d12b36b61c956bd2f5d00a608c91d3b24a55/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7339f295007143b7aacd3b9c398f761ff67b27dd/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e83944068ba09d6f5f4bf865d1cd433f7df104e7/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1614cf5aef0fa3c82b7b26cab1949a825075a4c1/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/847ab3cc823fdf418fe5c87c13c74a5581cceae4/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d945c062739768fb1bf3c084aac430439ee63e9d/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ff87f428a5ac4304c0fbefecd82a37f0d1eaa9d8/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bffc1a253d07d8fcb0cfa5f95729c91e23f40268/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/010ea7c15ab9487ea5363687b8dcfe260f4e1307/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d63b81c6f215ccfda354c81951d6583ee7c8e2fa/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c80f22ccdd0c899e662b272a34af02219034c78d/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cf8624ba065cefbbe2cdee454746c04658dc2837/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/791926e2d3360e0ff096a1847e924ec4f83a692d/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/937ad1cb2bb3a4950df77e886b176df7dc1bb25e/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/f8a5e22140e702cb532f549bd04db704cafb2270/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/d2a6bdbdc14e8f0b0ade400dc429836b8e19dee4/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/4fa04ba36fff078967de1a05788504c24dac9ddb/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/7fe293b09d1be84ee95875c27aa74e461a5d8e27/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/689caf41c2cc7b6a81b4f4ca44a575a81c0cdaa7/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/64acbba8ebfcbb25f64d943bfd3a4b404bd5cbcf/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/ba5e07841825dd89c7f4ced321fc4981550142f5/
         arm |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/317e73b7da1f601d63842537643ebc6b375c8285/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/1eb0a1d63aac7a96dd500ca8f9a14eb7ead85523/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/8873c6f0f6fd30290c6a09771b9ceb942c1763bc/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/1c689c98903399ae70190ff960bbf11f4d87504f/
      x86_64 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9dadbde72523c2f9f6cd6ecc8bf54bcfd510665e/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5cf5ba5fe69d6711139140305402e9cef8e36715/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/f80cef83484e32dd8e02aedc4b31fd9ec26e1083/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c6fe3e9c58f6b864a5f56698a02428cfe8d30442/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/e0621770d2e9557989fcc0c4b4074e55bcbafc9d/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/71048d36d4c696e4ea27e1ba35deff93ab965933/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/89d102a0116ce4907fa0f3fc324a78e3de27023c/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b2e6ad1e65f5926325c02bdb2995e65dfc5fd7c6/
     aarch64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/12ac2225a3ed47cdc8ef6dd13fe116b7d0f29db8/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c3a1867425b0afbec5cc49805df37dd89b56662c/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8ab17a1ed7671135990155a19c1d322e49ea940d/
       nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e315de6d8d57adc6952a1e7f893c74a3a6d16ce4/
         arm |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/771ccc13fd1d1a610c7ca83ae2f0c304b4dfca56/
         arm |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/71eeb66139e532389b7263d6a18241d15d481ab5/
        bfin |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/b4a3d00e9673a7aacc663c81de1d8e887a17951d/
         arm |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/322e3cd3b444106c9b624675c2265d4fdfefe458/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/dfdecfa8e81fa8478c2aa9c88394d1a1d645e107/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/714af30a2c7390cc0823a956a394023071584b18/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/5a050fb7e398d54657466eac8b6dfe89c9b66526/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/6512d6d96ec7b14b804b684191effda4dc884767/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/11c15ede2681a3be7fa6383a56427aadc192b866/
         arm |           libedit-20150325-3.1 | NOK | http://autobuild.buildroot.net/results/3d12a7e6423d236c9d528bca7cbcf86b1499d738/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/200b43f1e1a5f20d4e9c2477b671661a9a84344a/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/022757be72584e0b102daf2af57659d0d4864a3c/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/fc60d48e6a2a543f865dad04349382b14aec1325/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/fa77c3ceae75097d007fc3fa07408f7645a3154c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8de45830a72b1b92eef6ddbb809a6b6830b0607f/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7e109e642188d22b9a08b6cba0460a6bec18f962/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/ab5d81778e60459d0574505f42d06b593db3af0d/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/ebd0647eb1eef41a7fb6e5f5bab18d4d12168661/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/32177715ec7ac796f8e5aff14e5bc99148a01d7f/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/554ab071477a34d46e430a17236421f0321b5b30/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/77950e0c1d167bb6e7fda7a869802263f80fa4ed/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/cab076a429df6a301cc44d61f5c42ed2d7975bc7/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/3a2796dcff9e9c98c81136dfbcfc25ff21941edf/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/7bf3fdd9a3c62af5c3402b055222bfb4626fa71a/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/bbd41688e0cdbb027b98977033129d6c7e1d6382/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/0d60dd0303aa135b2883d4b1070dd7bbd148a38f/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/3821cafd5c9448d5e6e6e58d1cca498f1d78fe69/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/3e1753097c7c32b44f99c195e2c81a1e9920b61a/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/c79767b866af7382cf66143fa9c21868bf9d4b7a/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/ed5aa1212bd5de199ce690a14f443a12a55c861f/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/f463eb7fcbeeb3859fde4bbe082272356b20bcbd/
         arm |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/4ce5eb1e27c56caf8baa926194c1a7940e91a03e/
      x86_64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/3326484af6748060025ecb16aa34c347ddc1f039/
     powerpc |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/050010dca13e8cfac834e13baeee9cf645ad14d4/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f0e57fff9b66302722bd8a7948f67150db59c070/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/61b1d24709da6c9acdabb554fc4169090b4d4dae/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/48d99df21f629f88b29ee83e7fad7f9472b23d14/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/5fb82c633b4454cf9df66bf71bbfc49effd8e1c4/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/863b0ab8c30c8aa64fa7fb07169c02d4a909a5e1/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/7fabd051b959a7662d5eba86026dfcfb1bb22eb8/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/0dcd04ed6db5c6b48ab58cce0db90f9f0c10bdab/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/e1ffd5d192615bd641f0f4b646e6b813b1120158/
     powerpc |                     ruby-2.2.4 | NOK | http://autobuild.buildroot.net/results/9cea7b25ca008357e8c6054723fc797d793a4583/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/f3315e047007dde7d817e6e4da9ef9cb0e5999b5/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/7433b8681805230a2356c7a545f10cc8446bdf4e/
         arc |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/85a3f01bcd4eb2ce7ac480e63b4cc04bf7c8f3e5/
    mips64el |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/abd27966f686fc731db0187f4128fb2ef259bfe6/
      x86_64 |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/233dc7523dafa6d7677c4563ad7bd013fd53b4bb/
        i686 |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/7783964a807ca75247859cd8bd6d8f8735f8607c/
         arm |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/116a3c9fca518e30ac6211a15f79226334ed01ef/
     powerpc |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/bd515cee1703908a192c3d536590fdad883dda1b/
         arm |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/aba2a4a0632bbfabc97e7303c51a2437b4ded0da/
         sh4 |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/d64a4f34b8a1f82f2d181b5657995d84f069df68/
        bfin |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/e6592a80f998a7352f43abfdd71de5e5b7b03b8e/
        i686 |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/6c97abb6cb83c0c452e6e62a32eac11a344a38b3/
         arm |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/219c19882c945fb479f471d7d3d80eda0edae64f/
microblazeel |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/f2aa4f2871c9e5ba144453b2020895acf09aa414/
     powerpc |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/0f6df06fb6939986e3ad3cff35aeedd62ab8b39d/
         arm |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/0a20233a117325d8ed9b98a207866df5da25fcd2/
         sh4 |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/2bc5ac764954d9022808613a8dacddeb77f68056/
     aarch64 |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/f70db510d834b7242a78b68eed1d1585981bb458/
      mipsel |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/fe60ad264afc113721a3876c85260bb755363123/
         arm |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/f72fc7189cbc7191f1b75a8ebd1fc319650c8e2e/
         arm |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/246782b7d304f4b7ff793abd3ecbfedaae36c919/
     aarch64 |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/94080aa6d56741649cd1835b9bd232740ada914e/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/a5bb7655e5c6c71f0c6070f694d774b9d34aef3a/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/8f0e1015bd867366a47afa19d465fd8622be900b/
     aarch64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/160b226a8a03fa4fc6d2952f1f1e914ed1438eca/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/610647bb8e365f0c2e1ccb98de88d34ce519563d/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/47d0541bb3f37b0a92f21920a26f71e5cbdf3836/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/2af6fc331857393936f2b8c55529c67ee33f2422/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/a39d193a5c4b7f34e0b3de95ed44c4b11077f7bb/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d7f61734911b306d1738260b680752d21c6d90c7/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/394519f87c866024215d6427ffe180e583848bd7/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/92541645145c50f5cf33b2b536e59621c301f74e/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/71c52c43a81ce422d1d8c350ce2e77ab7d8ac60b/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/99340f9ff5167f96fb6f0894ddbc5783a08ddde9/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c8aafd01175d27b680f90b7fca0c65f5c181d946/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/7b6f156a2a1db383af8130a7cf4bbc3217cf8756/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/0fd9ab894fab1d0a43056afabbc8a67a42e25e55/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/e4a43f666f0c25b33b1d41f5ae1cbf5b9879087c/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/6046f76de7fc36dc697944563b21a099c341f520/
        i686 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/4769d3a5d5992cbfcf1119db98141be5904b90e3/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/063d395766811438e66574b81a54932c9ef679c9/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/5934fbd7f376cd20198d01014e54ef5e1525ab91/


-- 
http://autobuild.buildroot.net
