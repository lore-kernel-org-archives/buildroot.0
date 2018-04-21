From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-20
Message-ID: <20180421060013.D58F82086F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  35 |   2 |   1 |  38 |
      master | 215 | 127 |   1 | 343 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 1 
                host-libsodium | 1 
                     php-7.2.4 | 1 


Detail of failures
------------------

       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/09015acfffccd86912b2b0814039c9b0e12af4ea |     
     powerpc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c32510afcb0f710358a3abc2f30c32527571dadc |     
        mips |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/b2ad87bcf50a5ad77c73e4514064aecb2f401577 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

dtv-scan-tables-07b18ecef17... | 19
host-squashfs-e38956b92f738... | 12
             dhcpcd-legal-info | 9 
               libglib2-2.56.1 | 9 
                   flann-1.9.1 | 8 
             host-lz4-v1.8.1.2 | 8 
                  zeromq-4.2.5 | 8 
                     lxc-3.0.0 | 7 
                  host-go-1.10 | 6 
             bluez5_utils-5.49 | 5 
      gst1-plugins-ugly-1.12.4 | 4 
                 libuv-v1.20.1 | 4 
squashfs-e38956b92f738518c2... | 4 
               libupnpp-0.16.1 | 3 
              openblas-v0.2.20 | 3 
package/dhcpcd/dhcpcd.mk:57... | 3 
x264-7d0ff22e8c96de126be9d3... | 3 
gst1-interpipe-10dba89eecc2... | 2 
                  udftools-2.0 | 2 
            ecryptfs-utils-111 | 1 
             expect-2014-05-02 | 1 
                    gst-ffmpeg | 1 
                  libkrb5-1.16 | 1 
                    liblo-0.29 | 1 
                 mesa3d-18.0.0 | 1 
            qt5location-5.10.1 | 1 
                  screen-4.6.2 | 1 
           uboot-tools-2018.03 | 1 


