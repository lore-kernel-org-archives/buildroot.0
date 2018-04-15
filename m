From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-14
Message-ID: <20180415060011.CC7B32070C@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   6 |   0 |  31 |
      master | 175 | 159 |   2 | 336 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 2 
                  cc-tool-0.26 | 1 
                   flann-1.9.1 | 1 
          usb_modeswitch-2.5.0 | 1 
                   wmctrl-1.07 | 1 


Detail of failures
------------------

       nios2 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/e324bd8139a21dd8a6a6a8636ec36681f606a00f |     
    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/0b29d1a2cadda6c504021ddaea76dfff055e4a85 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4fbec843e3cc7f5c4cfe7cfb02331badf7238019 |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/c78c821245b8da01f26b583c3146abc0f37ce8ba |     
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/e39ca3c19e96c0c1979eb6ab59e9b2e1dc64a76c | ORPH
        or1k |                    wmctrl-1.07 | NOK | http://autobuild.buildroot.net/results/7e5cba8a5650a00e10d1a5528f38cb2bf772aee1 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

dtv-scan-tables-07b18ecef17... | 28
host-squashfs-e38956b92f738... | 24
                  zeromq-4.2.5 | 24
                     lxc-3.0.0 | 17
linux-firmware-65b1c68c63f9... | 9 
squashfs-e38956b92f738518c2... | 9 
x264-7d0ff22e8c96de126be9d3... | 9 
               libglib2-2.56.1 | 6 
             bluez5_utils-5.49 | 5 
                  host-go-1.10 | 4 
                   flann-1.9.1 | 3 
               libcap-ng-0.7.9 | 3 
               libupnpp-0.16.1 | 3 
                  udftools-2.0 | 3 
             expect-2014-05-02 | 2 
                host-libsodium | 2 
gst1-interpipe-10dba89eecc2... | 1 
                   jamvm-2.0.0 | 1 
           libfreeimage-3.17.0 | 1 
                    liblo-0.29 | 1 
                 mplayer-1.3.0 | 1 
              openblas-v0.2.20 | 1 
