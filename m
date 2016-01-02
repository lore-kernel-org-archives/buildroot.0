From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jan 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-01
Message-ID: <20160102073022.217A81012A0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-01
===============================

        success : 192
       failures : 254
       timeouts : 2  
          TOTAL : 448

Classification of failures by reason
====================================

                openssl-1.0.2e | 80
               tpm-tools-1.3.8 | 20
                   assimp-v3.2 | 20
                  boost-1.60.0 | 19
           host-openssl-1.0.2e | 14
             host-boost-1.60.0 | 12
                  libffi-3.2.1 | 11
                   libnss-3.21 | 8 
host-vboot-utils-bbdd62f9b0... | 5 
                bind-9.10.3-P2 | 4 
              alsa-utils-1.1.0 | 4 
                xcb-util-0.3.9 | 3 
                 dropwatch-1.4 | 3 
canfestival-7740ac6fdedc23e... | 3 
                      qt-4.8.7 | 3 
               libcap-ng-0.7.4 | 3 
                  libogg-1.3.2 | 3 
libbroadvoice-f65b0f50c8c76... | 2 
                pinentry-0.9.4 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                  ffmpeg-2.8.4 | 2 
                    ruby-2.2.4 | 2 
                 mesa3d-11.1.0 | 2 
             host-gauche-0.9.4 | 1 
                    php-5.6.16 | 1 
                 libdrm-2.4.65 | 1 
                  prboom-2.5.0 | 1 
                 xorriso-1.3.8 | 1 
              gst1-libav-1.6.2 | 1 
       openpgm-release-5-2-122 | 1 
                 lvm2-2.02.138 | 1 
                 libusb-1.0.19 | 1 
                moarvm-2015.10 | 1 
                 igmpproxy-0.1 | 1 
                   mplayer-1.2 | 1 
                   mpd-0.19.12 | 1 
                    kbd-1.15.5 | 1 
            netsniff-ng-v0.6.0 | 1 
                mongodb-r3.2.0 | 1 
                   glog-v0.3.4 | 1 
                  connman-1.30 | 1 
                   hostapd-2.5 | 1 
             ipsec-tools-0.8.2 | 1 
 make[1]: *** [all] Terminated | 1 
              rabbitmq-c-0.7.1 | 1 