Detail of failures
------------------

       nios2 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/364d95b562eb7f2e6313c1e0325a601d15bdcd00 |     
     powerpc |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/d038316edd7d9b2a3898a0d4661de09eeb78435b |     
      xtensa |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/8bc6360f7887aa443306bd80850b1bc7f165d4b3 |     
      xtensa |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/e120a3deb9e475c481a998c3856105d043f590d5 |     
       nios2 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/3e266a79acab8b8eb33360f7afbc1cd6db46f7cb |     
         arc |              dhcpcd-legal-info | NOK | http://autobuild.buildroot.net/results/603eda004a502f613e9b92cea4fb8cc9e4068255 |     
 powerpc64le |              dhcpcd-legal-info | NOK | http://autobuild.buildroot.net/results/6b930827913f9b4d2602d5777f4243ba7b295ca7 |     
        mips |              dhcpcd-legal-info | NOK | http://autobuild.buildroot.net/results/f5790e0a82a3b814d828d18eb71a3f6c422bb2b8 |     
        mips |              dhcpcd-legal-info | NOK | http://autobuild.buildroot.net/results/2f577364b0844b1875ced4619714fd821518ca2c |     
         arm |              dhcpcd-legal-info | NOK | http://autobuild.buildroot.net/results/28c5eed4430bbbbd89b350c29bb676046c4b92ab |     
         arc |              dhcpcd-legal-info | NOK | http://autobuild.buildroot.net/results/10c1467f795b1685cdf2ac15859f1db690730705 |     
      x86_64 |              dhcpcd-legal-info | NOK | http://autobuild.buildroot.net/results/cbf8ddde6e0b2d2607d977cc36a89e7d55560abc |     
        i686 |              dhcpcd-legal-info | NOK | http://autobuild.buildroot.net/results/545a3177700f2e8be206847334cd98730f6053d7 |     
        i686 |              dhcpcd-legal-info | NOK | http://autobuild.buildroot.net/results/adc727c5cac59e4b20d501c1cf57b42bf152ce51 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/7c3d9b743bb275b3d290ecd08a0b6088d63f094b |     
        i586 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6dd9fa3e34fb86b924596b33bb23d8ebdfbc85cf |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/f3330eaea4fe2519ed8518810f9208c46b3dc5d6 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/1ee2c5f36337a5914842ab6133802f144be1dcec |     
     aarch64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b3471e43025b200651fe8a64181fd435be1d4cbd |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/90d4a03919562d185d2506ad7c06eb3fb225ce3a |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/ec2865f22f58e2346a1a92814b74d1116ab0b488 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/959bb012f7553ffa1dff5c14fa498c5908851167 |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c169b69d4146806bf3ea8c46dec1d619c007ec02 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c65b45277ee1ac2709ad8fa137faf21f30ff9c64 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d6f1e88889697bd53c386d35a1ca1d128121ac17 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d899728ddd8fc32022df66e0a9ae5d7e518f0d72 |     
        i586 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/54bd1eb3fba69099c7e314892d77601c844a5058 |     
     powerpc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6e0686d0637b3cf2d4b97c71ba127fcffbdda23a |     
   powerpc64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d99fc327d68353953b69b3d7c707a80475e6d355 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/0195345143db1330d62520b7f4650bd5ec0d62d0 |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/9c2162532c8b22e7d085447a3b5ad61ebaf59548 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/9e44b710e7e8b128f231fcdf28bb331549d2b09c |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/acb9bd16529799b6275f317b9d68b5ce2f484057 |     
         arm |             ecryptfs-utils-111 | NOK | http://autobuild.buildroot.net/results/a4f939fc327f39c7081be83cf90699660d83d4b1 |     
   powerpc64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/ef4572cda28c9bd5bcd1b721c6277df5943b153a | ORPH
      mipsel |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/ebcc13a140533ca5f07670dc717e30700b1adf26 |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/2a16f8b06b02601da19bb09c6f85526a0bae0398 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/a07c485475b150534253b1778d36d9d593a5a825 |     
        i686 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/8fc7fc3a6c04a6f44c286db6faaa7ee318295f4d |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/3c585e50f3eb9d565edbbda266872ece2b428d2a |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/ae2034da8cdf38b6f16c7e481ce03011f2960940 |     
   powerpc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/b25977edb5cdb20627147b9e1a6f3d14406f0794 |     
      x86_64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/1d155a9df677e64fffdca18b93e78ad24969d135 |     
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/22cb531cb2087c30fa72b9cc136aa6b2b5b2b70b |     
      mipsel | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/32ff27afbb0cfc577835a898a86b78c1b5e2d983 |     
       nios2 | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/730585dc066ea43cd245b25688b2c8fb32d68299 |     
         arm |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/72b5aac9f2f3c9b11328668c98cc5eb0aac6c006 |     
       nios2 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/39cd49dee039c42da1929ecc1f50f1712dcb7437 |     
        i586 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/5b5aa6ff996871e63d7ac7db83cba1bea4a9b9fe |     
     aarch64 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/bfbfbb073022361b3189ebd9a190cc2ec03f484c |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/7f2879dbbfda305f3c54229e38e3544e3d375e1a | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d1d6771319bcd3313693225f96e5b1d90d54cd2f | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/ca76821fa9c080eb54220dbe58163183e34f49d4 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/773c7b53f3c5e00b3a8f131328c0483f15cc6026 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/0905ae9621194ccab92015443f67ef20a9c903e6 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/0d5b210de911eb7f89a761259b9eaa6a2e14d0e1 | ORPH
     powerpc |              host-lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/06fc490e6d1e516024c3338a5b8b3418051e5607 | ORPH
microblazeel |              host-lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/9523dbc767dc325befabeb9240c4009e78779c7d | ORPH
      xtensa |              host-lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/7dd47bef902845a0f7803f1a6c702ec154855858 | ORPH
         arc |              host-lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/bc5d6447ab16a61d9dcf56723106f0b107826ef4 | ORPH
