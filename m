From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-18
Message-ID: <20160319073023.C948B102A4A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-18
===============================

        success : 240
       failures : 115
       timeouts : 5  
          TOTAL : 360

Classification of failures by reason
====================================

     host-shared-mime-info-1.6 | 11
                     dt-v18.32 | 9 
              gst1-libav-1.6.3 | 6 
                  ffmpeg-2.8.6 | 5 
               linknx-0.0.1.32 | 5 
           libimxvpuapi-0.10.1 | 5 
                  multicat-2.1 | 4 
              gnuradio-3.7.9.1 | 4 
                  boost-1.60.0 | 4 
                    cups-2.1.2 | 4 
                 mesa3d-11.1.2 | 3 
          shared-mime-info-1.6 | 3 
                  cairo-1.14.4 | 3 
                  connman-1.31 | 3 
               ipmitool-1.8.15 | 2 
       gadgetfs-test-undefined | 2 
                   perl-5.22.1 | 2 
  getent-buildroot-2016.05-git | 2 
               valgrind-3.11.0 | 2 
                      qt-4.8.7 | 2 
                blktrace-1.1.0 | 2 
      ca-certificates-20160104 | 1 
        host-dosfstools-3.0.28 | 1 
             stress-ng-0.04.16 | 1 
            gst-ffmpeg-0.10.13 | 1 
                     tcl-8.6.5 | 1 
                   mplayer-1.2 | 1 
                  gamin-0.1.10 | 1 
             lirc-tools-0.9.3a | 1 
                    yajl-2.1.0 | 1 
                  stunnel-5.31 | 1 
                  trinity-v1.6 | 1 
          sane-backends-1.0.25 | 1 
