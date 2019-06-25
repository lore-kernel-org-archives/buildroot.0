From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Jun 2019 06:00:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-24
Message-ID: <20190625060130.5216720507@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  27 |   3 |   0 |  30 |
   2019.05.x |  24 |   3 |   0 |  27 |
      master | 186 |  76 |   2 | 264 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                      gzip-1.9 | 1 
          shairport-sync-3.2.2 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/6e2df9e6cc575ca4d1b5815c6dc0db364198b855 | ORPH
         arm |           shairport-sync-3.2.2 | NOK | http://autobuild.buildroot.net/results/0b765cede9066aba07311e3d93c77b3baf7fde6b |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/41a1ee80683d51976550de23471d1132b08666ec |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.4 | 14
                       unknown | 8 
              iputils-20190515 | 5 
               libcap-ng-0.7.9 | 5 
               libglib2-2.60.3 | 5 
rtmpdump-c5f04a58fc2aeea629... | 5 
           host-harfbuzz-2.5.2 | 4 
     host-imagemagick-7.0.8-42 | 4 
              libsodium-1.0.17 | 4 
                harfbuzz-2.5.2 | 3 
                qt5base-5.12.2 | 3 
                 hiawatha-10.9 | 2 
            host-mfgtools-0.02 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
             xlib_libX11-1.6.8 | 2 
              domoticz-4.10717 | 1 
fs/tar/tar.mk:32: /data/bui... | 1 
               host-efl-1.22.2 | 1 
                     host-llvm | 1 
           host-nodejs-10.15.3 | 1 
                       libcddb | 1 
           libvncserver-0.9.12 | 1 
              qt5enginio-1.6.3 | 1 
             qt5wayland-5.12.2 | 1 
              webkitgtk-2.24.2 | 1 


Detail of failures
------------------

   powerpc64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/06a68a99d26a8cbff180d93598dd877b067ce4c6 |     
      xtensa | fs/tar/tar.mk:32: /data/bui... | NOK | http://autobuild.buildroot.net/results/35f1f82747b03413b3082b9efb9ab1314f8fc60c |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/708b2250996388f643bc2a74669dc15ceef0de64 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/f46cb28d5fb7ae40ae7326f639a20b68d5abeb83 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/5dde1cb24ef66570f715d357bae610861f9b4693 | ORPH
      xtensa |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/9931ae367c4fd5b5756a6d46c341ea1eea141938 |     