make[3]: *** [code/CMakeFil... | 1 
                 opencv-2.4.10 | 1 
                   erlang-17.5 | 1 
                     rpm-5.2.0 | 1 
               libupnpp-0.13.1 | 1 
zbar-854a5d97059e395807091a... | 1 
flann-04b4a56533faf8c8228d0... | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/13f78f3439c8835dfe2599a9bc5c3e7ae707f073/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/302c5237f08ab5f6e6d5158aef180cd2e1d6ef74/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/c27075ed4ed6482c1e91a2bbded5945ca5566324/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/7d921cfa6120ce3c283f2a934664682557302004/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a1b2d8d282d7358fd89630d80024676ec4b072e2/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/93ef0fc5dea490da9ad8c9d5bea02c9edd1716e5/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/09660c5b810a08e85c0b44c0ea8cb39c333badfc/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5f1636bb052fe9c634f7229c1d0bb31f6901b061/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/dedd43391a79d6dcf386ddc341d41395a9699fbc/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1bf387aa9807cfccaf797a7b1e4038e16ad98ba7/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c60b3ace15e63d38f70ed5264a915a84b0b2ddeb/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4b3394b86033f4034bfb2149b9380623f33b704a/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/0491919392229cbb4e37c4b4cd1c7441c8b5527d/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/94852a4b5c70b3f46b78edaec46a609a333e5c26/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/969516f11164998a44ef9c25ede3b723c9f02497/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e3268832f2640c143bc6a0bceba56377ec749edc/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e7a1c45db537444b30b51a8cdcf0634afb8b5499/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/03a0b101d873e172d583500711dab298c4471e0a/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f7316f11284b831dcc515e24e1b4adcbde77f23d/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/8d50168d07bfb5e6b3d8c79194b0b5862b23d4b3/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b1521a665ea453112917e8484e440b9bc9d1b760/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/148f26ce5354c691a2527a4a278f0d57a28aaa3a/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/42b72c40ff0bee9d1a2e810be67470c80eec614a/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/72604bac791e6010cb75ebd37940c02befdafc91/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/fcf33f6156b24b7beb1e700fcfc6f34010edd9d5/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/26c9ced69efa13b0d5a393c66e8864209fd6c3ae/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/d67dffc577129e3c3df7cdf526b5108041c2f924/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/eaebfbced7c124fb25d64b79626a3b7fb9ab36c6/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/09bb49adb2b8b8ea5b8a2ee0ad7ac9c23f66c482/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/da94bbd593c6bb42cb93b2a528ca946af8886000/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fccb40e7b05b84275cfe36a890cedbbaaaa4f953/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b2fe8aca9d26817f1a2426eb3f4242f30a01c842/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9d02efd562a493a8fdfcd4d200b28d7e6212d1a4/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0ffb243f393e60fe67a327e5e7c6ccf76e70a878/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/499a7f049d157c8931b91091a771fed4ba1d7e02/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cfcc6c44d2225b9baf0fd92d3cfba4922bfb248b/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e169874cd41233848c7668fbb530a2d752800193/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ab1a5aceedb7f9edcd5536b601f1ffb66c5fe1e8/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c79228617eb6b6f5b8c1bc055c98e5a199029d55/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1ed3c1ae1e31325b49dd05c1f616637bb5e6382d/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9e53a5aff9966c6f26e705c91d13692107452feb/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4bb67619d5d38d2b69fa2e29dda7a1d2bd42bbfb/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5c992ee06b4b134cffd6aded60b5f57efa216f25/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/76e5dea6d7ab0cc5102a90e29b605f4e961f6699/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ad4ea8dc711c5718f90fbfcac93d2521b0a0e7cb/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1bcf5c22d15d6f65780fa2c1e37fa37747c53417/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c21d7e3dca07ab8d8b494965c06815cb028943f5/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/ceddb2cf4f1c9ee27faacab8703458cd3976a168/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/1588e6589eaca3f9536f6aeab544d081068344b6/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/9ff1e9400320350899f52c96c0154a1d5b03d06d/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/0e69e5250f12f287a600457a63141075d06501e9/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/1804f3633458252350d47418cd71495dd477d2dc/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/fa3ca05e77e92cdd0abdeed2a2715714a026c471/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/c12bfda45332dbfbc732a988d19ef571e461fa4d/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/ace4fd3a6840ed50aba61f2d0df63850d8b7838c/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/3e88172b7775cb7339f46e740fad653e8bc45ed5/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/425570ca49beec79641f93709b920bc32f1d34fd/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/0860b2b63ba5594753ddb17d23327e1e1960cd36/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/9f59944ec8ee3c9bb630b8cf6c03bb04ec60fc96/
      mipsel |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/9f40f1550f969fd54c2098bcd502d02207688ba7/
         sh4 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/54cd130fc57e2540dbd1759266b2326cb096f8ee/
      xtensa |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e7d328247080d52519b475e43a7638eb17cd8124/
      mipsel |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4ff870682788205bafbd0007c11a4d7a0d527ab1/
         sh4 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e7f555b9378061baf122c74efdb89d28e84f7c27/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fba263a3040cde3b54f167573782dcfa86722476/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/24f0406c55252c93af3c4dff55ebbe9c7d13d52e/
         sh4 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/183e7d12c89823c534bd6aac39c7d94f953b3de4/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f774df1d46af61b551c27e9e6b1ce32213ee6b43/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/05353b35a49a268e8b6843b2e9ffdcd8bdf88c7c/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0b2810d471e7c13e49ed0544ef1fcf93eb4b7b93/
      mipsel |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1b02a40306a7d25cedf821bcd09c16eb96d76afc/
      mipsel |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0d43cc2fe64db3f32354776de609268780da2ae0/
      mipsel |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/8486316278150cfbe2bec9cc1dd2392ca2a8039d/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/dbff7d917ca345e26a3c06395a6718d31cd4a794/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/78c5fc8ac896f55333e24dfc0ea4d3dbcc46a906/
         arm |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/fe4be196f3c6c8bb24e5b085dbf54787b059519f/
     powerpc |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/50503e76d1b0437c4f94bcaa1948e10382a48ab5/
         arc |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/845896522c7793f8ef8a75dd538b4310165c8aa7/
        bfin |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/14f9aac914bf5b0de9f3048bc41b3a17f3740766/
        i686 |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/48d8cb0a7dc2ecb011095300bd0a2021cd0acb3c/
    mips64el |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/6c383f07b3ade6bddf5f3030f898563fb1c9fd91/
         arm |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/d67a58a9287c48e4174ac175a3a45ce52810bde7/
     powerpc |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/25ff1f3199a5bb8f4613e426857798b938f04c9b/
     powerpc |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/c0e82454b677791711d64e44db8d31fce7fd1b3b/
         arm |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/40b817d3c17dcb96bceb46fa319957702d61a51e/
         arm |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/756a831ef580d3a55cf9ea207d302008a322cd2e/
         arm |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/33999ed624ee6a2de5dc2b0dca4610f6ea817259/
       nios2 |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/6a41c5166d3281c72ad6bfc338c4ec29402ebd13/
        sh4a |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/730c4f29fa4db30c20bc8e7c3cb13edfd56b0f16/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/685b02fe4181e31912e2997e87105eda627633a6/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/20c9752cda84caae0457107881adf47bb4a7cea4/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5b3d5d9f43d5952c44758626b9a94f59685f61c6/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2cd1af1e96c1419da3d49202c6beba77885f43ca/
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ee766a6c02e56582adeb909d5f5bb2b9f94240de/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/d423ccc15a6172618be2700a8a391816bbb322fa/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/1fad4d4a91a192932bdabe3be2b833f7c46a5904/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/63a7472f4301f06615e41f75263eca22f264e85b/
      x86_64 |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/cbfc14d5c7a61e997ff091983e586195e85a4316/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/8f79bb0d362ab9c6d7a0009ca4059766aa46c215/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/fdaacde61b16cc9161d6cf259aa244e5c37d4d66/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ae07058eaeaaa84ab1d7edeea999dd015b4adccd/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/dfae9948a057a5f47cf2e518a2831f68c545d13f/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/03fd27f4b3d06ae873bfe55ce042042d0f2c8a89/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/60dec311b090705b27ea1a7d2912b156eff5ec08/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a0b48da3f3b00c39d9874c948936242169306ec0/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/383ff9d3f15a30c7d836bb3712c7e350b6590b73/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1e2337fc5f975fdc063e17ea31baa7dd4dcf2ab2/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/916139290e36e88555d72a7f7c66c7b2380cdf87/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7ab972030aead20783c9f4e93ddf1466a383b83e/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/bc5137e5731de542ee71e793600de8c3830e1f46/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dc9328064c3df321f0b4d8b081e7e8d7a62cb8eb/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c85e860abe1d7fc600a5ef10126810e8a11028dd/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/349b49c7725fe5cb2424a70f28906116ebbb6df8/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9b224ea1bdb73ddd37139ce27d236186d4cec24a/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/187d9fac89813817a7b3d3ebad70b45ab780da03/
      x86_64 |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/6fa47e8f544099360ccc5e77da72c95c066cb1b3/
      x86_64 |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/5a67b170caab1c0129d551da6e0a9ef99e203afd/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/6b95df682f30ec9dc58881794a0496f6ab7b6a07/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/c5a46da86c879ba9feadc212ba2c0e63fd08d679/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/c6dbea054b36c73de838d327dacc17d2b03fc873/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/c12d7374c43d95be5fe91f9e9469a1cced0a6828/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/13bbf6093698bd1cef84906812709653af62d01d/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/d57cebce1e2b65e79fbfe5cd48d2a0773eda637c/
microblazeel |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/511eda973d5a3b2764382c4e6aa5b46fd53576f9/
         arm |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/812955c16a6632cb44deabcc7f91496daaddd678/
     powerpc |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/85b85f7a34d561bc134956bf5d057aaeee6b672f/
     powerpc |                libupnpp-0.13.1 | NOK | http://autobuild.buildroot.net/results/d8b96987a5336a64857817ec9831b0fb12867e7c/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/d44b0d247bc3651da4533ab1ca6dc93418b42e56/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/9842954594fe462586c8c1198cf28998fbe66ed2/
    mips64el |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/a2ecd16e62729883f17b82e8db1836f34e9f64fb/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/9a005c66d2c77944282c459e120acacdd45359a4/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/9c583fb708baf16519e1aabe2fdbed051ac6ebd8/
       sparc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/578dcc8e37e2bdfefdebe5f74aef8c6454189460/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/05a686025753fc7c0c6fc649546500de277830fc/
         arm |                 mongodb-r3.2.0 | NOK | http://autobuild.buildroot.net/results/b8ffce927cb0563f5c43533ec2f02d3487acc198/
       sparc |                    mpd-0.19.12 | NOK | http://autobuild.buildroot.net/results/c08f4fbbe2c77143be443ba640c7bfdbffe0a1c7/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/840c417b665cbaf35ac7c2f8d617d6afc04d6f28/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/afed5a67dc80d1e3fdf101473dc655059fc5907c/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/e17419d84d6e2ba0fc928e38d2ec0d53481d966d/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/19b5a7d868f14ad630353f5dd8aea16ca51fee77/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/e871248d8d0e037da9611a1f7e7f7b61a07ba81b/
microblazeel |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/f448d53b86a4022c8edcc074a0ebd09924c24a3f/
       sparc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/016c87970ccb571fb94fc983bdefa05855a867dc/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/57f232fe91893eadd859f825ccf88328c9f9c3be/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/11c512285ed8049a1ead7abf4669904c6084aa33/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/deb6fba155d6376e09a3437208ef55c6fd345018/
      xtensa |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/e5cac0564be298567a202f5d2a538be62edb887c/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/a1c6cb2aae6dcd30573d867430942dd4b973b7d1/
      x86_64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/d2dd88c29117e8abde649384d3b6e7175d8ffd7c/
       nios2 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/c91eeae71b4dcc9cee980aa821f946cf28fd265f/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/9dfd072341c5d498a44a74052c6e1a992b7b9443/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/888699dae70fc3df07c90e858631d42435586a38/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/1be2481833f446540f85803fb211f20fe61387da/
      mipsel |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/316bb3f633b3c7875e56b9b8a080499990f27ae6/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/29d6f0d72751a2b5e16634bab2910aff5ffce8c8/
      x86_64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/6128fac7abf49cc4d48815a2f273a93ae15fbfe4/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/083accc45f4c9f30ef32aefe40c6229f542ffc2b/
         arc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/d798cf42a6f24ebc3c3c0ba3c18741d717820e40/
         sh4 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/0c117518fd7ae2216a41ad0f43a191ce36f7fd2f/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/e140aaac42abe49a11d72ca344436911d448453e/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/9adec4fa7505c024619ac864c23270db78c0754f/
      xtensa |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/be9d07b2ebe60c1c16147a8c18c3296aed7432ae/
        sh4a |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/99fc3cc1cd2ec1390f01e4c3731b9c7a800c387e/
     sparc64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/908ae42eb7653a074814b129b0cc73a641f4baa8/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/8487b700e0a8fa9be9b43f15e9978f26a53cf54b/
       nios2 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/e5145cf25b4ab09c64627e8f506e86942c4e25ba/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/d1417020cc4498011040944d43c7e6262884f01a/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/7f5a05a7ab0724fbafd983fcd5fed269ddd71c03/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/ac19b39a7c553b73590e87ce4a030d286d5c585c/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/d63d14f2a96c20167db8bc3686b03d8091ec6802/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/2524c6a62db4aa8b5e2b2b4d235f13b9af5e0014/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/f01476db9f7e194aabc16fadbf407609d33d68a2/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/50c82556c6980337b5b413bcca0fed57ea6f4479/
     aarch64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/92d1b539872570fba8b918600d062ea535478689/
        mips |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/a8a81fefc9f4a8ec29460c37df78f9b373ff5d5c/
microblazeel |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/df62a69b89a152862d60778d5d3d4517f5a35110/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/fc9e0e17a9d4f4d31d450275aab82931c3fc8690/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/21dc2be4dc7c11651a90a71ade1e5293c3df3148/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/6aab0cdaa6dd20ab1c7258f1b190f7bec2ab476e/
         arc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/8ee26632277baa18921ad2c9ea89452722a2070b/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/8e24b9040e520b5bc4f958358701034d11881bd0/
      xtensa |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/88a308708eb54d5d001f82004f5df8cb5d2ceb8b/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/78f5e914be25974b49e6de6fd9e1e211c19de55a/
microblazeel |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/f521f5a4387dcb5038af17782a4e0550ed3abfe4/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/c855ceeba58ce85f10037a9311cbb03a53bc3ecc/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/2a2754d55ca75f877266fb8bee9679dd6da03b6d/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/56d54076b1fce988b7e5186dae750046a1ab21f3/
     aarch64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/48a4c6a3fbe1483208c4f0b5bd820ddd5d29d133/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/f7d423f0697d7e9e5f3b74252925d5c65903539d/
         sh4 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/b4b708f91e2bb60bd17d713856a1f6dd3849d26e/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/7969ba33d9226b65d634eba1b60cc40a4e82ef0f/
      x86_64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/b45a13a1b2a3a5f0fb33c84ca0f0474eaa7952ec/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/ddc548327c82c4bc43d18c5ded2ab5795adb9022/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/3ab1f734f1158125368e334df980098897f6846e/
         sh4 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/41fd8320d48e2ecea101ee8442395add2240a348/
microblazeel |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/73c340bc55041e1e09c61e66ef129f71c086f003/
      x86_64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/e5bf36d22b7469b2c015bb23f4324b99dbec7b5d/
      x86_64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/546ffecf33bbc178878dc1aba27bd6f6583959b3/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/cc5ed880cecfb8c734979269b9dc26f73a7649a8/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/0619a0a296ba7d8ab1ef3dee01f41d3173ebce39/
      xtensa |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/b3d480effd752377681af3a8b1673d8cab3799eb/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/b84aa0ff65094c74f04db9e5c55091dd1699ac17/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/85ac31b40e64372f497b64e212c61ca4b16a3993/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/dcc16ed3364d9b6ffbb4a90f113d8fa0624ee060/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/91ee7da244c1e4e9ee39785240bc725676d6f267/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/ac6e801c91c2041642e3d685864c696c56f7a759/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/51c445403a862b2976ecb31a028a7251459bf598/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/814f7f202db6bc0746102797be27bb602161ee7b/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/e3da8e2bbde6a6aafe8484cfb6a5ec6230cf719e/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/f2b6465cb1d55d8413ec247756b979e77bd9e01d/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/c81f6e171751c8e40a86156f5188eca762361885/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/5fc379131ad2bc94a255cbb2cca2a0a5db060185/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/04f122b7493f361e3d5348d00ba1ea6b28f5f211/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/1a2c3d7f286e2d7c31253cd5e1d7bce4a99398a0/
      x86_64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/51e9fe362e60fd7a3377031ba8cef12f8769e27b/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/c751815080e3d812c022594ad8999f18263443e7/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/8f82d5468fdcddcad551bc106f95ecef557314f2/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/175d61335f6a0e3b18a60e8ebef5ed410173ddaf/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/5135b983c4f38be7f78d213586d46dffdb56bfa0/
microblazeel |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/77f7b6ad1f5bbd1e9bd67b27be36dba7cfa15e31/
         arm |                     php-5.6.16 | NOK | http://autobuild.buildroot.net/results/3e39b628fc6693acf6a0636e3a9ff82e07096b67/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/9795437112939d9aabdb322f6df48c6f74ede440/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/ce88c49851fe96d10b607ddab5459b82a6a431b5/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/6b4f6906430947381c1d07a8a86bf4db66862467/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/17955820cd467e5dee5c3a2a4dd07d8e119fe804/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8a7ae2d84f63806485168c74be81bdca71bba9e7/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1f7e0a36c606b4d4d1bb118f92521eb29d7f96ea/
     powerpc |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/2a8f0f25efa904a4bd78544a5fc8cd78d110d64b/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/039849ff02250f744a297a96fac482b1f72649c0/
     powerpc |                     ruby-2.2.4 | NOK | http://autobuild.buildroot.net/results/8de5234ce6fb9f185f3deb27c315892b2dced6af/
     powerpc |                     ruby-2.2.4 | NOK | http://autobuild.buildroot.net/results/60ca1185414fae538f454aa6b272d5bf3167557e/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f55b5bd2277e3b3c635329e544dfa1b9ffe6f795/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/b30a7a578173e83904d429464db7900ac2278531/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/53892ecad3ca78139ebdf73269684ebf82ee96c4/
microblazeel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/2e4f98ad9bfbe3b11491488327ae93887f0d9fe5/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/4abe970236c580cd264c71b1465dbb56d96742ed/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/67b271e7c7851f134dabc194e41cf0ac52c58e36/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/aadbcb195f2fdf85036cc9cb62fba3636985645f/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c8b935fb375f0b0d08d4d55151d97ee735f32f01/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/180404b48776e0f39acef2ee845b3c2bc295b5c6/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/98f3f05af8a01a1a8ccd9f75d3d2ffd25ae23833/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/b1b9589826d7f608f67252c2aee8ba5884dcd637/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6eaeb751d8329bd239e35bd114a661df3a059b5e/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/588f08b9281b7f2de1497649f0c9762eabdab1e6/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/be35e055d01a4d00066e3ea0fa966691a4ebb55c/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/3d0877be3c7ce0286b9e328565f1cd1f3264cffd/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c69fae70c1f82e4e86c11eb86bb558bba0b58f25/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f8c82af78dd66e69071d5cd8ff5bae153e886efd/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/a4bbcf72992a6c1c8f43e75b0321bbe8c0757cd4/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/b18617a0b446c4635ee141c5887aac3cf227f887/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/ca84f6048b6c7f1e46bcd0925a17076afbdb7aa8/
       nios2 |                 xcb-util-0.3.9 | NOK | http://autobuild.buildroot.net/results/7cfd92ebfecbe3c6b6e7c1f39f39725109269cbf/
         arm |                 xcb-util-0.3.9 | NOK | http://autobuild.buildroot.net/results/88b45812d3fe5896d65c9d8b81cd33e322531567/
         arm |                 xcb-util-0.3.9 | NOK | http://autobuild.buildroot.net/results/6c822a13936cfe624ff80ec30de4bb0bbc46a0e3/
        i686 |                  xorriso-1.3.8 | NOK | http://autobuild.buildroot.net/results/ef7f5338b56195c7639a23c5b42e6a3a6d56db1c/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/cea31cf5f8ffaf36eadccd33a2e81975b995e2c9/


-- 
http://autobuild.buildroot.net