microblazeel |              host-lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/0d9634d0720e61b7abf8da8735b53b8d00eabc20 | ORPH
     aarch64 |              host-lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/ed7c141c640c7048c158e012c5342d233ab4142d | ORPH
    mips64el |              host-lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/ceacd8ca60e4c5e312e6713c719fc5b8b7c8bfd0 | ORPH
     powerpc |              host-lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/592c099586f381b5899e4fd50d74d6bf82dd35e0 | ORPH
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/10bf0fcb87acc7a6f77502f34b2cd036cf6a1d10 |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/be143b88822e3444b8d5f2fa422f12bfc067da54 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/7e6801e1920a1da905856f44117f18683c6999cb |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/fefafe58629bc848c9b2958c81af08cdf96dfe3a |     
 powerpc64le | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/b48f6361acc413d0d183956d9e0a979f8dfbbea6 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/fa5726f959a16f3260b346ea20c2a16e335d2634 |     
        m68k | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ed5951f4ca30fa03e7c641748d8d965ef1405f93 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/5f2b410e97a7e1296c7ad2c92b6d0d7b2336f2fe |     
     aarch64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/987869b7aa48a422220cbb84738d30fcb69eba5a |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/1df1ffc5836b4c52c260270e16a048bde31026ce |     
       nios2 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/0b7e924709b57dd3374cafd487c7181d34306623 |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/c8eaefdf0d33a43c0baab90df2f1bd5bbc64d3ed |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/764d21455f78b43365aafaaa2620711ccfc404bc |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/36d4884747fad963140d7584a3d15d0f8f17e609 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/43ebab3b4df7322632af49ad5ae533865c9c8471 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/d0536e2ddd530512131e6f6919128945c698ae84 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/e5265e793a356f39c3da074cabdb2c393f879d05 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/8bd1741ca0cab3ec6f1b3b3d0b8c71c7fb0ebf4d |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/ecd290175e5459f6cacd7bb56c06617238ad9895 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/811676a836fd48a7084baf9d6f5679c235f93d2c |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/182ebbba6c7466b07e965e5120d919cbcf5e9da6 |     
         arm |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/0bd0011978ecf0958ad459ae1aace564f4dde870 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/983b44075b6fbbf0a3a66fe38028c42015833247 | ORPH
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/9b422c43f439f2099ae37de3b712f9dc33314d90 |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/ad3c2d5318afbf74ae4b7d75b94303dba999c287 |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/461780ba187f0418c24592e6cfc62c6472600ae8 |     
      mipsel |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/e13b14f609a7a947119d17be5bd99be7b99d1d17 | ORPH
      mipsel |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/cfd72b99e2984905ed76bd79ea01f706deb09b29 | ORPH
         arm |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/9e052a4248020662082cbaa8fafdb497e38c624a | ORPH
         sh4 |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/1ddc7c8e3ac148d76ef68984831352b332061f00 | ORPH
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/90f9b4c30de9cd897a3aff9f8dae78df88ba8d48 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/8430f6a2e9dc54c11c40b07c702b3adc9aa3ec35 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/67073094d0d29402459d67efc6b34f411879b26e |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2909b3ac5f0315ba67c3ff6ea5aa338badb76fd1 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/20c2f7a48bc1fd028f771d39e9a2f323e0700827 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3c6e34cbcd43aba4dd2b18687bd89fc369c9dab7 |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5cabe352acb16c1b580814a3575426b5a594b9f3 |     
      x86_64 |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/eeeaa1f9800ec56fd098a03d83bdb57a80cbbefc |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/694e65f06b4aa8ef9851f316a4fb06d5030a318c |     
      x86_64 |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/cebb1dd2a407d7e3e0c13ef856eb769bf3ab244a |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/57a3a5d1a50b7288a282128850aeea8225280839 |     
      x86_64 | package/dhcpcd/dhcpcd.mk:57... | NOK | http://autobuild.buildroot.net/results/2860611fdd310a3e77c2f4764e32c57e82ac3652 |     
         arc | package/dhcpcd/dhcpcd.mk:57... | NOK | http://autobuild.buildroot.net/results/3c69dbf802a121fd001f2f895c03e34e8fa301f9 |     
      x86_64 | package/dhcpcd/dhcpcd.mk:57... | NOK | http://autobuild.buildroot.net/results/e704e40dd8a143e6ae6218407191a260dae3d6a2 |     
      mipsel |             qt5location-5.10.1 | NOK | http://autobuild.buildroot.net/results/877a9ce48451600f0282d69b3b92f7304a28e51b |     
         arm |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/a1701229834656baa371493560728eed0a490110 | ORPH
     powerpc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/6f2c20e12a8ca9b841fcb5c8d300d101624795c1 |     
         sh4 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/f8817116aba314fd5261546bb07d0886bcd3aada |     
    mips64el | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/7427f34e5c9f6d043b0fe6ad2c66cc0f31d2b24f |     
      x86_64 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/a7e52fd7b0897a8893d7947343c3f2bd6ddfc4bb |     
         arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/c641e0f1b1b5ffe557f181abe669011a2d4e71cb |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/ff5ac85102261e52f1664a32b982f184b7eb7803 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/6669d4a731cc689eb939e490ef474590edf4518f |     
     aarch64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/395c3fce8d1ac0136c17491b4163b15f04f99250 |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/e4ac6765610cf5c6e2d1983829b654c196970828 |     
         arc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f8084e7e3d68ff5cfe00c608849791086e5b0cb3 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/742144d4f1b538469b6f2e094447dae5990d8d58 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/d6a3e72db754cfd7e948a9782cd18102030f9947 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3a9d95137157e1aef786ce2d5d6f2a9d33448761 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c61cdc33786c035c07d3236ccef1d80545a1daf6 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b3829d25b18d62b8458c995e5fc8d22714e0ad35 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/872483b06666a2dff4639bc39684237cfa755baa |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4384e551cfcd72775b694c4483a9157ff95e7f93 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/72f7c8637dd56c41d46541a3dda84399c7bae9fa |     


-- 
http://autobuild.buildroot.net