microblazeel |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/addabdaf9b236e2642a4021c74f59c1f719538b1 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/b42bd5882825a63a60930e53822f998631fe271c |     
     powerpc |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/5fb484759d04f30f2b58d615f30ae08f49b56dc4 | ORPH
         sh4 |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/d919780862f59a259822b5c55fc71261bff2b295 | ORPH
      x86_64 |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/71cc3b1a00a1306f688f9361d3f26f9cb48ad82b | ORPH
     riscv64 |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/dfb7a2c33d4f44a912fc22ba159d11a5d15acb99 | ORPH
        i686 |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/55d598ae19d64a5cc23e6c2e2c70a6656b0450eb | ORPH
         arm |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/27cd3c50cf0b2af0c246e379f69bf959af874d9d | ORPH
         arm |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/0069fb3e8096af74ccb1646cc45eeb922b70d399 | ORPH
       nios2 |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/ad6de2794ed4c4b372051a1621df69abc1a8ded0 | ORPH
     aarch64 |                      host-llvm | TIM | http://autobuild.buildroot.net/results/92cbec4d3ea4f944744d80a5773742ca0ca81a81 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/8b40ddf5b6ec91b8d377439eefc38a78d22f08ff |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/5c1631e65e1877378a5438486f1c01afaa8ecad7 |     
     aarch64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/aee77bb38fcf5aabf319446e1c4e1bfb4ffa4f14 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/f2cf6c145df00d70b0938675c89877dc6d86f9e9 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/f44dc8ac1c864f07e12f2b1fd6bc82b80686c72d |     
        m68k |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/05a85fbe42cfdb241b694548e3b5edc3d7ce74cc |     
         arc |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/4095c3e35f9b33c9c03f5ab45a4b4037739a3f46 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/2ad6ec5b3821127bfd410658238a93eaad367978 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/387226bbbfaced9b0482d14a9591e9c4667a4bcc |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/c17a329d15ea8d29a696fef5c29b6e4026c07268 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/6c23a5b4f0d201320b8c65c870f30babe4554768 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/96ba4654cf9566c98068b7857d7480f998067784 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/f47247be914416303e7520f7212a918984519aac |     
    mips64el |                        libcddb | TIM | http://autobuild.buildroot.net/results/6499b96e95a17096e7092ce2fb76dabb4f82eba9 |     
      x86_64 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4d5a687914f18cfd3a3e7d988680cf2fdaf2fada |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/8d3d173caba8bee93f3562bb494f1abe4177c0f5 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/cdcfce39eefed2730889a234fff36f2ba43d4360 |     
        i586 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/26a98cafaeec2a0bc0105a4a1091ff8f51bb6b3d |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/ea00e9707104a88c6cee7f09098fc398ef2362d9 |     
        m68k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/d3485e0c5fa518926f46be4266e8331fc7a3a223 |     
       sparc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/34edab6b3458f79dd50eab7b933848bfb36044e2 |     
      x86_64 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/9aeab90513fc912e68b90c0067bfdf79c726dbb4 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/060738d96ce13051cd1ec0a055b5a071f1bb26d4 |     
       sparc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/0675dc0f5e33d582596d2388c839d35a3a22dad0 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/353d2f426a7b12c7a2c69a42615f95a448a9114f |     
        i586 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/2b43783ff3080bd87b0f5e51402ad5f886fc4398 |     
      x86_64 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/c67a3ffb422b4f7432a54d27fa539113c3c99224 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/354cd3b1fd2349129420cb37867f9625c279cc77 |     
         arc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/06510791bc07dda6279cf6590eb9fbf168194f59 |     
     powerpc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/dec7ee49d9d9d3fcb42ed40b4fe54d272da2bd59 |     
     powerpc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/b9c8700113b3ca6bc7551b66d01df0ed7438a0c9 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/5c195b99014be61f8669e22ba58b111849a125b6 |     
        or1k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/5fc9c93b5bb87063d779cc80da31b07952e7452d |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/7f180c30f8de60143c65efdefa85300633d884fa |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/71ecbc1c865d8c4dda12057c272d5c1ddddfaa94 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/acf2b5fff4b8f2096fc00a68aec97dc8f23a9cac |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/375590026661dc3b020d497545252e5af29cacdc |     
         arc |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/dd9de722b886dee3e6373b026062e1aecc11efd3 | ORPH
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/5419e9f57cd0f1c13d43672080daf3432e16d1c5 |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/62993f96280c2ce2a7dff72938879eb4f4f33543 |     
         arm |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/de2322ba2cd877761fd8927a5099f440aa782ce7 |     
     aarch64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/62ff6ae55a3207723da4a08b69cc009c2fdc4cd3 |     
     aarch64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/667e56ca3b5e0e2bf39f99de55afa64c781ed6cc |     
         arm | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/8c4e3aa886e2123d94659cad68beba9adec9b5bf |     
     riscv32 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/f19766e7eb612521ed522170e3c72ad8059b7da1 |     
     sparc64 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/bd66ff96f2a595a837561722c8d4a9271bacaaec |     
         arm | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/07b9eb40c49bd264bf502875f67c265d85ddbd1f |     
     riscv32 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/8fd65149bdbbaf5dcb8e6a9d543f4224875bb156 |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/866eac56318d8ce13dc96c1e3edcf3cd352f214a |     
     riscv32 |                        unknown | NOK | http://autobuild.buildroot.net/results/9796317312dc45592a63c6b3f00ec005bd8b8d72 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/320288a0ea181be490e2102f3f149c664d8587f5 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/e390ad2984fe6fa0cc03970a3830c9a8c166461a |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/785176ac5cc008712c506a23c31a45f5adbd964c |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/f887852284df0f6a0d4c7d734a605f3a444c02f2 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/895d51bd95ba1016b5d26a186bd833739f82d039 |     
     nds32le |                        unknown | NOK | http://autobuild.buildroot.net/results/e3c1ace154b3fe55300e31171aa2f85840c253fe |     
     sparc64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/25e6d328c6e31f30a28046c486314c2ae5c50330 |     
    mips64el |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/5a4dfcd6af001fdfde8cfb084ee6e55f5d070346 |     
     aarch64 |               webkitgtk-2.24.2 | NOK | http://autobuild.buildroot.net/results/43028992c6c053473b5cba3277bcbb805815c1be |     
      xtensa |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/33d266b90dbeae31fa91bcbe60c25beb5f742d88 |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/9d7bf664922ce30e9ba88fe8b8107bad6237879f |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 2 
imx-uuc-79e9798eee9cd972d92... | 1 


Detail of failures
------------------

         arm | imx-uuc-79e9798eee9cd972d92... | NOK | http://autobuild.buildroot.net/results/af3ea11b7adbcd528264a22ba9b3035dd44df556 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/8665f55a3aa2ce84bfa06df95d5b2664e37799b8 |     
microblazeel |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/48c3eccd329bcf9434ab943b044d153d399cd055 |     


-- 
http://autobuild.buildroot.net