pixiewps-9e5bdc6c86c8487b2a... | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
             qt5location-5.6.3 | 1 
                     vlc-2.2.8 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/b75142fd3629cd0c504706bb3f373bd7e4d7c05b |     
   powerpc64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/241d49937e402a4509ca7349d6ecb5adeb2724d8 |     
      x86_64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/b54aa72343624d0c4631fd931793e842195a9e3c |     
      x86_64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/47850e96852f8a2ccfe3d815f701ee9299d926d0 |     
         arc |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/633c2522a82eda5d66af6d5a713452afb7387e5c |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d9c05af32d119edab71ff25aae3dac61680d675f |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/4c73a1e40d94ae1442322fae7fc570ff65c90857 |     
 powerpc64le | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/20305c16b0468087cf1478b8eb80a175529cf971 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/caaa8aaedfdae4ad6fbc468853d818424fc697b2 |     
         sh4 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/75d9bcd33cac6eba363285fd1749dde8d2ea698e |     
         sh4 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/7bc0eb28a3eeba3031df6c5e5fabd0e94d378971 |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6cd7031261bb584cd7e79706275794a80efb4dbc |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c11b2b3dbe62b1d6f9d4c10c19a7fc67a40301d9 |     
        bfin | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/34af3a129dac9337e37e452d4b6892d09b723ffb |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/cd7d832a32509198baafcc3a4dd991948fd8f075 |     
        m68k | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/eadafce1cb366b392e3a4879696a8abff1a013b4 |     
        bfin | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/a2ebcefd466b9869dfad369d1a48c2e11b6d42a9 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c225b151e7355b5cfba3f9e5da51816b24a0e66e |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/a0dbe9cc97b4816f8498ec1efd0f087a01dcabbf |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/89f9c1e32c1b7da49c42e504d866476c97368ea8 |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/44db952f2ec78d5db68fdc1b2fcfc5086b2de918 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/1a2d48b9dd319513b0ac95edbfa9c624f6a2abf2 |     
        m68k | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/14ab3f93862cee24136cf94e3a297a4bef1465a3 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b9b270b45549fdc423dd50bf23515672df72eacf |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/f296f82d5955470596c9b03dbb51827d078892fb |     
   powerpc64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/629a746d951a602cb3344b1604ae741ba027c95c |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/68cf5e7c6fb4f5b4d428442521431dfde2f0d3b7 |     
        mips | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/8022e57945007f83188defe0290c0fbd93d6b1ef |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d071dc2bf76d33ea61c7437659ebb4e4e9df1e04 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/5cfb997804765ee6b7e05ee50a5a09bf81a72f84 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/abbfc23aa7154611c9725fa7952a3e1a858df978 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6d732399d5b686fa0cdcd056ba60ba6092c8b6fc |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/eb0e1f4f42db93601c1f0f6505aca0eb6f53ed75 |     
   powerpc64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/e764b82bb9b44c88669741e70cc3d8d87007a6d3 | ORPH
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/24697821ab973b5e045ed5b21c04ab616cf3f5f2 | ORPH
    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/86d8201000744de75c8dd0f14ef0fc2b1f2d508b |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/66138bca0625f8234ec7ea1230d61b9c37364c52 |     
      x86_64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/1163c74535c8ff3ae0340885187f8aa4c2380421 |     
      xtensa | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/3155290d1a450ee66149f3a693060a689a0ecf35 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d3c0a4be6f4018ac0b36ae728137927e02385ad2 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/fdd0e63339484e29c158e89fbd11300252962090 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e321d815ead5d7161d0d7c1d2b382979ddc2df29 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/c9cfd251a0de994d80392b98b1852c8c10c75d83 | ORPH
     sparc64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c67531299905b13e529797800d2f90e25d7ac3ce |     
       nios2 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/70e4bce62aaf34460f6020af437540348ba78d54 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ac23a4e93517b0fd035d1115c6b501ec40470fb1 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/27edbb22f565b2687a65fe172df72709d0da9aaa |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/07a0bc68037ca502f3dfeea2627932d783c62c83 |     
        i686 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/b5c5cb931e59211250adb5f95db04991d3d4871a |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/8e1d3d7e7f77251123a2955efc0206631b646a6f |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/e4875c686bdfa7d8e12a87c622bfb2d7708a99f1 |     
        m68k | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/056e6b02f3d32ca5059ca5d6e1f042e5b9f3703d |     
       nios2 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/05077609c0e41ee4214fb430f7246d9fbbe96b10 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/fdbefa418f6c822bc59c09c24d82ea4678a9bc5b |     
       nios2 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/dba99717682e8e2b0f7ba5a582ffd00ee9f0ba10 |     
        bfin | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/e7a9613c1b4740fb34927bd294b7c86c5c4ea7c6 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/c6a53f446546177ee5305970b1cabbeaeccdc11c |     
      mipsel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/00a62a19d87aaf5e8a0a5ef87fb7f3f2beaa0f94 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/f69023d0d44257f4f38ede346fd9731ddc542b00 |     
       sparc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/1592e1fdad22a565a4db6111a40c87a516f77e00 |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ced9eb0e168795ca570b6eed5ee78479dad9a37f |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/0d7bd759c9343282cf60b148ae9484044ef1862f |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ee7865bdde31a47e273a94f1702d89fee3396345 |     
     aarch64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/57207431de1edfd13d48f1c132abbcef52bc5c0c |     
      xtensa | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/3ff0b66b7ebaee7dde747ac93e0f33c19ab6cdb2 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/bdac1d42887f524c0adc1c39b4c1cdd75efc6136 |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/4d01275e85656c4c5d7a0dc5feca374d64de6917 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/febad3ac319762196cbd443ab155a0d4fa9e08a8 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/721ba0082d510c09bf95a3151692147bfd197224 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/e16f0efe73ad43d37e3e9708c349eeeaf6402e5a | ORPH
         arm |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/6050fd48688f59bf31ab61ac9b4fdebef13e1301 |     
         arm |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/ce256a2c95f77228d9d4f12a959deb70b80f2ae9 |     
         arm |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/dc8cb1eb00a85291238713e04681376bde0b02e8 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/bf2a2d84e79c113a95a62d812153c67d5a3ec25b |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/e7b1bd1dd96698b0e0411b4d2c06c0a60d43f776 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/c53116461fc78ede06225b2b86cb60d6ef561b8a |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/f248f498429f37db69ecc06d2ba028b6360f2e0c |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/e7e8a1e9b433173656192062b579611407d7412b |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/ee1543a33bdad2b44d06bc3d3203050548b0a337 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/fecf178bc237f5bef1ed135165a9fbb23b9f4fc6 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/cbc130f11bea3270021c14831f1deb488c91ba50 | ORPH
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/560a6a1478aa26a36ddcb5f962cb55b7f3a2c616 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/432005e36c5655450f6af6761e1b57e515bea8d9 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/3d83902b0357094a04237d396b16b77f96e0e36f |     
         arc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/d2b328775aee78848e3aff0f140b5cdebeab256e |     
         arc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/b0747625cf89bc6ff9bc4118f65df50434d8e8f0 |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/1e3c8aeca5ea4379558e2bcb7d80539d3ba5c6e8 |     
        bfin | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/b5f1afe1716d849a6131aa94166d1706e99600c8 |     
    mips64el | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/f157772260f041ef18b00fd925c48581c681e705 |     
     aarch64 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/80f9a98355ca49684ac039a7a77f45fcfc18b74c |     
     powerpc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/59930f2eb107a2be25d057a5293774f8a223a6de |     
    mips64el | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/70aae11328b4c04e17f5a6f17ca2475f28276f62 |     
     aarch64 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/1780c48dd89e0b0ee5dde3ebfb002bcfee62d47b |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/9c9729609098b4343ad27a26e582042e9d42fc73 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/df8f00c9397bf46e34c6264b69c6dfbcdc5b9561 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a8d01256f36f698a9d56ce8a3134f6f7a997cb0a |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/42b9c6fdd7dc7f6854c031233f7dd1769b757757 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/90902ca748deb02e0e3c97e80e7bd821853d51f3 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/76cdee7ed6ec9125aac366839a8be65cb1618b45 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a2e18e0a29b7fc90ffef9ffed4db586ee796e34c |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1860f750a8d94da568d0346905bed99aabd6d7c6 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/968c1c84ea30ef4331e7db1086150707fbd7480e |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c922ee3ec2cc815e05ebc02ad6a2a49f33564c4c |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f6570bf380f294c01fd6ec3d9d322d97439c763b |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d3c2305c7d54b257d74f607dea853c7d4c231868 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/954b1f74123d739b877701fa89aef85418436e10 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5851a1b3e7d7e2c31f7bc0b991d062134dddbb05 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2fe2b8f60939b402ee79b70d25989685c8d31270 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/bcea232f462201738f4e765b563c334f5014ccd9 |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/40cd234f1036f33760a797ed23db8a6126110c13 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/25d3b164a9fd60310a09e80628437d60bd43f42c |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/a76a343969f7c8d17d731e050090404f5ed166e2 |     
         arm | pixiewps-9e5bdc6c86c8487b2a... | NOK | http://autobuild.buildroot.net/results/a9aa29fed046c398bf2111248ed419bfde4fa65b |     
      x86_64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/3d05b4221a185ac963eb29afd59c59805425a5e3 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/f5d3c88add73ce98e0b563d68c7bcc303c48b984 |     
      xtensa | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/97b9cd4ff58dbae353e65e91359a225c13296bab |     
         sh4 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/8f1b4f7305b3d6952b0666de7bf213a227876f41 |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/0e300cab117b03025566e06f171fc1c8546b04d8 |     
     powerpc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/4e5e49349030b2a13baf6f4c3bd778431eef822b |     
       nios2 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/d95f54d72508e4006b6ba3c5ec774d0fde23bcf4 |     
     aarch64 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/e6c555682b34e4d066e77bf1cff9af094d2c3770 |     
    mips64el | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/076b56adc36e36582f51f84bdb264018e0077ba0 |     
        m68k | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/4468fb8e01d29dbdd47b17745a5bff196e9af698 |     
         arc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/e14d9e4bd6215b62efadeb284cf736b6891687e2 |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/71dd3b2ae4c3c1215c31a790916d171b0127505e |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/c82a796dde863affa8a95ecdbfce6a787c6d9ba0 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/25e84b3ef67adc0e774ba34f43542ef7eee2e21e |     
     aarch64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/db08d498b782cf3c8481c52b2b2181a30ade1d70 |     
