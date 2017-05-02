From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 May 2017 08:28:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-01
Message-ID: <20170502062817.B594620775@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-01
================================

      successes : 180
       failures : 69 
       timeouts : 0  
          TOTAL : 249

Classification of failures by reason
====================================

           host-protobuf-3.2.0 | 23
                busybox-1.26.2 | 5 
                 binutils-2.27 | 3 
                 libqmi-1.18.0 | 3 
                 lvm2-2.02.170 | 3 
             rabbitmq-c-v0.8.0 | 3 
           uboot-tools-2017.03 | 3 
                  boost-1.63.0 | 2 
                 libpng-1.6.29 | 2 
                    mpir-3.0.0 | 2 
                 opencv3-3.2.0 | 2 
                tinyxml2-4.0.1 | 2 
atest-895b0183a89c15f5e2305... | 1 
             bluez5_utils-5.44 | 1 
             bluez_utils-4.101 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libcdio-0.94 | 1 
                libepoxy-1.4.1 | 1 
                 libv4l-1.12.2 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.25.0 | 1 
                 opencv-2.4.13 | 1 
                poppler-0.54.0 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.8.0 | 1 
rpi-firmware-4b24a81a2ce94a... | 1 
toolchain-external-codesour... | 1 
                     xen-4.8.1 | 1 


