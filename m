From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-30
Message-ID: <20151231073021.6C58F1026D8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-30
===============================

        success : 193
       failures : 297
       timeouts : 1  
          TOTAL : 491

Classification of failures by reason
====================================

        luainterpreter-virtual | 26
             netbsd-queue-1.70 | 24
           linux-headers-4.3.3 | 24
                  boost-1.60.0 | 21
                  libffi-3.2.1 | 19
               libcap-ng-0.7.4 | 13
                   assimp-v3.2 | 13
                    libjpeg-9a | 13
                  udev-virtual | 8 
host-vboot-utils-bbdd62f9b0... | 8 
                     popt-1.16 | 7 
                bind-9.10.3-P2 | 7 
               tpm-tools-1.3.8 | 7 
                 setools-3.3.8 | 5 
             host-boost-1.60.0 | 5 
               libmcrypt-2.5.8 | 4 
               libgles-virtual | 4 
         xproto_glproto-1.4.17 | 4 
                 mbedtls-2.2.0 | 4 
             util-linux-2.27.1 | 3 
                  libogg-1.3.2 | 3 
                iptables-1.6.0 | 3 
          chocolate-doom-2.2.1 | 3 
                  ffmpeg-2.8.4 | 3 
                  prboom-2.5.0 | 3 
                   erlang-17.5 | 3 
               trousers-0.3.13 | 3 
         xfont_font-util-1.3.1 | 3 
                     tslib-1.1 | 3 
               libmodbus-3.0.6 | 3 
             host-nodejs-5.3.0 | 3 
          libcdaudio-0.99.12p2 | 2 
                 mesa3d-11.1.0 | 2 
                   glog-v0.3.4 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
             mcookie-undefined | 2 
                      qt-4.8.7 | 2 
                libegl-virtual | 2 
        gst1-plugins-bad-1.6.2 | 2 
                     tftpd-5.2 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
libubox-e88d816d6e462180f03... | 1 
                    exiv2-0.25 | 1 
                   slang-2.3.0 | 1 
           libvncserver-0.9.10 | 1 
freerdp-17834af7bb378f85a3b... | 1 
canfestival-7740ac6fdedc23e... | 1 
                 qt5base-5.5.0 | 1 
                   mplayer-1.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   hostapd-2.5 | 1 
              rabbitmq-c-0.7.1 | 1 
                  cairo-1.14.4 | 1 
             stress-ng-0.04.16 | 1 
               qt5webkit-5.5.0 | 1 
                  aespipe-2.4c | 1 
               dvbsnoop-1.4.50 | 1 
             lttng-tools-2.7.0 | 1 
