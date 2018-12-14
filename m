From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 08:00:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-13
Message-ID: <20181214070028.8318D207D4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   0 |   0 |  30 |
   2018.11.x |  30 |   0 |   0 |  30 |
   2018.08.x |  34 |   0 |   0 |  34 |
      master | 108 | 144 |   0 | 252 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 acsccid-1.1.4 | 23
             bluez5_utils-5.50 | 19
                   ccid-1.4.29 | 18
        glib-networking-2.50.0 | 14
                   netsurf-3.8 | 13
                      iwd-0.11 | 9 
                   libva-2.3.0 | 5 
                 mesa3d-18.3.0 | 5 
                  ffmpeg-3.4.5 | 4 
   libtorrent-rasterbar-1.1.11 | 3 
                  linuxptp-2.0 | 3 
                 dmalloc-5.5.2 | 2 
                  grpc-v1.16.1 | 2 
             host-grpc-v1.16.1 | 2 
             keepalived-2.0.10 | 2 
                     pcre-8.42 | 2 
                    php-7.2.13 | 2 
              xapp_xcalc-1.0.6 | 2 
              alsa-utils-1.1.7 | 1 
              drbd-utils-9.2.0 | 1 
gstreamer1-editing-services... | 1 
                  libssh-0.8.4 | 1 
              pcm-tools-201812 | 1 
                   strace-4.25 | 1 
                   trinity-1.8 | 1 
               util-linux-2.33 | 1 
             xapp_bitmap-1.0.8 | 1 
           xapp_xconsole-1.0.7 | 1 
              xapp_xload-1.1.3 | 1 
               xapp_xman-1.1.4 | 1 
           xapp_xmessage-1.0.5 | 1 
xfont_font-schumacher-misc-... | 1 