Detail of failures
===================

         arm | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/24081a28132899e9853dcb33a345db55c7c9d04a |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/281eff44fc1767c24e863f32068f1d00c053c259 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/25a9d56282a8e122dd826e8fc4137aa1a1921b19 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/10a1e98fbabf00c64eb523c20b46c5c24c121a9c | ORPH
     powerpc |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/ddb975c9e1475fee1da63cb21240d8d59b161076 |     
        i586 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ada0d8080141978c28ee04c4a8420e72ed08a1ba |     
         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/ac33a9d33532f1385eb97699c5b1862f2fde4417 |     
         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/b57e46b30c64d377852e26b1303396ce6bed2020 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/af5749a950072ecbec73627ac2745e3decd5d832 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/c0460aa05ecadc35e22d68d59a19830327b73a2d | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/6236f6fbba0f12b49655ab178217f6e1d66192f6 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/77149a342a82fd0a1646100cd26221aaf6927b06 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/9b7339ab8f27d79a4507b867c01ba2415681d78c | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a3de4446e9190d92a2a76bff493a564bb9f077df | ORPH
       sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/716cec594d2a6e952d60391cb590e812b74a21d2 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/24caff5c67032f012068408bea004b87faf69d09 | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a4ca2efc36532d2b64fbc8da2862d7e7cae17ac9 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/afd08373d4237c33bf74f44664287db3711454b5 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/cb1bd2b7fff16cfed915ff88bea9b7812f046984 | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c818147d1ecb0cc6f47ea2518ca58682283de37a | ORPH
        mips |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/66d820860a5ad21982e8f40d63ddd8760bdd07f2 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/53811bb3cb0f4915f136e7aafad32cafe9e0391e | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8e7f6b4b89fe11334de2c12cdbfc601d18ab2f45 | ORPH
      mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/65a1cc266386ecaf37df96b95b06f7d83bf0ffe0 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ceac8e5fbd6c5d405dc9c9b253f8538f0add10f5 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/598130cb1c3b66d04db198b50d2ab4b773f772e0 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ed428d0d582f767c5a6a77aa99e5c9d5f7e02b76 | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/bfb6cea03ea0e907354375aea18ace9257dfb1b8 | ORPH
        m68k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6be6272a1b714101b7acb2fbd24c77fff59a3d93 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/e2d73e73caed2da4c5d6472801405835e6aef45e | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f0d577ebb7c59fe809307c504ffe6cab8b988b3b | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b20b99264c8858c96cd85da943a9729d302fdaf8 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/89142eb35df483caaa49bc6e12133d87f57ac864 | ORPH
        i586 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/74b75114821f3d058eeb00dfe1869b7e99344557 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0fbffdc9b6ecac48da6ecf08665d675917422119 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/edf7a46458f38e365c3e52698faf65cd496dcdeb | ORPH
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/c4ef80c676b1d3db7566837dc7ff6185d4c4d9cc |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/ea65bd10d6989012a0f9eca9dc1befe60fe32fd3 |     
       nios2 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/4daa76f2d042f3d80eb20af08dcb4e949377f6e2 |     
     powerpc |                  libpng-1.6.29 | NOK | http://autobuild.buildroot.net/results/5af1acfab6d6d34632e7afc406808237127ff859 | ORPH
         arm |                  libpng-1.6.29 | NOK | http://autobuild.buildroot.net/results/f7237afae3a934ae10411c7d5dd46241e4af410b | ORPH
      x86_64 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/0a3247a4d2a25fd4b5caa18bd09d0e68a0df89b4 | ORPH
        i586 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/afa4b97e012586585b11be1e70ed3c63a7c48a4d | ORPH
         arm |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/a70946946cdb4ccf3e7161c5b2d4426e03a725c0 | ORPH
       sparc |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/91eb02ba632b1714f9657630fc56cfc2a0b09cc2 | ORPH
         arc |                  lvm2-2.02.170 | NOK | http://autobuild.buildroot.net/results/e35d348e4dfca575fac79b336776208237d591f5 | ORPH
         arc |                  lvm2-2.02.170 | NOK | http://autobuild.buildroot.net/results/6b06381f5412cfb5f001a5c271ccdb3abd8a639a | ORPH
         arc |                  lvm2-2.02.170 | NOK | http://autobuild.buildroot.net/results/c5959b2151a03b88a61c926ff096e68a1e96704b | ORPH
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/90086d449bb45b7e93a207bf584618434094d7fd |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/31f1c891da811af79494b468c71ab77d06c680ba |     
     powerpc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1f768c876f26cb7f3f0aa658d85fe7e2dddc10ee |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/801f9d4373baf1a7a372255bdcc031709944aaea |     
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/9ac63779694c83ba92aad5681346db1c7d24f134 |     
      x86_64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/bafe93c15a1b28877c955bc7ffa94388947ba677 |     
   powerpc64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/fdfdaf0497023796c8ad4fc77fc025564d49fd2d |     
        or1k |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/04d99617806282b4ab9a838143cff96e8a564e07 |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/aa1d949d41421c8f5a333ee52df8673fd86beb52 | ORPH
        i686 |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/6a424ac78b907c3b3625c4e9d5227d958184c182 |     
       sparc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/7e31b40300e14c5a4ba8a9ca717832b274935b42 |     
      xtensa |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/0d3e96cf69a597aa2ae871907ff55993ee067e07 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a215c6bb1613acf4c50fe4b9a9b768a13a3323a0 |     
     aarch64 | rpi-firmware-4b24a81a2ce94a... | NOK | http://autobuild.buildroot.net/results/3d35d007cd7c4ae69cc93a32f83c3640e44bd7fb |     
         arm |                 tinyxml2-4.0.1 | NOK | http://autobuild.buildroot.net/results/c1b22d5313c352d1e41ea4afb0fd8c96e2aa0182 |     
        m68k |                 tinyxml2-4.0.1 | NOK | http://autobuild.buildroot.net/results/3e439ef9004e1311e97c084c2691bbcd3ff96adb |     
       nios2 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/25d7e573f8739626f37a26f32f71f15ee5fd4479 | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/df5c5c3a65a67fef88ecfdd27ecf530775f497a0 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a787999bd02d159d1d70c84e921b736115c7ad7b | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/086f1aabff0eea59ccbc321632dba960e55bd3d5 | ORPH
     aarch64 |                      xen-4.8.1 | NOK | http://autobuild.buildroot.net/results/afa199864d6b546fe759bb582a9c10702ea7fa78 |     

-- 
http://autobuild.buildroot.net
