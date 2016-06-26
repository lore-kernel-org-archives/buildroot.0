From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-25
Message-ID: <20160626063029.4297B1029FA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-25
===============================

        success : 201
       failures : 110
       timeouts : 0  
          TOTAL : 311

Classification of failures by reason
====================================

                   efivar-0.23 | 10
              e2fsprogs-1.43.1 | 9 
              host-libxcb-1.12 | 8 
                  boost-1.61.0 | 7 
             bluez_utils-4.101 | 6 
                flannel-v0.5.5 | 6 
          libmicrohttpd-0.9.50 | 4 
                pulseaudio-9.0 | 4 
               libcap-ng-0.7.7 | 3 
                   libxcb-1.12 | 3 
                openmpi-1.10.2 | 3 
                 mplayer-1.3.0 | 2 
              libdvdread-5.0.3 | 2 
                    gdb-7.10.1 | 2 
                 gflags-v2.1.2 | 2 
iputils-55828d1fef3fed7f07a... | 2 
                  cairo-1.14.6 | 2 
                     vlc-2.2.4 | 2 
                   ncurses-5.9 | 2 
           libfastjson-v0.99.2 | 2 
                   jamvm-2.0.0 | 1 
                 lvm2-2.02.156 | 1 
                pinentry-0.9.4 | 1 
               linux-pam-1.2.1 | 1 
                     fbset-2.1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                   ulogd-2.0.5 | 1 
                     gmp-6.1.1 | 1 
                    lftp-4.7.2 | 1 
                   fwup-v0.8.0 | 1 
               libdvdnav-5.0.3 | 1 
android-tools-4.2.2+git2013... | 1 
                   systemd-230 | 1 
           linux-zigbee-v0.3.1 | 1 
                blktrace-1.1.0 | 1 
                   luvi-v2.7.2 | 1 
                    ustr-1.0.4 | 1 
                     php-7.0.7 | 1 
                    pppd-2.4.7 | 1 
                   gtest-1.7.0 | 1 
            lttng-libust-2.7.1 | 1 
                rt-tests-v0.89 | 1 
                    cups-2.1.2 | 1 
                 setools-3.3.8 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                      qt-4.8.7 | 1 
                 php-zmq-1.1.3 | 1 
              libarchive-3.2.1 | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 

