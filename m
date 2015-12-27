From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-26
Message-ID: <20151227073020.D8AAA101B52@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-26
===============================

        success : 219
       failures : 129
       timeouts : 1  
          TOTAL : 349

Classification of failures by reason
====================================

                  libffi-3.2.1 | 13
                  boost-1.59.0 | 9 
                  boost-1.60.0 | 9 
               trousers-0.3.13 | 8 
               tpm-tools-1.3.8 | 5 
                   attr-2.4.47 | 4 
zbar-854a5d97059e395807091a... | 3 
canfestival-7740ac6fdedc23e... | 3 
                  autofs-5.1.1 | 3 
              rabbitmq-c-0.7.1 | 3 
                   erlang-17.5 | 3 
                   libnss-3.21 | 3 
                  connman-1.30 | 3 
                alsa-lib-1.1.0 | 3 
             host-boost-1.60.0 | 3 
              alsa-utils-1.1.0 | 2 
                 dropwatch-1.4 | 2 
                 mesa3d-11.1.0 | 2 
             stress-ng-0.04.16 | 2 
             webkitgtk24-2.4.9 | 2 
                   strace-4.11 | 2 
             host-nodejs-5.3.0 | 2 
               iptraf-ng-1.1.4 | 2 
                  ffmpeg-2.8.4 | 2 
                      qt-4.8.7 | 2 
                   tinc-1.0.24 | 2 
                   mplayer-1.2 | 2 
                     pcre-8.38 | 1 
                     tftpd-5.2 | 1 
                nodejs-0.10.41 | 1 
                   opkg-v0.3.0 | 1 
                    neard-0.14 | 1 
                  aespipe-2.4c | 1 
kodi-pvr-argustv-32f03271cc... | 1 
                harfbuzz-1.1.2 | 1 
                oprofile-1.0.0 | 1 
              cryptsetup-1.7.0 | 1 
                 opencv3-3.0.0 | 1 
                 lvm2-2.02.138 | 1 
                  prboom-2.5.0 | 1 
               libcap-ng-0.7.4 | 1 
make[5]: *** wait: No child... | 1 
      kismet-Kismet-2014-02-R1 | 1 
                 igmpproxy-0.1 | 1 
               dvbsnoop-1.4.50 | 1 
                 gtkmm3-3.14.0 | 1 
                moarvm-2015.10 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                  gamin-0.1.10 | 1 
             netbsd-queue-1.70 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                    ofono-1.17 | 1 
                 libdrm-2.4.65 | 1 
                 openal-1.17.1 | 1 
                rt-tests-v0.89 | 1 
flann-04b4a56533faf8c8228d0... | 1 
      host-gdb-arc-2015.06-gdb | 1 
             bluez5_utils-5.27 | 1 

