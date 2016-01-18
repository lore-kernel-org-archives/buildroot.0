From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-17
Message-ID: <20160118073021.C215F101FE0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-17
===============================

        success : 171
       failures : 110
       timeouts : 2  
          TOTAL : 283

Classification of failures by reason
====================================

                  libffi-3.2.1 | 14
                  boost-1.60.0 | 14
host-vboot-utils-bbdd62f9b0... | 10
               trousers-0.3.13 | 6 
                      qt-4.8.7 | 5 
           uboot-tools-2015.10 | 4 
                python-nfc-212 | 3 
                  ffmpeg-2.8.5 | 3 
                   libnss-3.21 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
             bluez5_utils-5.37 | 2 
        ltp-testsuite-20150903 | 2 
                   erlang-17.5 | 2 
                    ruby-2.3.0 | 2 
                bind-9.10.3-P2 | 2 
libubox-e88d816d6e462180f03... | 2 
                oprofile-1.0.0 | 1 
                     mtr-v0.86 | 1 
                   redis-3.0.5 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                 libdrm-2.4.66 | 1 
                    vpnc-0.5.3 | 1 
                moarvm-2015.10 | 1 
zbar-854a5d97059e395807091a... | 1 
                    ofono-1.17 | 1 
canfestival-7740ac6fdedc23e... | 1 
                 opencv3-3.0.0 | 1 
                 mesa3d-11.1.0 | 1 
                 fio-fio-2.1.4 | 1 
               libcap-ng-0.7.4 | 1 
                 setools-3.3.8 | 1 
