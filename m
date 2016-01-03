From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-02
Message-ID: <20160103073021.0B1DB1019FF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-02
===============================

        success : 181
       failures : 169
       timeouts : 2  
          TOTAL : 352

Classification of failures by reason
====================================

                  boost-1.60.0 | 23
               tpm-tools-1.3.8 | 20
                   assimp-v3.2 | 13
                  libffi-3.2.1 | 12
                  libogg-1.3.2 | 7 
zbar-854a5d97059e395807091a... | 7 
            mongodb-legal-info | 6 
host-vboot-utils-bbdd62f9b0... | 6 
                      qt-4.8.7 | 4 
                 mesa3d-11.1.0 | 4 
               libcap-ng-0.7.4 | 4 
              rabbitmq-c-0.7.1 | 3 
                   mplayer-1.2 | 3 
             host-boost-1.60.0 | 3 
                  prboom-2.5.0 | 2 
                 igmpproxy-0.1 | 2 
                bind-9.10.3-P2 | 2 
               nfs-utils-1.3.3 | 2 
                   erlang-17.5 | 2 
                  ffmpeg-2.8.4 | 2 
             host-nodejs-5.3.0 | 2 
               trousers-0.3.13 | 2 
                      pv-1.5.7 | 1 
                mono-4.2.1.102 | 1 
                 openal-1.17.1 | 1 
                collectd-5.5.0 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 opencv-2.4.10 | 1 
                    ruby-2.2.4 | 1 
                   mpd-0.19.12 | 1 
               linknx-0.0.1.32 | 1 
                 lcdproc-0.5.7 | 1 
                iptables-1.6.0 | 1 
net-tools-3eb367aedf1280f35... | 1 
       sp-oops-extract-0.0.7-1 | 1 
                  connman-1.30 | 1 
              gst1-libav-1.6.2 | 1 
                   libnss-3.21 | 1 
             ipsec-tools-0.8.2 | 1 
                   nginx-1.8.0 | 1 
         xlib_libxshmfence-1.2 | 1 
            xlib_libXpm-3.5.11 | 1 
                   tinc-1.0.24 | 1 
              alsa-utils-1.1.0 | 1 
                sysklogd-1.5.1 | 1 
                   perl-5.22.0 | 1 
                 dropwatch-1.4 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