microblazeel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/85ab485acb2580dc69ac203b96023cf39c2ca16e |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/bc3391733e76ae13597e31fe3dd0c48ef2b36768 |     
       nios2 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/67220ba8d9c824ffb13ecb061ff12f33a3395ede |     
       sparc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/1a3c7cc8cb06478d459f965fae7c4ee4c2492d94 |     
     powerpc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/0e95da12594056b4b0a63bd2255e62f47c49a32c |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/208113dfcf89a641f8870a6113c9512a662d2670 |     
     powerpc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/a4e95e883f9b74555386428e948f9c2fee614b0a |     
      x86_64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/390d4f6aea91287a725839e41b361f8bc7d31670 |     
     powerpc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/557b993a27f1ee42ba787b1a013d795dd2dca680 |     
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0fec5e9e7fad3b059904508ad6982f64b61a10e9 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c543734e51a62d61ee5395af1e8bbf1cda71128e | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/18c6d3094eeb721a21d260878eb4bf83c67a8fb8 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4b4e432f5ecf996da8fbff1fa69a6c618cfaa102 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/fd23da97172d17c3a331953de8c394a4922d6e0d | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6e2e5023aae30177f2fe2ca9bfb6c1d67045a303 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e8d5dd3687b875555056a0d484a0ecc22c4848bb | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/268dc167bedcbaeb70f37a4e968489f5be8e6ec0 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8cdce47a5ec82ac6c0bf660eb66ec36e50876d0f | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/85bcb286bde6ef1b90412bb6a83c25215efe5cd8 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/18764d7161c7b539569b0b75e90bf786d6d33829 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e9767263a2767bcb41486636c15122388a437da4 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/84e2e00d64a4ee9c7bd734e8ec77f3b56df0626b | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/38e49d61346f0b651d5f1ac881efa0fea14cd7bf | ORPH
        or1k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4a21af32060b313ae0e58b0d565728c1e5811816 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/36485ee9cd8765aadf528f92ef3a52dfe8bebbd2 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8c0b40da6830accc84c2c0971a9b59ee16657e33 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a8322d47ff189d3876e1ef3f38f9f0b5fa839dd9 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c3fee83e977ff8fd3cc35a735347cdaa9152f355 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0dbd783ec2eff35038cfa013ed2bef1cb13c4542 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/38d3a80cf3126b337f4b3a552dccea0f24ae3af5 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0e39b104b84ffaf71ad2b601b4ad818d9c06d0c1 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7569067be8ea2a0f112237fce8d93a1311fa6fec | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8dc70754c5ee50b9fe9f7a20818482936090025d | ORPH


-- 
http://autobuild.buildroot.net