Detail of failures
------------------

    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/7a64a235eb3101bf579fd69d4f5c98d815170fcd |     
 powerpc64le |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/301e44757c63589122ea7c43c5a0e5a9f4ed8c69 |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/24c2f893421fac1bd275104f05ba4a97b1b5cde8 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/63407f70eba308435c9c6f6f10d03887576de913 |     
        i686 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/9ee4f4a50cdc92b32b3a1f885e901716dc4d6418 |     
        mips |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/21ca9e9a7f82b59115ebd1c6d1749d596ebb11e2 |     
      x86_64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/fb6554a35c8e53a7541f65dd80fb06d61bab6964 |     
     aarch64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/5bd8a99c59c7d7477362a0438db72590f24dc757 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/52508fb35f51300d9906386a88353a84e05396b3 |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/10b36b1629c7b61b27be4da481dc0d08ad3ba7dd |     
        m68k |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/fd13aabe70e26af25e279236f1f3d5a69f41a1a0 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/6bb484c47e207a1d18db9c20659ca22121a59ee6 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/4e81432e029f69307c55af25e7ad08911c20dc2d |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/fa59e3bbbe316d4e9e02c2a4d9bbc4840e63bf78 |     
   powerpc64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/f27d5eda50feab87dd0931196702ddbd922457fa |     
     aarch64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/7558ba7342db759107f28055b750e00faf6dfdfd |     
  aarch64_be |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/f130b90233137a73e03ae1472056a4d567372d1d |     
      xtensa |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/5c8906204e8ce3d369834f966023ab76d6eabd61 |     
     aarch64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/24c12721a707d93bda126af602d4083e9db1d8e1 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/518713a3f0a372ecee6fef1ce1fa6d0073f0adc9 |     
     aarch64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/cd42479d2edc6ed9391f9f96ea1b4523961776bd |     
     sparc64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/4d099425e79b084f2899dd0b8479b94cb7cb0750 |     
  aarch64_be |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/98b7a66b33dc9f7e9c740327e3ff8dab13bd617e |     
 powerpc64le |               alsa-utils-1.1.7 | NOK | http://autobuild.buildroot.net/results/d8ad140ae52b4fe8e153de3835f3f17e92b58e53 |     
         arc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/599f5aa8917165e9493b0652b279d56669c5aa47 |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/1189cf3b800ef6f00a2052f1a3dda6cb75b78783 |     
         arc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/45e416b800a53ea216ad3dde49666e8ee87ea02d |     
     aarch64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/ff424a718f2bda9be77ac1c904134ad95eee6d7d |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/90b4d2e743efbbf17394bd5cb139ad3f55c7cf24 |     
         sh4 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/b8d92d060f38648b19300391e9130b98752dfc01 |     
      x86_64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/eb89def104ed1b65f5ae7b96b365b8766c73919b |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/1c0c7cb2e5ce0ef079550cecaff07d3ab713780b |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/f83445d28a2a0286cb930a84414df78bbb53c060 |     
      xtensa |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/04ce8da4e1d465d0f3cccd1c0d9e31ffc3cb9e17 |     
  aarch64_be |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/3a274d660425e566f8003fbbaf2428a4b3ffee2b |     
        m68k |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/b00d935a38a1ae5c913b080cb7fb993aca2c3a44 |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/0871041752d1fc143a17634468d081dc020e6016 |     
     riscv64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/c9157eb4f309d4b98fad1bf39935b3550a57bd4b |     
      x86_64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/3c1a6c493a205d263a29a582e53b16f36e955a8b |     
     aarch64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/47d2845d535083fb99a194e30714dbb2a1f28c7a |     
      xtensa |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/dad865bc7d6f7a712c168623fcd3eca58a857606 |     
   powerpc64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/99970a7cffd1b67b76ab0b48f77d619f70cc4255 |     
 powerpc64le |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/b7a63a4bdbfd9be0473df78de4b221eb76543d66 |     
         arc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/aa540b08e99fa9f97ba1caa7eb2b574138d17c48 | ORPH
  aarch64_be |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/d114144cf83302c1479a9dce00486805ae526ea6 | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/e2c2237db99c2aea62a0b3369f3bd2722e6adb60 | ORPH
      x86_64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/22c630038a2ba0f71488b13283f964f41761abdf | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/a6df9ba7b0cfcbb25199af24dd7dd493ff6aacac | ORPH
         arc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/00addbc5ad757a6beedca236a7cbdf03b731e95e | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/1d2084b2b161d282f855101b84485c490e9178d9 | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/0106ad9235899b683f5a6688b502bfb35458d58b | ORPH
      x86_64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/2ab122d57c0edfcef39af4d93ed09822c5559622 | ORPH
      x86_64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/bcdee7f30e3f5783ecd5c6dbdb9ae1edbae530ec | ORPH
         arc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/2addac32d8b35228b398d0c48a62d1a2819e2191 | ORPH
 powerpc64le |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/caafdacfeba8aca00c8f1b35e2873e285914202a | ORPH
       nios2 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/0d71446b5abe414aa7f051a430efa569f9f6c606 | ORPH
      mipsel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/10f2e0c86bd2cd5b149854915b654fe69b98b45b | ORPH
     sparc64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/c50439990da64da3468244d838981fff85c1c6a1 | ORPH
         arc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/1d1990accacbbff9cc68a504cbda15ee097d48d2 | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/ae751466f25ae16f9bde64eb0a3413b9fd5eb9f9 | ORPH
       sparc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/56cb648240d2b03014a0e329b098a6539943c3b8 | ORPH
     powerpc |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/129ddd848bd6e4b2863dd2ad8668be0c23363b22 | ORPH
        i686 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/5d9d5bc0e526e92e4fc33968dcde778f4f0e0edd | ORPH
      xtensa |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/c2e81fa2ffed0351f2cdf4f463aaba4e8f2958f1 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/330a14032110ea5509645b3b78bdd8356aed878f |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/5112e4d86bd0a7f1a2e387d3773d7111364db11a |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/44e9194656e4a930dc8da7e9a90156b724e5b5a9 |     
        m68k |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/71026c9ad0f78ba6ae8cd1b4736a696efb20788d |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6794c1136ee005ede9c4695a57b7c50f969c6030 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f07c676187eeef89037121977c9c257891c9ebd7 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/3b73a085d474ffcb11cd88b4633c4dd8eff52bc5 |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ef934bbdd10a7205e3e746981fef517bcd235a0e |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7b3fed1246d5fcca7e6e56daa412bfb8dac63a20 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b47088343ad2df62f7262a662255ce328856d37a |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f8975af19ef3b905a263f38570492def1298d095 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4252cdac83a7bcbf6decb9fb3a014e6da109bf84 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7673f21195fb68efa3bdd888d83ae71ee2ff7e44 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/84ab840f87a9bd3dcfa8b32b983f434793b9d2d8 |     
 powerpc64le |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/fafda3e8bd56a5d43d2269a7fc1e8c198d7dd8ed |     
     sparc64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/97fadb10f1f8e731575c6cf30bb920dc08315534 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d7025b546a7bb98a5971cb4bd4a422fd15ef3ebd |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1572060c9ddec13eb037bc6f0587d7934cd569fb |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/14a02dd3804d9b9eb72beb69d0d3480e5e4176fa |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/7f0619cc48df3e42d637a7c85a3f276c4e5e208e |     
        i586 | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/eb60ef839049a0ca16c50a1ab7664339b14ab188 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/1442bad0e73390ba4fed61631324e7d0ca8df892 |     
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/b9342e23c411cb06b4f6ad446e5ef07440ca0d31 |     
         arc |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/940418c5b300afd3eaf5975c951dee54711310c9 |     
   powerpc64 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/a757f03b09ece148092f22be3be50e60ed51e801 |     
        i686 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/f41ebd8587e8bb6313176384914ceaec209782d7 |     
    mips64el |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/b3832377cdd88297175c7ae5803c1c8e5feb3e9b |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/61242b344635d8eca170428538792fbf1e68143a |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/b4fdfcd27867431fa32c6ac9650041ea08563f42 |     