make[4]: *** [all-recursive... | 1 
                  apitrace-7.0 | 1 
 make[2]: *** [all] Terminated | 1 
                 setools-3.3.8 | 1 
                   unionfs-1.0 | 1 
                   hostapd-2.5 | 1 
            lttng-libust-2.7.1 | 1 
                 libdrm-2.4.65 | 1 
      kismet-Kismet-2014-02-R1 | 1 
        ltp-testsuite-20150903 | 1 
xdriver_xf86-video-r128-6.1... | 1 
                pinentry-0.9.4 | 1 
                rtorrent-0.9.6 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/dc895d9e19c4925df8df1cad8ca5047a8615a7ad/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/75038b6dabf084760fdcfd8a5196bad52dd0e9a8/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/7185d01bd4850c374b191fa35612a5d6deec9785/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/625047a81f2404152186c786b90dd6561d6067f9/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d37b1074edcb7e78ae0a8d26a497f6b14779bc4d/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/0028957bc4e3f449b546eba79c8a1cea6749a4f6/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ce87a6a44e2b647e0630805c5a85cf17cd4c2d94/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/752776a03c12d8e5c2612ddbf9c476e7fd245e1f/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/77a3820495aed62abcc939b72fcdeb87c2a4c96b/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d9171fc9a28754c1d0d8180dd2bea55d99a74b71/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/432681804464f60cb45ce0b555b1631a36dd1ee5/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c1b22c6568e3f42d5c96186c94cf10974e6b1aef/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/44068dbade05d906444f8d52689e7a50d996a552/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/39a174e29c206c8cee7adda1431c2e73d0c5b7ed/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2fc802ebd3f1e641de0b2ab7e7f55cd91ca2acf5/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/9ffb44f6e627ff571ab74d9bf098cd382bcf94dc/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/1853433610193a86020a19514dfc81aecd04c51a/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7ae43db75c929036ac11f3b051de4bb554030844/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bb964fb73cb0c2f8160d2a8f142cee0330f52c7c/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ee1c86e386767d0dd6f3f81ee54624dd2c855a99/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b074f612d0d1cbf4171c68842adf7d7415bf1a02/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dc389e3f23c5ee97fd4c7179a622b8880922116e/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/eac61dd076832dc12b5d0086bd2dfc8aeebe6065/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fe702b7a48028b0a9ea474c36cb1be313e654ef3/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/70dd19015bb2345aff53f89ea10a85726f73ee09/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/beb38b44f75cb678cc664f14acbc5f6af5ccd0e5/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6b94c6f2c59347befcfef716bf321b3505289d1b/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0779fa52101491df15d903be936a24aa5adf7752/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6b59b93affa26e4e65e2dbf9c3696a4deed19f50/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c86bcac3a5402d46b3de3d9175d489c3e7dd4711/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9cc60aadc3374c0b4526702ba493e013a7213d65/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/663ce8b9309e6698422054a22b0498c5c10a164f/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fa3084b7499adf94e4ca38081ef5fe98fd676863/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0719a5d8de3972b0edf65f6202ff193cc6743995/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/29f13d8aeb619eafea555643bf6d05b29cfdeabb/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/16d78d9134033dbe89138de6f87bd409e5a39354/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8945dab261ba5f3f6b5dc3f44307b840d11e5f50/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8aac25250c422e32e650b2d3581652c68a3cb20f/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2afa05c6f92efba07570f505ed05e4079467050f/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4a2b342573eaad606985f67670a71b072910fc52/
      x86_64 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/616df9f459c238064c35f186e65f9be8344e1e17/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/847a1e239e2be622e3221baba0f76d0083017b71/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/d17b77e8f62efb3066a3688929f563eb2a38b034/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/d6d5f5f05e8f570ff97311792a858f6bf0787046/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/1b8e4b7525fb3315593f88a9b49ca73f2a5b8860/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/4303c2bed989877d8396cec7f8679325fc52a38e/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/c80d36cf61e9a344eed625a049d345b1609a7b53/
      mipsel |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/83b5da9834678aee2ffe1fdf472975f3e860b3a6/
     aarch64 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/679dc73abaa78f04b0086fbe5d89df9449a4c5dd/
        i686 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/842b7b753cbc6bd329dfc45fb54d7f3689793771/
        bfin |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ef0ad3c9de8f77ec308aee4a7594fd698db5f31c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/a4deef2aebe2a3c41879647d1ff570e848622849/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/27b275f7207b5d8be3a327cba9022f74341adfef/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/a80299cecb153d4d7ab6708d83aeb77e05006d56/
      mipsel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/215c3daf1aadaa36f37744aa6585e17659b589f7/
     sparc64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/891e6a8309a57e4315cf67eea9ab3d2554fde903/
         sh4 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/545780c85a570ace7837eb57ad82ec632ecd3886/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/30bc4610e922e3a890638b77b67a2c45cbfca656/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d837b9c222408e0ed74d9b12a0002b9c489092ac/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/79dfc667152f2bea9e296030f31a837070e2ceb4/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/78ad3b6329a97280527c3addf2f1084329ced42c/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/4c9b3afcb52845c282526628cfeaa346843fec4d/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/b23633221e2cdcf4fbae6b908d912a62c9531abd/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/937c23d117177292f0c6ef98035a7e952539adde/
        bfin |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/fca6c5e8cf96823040ac338f0e8604b20add272f/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/8e7f790f215cb6a4d2389c83f0fbaeba43a827b8/
      x86_64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/aa27b150a79b14fe1dda74a56371b4ee35b3ac15/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/dc80f700879d695c576d515b0d68538a50619f07/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d6100364844aa080c0adb52c2b2f32d132e66e96/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/5584ca178f614e0551f3786dcae306a13fa4d357/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/9881b648dda8de840ea6907eeb305d492e27006c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/6a70d62f855e39ca31aac8fa519ed725d05e9e22/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/ed4cc8cdd2717562a8bd6b3c20f647c3cb90c9a7/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4fbe4dfb7b0776ef125ad66f4fa78855833303c0/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/770184bef5953938fb2f7c9379557fb2b8a98774/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2f95c3cfc8da16fbda6f959434a9abf299c97433/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d65c072abcdba61c3faa1879b043099c1f2e1532/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/05b38b2cd22acba03e59da6a7b80102eec74d9ea/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4977ed2a5f84cd6508228195d64f93116d143bc8/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/42cba5a379bbaf3ddc738a5b34a2bb8fdd4ca90e/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b6fb3533dadde5f4a8d945424bc140241f5b8e5d/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/37ecbb920d78d7e8814ced3ec6ca158b500e8870/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/fe4272479eceac1aa07f70b6b0a68e6757f1be3a/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/84b7a462b10e184dfba51d7249a275afff1d2e1d/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d79d0115a8c7345148be4297e64ce76916cd3fbe/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/4bb5b9c0cf1527beba6038f07b50fef0634f03e3/
         arm |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/d271b568272d7c9761dedfc0c11095804cd26b3c/
      x86_64 |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/3ca57e9e6b4465ca14ac9cd2ff8471437441d528/
         arm |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/3d6eb3ffdb0e8dcb88d85463dd867fd93492a40d/
    mips64el |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/4f45777dae6763acd7f4ba61c22e7ef6b0b73292/
         arm |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/838422c31d0b3c5c337951ba917059afc7218492/
     powerpc |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/0da3265f0f1e499f5d34ed32b0d13a2eda53f976/
      xtensa |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/aef444dc7093418c1063af710b62df50b3823cab/
      xtensa |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/79b404c9cb23a1f990b6cee688100dec8725592a/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/8dea857e7ca864cc0e556133c4d85dda8663a392/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/0d206f135a5f13cd20958940ac2f184a483ed531/
microblazeel |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/6461f97825c8137abcb70f2e94fc437c984c0dbf/
microblazeel | make[4]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/f04fabc0d7cf5da9f81af633bd16e088506b0fef/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/a24bb4052b5ac0d0a3df764ba1199b43449cc1f6/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/ff74768f3b31338e52171f1c2009f3c01ca2178c/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/d46b81ec9b34ffadb2d0097aac33c74ffef81cb8/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/176f4fe7d662f6bab26e3774ee33ec4e0c30d772/
         arm |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/4a960d7c28ee7de80d02cb84d8ef1032478e8c0b/
      x86_64 |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/4f10678c665ca98b46140ff7549fab2d3b76275a/
         arm |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/1ecd69715a4879e5557dd3ac3bdeaba1b5d4d0d8/
     aarch64 |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/fb7082d7287ae74aa077acd2107c338910408b49/
     aarch64 |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/78895529ad015a1ce57e7261affeeffb99e9bcc6/
         arm |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/70d830b1c50c047c96a4b0e7874af790eccc4bce/
         arm |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/20edeca269599573a06c99af22f0e2037cab57d8/
       sparc |                    mpd-0.19.12 | NOK | http://autobuild.buildroot.net/results/cd61aaf1dd0421c6b9dc0c019332fb0de793b72e/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b98a67ee9723ea15090c0f2a3d0f4e67080f6f06/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a54d2ee30b1d58f915a2f135213ad549ca0e8cec/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/478c25499618949a8177975c4466f9a390dfa4c8/
         arm | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/50561e4f131c132edcc9f5c4f70f82312701ce51/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/35ae6f95afc94a4d6603b039069f20e3e3215923/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/e71f441ac5f77f781c20b5154ea73d0812f79849/
       sparc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/c2a109cba61c3cd249ef30c032533a9b6fe346a6/
      xtensa |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/345f0f5cd1a46e17f88e419e6b2098d02e99edd2/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/25ecc1740b574c093ebc1a11e39c99d25a74b5ac/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/5be1ae8665d410faf9b53296c7f1b0914f968c53/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/3500df3f615d0bfa6987c4077fe4c9cbaa3d3e80/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/dbe95144159410af637d7071d196a838e865a179/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/2a58f738ddc7da8b645e1943312997e93de13802/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/10f298f5bcf50e2fc1a1a1a971e2540b7d8f6eb2/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/b667b2a53fc55ce8ce25c4725e5195627b2fcae3/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ca8a08e526dd8db977a44c805d9744ecf5688cd0/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/55709e5fa5d92ff94765d741d45b44c1b4e857fc/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f3df749519308c16464cd4dd1979be9b25ee782c/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1f3a4a8bd23591cb10d323d6d9b8627850c6fdcb/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/94857a09e25203be2ae350c6375349302070ad44/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/622967e957455e1df2693bd1b58e9dbefa135062/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/7ff84673cdf98213e974d7561720b0e9f32469a1/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/c55cc378b7fcd27b8ac555cfad84d39721b11f64/
     powerpc |                     ruby-2.2.4 | NOK | http://autobuild.buildroot.net/results/cc3c7460dc45727ff149428ba3994316cae81a32/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/029990afde0c77c6ec4b6eb8b9a4903507d508cd/
         arm |        sp-oops-extract-0.0.7-1 | NOK | http://autobuild.buildroot.net/results/c649822aa129d56e5462a4887b13811340564453/
     powerpc |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/430293d765392d5cad048a2806a0ede4265f75f4/
      xtensa |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/af97471e38892a8a14a2e7375bc214f2204bdcd7/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c5b7355a39cd85ad66af1df11247e36aa5c52e00/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/a4a6bc3cc228105e1c04be3f16d42d1827cd3bc0/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/8549dd4a39871d9520ce7a80b1373b09ac4c5d00/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/07563e8a06ed0a2908f1a21b6539617d17332b1e/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/71e7dc73ec6cb667936456dadbf737c829f5999e/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/34de0e9c7cb0441dc3a6a2aed1f8ca7305034c56/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/734a7cadbe3bb0b3654b1d04078b95bcbcd6e6f6/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/7f81ce7cb4b75599d751c30ac87082eb7faf8ba6/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f4ff5d1086d31db4b00e503e8d473c7de888bfd8/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/1c7f00eb0ba7f2c248288197f5c87651998761db/
     sparc64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/94d4879fa84790ec8bbb6eb21e7720f11c40ccc5/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/4947ca9efaab6b08795cdae400ebc125ff89af00/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d56bfc69ef0a478219c959d50fb96d526fc2155e/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/8915012502a9d791c9f408771981a4d03ecc46e5/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/03169a174e8188d0347859cbe5635b41a8b0f7f3/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/04a45690d8fc1492c4edb01aab6f33806426f513/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/056255100dd6beecfdf6b1f77ee50f9b575def6b/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/090cb622ea589a962aa9a56ea2f64a8b850014c3/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/dc827e9ce10568cb0a6611c0b5fc8cff1815fb83/
microblazeel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/03ba71dbe568e1bb0ffe1f351d861c95721b91ff/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/6ab35927c2f8e2520d20e201d227f5535772877e/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/e19b077e0738dc4fcc1ff9ac8def6437350b9c54/
      x86_64 |                    unionfs-1.0 | NOK | http://autobuild.buildroot.net/results/020951a32ace3b4bca12a888eaaeb8b6c5633e4f/
    mips64el | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/12df6e152a12d1252d0bbc95f2091b9bda445bec/
      x86_64 |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/87aab7d843a2ce633afc75ffb0b097ac49b78083/
    mips64el |          xlib_libxshmfence-1.2 | NOK | http://autobuild.buildroot.net/results/a253d19191dbc8bcc54f9e9d7fddae03d6695b4b/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/b86d19b096ee50026a97b1bf3a4c27d96da4f250/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/1ae0d4928e2c3f1cdeb3be53000497650f4c4680/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/2e36d579aada1fea66cd37da65e497bfbd0d35ac/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/4584c2c341efa7b514aea96c9e5d9529609dd674/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/4392eb5fc6a0c349150375ebb976bcd3856dde6b/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/cc3bab07bedf957956f94926b10814647a3a476b/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/75dfda08b10f66c1f81517316a835addaf759395/


-- 
http://autobuild.buildroot.net
