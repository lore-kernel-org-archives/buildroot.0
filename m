From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 08:31:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-26
Message-ID: <20161027063131.9301B104EAB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-26
================================

      successes : 170
       failures : 123
       timeouts : 5  
          TOTAL : 298

Classification of failures by reason
====================================

        host-util-linux-2.28.2 | 61
net-tools-3f170bff115303e92... | 5 
              python-pyqt5-5.7 | 4 
                     vdr-2.3.1 | 4 
                 libnss-3.27.1 | 3 
                 openssh-7.3p1 | 3 
python-libconfig-b271c3d9da... | 3 
         rabbitmq-server-3.6.1 | 3 
             berkeleydb-5.3.28 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
kvm-unit-tests-5731572b2ac2... | 2 
                    lftp-4.7.3 | 2 
make[1]: *** [libavfilter/s... | 2 
          motion-release-4.0.1 | 2 
                  olsr-0.9.0.2 | 2 
                privoxy-3.0.26 | 2 
                   assimp-v3.2 | 1 
                bellagio-0.9.3 | 1 
                    cups-2.1.4 | 1 
                  guile-2.0.13 | 1 
      kismet-Kismet-2014-02-R1 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
              libarchive-3.2.1 | 1 
          libmicrohttpd-0.9.50 | 1 
                libmpeg2-0.5.1 | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/a... | 1 
          mediastreamer-2.12.1 | 1 
                 mesa3d-12.0.3 | 1 
                 mplayer-1.3.0 | 1 
                    ngrep-1.45 | 1 
                 opencv-2.4.13 | 1 
                    qemu-2.7.0 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
                    quota-4.01 | 1 
             rabbitmq-c-v0.8.0 | 1 
              sdl_mixer-1.2.12 | 1 
                  stunnel-5.36 | 1 
                       unknown | 1 
vpnc-b1243d29e0c00312ead038... | 1 
                 weston-1.12.0 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ffe2f69824399aee313c7cec88aa983313fbca1b
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/fa1fb5d4e4183e3079bfeaf3962cbe22091ba7d8
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/88422ad3b8fd235341c82312f2382742945fb452
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/320c1a48d7f529dcf9a6511f630ddc367dc4da8e
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/aa71e22f9096c67772587f863f473daaa43e71a8
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/6da33f7d0d4bcae01015f7251a4b2dae5149a3bd
        sh4a |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/4ba3fecc6f5417aaac34eca148974128bb134579
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/c9400ec1ea544e92118c66fc38bdfa19fbee45b0
      xtensa |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/cd0655089e93ea9700678ae4001f95c7fe7457e5
        sh4a |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/b68fc5ef79350f7b0f98c2b0d6e10fe0baddb8ad
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/970d2ee5da9814b118b5c07443c8bcbd3a799909
      x86_64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/16da699571e475077d05a067e268e945e83eb7cc
     powerpc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/c66b91f71892e8d9f61001f1bd0958c66064b081
       sparc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/4979f36f70a6c73d1e02a3d2032e6594eb8b0dce
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/382fd14cb342a7d0ce8b647a6e7ee808b34b9950
        m68k |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d4ae8326a1ed5e751a938360cecddced17056bb4
        i686 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/ac517d19630e3a6f59ec94b4e7e588787ac7b5d0
       nios2 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/40b29df26a069c0aa729f826840f0d9cd3a2b8ee
        i586 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/a2ec1150c5498eb0f6a8a4f67fa748c93692e6be
      x86_64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/ce316d9a949f9288e58ade1ba69e96ddb63be66d
        i686 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/651e56c3ff2213c2823c9a03a3612820101bc7f3
       sparc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/055ddcbe8b70cac081a68a1d8d500afde977f360
    mips64el |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/0ee7b069225f014e04fc3139ae5cdfcc8e565930
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/dca9cd6e134eb0906f1bbaf1422bd11243909061
      xtensa |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/fddf13fef675c482b3de44bd53b07433418f5388
     powerpc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/f5d851f2f82370f54b90adc6a7fdef513c508b62
         arc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/f6dab17030141fa31a8260a294624f909cfe8aca
     sparc64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/457ff45125be22fbae41d1acc9dcf90d07f7fabb
     sparc64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/fb0a62b5a41ba744b359754e746508b17ac5b1d3
     powerpc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d4cc6eca1d634de86d937b4389dabc0d9ac09da9
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/30dd177db58b1656658c90b9ac159dcdc8f3e8bb
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d7c67e5e7bedcd4a01207fe75895cc95a16185d3
       nios2 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/7a8354f9177e65d80a36d26f0d644f1d28c646b9
      x86_64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/8bb59f5fe6d27374e996da9ffab89da49a213736
     powerpc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/0f831fe1fe5d46c119d136a55c6002305b93a4a0
      x86_64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/182428cd0b9967a9afd2c4f21824e0673d771b84
     aarch64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/4bd09630ae87b23a5344dfab79672981b47d54de
        bfin |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/fd85f5c27762820807e1890d0adefe04a357d910
      xtensa |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/bfb25e1d516d04cda31de7f12c87dfa9e5ca978a
        sh4a |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/3c447e601a7b728860e78cabf2191ab206e6480d
      x86_64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/14d1a16f0da53f1727cf9055b505358ef86ee12c
        i686 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/02ec9d289b401e061a8ae8ec162a482807bde76a
microblazeel |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/f0bf8e655b6132a289ea387a69f5b8cb28466252
        i686 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/323df37c9e596cddb1e7992acb9f3d87acf7f14a
      x86_64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/96107018ccc6e20d83a72abce07b67b23bef43e8
     aarch64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/49ad2665c46e311b2e16b237a3341fc40f019a51
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/19c494ece415d5ed4254392410caa5db7c7a3c83
        i686 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/c78081c2d28a3b430337971ab147f08f3763e903
      xtensa |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/4aab71dd20158537ef3ed0766c4b699c6cfb94a4
      mipsel |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/aa09bd9a9c108ce755c7e1b15f72daa656534ef1
      mipsel |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/0170ff8ef26055b17a33ad0e98405b5582603094
        mips |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/e254d2c6ee206789511ae9dfa0da03165bf01807
    mips64el |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/ead2e2501e3294a40253c675b311db2c60ed5bbc
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/e89e3fb61f2e4b2cb038426e6b9fec6ad91d30db
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/7cdd686a732b597587b6a3555144744b336a5816
      x86_64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/fa2766b5e32d72224d442196476047f362120e20
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/e1d7f1062aea4a8a9e75e52c1064329c3745e8c1
         arc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/2e12994ab3602e454710a36d38c6cc70b2216963
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/a20c9a744152aa996ef403e3d7930ec96c219af0
        m68k |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/59fee51462cbbf41fe4d60909ef2aa7ebeb3900f
     aarch64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/2043ad01088574d73fb70c87ce54dcc876b82703
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/7b4c62b444892e9fafc6adca757bef9646edee67
        i586 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d9e5ca2df468d0d73b60d561d229124d19d33326
     powerpc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/8b5d9f49e315255c5364778f4ebe604697077f82
        i586 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/2cc1cbdb0999fc921fb7228375b200b541dc22bb
     powerpc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/98d008bad6637fac8802fd1fa0a7717eaf3e60dd
     powerpc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/76b712f988cfa981f1d77b61f0e1648fef0820d6
     powerpc |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/6ea2c1b713158d92450e8a708e0f51d89ab83018
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/2288245602edfa446d8584b71f3746f674ee2ba0
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/2132d80dc46cbc89fc56777979e301a3897ddf6c
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/21340a7e6494e23adb2fe8dc6253ab220c380fec
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/fd5916a4724d01d466b0dc4cc03830306726d31d
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/28f794ff10ab8e763635e58314245295d9dec75a
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/922339ad16b1eecaca67a55299c682b6b01a035e
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/d7c9bb9ed722164494994ed9fad7531872b1f4db
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/d5a703242933af3c6a6239a424e36c7a0134f7dd
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/ed6997f989db1744b1bd6798a11ff311786e2761
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1362b0b66ab28013de09fb1936a9524e6fabe9d3
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/be92a389bcd41dea400f64ce4b44da4395c1a6df
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/56ecb2c1cefefda72800bd068edd8f154c9b7517
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/8e1c0ca914e308c754c0ab157f5232c4b2f70825
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/b8f7d81ca778b09fec0996de887a7466f17adf79
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/4ae4e5676e0d0ead4b9f496e02417b1e7a0b2d42
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/00846c45371d5f9a2e44de53b943b23b21eb07c4
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/3c9f53cc4911f07a38007479ad8290bb04903c63
        bfin |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/b057fa6d6b77ebf3ab5fe2c3cd8fc2f8c1fd4593
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/9a1d55b33f18ed6c9dd24f72fc6600214c72cc6c
       sparc |           motion-release-4.0.1 | NOK | http://autobuild.buildroot.net/results/d65e5e76ca9bf9b37886cae6904c7c77e6a2741b
       sparc |           motion-release-4.0.1 | NOK | http://autobuild.buildroot.net/results/130694dcc8954f59f83accdfc99079ebf9f53aa0
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/396e718a8f5f60bcf596066e4be5795a14394e02
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3407ccad1dd1665b657d1fcb426eed2f540f186b
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/ef9ebd4431a379e93569a182a11c01c93f831cf6
       nios2 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/a7fd23f17128afa9ffdb91d7f94fbcc37385b5ec
         sh4 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/9dbf28be011384b47dcaf5279359d1b153dd5943
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/350895a35eb31aafac5e8e2fdb84dbc7e25e3cc4
     sparc64 |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/80982b07bddb8092accc643f2dc8105cd17ecb37
         arm |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/2fad4c5a8921cec55b442bbb6826dfa74330a895
      x86_64 |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/2d53e8382e31fd70b2b1d5939c8450205811b9a2
      x86_64 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/0aa49dbe12e8c4f2d0a72454fb466f19f2cf6cce
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/9b98ddfa13048666919c124dc7386c4fb33329aa
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/f17d95b9acf8040f67cbab7a86cc59d0049b6886
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/930dea596f91de4e5591b9cc8da7cf5da6c74867
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/6941e137b4fe3983be7e5557ced3875aac4f6d6e
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/2dba879b41a6626f8c5723208b4c82f2cd29e91b
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/97338434dd3541c17722a2a04bce9a8a49230ca9
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/41acc1a4d4eccdd85a8691ebdd11c3ccd66fd53f
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/b773a548e3913aeff9e5e17ce4af19329b474b67
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/4e0c5776264a7382c842f04e333fe4ded7d14f8a
        mips |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/8ca61ec09cf0e6577d72fe5d809867aa284c8f1e
       nios2 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/ef02b649190a4bac93598baf1ee9200abdaf33f1
     sparc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/0719b0ea9a3a5eeb054eab4ba97557e88c5bc3f8
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/ac50abb04d2616dc0f8070e1c00679232018c7ee
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/b0668fa5edc361e6842b372efcb9de941c96bd2e
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/4cc00c5dcdb6636914803b4d29443ff645effa3b
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/bd9685cc8c67332d2a5a67649822ee6f82794316
     aarch64 |          rabbitmq-server-3.6.1 | NOK | http://autobuild.buildroot.net/results/0ec785b8fa876d879934af618851d77a3ce70f55
     aarch64 |          rabbitmq-server-3.6.1 | NOK | http://autobuild.buildroot.net/results/03eb39eb9498eb42202ac8b16c1ffc175c0b69d3
         arm |          rabbitmq-server-3.6.1 | NOK | http://autobuild.buildroot.net/results/199b04408fa8d9c94b9bed42fdcaafb03278f03c
         arc |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/cce6aa16904cd4b028f587dae7865c01c0024d3f
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/ea2684a008b850c86413bbbd366c769b1dd5ce1e
     powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/9866018e225408356d64ad928953faaf979b7d93
       sparc |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/2c57781981f6470c1eb458edd40609bb3b55306d
    mips64el |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/6d58ec99c969b1862ee9f8eef31f92a93de25bf9
     aarch64 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/9315673a8ddfb19bdfc042706a59b83d25b84c3f
       sparc |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/49aaed9fcedcef66972672752869868f8fe25e96
         arm | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/00f565f5fad2040ec803599f3ca6a6358019a1d8
      xtensa |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/633f210f79423d520124b9520bbb6cca2dc1e1e9
         arm |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/e15c321685f1b99ec449332595ea577530415b75

-- 
http://autobuild.buildroot.net