make[2]: *** [code/CMakeFil... | 1 
                    ruby-2.3.0 | 1 
        lttng-babeltrace-1.2.4 | 1 
                   nginx-1.8.1 | 1 
                sg3_utils-1.42 | 1 
                 opencv-2.4.10 | 1 
                collectd-5.5.1 | 1 
               binutils-2.25.1 | 1 
                oprofile-1.1.0 | 1 
               qt5webkit-5.5.1 | 1 
              macchanger-1.6.0 | 1 
                  squid-3.5.15 | 1 
                    owfs-3.1p1 | 1 
 toolchain-external-legal-info | 1 
                 igmpproxy-0.1 | 1 
               libgtk2-2.24.29 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
               libsodium-1.0.8 | 1 
                 erlang-18.2.1 | 1 
           lksctp-tools-1.0.16 | 1 
make: *** wait: No child pr... | 1 
          libwebsockets-v1.7.3 | 1 
           aircrack-ng-1.2-rc1 | 1 
                socat-2.0.0-b9 | 1 
                sylpheed-3.2.0 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/17e19b06e49b0bc0ae37700d06bad0ac37ba84d1/
      xtensa |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/a59e5858d777dcee3d8f7fb6e82ee4735b520155/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/530e825fbb2accce2e579e891ce213e3585c870e/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/23e66de2d268be2d725d5839f2032c325d4f9b41/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d9bce317bc58e50e27ce09ae677d438eea91faf0/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d2f752f3ac5cb0897aaf4607b24017a82875ab5a/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/548b6e36f2ce3bc4c7314eab4fcc5cb2ada034c4/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0296b42c3f95eab018127b8c3f2294e700b1214d/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/7cb8a9013c1a83d98ad617ecec1107d592d3a7e8/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/b884895d09b530a9cd4893f353562259d039c17d/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/2a5eacc7bf4d0b3e79ba71d418ba9efe5d4c3669/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/33e8b4b54d3be47919e54d85a12e16cf361f02fe/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/9796fcec822ed2da912ebb9c2758a32eaf5b5c6f/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/86589e2852ec14a3126392907e23ce2da25703be/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/1fec63fb1ff6a94d8899870ac46033ca2dca48db/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/9caaad31754fb7738e9999857f43f8724f8dbf6b/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/1769590c7a144cf27f4bfd39a983e5388ad56e5b/
         sh4 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/7601a931026e47bd807007868b1322ba3289b4ed/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/b7f3aa5b211552f3fd72b5223ef1b6f47e57e17c/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/95cd486ea06ce962294a60644620a96be7947859/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/60cdb8df8e99d823066faff003650537310dfa6a/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/193de3fc9a9dd52260b34b15bf5fd0bf5ecb7586/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c71fb5b8d059224fbe514b869f824eccf231ff54/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/65b0813fda5197d5017c12d7d321e74676e1d3bf/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/72ac4fe47ac1118921ebb06990eaecd2dbde4640/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/83eafba9e14de9ed128ae21fbbccb3cfa1959eb5/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/b131d0169174f6b9e7a51656394016b58cdee1a1/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/ff0dd51802ab1199743c2446264203c2effff524/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/0ffa45f3fbff4f6dd8a65c1e83879c8e0cc5fd7b/
       sparc |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/15063b0c90110ee168d916d6977c749cc20190e2/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/96e2d152d181abe7685336e1a2ac55672f078d03/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/e5adfd146a555a5a27613f8804427b5930fe94f6/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/3ec25315ec269f27fc2fecf24b5d73febc4cdece/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f996ebc520f1a63ad7dc114ddf7cb83cb21b58fd/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f6dbcd19e98ff0b89ded0ff6c082720f484121e7/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/5753bc59d1284d11b4842281ba54b46cec99b900/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/6a46480767c9b104cc56fdfb4183f344c548f639/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/0be8004af34529b5643e1ee38d1201b134e92ad1/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/ddcfaefb0c875977eed21a99072260a7a9a30231/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/b4e1654567ff9bd54aff78f8816e85f119ebd6a4/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/e45a5943a86fec42babeaf05a451921455102f73/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/183604cc9e4b1f553f3d8b814582f644c7065d1b/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/16cf6fc651235778744927bd12a3f6a3313e08ef/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/386ffdfb1abe8fdc0a3466acace1ecb9da6feb4c/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/7f1c38a6b386ed7ab27f9812e080badf11545725/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/a4d39669fba66f4da82d8016d67102a65baf1d25/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/196cc62e01fbe5b01e9f942cd05fc6142df5f1bf/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/4c63eaba11f3fbed7500a0f4171ba448119652b7/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/eb37be09ab8ec06c77ef2c8ab63db3f0bf9a8d5e/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/f2a0326516cccf5534655d16ab24b419442a9131/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/e1a8f7bc8e10bf530b0150920caac29b7b648eff/
       nios2 |         host-dosfstools-3.0.28 | TIM | http://autobuild.buildroot.net/results/78424fdc13be5a658b5679a37aa1cf1dc1eb52d4/
     sparc64 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/792ffd5c4fb2643dcf151ceed5c7a0052f7f4940/
     powerpc |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/5c0f7a5bb220f43d89b04e9381cd9ae28377c0b8/
         arc |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/6ef2c9682e610b28ae800d13525dc0f56de75dd1/
         sh4 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/b2af224f0839d23d4236343a3c4acbdc43ca4196/
microblazeel |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/7cd7cdfbc1e89071f96111c2da2f7b7c34810cef/
microblazeel |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/12338229bd1e0bb1be8cfd961f1644b613d82bf2/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/779f469c0fc7c8a95087f1daea9b204a48fb6397/
         arc |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/6edb632ea3be8e6196f17c4534aea9f5cdcaf68d/
     sparc64 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/beb08987c83ced2162d405d05211d8f196dc17d9/
     powerpc |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/0ad72033c2a3a31f13462ddf6f5750c3b9f07766/
      mipsel |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/55d6cff0106d1111de0e4161c040853181214ff2/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/19d395f45d76afd847167df55bf1c193de27d0f7/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/7c11c65e54587c4a58286277354945a89e9099c8/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/e7fe972204146455d06802f42ecf65f71e68d960/
         sh4 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/04b0bd455439c2565ce64c3e35aa987bc1ecdb9e/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/918b5ba9711e66593ccd697d57cfa8985d3e0a19/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5d050e335711f8441b5d90eea1d025ba9d45efa9/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/20d974f6af14c91609c4aa43a20b6534aec007d8/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/baeb7ea44b9db94e40d2f53e84f98ce39fc1285a/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/2dfe95f7866df32bfbb82a7543ccb8c75ccca2f4/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/71b20a00ac45a28cfb9f0dcc34a251b4246f735f/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/6e649747b4626a19cc5ae382dd7b57e78638f016/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/53f613594b1ff8f8b10937becaa42bde5c87144e/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/af63479438e165ce19a1d9a983746c19da1878a7/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/5819326f30bd6ef9dbaaa00386036e8925846bb5/
       nios2 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/c55c90861384708d62364989eec90f40368fb44e/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/9094eebba598ec3443573b2588cf69d762526481/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/4e9f4b46cb82b4b326a11fb88a10ddc013c96ab1/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/2a2ec5c4e48097edc93039ee9d6c4cdea080f47c/
      xtensa |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/1ab89c6e8d704bc28c9ff8b5ffda3f60e57a25b4/
         arm |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/ab871a65e9b06da6d218c9be3067b78dfee56705/
      x86_64 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/0cf460eb8c17878706e726e7456f88fd851f7728/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/a3080bb491d0a09f784c58eedb6e6795b51ef4db/
       sparc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/399d76ac70c3933604067e2c6dcb4086b50acfff/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/4d8e528ad7b012d5e929ba927e4bad1592bc67dd/
microblazeel |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/70cd299600985d7cf00c5b449f7e75284160551a/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/09a7de577041b212dfb36d313afd9dd63d24aeab/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/e699cf6b97bc97f2e8e51aa8b86f0e16af70b5b0/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/2019f11dcc43cb0db13ceb4e3a575c1a91573d4c/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/9f1a3f3aab854f1bd20f1064391e613457312022/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/84f8302ee94e6e6849f6b26cb697c2f9986bafe5/
        i686 |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/17db76c3a099e7592af343bbe119dfe717cd7999/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/31f1eb57ccd98a7676d06a0ab73d35c49f9bad08/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/ce65561cf88fa8743692dabb3cbe81c22d0c735e/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/5362f503938bb7d08a95ddd3e40d571d53983a94/
      xtensa |                    perl-5.22.1 | NOK | http://autobuild.buildroot.net/results/647bda0cf14ee9a6450d7d275a4e95789f26a6f4/
         arm |                    perl-5.22.1 | NOK | http://autobuild.buildroot.net/results/a9795b0214be6c85cf71a6acfa1603598f23a093/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7cb1f1533efd92a7c3a60363d99d6cd6fbdeb9a6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/57c96765f2f0a61216f0833f334c3b15eccb174f/
      x86_64 |                qt5webkit-5.5.1 | NOK | http://autobuild.buildroot.net/results/a72832cbb84a55a34859669f8ce0c25876e10e43/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/859c90e4b77d31c68aa0c1e26cb06984c2d3089c/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/3e9b690425e99d282f2a39eb423308fa212e4f88/
         sh4 | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/322098c2fa6f1b0eba2ad89500a1b1d7975ad15d/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/45d163205255f05835b7c4a1e8143c323d61570c/
      x86_64 |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/009551134d30229c36fe8bb04ee64c267db73cc7/
      xtensa |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/0fbc4dabedf0a30d73331eef19ad6cf610abebe8/
    mips64el |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/3a20787f66a85b0e02caf101d79aa4134f5625fe/
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/0850668d3f01f42e035e6426f4bf9dec0fe98488/
     powerpc |                   squid-3.5.15 | NOK | http://autobuild.buildroot.net/results/f0c0159412a55fb029902fe03dd31eb05cdbcb51/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/e3c4835a612b9f55fb85932e4737a377a2e174fb/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/e90562350229f2efd98ebd783869ec984a775ae5/
    mips64el |                 sylpheed-3.2.0 | TIM | http://autobuild.buildroot.net/results/e8c47480472191f29188ec7fc7b6f0918778073f/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/689f446baa046a9f0c7bd9aaea6b2d127276231a/
       nios2 |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/c47809fa5346fb6168434ef2e21b988ce21047e1/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/8317fb0c38bc87d6343b6493eefa77fb485b7223/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/64d310e0d54bff3d438a137256a40b5237907bdc/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/260c2b7e9910ba09ceb3b8b207453f1b92c1b0d2/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6e48444ab942a4f4eee87bfea0b618513babadf5/


-- 
http://autobuild.buildroot.net