make[2]: *** [code/CMakeFil... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   mplayer-1.2 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                rtorrent-0.9.6 | 1 
              quagga-0.99.24.1 | 1 
               lighttpd-1.4.39 | 1 
             ipsec-tools-0.8.2 | 1 
                   glog-v0.3.4 | 1 
                   luvi-v2.5.1 | 1 
                  trinity-v1.6 | 1 
              gst1-libav-1.6.2 | 1 
                    ustr-1.0.4 | 1 
          chocolate-doom-2.2.1 | 1 
                   assimp-v3.2 | 1 
                   ympd-v1.2.3 | 1 
                       unknown | 1 
flann-04b4a56533faf8c8228d0... | 1 
make[6]: *** [libavfilter/a... | 1 
            gst-ffmpeg-0.10.13 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                 igmpproxy-0.1 | 1 

Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/20beef47d1de61ce51ccc3239da7ce3a1b9e3a26/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/469d1f194340a2a9a264bc8fb39e70fe8e0586c6/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/1f2f4a1de444d122e9c9a6109cbf5633348b54ba/
       sparc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/8acdeef9ffa4ffdf47d5c18ad7caa9bdc92ad9a7/
     powerpc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/abfdd99a220641f600b3b5548214b076bdf7219e/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/90804fe9983c879f2280981ac98295c32d029e9a/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bd16de788d6d5efc4a1e5a82c62ad5c55c901285/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dadf4c6a8bd8cdb2b384dba4671cc94e9cbd67dd/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9ded146d2b41f27639d78bdb22e816b66abdcaa8/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/44d51e73e63df15b691708a97d09877a2dfab6ee/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c36fae7520186363c693b54c0fef2a916256a504/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/abb3e57dfd34657a4dd7155ada8f191b7adb988a/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/54b25714f1b4a58f2529c430e0dd8c888cbeef7b/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f1def608eb369b97641dc415abc2a602499e7133/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/03dcb01d079f22e8ab9e38342c02f747b6fce71b/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3b5000139851e9ac649dfc7dafc3a5afac5d77ca/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b9991c415f758258968f2f861394a02be597a121/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/45d27fa2960266b9057a3a40574cfe67e1972ef2/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ffd37d371292fc1a91cba02025fdba4e659e704b/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/69457ab1ecd4e5670f4a8aeda6d292ccad61a640/
      x86_64 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/78a788152764ccc04713773909e2aef26821d67a/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/711e7b7cbd9027197edc4d35f6921dec176f0cb3/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/fd7b2367f09bd77be7649da1cd38c72ebb8e12f3/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/6bce9d255511a98563a022469a71b44602137f9f/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/ab2f713366de4197bcfa5101f3db6e7f919a8fd5/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/01a3d2f18905341983f1a7f002db9e25e545c97b/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/03e22539c513ab1f1f0afb52f0620e1140f2e23e/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/efd648120badf90357b9724fc5e16db82b7304e5/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/df341b99053066a730d52dc0c1fe2d81a9bdb470/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/ca6cee675f87aecead41da692efa9a36e97f676c/
    mips64el |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/69cba457afe0c781a31226b38da584f159847319/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/fe6c0b5ddf313a20d06b121dba26720590157540/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/7bea97a28926cbc142dded4535aa9b45cb9502cc/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1fced02ed904150f31859c0e72bfee24d000751a/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6e0c7651605f961e7e81be6e45da24b7c1dbaa13/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bd15b377b0258e1bf173352742259cd86b4479cd/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e0f0e2fc7e15e33fa11661cebe3795cae457913e/
         sh4 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/78f5bce5c435e8d3e02f650584c26ee506ce98f3/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f656dbf0a3644996405fc42e7ec8ec65d0001c8f/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/36ba71d86af9118bdccda54170426d41b4609fc2/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8854a10ad18d0d24690eb815592172a4c57a72d8/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ac955996a14ec23ce4c6470efba2633396ac6301/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/97b6c02022998fafdc75984edbd78732d5ccac6a/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/9432748bf7b1e24db9fcb0a8cce6942fcdf6be5b/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/c3feb5b94a39ccca1883fff3aa366017ac4ab59d/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ce3be7d27489647a98d8932c5bcabd08c845187b/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/4a1fd92d1ce4963d3e282ea2dc8f0f6c5db4f1e1/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/e427a62511214b9838830d773a534fe3b6a2251d/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/e46a981a5d5cca94505509e6fcfd3685e8e0f28c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/884dc7ffc523dd9d2a2927e690cd88b29e95910e/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/50297d8e4c39f2d9fa2e632f0ffa74d334b74646/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ddbde92ec8772fcc9e3d4e4992808ade06aabd55/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/71c8a6d42a214a8ca5b5f8f50f84040d833eb456/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/23c216bc9bb43759b6d8500c0ed858f293b82f13/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/049929760458009e60cbd6d711a7dfa037858c9b/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2865fbc3d35be8ee308565b36db2e9ca8e62a4f6/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/989e9351e62c7dc13dfd24ae98892dabb35886af/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7f7609a205050c003bb4c63cf5658d1b632bc89b/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6b0607b7cb0ac5525c2e47e819301f38bd2d6b30/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6d7be4b941cfe6936cf03935ef47d8feb0a00921/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/22445d41cf4967a6b6212102f4627d2366b063a0/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3a76a160f29201b8a92fa002c64e47cb38ac6f42/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f32a00bf842d4630ad3c2e8378d5c7409eff7364/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/6564eac105d2c6bf551e70b3995cd75dad84da4c/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/abfc0cb5e6673c18ad915a13ae8b2f086224b59f/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/81614ef4fa51c94dd33b96030d4e3175fa57c0cb/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/8f5141a68e9912ccab1e5532a47c7b7ce2236877/
        sh4a |                lighttpd-1.4.39 | NOK | http://autobuild.buildroot.net/results/8fb7f37a5018eef90d583766a02167f272bd0087/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/f8b9dad0994062124f58cb347b177d18a09f74ab/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/ddab7c680cfc46b969d7204aa236c642f5da53d2/
      mipsel |                    luvi-v2.5.1 | NOK | http://autobuild.buildroot.net/results/1fe6deb316ae505c7c8b650dae13943b49c8dd9d/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/f5b6c528f27d86114c8a0124dd991c9476e1a07e/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/d0da52c2c549535a4f464f02a64778846221dd51/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/171d8f04dc267e1ef04028d892be1798cab617ed/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/b18c83a72630b8f5118241706474537432066bff/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9d004d7a314179d23bcc0d85b5641155c2c61ec0/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/bf08023d7f3d485a9109645e6228546651c40214/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/9ee238825b0ff34d73cbd69ccca8e776ab66e5fb/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/69d730e7e8e9c3f8f7eb3b9f3571365720c71a31/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/e43195361d283635523c789856782fec34efb09b/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/65fb6578f51843577a476301f8668064ebdb1d09/
    mips64el |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/51f4ff5462c15a85937d411f457096224d00fdcd/
         arc |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/b8828b5fbc16128408c2f44169ac23de7e34d770/
     aarch64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/fb4b0fb2131b40c18273dbe5e51b393cb6df18ec/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1ecf8dc044b384f2e628241f82af1d265dfdd205/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0c44803ca763c676b3440b45f50f7f0c26d419f3/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/16ff57ae200843a20780b7c226559b8522b3ae9e/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e80216534b47611a28c22e9b695fe0e5890ca4b0/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a3072f6cc3681787ea098c25d51c82a5146f935d/
         arm |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/7b6e1d1c4bad6c48af1e0348ead5e93f979c834b/
       sparc |                    redis-3.0.5 | NOK | http://autobuild.buildroot.net/results/e3f4aa238831eefa059a35901972602da627f391/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/16020b2a459ac7688fe10dd2f6143992db1ebcd7/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d7a382adee11a3854e25f7959c0f199cd9e4a30b/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/68963662ad0ada13860e5c5878074c27506814be/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/8280d4ac9cf21bb8bbe91b1ca7c65288c99e2b46/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/7c61255096b168eff0f995a63d527be5f39d36d5/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/190f508b71e1416bf122f75424b7bd70f8da5331/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/1bbaf5a919991c11fbb9a8f1fb4bbaf651a02b73/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/88f9d01800715721f20e09b3a2948ddc27e37793/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/8dbcb410fe8e4dbfe6c5495615e3c3884b309683/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f24ea8131b09261d6d29a93cb28f0f2d1b0803b5/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/4c97df12e6a0d9f5810b20182b31abaf84f4b947/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/6e0fb19b64577a24f5d6407b4226f2b779f639b9/
     powerpc |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/04cc904872cb736c720e112f5e24d1307509b90e/
         arc |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/ab7f7de3f9aa1d6c75f62f79918228175553baf6/
microblazeel |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/f404a1d017989a5bd38c83e2cd59d40be2e4f81b/
         arc |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/5b13632f64afc2243a5392541c2d85d33c946d2e/
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/908999215a88b945a2f24011269666b0440eda04/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/6901004e1f6cc4c8dedf5768b7afb555a4a29330/
      x86_64 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/fb1e063bb076f599bd22c98543e96df46917296b/
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/6d8c9f83cac37345b737ebfcade1ece4d529f2a8/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/47b61ad4339b606288e00d79b8a2b679dc2f3137/


-- 
http://autobuild.buildroot.net