Detail of failures
===================

     powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/6f6e30437aba043a953ce870ce0a1b8c283a8fec/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/a4ccc909d40b6d56e42ebc5079711e05324dabc6/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/a7a7f00a4eeaf48d1b603fd6f91efa4a6c5ce308/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/379c78c470e8ffec1d53889db684f5687ef520ae/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/800e628a95f30a596577095f18c6ca4ced936446/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/498e60e52c764194ead231fb65e82c639609bbd5/
     powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/09245cb36fe507346b1810262f331c0242b5325d/
     powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/98843819674cb7026409720fef933a4062a1b630/
     powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/61c9599c02bbee2d0853a515db05d0fadf1e5d3e/
     powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/ecc2ed5222a24653ea52329788b6982271fb5c3a/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/93a541b7b971c6bf06779fe96636e6164ebcb997/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/d79edf5f5cd4060ee806688a905fa6cad4b3ab5f/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/9ede6ab1c17262fde67f763e55bea1036349de0d/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/c8d17e6f9f39c67f8b5fec9bc2f38cbf8c642980/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/49b574b31533742ba8aec63701eb7e4cbb110825/
      x86_64 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/0db94474c266547ea7de31104942eeb365983b28/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/b96727608cc81a9256f0c4237eae278def902017/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/fa4b014b6c6f6c0f6dd1d3c6634554843488db7e/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/ab48b2ad810870c10d62f29061ce775c1acdb7c8/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/c418e5bce5a3659a0a56b12d8590c12c032c3be0/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d9588eaaae7a70d3bd2eb3f637abfdc1783c8519/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/f9947f5e9cf262046f6d53f9164c07b632ae1e65/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/8050463c65e1fad53c053e27e57d9b04881ba575/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b8449865b4f8152674d3155284a776ffb0f04241/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a3a095469c2e2ecaf8ec6d463db1c3174feff5ec/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9b1f15762c59aed08e9f4b5f78a9da556ebb2ed6/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4aedf0d256a473f8dd834b5df881a6626f908d34/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0236b3ad240cc3c20f2716f2a1b0fa359cb4b5a7/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a044208cebba5203f04e7c55d450279e6823155d/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d80198714a1cd52346761e7b5515d128c6250e91/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9fbd456d84ca945b165b56d83537915a46e4007b/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/59eff6b6d40c256a3cdd014cc012b64ed2b4b2f3/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/80375c0906959486a5f63771a3647afa04187728/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/85e5f01d81747b3d98a863aa07042685fa2bd0da/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/5ed8d352bb63269b3d8f7b10dc5ee407818d1f3f/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/48ab7648c371ee0ed80921c2c65ff15f39634a6b/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/978a591095c9cf700ce0b3433982f60e6c051aa0/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/d56f3b3d480f275babdea1c1f0a5f639333e8bfa/
      x86_64 |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/a4977541f991447395407498b457c45e3e089c6d/
     powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/1937879ee17c5f98bdd32d93cb83423e583c1237/
     powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/5ffa03312c8a71279542aa456eb0cb518b31c216/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/4a19163537b6784a23fd2f40575a8078a506848c/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/6e06333552e5e5c328241f1eb70eea4ebf9c7e6a/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/cb54c4c387d4386c99176ea5ad8487d8ff074a99/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/8d536eae061916a4b75c3e6cda06cc102c87757c/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/6d81e4081e857dd1cdd0e5a9b7f76b91f5e9b427/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/09f9c6f00306ea3147fcc42d0dad02394e7637ff/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/99a9eac041a21a7c4de3a080cb369ab0b3e17310/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/e55daed801efcff75d6dd6612d88a5991b66cc97/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/8df2cd7a629eb43a90a1c71f7fd78c1bd7f9126a/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/2c0141fc26b58532004398ae579e4124d0cf0fc9/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/159cfb7fff376b08d72eecd6806cfe73f90f1c84/
        i686 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a19e79a83522504cb55f1fb228c32a6d19010392/
      mipsel |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4e614838024deb9f2c1abe89ebacd10e5e8c3cc0/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/e8c7f1deec5834d5c6b977e6630bd0ed898ff007/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/0aa5cff2a3288367f5aa74d8375302feb495fd7c/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/8dc522e4691630c53209ddca78b42fd756e793ac/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/117a2a2d5662b98f0fe42848a00951edaa924c71/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/72b019ce5bb52b8b87d92cce675708f7b9f8a96e/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/30437e12cdd57ea62bfcc08cdb5b83e9e9cecc3a/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/c15962359753448775e5fffd18abf6189ae56cc6/
         arm | kodi-pvr-argustv-32f03271cc... | NOK | http://autobuild.buildroot.net/results/a6d3b510681f54f5625908930b4da73bf9edccf7/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ef07a6c3b2b2c8696fbde106513bf50a314bec3a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/b1e04fa4147a1d54be7d18eeb0adcf779dbf6064/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/5688494711df14c1b0c36e2cea09adaf6b6ba2b2/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/35cc6e8ae2062224df4ba5251d878f361a319134/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dbc04b9aa4148f8ad9c77636df20e33b1e9a13b6/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6e0ed2764b77ebfc3874dbc559b96a8ab85da943/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/78a4668d26184636aaeb497c56b805a8c02f60a0/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/57485174d6abb81fe046c02b7a54fce14aa0125d/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7ad6873f55e46aca11c66f1d10ff1921db27eb28/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1f8f486b955f81d6a32936f89c46ebfddee6e24c/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a4e8368b94b9c2278ce8332776d404e786dc285f/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/222039a20f9b9986abb0ddc1bb16b72b389c7a7c/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2823dfe12d24425c503a2970099c62a3d4b90d16/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/679174d776dc8e9014e0363b15d38a685b5ef308/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6dde65b135be87cdec384289a7f2a63bb3ba5f90/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cd8676991997b8c1353797ed63a0779e143b6292/
      x86_64 |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/ae50521c485371cd59bc4ee7e8f323169c7d513d/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/cbd790a2355b4dea70b2adca54dbdcbc2f3ea61d/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/7a4ddbd5d23f5b4bbb4f1942f9a57a898d1960f3/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/52d29d81036b14733c49720accbf0099f8f04ead/