Detail of failures
===================

    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7b31f041aaa143a13dcd6801f059af82e1f8c994/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/5f46e087984d024139fe66129d5c4e960ecaccea/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/daa1458a9fc9d0c66d7fe3d1b482179b2e4ca621/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2b7a810395360bec2304804e4c42adbc12bfde5a/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/dbedc915757d90f13f5f58b88c6e94a75abc83da/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/751a3702bd738f80aff581928effe29c348d97dc/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/123b6ae7813caccdcdd632daa25cafd76e738d41/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2783b0c8aa4959567f083e160703ae6374572ff7/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/543743a40a61b5135db30a29a6f66fb6e7fca950/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/43e716ab6b9c1eea2f412b756557e5fa75dfe8db/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/2cae9b08efd652466471ae8744a6993ddc073764/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/63c1253aa7ffa7f050ff6a7ef37b097c0f978d00/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/b238bb6d8f547d7d84a3385bc03820943a19e989/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/a0469f476ed95f90f93b353265c2c77831b4bd6a/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/0104eb5801ba108918c78afcfae559a793fd39c4/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/f0c05170524728c0a075502b325ed1b6f3662125/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/29eed7e2448730deadae1ae977eceb2c2bda2380/
       sparc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/0cad8e6124074271ff147fdfb9e87168b24485a8/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/59f1f941c47675083d1d74c7feaeeceba1c4d3f4/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/dce1a3f628776af2d46f5b9d832b0b98a5058002/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/e49b93b169c63250c7bf3c6b4739ef7b9d21104b/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/755dee66471c43af67b73b1988cfe4065185d1e1/
    mips64el |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/b41b11dce513c67e3f348e85e197f7c77981edd2/
       sparc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/f1188c690fad0aec3b0d07ac89fe21bbd2aaa087/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/7f89d1fdfc386ce215c99bb522998147843fb11e/
    mips64el |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/72b7e421a5408a91cbecee2af6f505064c7cfb9e/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/78b8d9ae5f290fa0ad2303e815d8a12f14383847/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/da5a21dc27c9f0f6ea3c1863e6d7ad6ba7bf5007/
     powerpc |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4092530668e8941ffaf588b3ae2b6656a4be3c86/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ada12ab3c2a26007a237054cc63146b6a1410945/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/5a6e3d0dcfd56633e9ace352e356d67c3c6f6549/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/d3eb5a3d1326e1b9edda376a12a77578da04ded5/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/605abc9a5ffedf0432f610928385faa563a6f2ea/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/5f2ebc3b5d0763a7e74633a8e2beca7a3720046e/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/531a12e85238c0c7d57467194ee3a42e731df5a1/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4f5caa2c6ea0e958cba6b4bca9333d622f362778/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/a049c2c0792d142ffeb9278cabe29dc488fd279b/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/10d93bc7299b38a3bb6acfc8c599e01aee1ec63d/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2a8b30c0fc6b08f01b295ea25d8cfa1fc58e6ba5/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/752de5cf463ea73c4b691161c9c8b44720a4002e/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/62f1840a8d7cca89852d3a029a2cd7a8272e34f5/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/51d5ff2247242151c786c9180ccf1bb68d612b8d/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/37acebc278190102ad87ea3b3667debf2dc59f2f/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/71dc14e0d6ce207098ff555689955fde00acfd10/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/cb81ee38c653644c4177212a34964a55ed6f09fb/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/c73bb006587bc496bc703e09fd66bba709d8179f/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/808711617e4c0a50cbab31ecc5baa389c499aee7/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/b729af0ecd02bbf576e95fca665141718adad506/
      x86_64 |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/2fb1c7c618438863a94b1f408ce0ab6313d43b63/
         arm |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/d14cb52d217531405463b05cc099442c5bcd7203/
         arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/b975d643c368917993c31183c15a124b2c7023e6/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/7249e529fe0c2e0baf4040f7f6f08dd87e6214a8/
      xtensa |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/5a022be8acfcc776c6f2d63294d55df716583345/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/fe0d91d382e81f7fb6b639c85b6d05d878badcc5/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/c74fa243bf319472dca66982323df6c2a983642b/
      xtensa |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/13d85680d04702d1ebe5964efcc549796d5d8e11/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/5b1cf5cd07391e8d61eddc9d151048b78d549163/
    mips64el |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/09eb5d80615de128d790593f68b8823269b9f8d2/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/2ee67e75232a85d238c4cee7453397a86b03b121/
      mipsel | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/478a88cd892a119970cfca717ea7f5517bfc4cea/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/0c32f544641db4cbfc2b6d23028962d832fd5c9c/
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/a6fce3084c9a7dc2ba43e2e4cc81cada4d199880/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/55748bc3ac6b7c74b88428cf37e99ca6035b556b/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/2d593f6c7592319fbfc4d679e2f2bdcb81e546dc/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/fba8b07ceb46b1a3c7a280453e6f4040a8b407d9/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/cb448ddb2487ff6d26f20297cec8c8dc508fc42d/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/f3d9106fbf89fb6e84b50d71f6b7669f20c871cc/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/4f081ce42019e89acd6de5a0b456fb7a55163808/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/b99a803a8872e39a1818623fdd0a1211d5b78ea9/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/43a44f1039546db779eb23f05b94c3d3df7b8731/
         arm |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/0e8426f544bd8a6214ac6923f11e8449c142fd3e/
         arm |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/6775c9e9e154d0dd55969a60ef32da49c692e44a/
         arm |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/9fef4c2653f607d98c3939c84418aeac0f61d411/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/7f16a4de0e860316268a2182ccbf9c266475461c/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/f3427f912c280e56d0a8022e77838a539d151efe/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/5089379babe1f75fd89cb64aa6859dc9bbc9c4a9/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/571413036eb2526dfacb5258b656f7d2b4ffd9d5/
      x86_64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/65aed9a6d1d874591c6a7102ed08cfca0010583e/
        i686 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/04ca8c16bb03161fb675f7ac7c8417d24331ebbb/
        m68k |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/8cd505b3469c53edc98cfe3936f1c67d595e8f41/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1da77eb2e7580758488b66b0af051d985fad6233/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/4be148927adc60f99b94a77d577798730655869c/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/1d084b17e37ebc7053a24088e1aa05c5c4e22cfb/
      mipsel |                    luvi-v2.7.2 | NOK | http://autobuild.buildroot.net/results/72d0ff79e75d21cd7efdcb717b6e3407c4ffb198/
      x86_64 |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/24fc83ce9205297833e91ed1e0657e7f3448e6de/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/230fd0ea95f155785ab1d7608e83510d9e65f29c/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d29ee433ca3d68790312e31bf67141df7bc2b512/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/56b7e4751f25b928ffb8d29f38fe9e427a11c427/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/9ee30f94e8d9ff5fd380a6eda7abfb46e6570c42/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/fcb7f8c9f3015c8cd857f38f3f03ef59eb12eca1/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/4e438b8b37a8da406c815743ea53f9009be150f8/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/30e9c94cbf385376542a7cc183e76184255b9304/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/98d3b6da3dff48c0207daad5f2d922ee521b853b/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/c84d3b38740fa63df6f3e14698a8fbc680e7e725/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/e48eeb331f8085db7cd4142a5a6048040fbb681b/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b10b9ac39b5a91051dcd092055cf5e29a4700c59/
        i686 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/5c92bc764245330ad9f7efb9463bb3d95f45df89/
        sh4a |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/b8a2d50fef58db8ca59b037f980ee30ba23e8eef/
        i686 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/63456817998331bde7ce4593ed3dd6b969b89b0f/
     powerpc |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/d543e9ec4781a143252655e58296afb856bd4098/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8db5c342ce773f90cf599c18d87bf5874e7292b0/
         arm | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/876d29e67f79fc8b56ad7113618f6fe4bd93cfb7/
      x86_64 |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/c272ef7df6190cbb688e6db0b1ee210e6fbb472c/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/5570dec964c46daa268faa9b171e1a84f888824c/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/4b30c382d9933805f424f77dbcf5de201049661a/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/19e407e4c3ecd62ca887236f557695b3c8d0a9df/
         arm |                    ulogd-2.0.5 | NOK | http://autobuild.buildroot.net/results/601d62124ecdfd107d2f9b6138ae22d61db97953/
     powerpc |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/549124d262bd548705bb7d2687fae67d84a0ab03/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/254292218f4b5d15a14869c7ecf9f768791e7ab7/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/6eed97fb2bc931d3143d117b636337b020626a7c/


-- 
http://autobuild.buildroot.net