make[2]: *** [code/CMakeFil... | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                moarvm-2015.10 | 1 
zbar-854a5d97059e395807091a... | 1 
                 openal-1.17.1 | 1 
              libsoil-20080707 | 1 
              alsa-utils-1.1.0 | 1 
                     gdb-7.9.1 | 1 
                   attr-2.4.47 | 1 
                  libnl-3.2.27 | 1 
                  fbterm-1.7.0 | 1 

Detail of failures
===================

     powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/eb9a75bf66337cc8da81cc27b8d5d160f9bcb958/
      xtensa |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/942fa14f2f6e34fbc1a764b377abf2e984c2d5cf/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/79edc3a8c7bcc5a7ffb433bf1ecb645050e2f044/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f953cfc756bd7281047fd7568b872e554024de2f/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5df177500c26bb6d72f61bf22f7254660ce37562/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3e640ce063912e2ee06915ad5dab7db5a9d258dc/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/6bfd4ae2672f2ec75a9a1f58a0a133cfd834b14e/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/489c46f826048884d855ffba8c2b0b545908e620/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/93e454f2e853423a48c4298d27cdaf15d7dc55ab/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b813d8a8da127255e8f1bc0db23a370a130d5a32/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/82b18cb9c99383e846bb56e3753c74bc3c3910bb/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/426f8c8df293cec155ebe42a4dfce0c4646dcf74/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5fd64b7b5648afea20253559d8f73c28936d0d41/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b0e50e64707d71e90356086a019d5f48370b310a/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/36d20cd855c83809a13ee2cd6a32590fc54465cc/
     powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/792a65da431e6e8e0ad7906347ec0c60d054208d/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/3542d6a51706b4c6997433aadf09462e89ee0bfe/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/f556450e89d09062fff8be2194ebbf80a219b42c/
      x86_64 |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/21496efc9e291444d4b2358753c498495cdde1b4/
     powerpc |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/a435b69d30b03e3024561a6f3a886110b6afa448/
     sparc64 |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/2262c9b46663ea7a45e128a5fd7ff30417c2c2a7/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/a0d9f9c29d9156d8b880dcef705a533e0d2c0032/
       nios2 |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/03b89403dcd29cd89c51fba8089e85e32e3c0429/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2cafd6f207f1b142bb445f524504c54faab6bfec/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2332d5e983fcfe9b4762162dc1635743a59c613b/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2c06fb497001384c427cd808cea10e881ffc3280/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/309ea2f4a6918b8c21d7ddd4b2c07672efd4a405/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/23bc8bfa675ad22f6e5f45dd3a92cc69f438fe97/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/aff6f6883f659ce2e2ef02028b816daffb41ba1b/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9a971b58bcdb5004e5a84e6389033caf510c2bda/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c6206bd36f21a1b174249f4c8df226ac9305df59/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8136e2307403b71b67279a309c18d64be83d93b3/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4865fd23e50d13249e2b8fbc141c7fecdbcd9e82/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c997f57ad7a879e9f72f132da490685aa09ba66c/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/354a3cbe8f196ed1759ee0a3f308972f5ea3e610/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cdfb5ecb112d87976a569a995551f4d333bbe10b/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fac5ed66ae1a205a3a0de395c7cd6b5f33789da9/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c71ca120f15c81ce849d77836b0c36459bf399e2/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/eba42f555b391b5e7dda034be6ae2c446c909651/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fe66042a23ad7cc2f4d541fc7d2fec75dda249ec/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/36687e172859b70d4b8b7d611c8eee09a1dd067c/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8c41c2fce25e8f2230669f1b6de874e90aef89d4/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/881d33f413701bccde32a7aa1add215f5e17ee94/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/834507be0d43272658509b8b29c6c9e9e9311ed2/
     sparc64 |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/d3b17335f2e5720a69b4635602fef30a5ae34660/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/060fbda3a86e10f625585ada592c52111c1909aa/
      xtensa |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/34af00ed019c016506fb691b434d86b1cdf363ff/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/db66d36cfcade8d0e908a785f48d7bcb1622f0df/
    mips64el |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/4d968a45bca1858d49968558d300c4389e06d9a4/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/32f8ea2e900ccb58542349a80c296457f2d3b6a7/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/74a844004a3c198f87909904bd38c354ac07634c/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/d2704a2c873be951a3d770a8d7cf2920196d5410/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/cab9190baf233ba0c1d62e2283f66a8eed9abfda/
     powerpc |                     exiv2-0.25 | NOK | http://autobuild.buildroot.net/results/a564199a3a99f18c034bc39d6632f84a26fa3776/
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/129c54d4b569b46adb227aab8b9cefba975977a5/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/d57bfa4c110c0e86b2c6dec85b77d47bf9bceb44/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/e36b9543df09b6d146e2fc7f9886cdd124b84f5b/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/a7b774e360f827f765eb6456826620209b2ddde9/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/6f197f73fc88e9e7f7079785ac4edbc290512315/
     powerpc |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/53ffad78b301eef5af17ed55a6b60b1be4f8b30d/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/3d4faf0f39e73046363ecac014c713242d8cee59/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/11cb810b8bea018f80d37d10a9f857d964937505/
        i686 |         gst1-plugins-bad-1.6.2 | NOK | http://autobuild.buildroot.net/results/e18625f91a1bfd1a12072b10a8e77a25bac68f7e/
        sh4a |         gst1-plugins-bad-1.6.2 | NOK | http://autobuild.buildroot.net/results/98af409aeb3dd0e54ee61f2bcf561d0b5d7875df/
microblazeel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/6ce0a4b8c7acb857005350a57c313b493bc6e2b7/
     aarch64 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6b1de521c9738d65682ae49ce2446c24164d9dc2/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cb49106867a01fd4cd46353ef8b0460296b5af77/
      mipsel |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4b4140d864c1d90d0dfe43b295744764fafabbc2/
        i686 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/96cb4b10f5d6ae323091136156bdf947fab3c2ef/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/87307c345867273b4821a5c0d8ed0f41bd893ffa/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/59d5413a20812a4c78766c97697d718d0664f836/
      mipsel |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/f90c26b022f4a89941da63f4db07b1f8e1d1016b/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/968fdca11f78514bebe396157b91f832695e4ec4/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/566474e4cb71da176785b7c08010a0894c9721d8/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6eab132e91bd8d1a68d1c0ef616edee6d74a4e0d/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/410e962ce41c80174652b1b0d98c79c25ddf07af/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7118927189c19554046e8e168792d5ff7dafca34/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8ce01d413cb797fa7b23e79607418a2bbccdb0d6/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/478297fa55b099a3aa2b0af5c9c7e8ced64535fc/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9bd4edd7a5c0fbd4fcbb3ee732ed391975ad1453/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/28cbbec279ab7a80ac5df496c5b4207cecf2d581/
      mipsel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9fb447c216afd4b9e3ab5abc5dd2575873df8358/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/0fa7b7af08336fb4deecf365b357ea7e87a64fae/
         arm |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/8ee299d8697bf488ba94f60785e81f274b2128fd/
    mips64el |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/5c4ca595c4bf744aa00fc58851eeccf81f9c6ecc/
         arm |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/426cbe86607f7535ee92737f574184526cf87f53/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/511e332e79955340615c785bc9f28e02fab7fdd5/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/df4f3ecc09d324c49be672ceb16f358abfe913f4/
      x86_64 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/bc6083a58f274a21b2e8f302e307043f849c67bf/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1097bf49d25a680238a37dff33e48dd2ceb1ad68/
      x86_64 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/43c089cca28b3aac57499103375cd5dd2a25c3da/
         arm |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/8fe23ef182328a91bf034a3fd8bd27160ee2b1c3/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/da0bd039f7d84a166a6d90e3a120c571b47af115/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/840d21f3dbb919979bea94526bcca3be79dadc93/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/a5374a56f9e19afae405e936ba7a7558b432b78e/
         arm |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/23953cc66faecb65e9ebf1f6980924f823d736a2/
         arm |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/fb664f9b6980301bd6b4dbd174fdd3e57fbf4a35/
         arm |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/a7e561db95fbb5cde1c10d2e6c15f577267ef56c/
         arm |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/13e417a8dad94ffb06594b414e2955ca5c098a5e/
     powerpc |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7e307239f68363266568f0ebc4e0d22e4ae297b8/
      x86_64 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1e1f50fdeba8a1f5fdb40f66bb4bc908e13abdef/
       nios2 |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/1379f8c4b27fc3675d3f404072d937cb389d3096/
       nios2 |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/5397c51bc6915a082e873dee2d298f433172ef4d/
         arm |                 libegl-virtual | NOK | http://autobuild.buildroot.net/results/9a5b60e26ca3b987c6522454251347367377c89c/
    mips64el |                 libegl-virtual | NOK | http://autobuild.buildroot.net/results/ef83195d2959efca8e4b00b0ea7a70d596c7c6a8/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e92e8a93309875f101fb99a2c144898d389872f0/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/60ade7c7764c69596a1ad33d762a15eeb4265d44/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/805b8176adba56540e7f95ef65975471ebe5af32/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8e5d9c8f16647683a2e6469e3a0f8dfc6b2919e6/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/00b4375b65b6b9c2a42bc4e0aca3ac5ee6834d87/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ffddb39409352167eff2c0487ec9f4f9f48af121/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e4c5f3a7f5b63a6143dc4cbd2fe400598082eabf/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9c76e8ddc7023b593179854e520dea1a91f770a4/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f33e6cd87e66f11a05003870a6958278d35ac00c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1eb965e0b7f26717ecf10f66206d06959d67f1fb/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2e7d47cc7ada4c69f5e1975c693250fc47b56a68/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/16afbe5481d5228e9cfb29b1ca81b3a0129335a7/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cf7ba1ae3cb28f41b4020601c70f18a00c0b6fa5/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/67f9a2a7d469c0a85bb28ea4a0b484df3614f266/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/058fc7941784a39e6398c96a42e942a276d747d9/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/520698efb4e505bc8120cc5a3819a99ab2fb1226/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2c1ee547fe9e597762545983a80457bc961be94f/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/05343ce2109d5d9e3b5f6d853e026026fdda24d5/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d4b18ff876f1b4b27320f4307fbe37fe85265c79/
         arm |                libgles-virtual | NOK | http://autobuild.buildroot.net/results/3d27ce729421a620ec40b44ab85d3de1eee6c216/
         arm |                libgles-virtual | NOK | http://autobuild.buildroot.net/results/33cfb33794593b55b8e7bea3588a8461327199ec/
         arm |                libgles-virtual | NOK | http://autobuild.buildroot.net/results/973959d7f475b1674aab0c760cb73f368bdc532a/
         arm |                libgles-virtual | NOK | http://autobuild.buildroot.net/results/a067ecc60bd2453d767e1d2c74aa67a16a240301/
         arm |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/2fc891ed204780a29df809c0c2fc4cf45bf0bc55/
      x86_64 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/ba0979c59217dffa0aa14bfce270a599de5d9d3c/
        i686 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/bd72a15227f2476a8940b550363f7f591a0ac490/
       nios2 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/24a8884d07a8acb44899b9d191381e78556b62a8/
         arm |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/21aa3baa39fbc3dcf0c84c44aa49539fadf35447/
         sh4 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/4de65e319cbdb619710e876d2ee0bef5a4f4ccaf/
         arm |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/a12760dea9e9d7ca62d14d0821539cc4b0c76835/
        i686 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/c3471ea0b450d0bd4f0bf6521f19baa1e429dcd6/
         arm |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/ff5bee37373f047ff4b3a0c4b515f68e937792a4/
        i686 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/f84080b4a23ace9acacac56f8e009ce5c09313d1/
      xtensa |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/751ac04edf11400450d572143cdcee38ee54c4aa/
        i686 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/33d5bd781f82987f070d726f9dd7f11593b05124/
         sh4 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/e33116ca42c75ff446a7cbb7f6d7ec52348f8c54/
       nios2 |                libmcrypt-2.5.8 | NOK | http://autobuild.buildroot.net/results/3bb025e525d38711e02df4f83bf4569b52b80980/
         arm |                libmcrypt-2.5.8 | NOK | http://autobuild.buildroot.net/results/b0c9ea0d577a74549476ddbdb0d2ecd09311c765/
        sh4a |                libmcrypt-2.5.8 | NOK | http://autobuild.buildroot.net/results/77c9da0e3a08e82482e64fc7813f69ebbce616da/
         sh4 |                libmcrypt-2.5.8 | NOK | http://autobuild.buildroot.net/results/1044dccac57a9cbe04bb49af2ad645da4754b1ec/
    mips64el |                libmodbus-3.0.6 | NOK | http://autobuild.buildroot.net/results/a0a2f9dcef223c3945c495260af2b79b71888984/
         arm |                libmodbus-3.0.6 | NOK | http://autobuild.buildroot.net/results/6617ea58424bf55640a70bee8fc3a6a8d098e3b2/
     powerpc |                libmodbus-3.0.6 | NOK | http://autobuild.buildroot.net/results/181906ccd6b450d53e62078c8db8f115059c77f8/
     powerpc |                   libnl-3.2.27 | NOK | http://autobuild.buildroot.net/results/097918f7a3b14b29a5879826e862c9d80114e636/
         arm |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/d3daa0e412b2359c557074a2c0aa19099cee95d6/
         arm |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/fbbb887f8bfe8289b84aff2283a90b8fd448b258/
        sh4a |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/8f6f4bdcf070d2ae6ba32927ed25b5971c3ef809/
         arm |               libsoil-20080707 | NOK | http://autobuild.buildroot.net/results/af7a912076ed8b42f37cccf607cca572d7c87ea7/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/b74cba34081212677f6f875ac91ed11c5c55eefc/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/469d5667f05ca6954805772fcaaa2b33dfdc6167/
         arc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/d8e39347e16e8afdf5048ee743cd77d08e93b051/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/9a4481166128c865a882d863424a81528af6f899/
         arc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/1198a8feff1f95badf0695ee79c8130182f1eb7a/
         arc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/c81cd7bf708192142664cbd6dff3cca8e2c5fa21/
      xtensa |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/64e3c7583431ee1295d419f21a235fb64c0d10f4/
     powerpc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/b8c3cb9da9b441b28b42d80337961eeb4a7497b2/
microblazeel |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/5e5d43dcc513474caee1b4b16767e28d27c093d9/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/fc313643626fa7ef412d483f01806f719cc42e93/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/e40df89fa1ca90c8569d7b6875ca1c634a2074a8/
         arc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/16f38da067f4902fb50ed896df227a2230e31a0e/
     powerpc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/6b11cfa9d32b9499c2e886455401fea9707818d8/
microblazeel |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/e31b498f13b4b63711091f8808d98df681fc232b/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/dfcea968b6964401a038e55563ded5950bd1ad3f/
         arc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/b1af30b9d31a6e1f4a62839c194ebc2402e2aa08/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/f8482fae2f70ce6685b7bfb1457cffa5e4eccbd7/
      xtensa |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/87a1b9a2e629565109f032bbb0af58df113c718f/
microblazeel |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/04d8c97a1b34595166a17d7aeee5c2d6208f44fe/
     powerpc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/2a79d4957c122e604803f35c60f9596950598de5/
     powerpc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/a40bd0dfb56deb4dd9cc1ca4717f27515e9096cd/
         arc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/c9de8957b5c2ec794f48ed4fc00614e173ab124b/
      xtensa |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/401fe4811029d046ddc299c9faba8a432504800b/
     powerpc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/e0e8439c4459fc52af6244186240f762892cea4f/
microblazeel |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/529a4e752ca85b5fc2f220d920390cd5fdd8b86c/
      xtensa |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/172e32e568a147ad9ec46ea2a289ca10e4470c9b/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/297f37f455b883e76a6e6e11201a765e852e2ca4/
    mips64el |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/337cae7c66021f6340a4fef21116e093245022f4/
        i686 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/cd3ba78b7a4cecd3d1147bfe4ab92e3eb283e530/
     aarch64 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/081fabf4936b10e9d7cdcb3766c54f51985a03ef/
    mips64el |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/d919f7f11d40a4b7fc24d8719d7a38574ea4a96f/
    mips64el |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/313b0b68c6a0eab3a560fbc430e8c1448dd82d31/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/1a2a02262e2d53003617f0c65e1610bd76c02cad/
      mipsel |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/06d0d1533fa34f4f9fa7e0ba5b1e8a08256d769a/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/b318df34ac4b9b383c6cc2d7c3f4285f719acdbb/
     powerpc |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/4a585fbe7760bab42313623d46a9febc421c470e/
      x86_64 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/7831a8671c95f610eb8baa6eba8c6fa7786d5437/
        i686 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/cf0f2fb818f121532f9ade26794cf7d5319c2abe/
        i686 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/23028b29f88623556dc7b5d9ce14b0a5d63f6914/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/d378a9d1a2cfc436a7d386134d177a9b581718a8/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/2319b50e36c584df47cfa58ad798e0423fd89010/
     powerpc |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/6260290f66d5389a9de77a10581c24d844bd2df7/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/fdb71e06f6a45c74b8a7cb1876b87d18f631f0b0/
         sh4 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/3f8678c991224106fc1e2e5898c262b9ec9e4865/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/78a6a494d36bf52edb7ba1cd98b9bc49e3d52a51/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/3fd683fe62e3f410b5f11995d54995e1b90c3473/
      x86_64 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/81f83bb40b221f0476b317a3500713b032230efe/
        i686 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/f2e7c4e39e0d54cb6ba32daaeeb827644ee28d6e/
     sparc64 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/75ee62e2e00e91bc465f2503b2bd9ca81da22afc/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/594451c83fea255570ed67050fef71ff76f1911f/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/2a9c81e7285c94bff7d9bff7236cc3493467308d/
    mips64el |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/49bceddceb171fbbb56b12678f64967bed99ec78/
        i686 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/caa6aa72dcd16bdd6e3bb0c57ff0e17efee70ace/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/8406cc0de77c0db29b6bbb220bdd9d0afe616c84/
microblazeel |                  mbedtls-2.2.0 | NOK | http://autobuild.buildroot.net/results/8d095e3e947a47264fe05e00817b1b5dfb5a4b80/
microblazeel |                  mbedtls-2.2.0 | NOK | http://autobuild.buildroot.net/results/d13a06ba3fc0d7f08a03c04fcb484761da7af3f7/
      mipsel |                  mbedtls-2.2.0 | NOK | http://autobuild.buildroot.net/results/fae01df52057bfade999c446882c80c4b5ad4e4d/
      mipsel |                  mbedtls-2.2.0 | NOK | http://autobuild.buildroot.net/results/584d1d12be9f2bbf45ccbdf93b6b442524059dcc/
      mipsel |              mcookie-undefined | NOK | http://autobuild.buildroot.net/results/7afbf93492819ce59141f056f72679e4cdec0649/
     powerpc |              mcookie-undefined | NOK | http://autobuild.buildroot.net/results/d2dd377663f68002cc2bbb541b6394341313ae99/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/71866ac2b7e53751960c0d9ac1bdaf1225c4143c/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/37a0b6a74f0e05f3323e4c02450fdaaf04ee2f43/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/8b714ff5f1966add859afa4f62d07d11f60cbbd8/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3a6dd895f9a520cf41303f6a99dcf5f53e4c5744/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/47f2e7cf75e778f9a80f281b10deb411f7723281/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/e86e650dc6ee222eeb451715149451db3cc63309/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/e96a03d3075ebc8425bf45b4bbd5ae27edf31aee/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/13cb27a6399b1cde3debe09af7db36cc9d82e5e2/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/9ab3c20de264d194d789753f735cc83adc6b1b86/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/7695e8dfdf313659cfeffefb5ed7bafe7624db31/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/84d9c7f913ef7824149958dd116cad3265c273d1/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/8d3ca06463c61d4ef6bd72b9fc70469e4a87a8a2/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/f1d45df69f6041b6614b46b9d737aa6a58087432/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/688505c05485e95717b59712a3c68b24a8922a73/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/280e57a06089a888151dbc8af66caff1e5de70cc/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/26ccd30b471716e5028ac1eefc78c4c7bd682e94/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/2090263da4ab3f9539828b87ea92c26807b967e4/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/d23a1c51c4d7a260364aeef576fdf5a407abc2f6/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/23fb02a9b70def5ac7bbce4d8d292014f9179a25/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/2fb27b90d27939ac260f20718c0dd9ae4c25dad0/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/25c7d64db336264b49a50fd5d118f9b426fb2bd0/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/aa80c5c942d5481b24dc3fc2c62da7fb2ff2f115/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/b162530fce10b36774a1462ca03e056e340ec07c/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/a878644a41660fac0723786b8f11e56cdfb87fdf/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/f94e5a34641edabd2be78141886a33f225839cf1/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/c64f90abe685b991ebef08e530dddb0e24e9eee5/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/ca29d992998e455011de2ebae46da61efa4c873f/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/96ae8deca3a8fe906e0f204aafecd4b3530882bc/
       sparc |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/e2952a8d85fe678e16ba57c938f2cd559ed8b59e/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/7c1295f4e06f29d18d59cf46289805b8a5b9a8c4/
     sparc64 |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/8d1490e373e6538a0c4e91879bf46da1eaf0004e/
         arm |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/ec1b825d3115ded6a1c36bc135c35cb8761f8d28/
     aarch64 |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/f7de8330e6270b306ace6cd5ccfbf048f3e1f4ff/
        sh4a |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/65d7615755d2cbe8367d8ce4a40ac397f52d8751/
        sh4a |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/2748a02b090ce078fc880bd821df3c913b8c8dfd/
     powerpc |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/0651cd55fd1a30816e5b1c94fa3c1e28f758c306/
      mipsel |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/6921f6c49549616d61eb67e2e04749ac5b39f0aa/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/0cf3910b6440a9a58c13dc11d1d52b416282c008/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/9e4b5e3d99bba1ed24bdbf6414c5211d153d68c5/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/99a30167dc8e01ed241233efffd2afd4e08dba7a/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b9f6d042ae2fdc764ee0f14587fc6fa779af19a6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/acd2745694121f6cedfc423de9b65e415aa50a3f/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/0da82e48ced562513ba00916ad54dbea04cdfcac/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/af1266d8683976d5c1528f22d6ddefa916300fed/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/825651c26e57ef64e62f9e330e82910e1ab3564e/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/2b6f9a25fda7639eca9e421057cf4fa0d5a8877e/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/330698ec6d3a6cf9db981b52ac965287a1c75ef1/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/db0e8be0c00bc1912c69b4a79b2975f42a654a83/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/e636c9c49542c9f0a0070b2cfd5ceb4fc998d990/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f78cb998f17d4d642538f2c0d79469da0b689e62/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/9cecff85bf26a44e4e62466afe08222b12f921fe/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/19eb0f0c500b137132180df1a1f5e8043cab2c74/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/368c1990c1648bb52bd2ec6cc8a64839e481fbfc/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/04919b26eb46b57d86397f8e6b57ae3a6f7b26de/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/8954a791108abcc1d7a74f373065b22de0a3c84d/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d0e9d93d597452f28597700c891523a81cb6e0b5/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/34ba655efe3821ff00c7e23d10c4486282878a9a/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c36955c7372aa0883a9fc2378047a621dbd568d5/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6cc8e301cc18a1ef14843e9c46e67b434525bff8/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/13454ea7ce6e1c2d06073ad0ebc39d75f8008563/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/46169605f5628edab59ffe858d07b8b83660143e/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/c5d59dce5194a7574a955b0643456732a3e7975e/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/a094cc13bce103ec0db97214597fcef185367eee/
    mips64el |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/b2e6b81e24adb8e3bc8b99cff6abf1955a6fe64a/
         sh4 |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/36c56d10abcf96afd389f2ebe8db4dc13659997b/
      mipsel |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/bca1ce397f22308a8081f01854401cad8aadcafe/
    mips64el |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/bbfa718f4f5baef0136c74c5a969f59b0d395980/
      x86_64 |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/47c503429c00876fe5620fb1b135ff3db22e18e9/
      x86_64 |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/d0fe1e0cd498d9c5a66423a73b2ee51429448279/
         arm |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/4736d157c9b693ec3fc8e565b2c28e19b53244a3/
    mips64el |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/35ef486118ec531bd85e596c22c6463b51f32b33/
        i686 |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/913f0e1dbc4f2176822ff64b4efd4c84cfb1f576/
     powerpc |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/f7943ee4dd79cf2bb458b0f7065ebad0e98cffc7/
         arm |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/18c6e77bd7d567b506a42bb9dd296b912b603c42/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/342f68d0bcecfacd3aa348fabb911f1dbbddcda2/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/600f801275e850ec42886de1c1cf9c17d4e412a2/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/f5d2a31c0cb43f6b52bc5a4d9589b2a80baec12f/
      xtensa |          xfont_font-util-1.3.1 | NOK | http://autobuild.buildroot.net/results/7e7b3c3877d2782eda65a0ba8794e7b5b41a3397/
         arc |          xfont_font-util-1.3.1 | NOK | http://autobuild.buildroot.net/results/d63b45c24d01bfb3409e90569a0708f1d4af905d/
         arm |          xfont_font-util-1.3.1 | NOK | http://autobuild.buildroot.net/results/0d7e68ea24ade9587cf66453393544ced9fe6fc4/
    mips64el |          xproto_glproto-1.4.17 | NOK | http://autobuild.buildroot.net/results/378bbf8520d67a67b5906ec177079542158a6be7/
    mips64el |          xproto_glproto-1.4.17 | NOK | http://autobuild.buildroot.net/results/df5bc7ce3ef7697373174d4428e959dc6d8446dc/
        i686 |          xproto_glproto-1.4.17 | NOK | http://autobuild.buildroot.net/results/96b856d9dfab6af20794103509cb4f3c92c8e435/
       nios2 |          xproto_glproto-1.4.17 | NOK | http://autobuild.buildroot.net/results/32fb677b0b76c30239424170728296c6c7535653/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/975a9a938db78852eb8e276e2a097305b7566f9c/


-- 
http://autobuild.buildroot.net