microblazeel | make[5]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/9e73d2414e922e770462f80a4e6242131f94a3ea/
       sparc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/1bf7c27402aef93538e67aa63a72e40240472906/
       sparc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/6972304a9402d6642ad0ad848210593005a411c2/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/40e5f33ab210885a0ff1ee7459c7fac708e96379/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3ffb997f923fb93d19f8bafdf1057c7ac4b303f3/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/83e71bbb6527943f13ba74aac912dddf37abe29b/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/c01db9f0d8fe41de2871db99a48cac0be1ff32dc/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/4e75f700b925268cd0855dc4e08847baa8c22e85/
         arm |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/b64a5cdebba59e4f8ec361c6d85400087482a021/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/f6185f79566c1ff0ba8fb80573a07a1f79f6b48a/
       sparc |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/1021365272c913788e5257da8a2db9892d6f6002/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/d2298c51ae06376bda93f6f491f1856b826d32c9/
     powerpc |                    opkg-v0.3.0 | NOK | http://autobuild.buildroot.net/results/7e02c7d81bb83fef22554590521b848acd4fc38c/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/3352d80e1f4f5917117bf96cc4332094b0739796/
     powerpc |                      pcre-8.38 | NOK | http://autobuild.buildroot.net/results/817b3151b1cb5625d3a02824f4dcfb62ad1ba285/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/dca99951b0b6a76ee0d803555d8b5eca4bfc47c1/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/273676f1deee986a205b63e92cd6042c29ba1578/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d8d030f65e9ffd5f7659a3ed5e1dc23f0fa8a7de/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/644b563bf8561b9a89007b5ccf15936e47d62688/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/c1a483cc1e66146cd5bbfe1b36572459467c1bd7/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/fb9872cf347cdcb1434ea3b4f26f86c6002f7103/
         arc |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/4ae4a9bb0f4d34425825ee8a9be6916d5281c5b8/
     powerpc | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/656f922d1a1dbd9096ef2927d3b168db14253d1e/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/b875382f62d42164c9b027f00d99d3626d08e6c9/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/4027daa00a60cb54867ba46bfcd0b4e28c59ca8a/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/2980df96afd9942bdffd8936d6b8b2cbe224864f/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/5ddce65a14a5396a0efb46e6523bcc67585e7bdd/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/a7429f92e3073dfceee58976ed71207516bc6314/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/22fa905454e6d27b824f28a436b096f32c122991/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/801b7c84300d1b87c725dd4fe70ebe87ad3e8221/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/4d515684c83ebfdd45d599d82a9e971f44e29d64/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/09007cbfd3e147642f8520d48881ba103944b017/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/60b3df1deb0b291478c98ebb53ec3afc760d2a7c/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/5fcfa87bc30e0af7f26a53c0b427aef60b7a7d6a/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c41e4b876efd4b77f80ebc1b39166cb1469707fb/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/4e9bbe27f33b814073f2ecbd521b4ae2d0a21072/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/26ea99b0d6b6bf8c53c77991b9681fb0a7c6ccdd/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/887dc33d028b4c74a5269c565bc6e6c92edf78af/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/602f96cc0c276da578e376371e56e67637e99f5f/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f5ffc4e29aebc08175711251710f2da057ec0891/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/28f62905393a71b0a64ff7a6ea1cd7d8e403ee1a/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/9ffe59b613f13a3b661d71aac2e30e11baecf132/
    mips64el |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/a91b6a18fdd2f044d26f6c625dcdeb0804191209/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/03f82eae6597f847111772089dbdedb22c1febd1/
      x86_64 |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/6a8002906128920252f15eafde801b46f0f87b2d/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/8776d4d74bdffd29670269b607fc6b63633df8fa/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/85200a963690407a8eb260ad6dfa62e544b669a5/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/b3b2cbb09a9a50e605865e5d5ffaef2d116b1714/


-- 
http://autobuild.buildroot.net