microblazeel |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/d2f6ec172ec33da3360ade67e7dcca4de33d2800 |     
      xtensa |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/9dbc6abcaaa59c473c7292c9632a84e4cef2877d |     
      x86_64 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/29d2dabf37ebd8c34da9fe2fe2121136e5060bc2 |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/e1351f640007cf9eff09d56b0e13d58ede1487fe |     
         arm |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/34690fd724332c154971d5363a4c84e97a5e9ae9 |     
      x86_64 |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/3826dab83bba44eeba27036e24483533b460f38a |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/15b2708aaad9bb63cf645b4f5b10e9e2cc4bf1f4 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/d13baceef36914fb5af31580f29cf97ec4f9532a |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/6fc5bd32ebd9b646a10bf6fe6b5c2ca13ecc37d9 |     
        i686 |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/148c23f3e17de8afb88bc898be8b967565ba36da |     
      mipsel |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/1205c1654bcf7779318812ebe7033ba1aca7853a |     
        m68k |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/58d7162c5bccc60bce321ddebd9fc2f9f938ab33 |     
         arm |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/1f18b336e13883dad62fa0c26b80484b78e50dca |     
     aarch64 |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/76f15bedfb8b6f4598d3bda8b31cd9de100ef04c |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/9f59a30fbdf58988f0b5938e13deeaecfdb18edc |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/6129c842220018ca0edd6199bf254cdbce162a20 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/d8c1618f6c242e3904dd844535a91e9dda0db87e |     
         arm |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/54f3f12c63497c5737d554b277ee62ad3faa0483 |     
      x86_64 |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/1f327c3b3ce190b5e5a65c327ffc286e89648a98 |     
     powerpc |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/088c015778295106d36e3efadec497ef2ee3d9f2 |     
       nios2 |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/21ca123878ddc82910241c530024bc7eff005e3e |     
      mipsel |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/fe5cf656fbfb4e6f7f9b7573ad2e8903e5d8fbcb |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/47ee525a864e61c9a5018f42754e9a4d761e6cd2 |     
        i686 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7bbd55ed1651a3b9e6ad3f5576ee9277c97a9e98 |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/757f44d75db7551848078eed946841f1b8ca7d2f |     
        mips |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/572cfd26b5f10750737983fd7ae473f687a83d52 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0c56966b71bee6d895b75f95ea99e10779d26a73 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2bfcb1bb02249a3288af19adc9e6d7f25f0303fb |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4adf1b58e59d8b1670c616011ec78d25f0167cfd |     
    mips64el |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9f46398e1311c04ce8b95e00aa5f0374f6624bf4 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/fa5bb3c19908aaa5104d6dac44da52ddbb75f57a |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c40ac41500a033cf3b80608c99698f3933ca95c1 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a0a95f027f6beb7d1a9cac83c210563398ceb3c1 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/43d56a68da1bea2829caa1eb4c781092f58b19c2 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ac844acaf6a97334ba18ed02def255ee5ffebc7e |     
        i686 |               pcm-tools-201812 | NOK | http://autobuild.buildroot.net/results/cf3c79f0c94be8a184d532570bdb1893090316a3 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/386ab0a7418cae13d52d451966a9fb0293219c39 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/c423876f20e2b6d541eeb7259997d69b1816f616 | ORPH
        i586 |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/e97ec7c18945bc6cc0b2de43401d73d33cc61c93 | ORPH
         arm |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/8d47fa46409e42dfc08726653b32e082fe9def92 | ORPH
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/0695d6e415c0d619e55848b9039de6577357d8b3 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/603b779fafdbb729226422363a8c3340c7010927 |     
      xtensa |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/12b108a6185ab96a0eb509ab0e6fe053e545c77b |     
  aarch64_be |              xapp_bitmap-1.0.8 | NOK | http://autobuild.buildroot.net/results/44bed7a9251e108f0c3bc8654b757ccc031a1187 |     
         arm |               xapp_xcalc-1.0.6 | NOK | http://autobuild.buildroot.net/results/88d8b5c5c64870451febcb5ed8079687910f8b0a |     
      x86_64 |               xapp_xcalc-1.0.6 | NOK | http://autobuild.buildroot.net/results/6d906fc092e86ecf4214a69a5f087efabab4ade8 |     
         arm |            xapp_xconsole-1.0.7 | NOK | http://autobuild.buildroot.net/results/959986ce1411f14d84da4aafaeb965bf9a847c7c |     
       nios2 |               xapp_xload-1.1.3 | NOK | http://autobuild.buildroot.net/results/722c1bdfb3f38a13be7a40793a8df4f0324885f4 |     
         arm |                xapp_xman-1.1.4 | NOK | http://autobuild.buildroot.net/results/725c20ec9621a9c2d4b94784785bb481ff74f0e7 |     
      x86_64 |            xapp_xmessage-1.0.5 | NOK | http://autobuild.buildroot.net/results/ca1ce01dfef8b1a9cbb27e444c0c884f37f9cd7c |     
       nios2 | xfont_font-schumacher-misc-... | NOK | http://autobuild.buildroot.net/results/73fbf7714b0a9a102565f90bffc0122546a87497 |     


-- 
http://autobuild.buildroot.net
