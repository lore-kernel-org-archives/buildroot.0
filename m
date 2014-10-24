From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Oct 2014 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-23
Message-ID: <20141024063016.0D21A1014BF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-23
===============================

        success : 192
       failures : 188
       timeouts : 0  
          TOTAL : 380

Classification of failures by reason
====================================

                  avahi-0.6.31 | 27
        glib-networking-2.36.2 | 23
            ecryptfs-utils-104 | 23
                libsoup-2.43.1 | 12
    host-shared-mime-info-0.90 | 12
          linux-headers-3.17.1 | 12
                pulseaudio-5.0 | 10
       xkeyboard-config-2.10.1 | 9 
   sound-theme-freedesktop-0.7 | 8 
                libsecret-0.15 | 5 
                  polkit-0.103 | 4 
               alsa-lib-1.0.28 | 3 
           gtk2-engines-2.20.2 | 3 
           libmemcached-1.0.18 | 3 
                    qemu-2.1.2 | 2 
                   nginx-1.6.2 | 2 
               uclibc-0.9.33.2 | 2 
                  zeromq-4.0.4 | 2 
libshairplay-64d59e3087f829... | 2 
                libnspr-4.10.7 | 1 
                 cdrkit-1.1.11 | 1 
                 webkit-1.11.5 | 1 
                libcurl-7.38.0 | 1 
                collectd-5.4.1 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 gnupg2-2.0.26 | 1 
              uemacs-4.0.15-lt | 1 
         conntrack-tools-1.4.2 | 1 
                  libv4l-1.6.0 | 1 
              qdecoder-r12.0.5 | 1 
       opentyrian-2.1.20130907 | 1 
               aircrack-ng-1.1 | 1 
                espeak-1.48.04 | 1 
                openntpd-3.9p1 | 1 
                 libhid-0.2.16 | 1 
                    orc-0.4.22 | 1 
                  botan-1.10.8 | 1 
                  thrift-0.9.1 | 1 
       liblog4c-localtime-v1.0 | 1 
                    fltk-1.3.2 | 1 
                   slang-2.3.0 | 1 
               iptables-1.4.21 | 1 
                libupnpp-0.8.5 | 1 

Detail of failures
===================

      xtensa |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/bfd1ca4afdd32e3cc251aab7ee2ae5e5293ced1c/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/27970c147d53834ecd2746addbe70817c0e650e3/
         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/6f84e0eaccfa0882f1e14785872efd935353e70c/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/3ac70bc2f11c7e36dae5092d3e7c05c602293309/
        i486 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/245cfcb09d4cbffdeac8077254b0be440a614d50/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/eac7a87afae8f2c8686031e94b9d19aa96c3c8f5/
        i486 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/fa71eeddf770ddc18eae0c40b75bebf6f55c48fb/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/683828f921fa21ab3c4d702d4f2afb3c8731bcfb/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d17b22100aa23084cf55063eaf93b52d17817a1b/
     aarch64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/1881424d2a337b80627aaeb5ff13d41cf0f29f19/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/5ca259ba8c27852c8a6d76af9238f099bd6512e2/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e5a12ed2edd8810a16e84b00d8fcb522bbebe45e/
microblazeel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/90f71fa31e8044beb9a02f79e45f19ddb6748fd4/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/0806d1e8c1929a7490ff57f188e1531cfb15f466/
        sh4a |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/dba3707b5ee424adfa4bb76f30a706817c91dcd4/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ce3dc46381c6d62376b745621970b396c0a242f1/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/5e66ed82c700b9ba0b5af850a3863eaaab82f974/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/4d58c3ab3ca91720324a298edfd7ae26b16bd80e/
microblazeel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/a1c428a50864d26e6db2a62c55f4fb202d527095/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/985c08ed842366295d1646cbdb40f2f2e6868de8/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c9f99a4a75d372fe66709809fd38600ca7e0d632/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/68f35eb9758f514e5ffc8fc4645e292c1c00f6f7/
         sh4 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/bf5c4d197de3718940c0b86bcc8a1563ac2ec5a8/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/8ed7db0ecd946f8e5e6a04dbda502d62fc06b311/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/b3ff4fb2db341be9aca27cc587a7e3be822f073f/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/7289a2e17c5a8ef764a94995e40051c7235b50fd/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/0dbc713ac4325263a5357eda766cc7fd2431a286/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/b050c814ecbb861925c7a27833c816a769364f29/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c54fea778808fb076e44eeb613b01424d18186b0/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/0cf8118cc8c36cff1b1017cbd875075783ff05c3/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/b148fe278bbd5dd0b7eb9a91540611040c047a5c/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/8fb8621bc5175f593de4ad0f005a5c7ffd4d9241/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/6ec154c95fa11bbdcb882311eea8d24022a367c4/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/2bc17ae9e6d268d6f064f47c5ded839a8439944c/
      xtensa |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/b4b28cc2a6f3270aeca81ecf794c84f22bb3310d/
        mips |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/e4b48e98f39c4262f4e81c1106465228c04a47b6/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/9bb0515f79b0d8a7d048cc1f70b13a6058207efb/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/48608bd26f8da0c343ae3003279fc37e6ecab9a6/
      mipsel |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/1c84e42d89929e964f58ff38962a2ed3b0d581f4/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/f99c306f5ed5edf52f092338a88e3c7d4cb43137/
        i686 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/3676b206b175e4d94101e3937896bb39d74c9ea7/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/14407c7e14159916f1976d5cef66586f7f3c0def/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/64fe55b319cc168c53abef0c32e4d2c29bb0a188/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/a3c7d444b1db8e2c854409f31f65f1a9d20a18db/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/f4ce9504067bc1dafc2af2962dfef36bcbba07bd/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/2322a435e7b8c2153bb974169232d055e983c84d/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/fa4df2d57184e73626614249e30f28493d2e542d/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/b09f9400b6710a356bb9ce444cac71fa8a3e619e/
        i686 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/e430d7503ec809eef8f834ea3eb4209bccb32107/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/a2eebb49f5df06d16e5a69d4b7f714af4b360b9a/
     aarch64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/2c1532c63c04770d7d98471f32c4df692c9737c0/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/b31d88f2a81dc94e5475a7f3cb67419f380e1818/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/80b509bab1672cb191ffbbe4b69ec0f7ce40d227/
        i686 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/b1a462fbe0e26b8bb931693cd7560a22466c2e4f/
        i686 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/a0a539211645f6afa3a0bf4bae341ae2ef17c6ff/
        mips |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/6bb031425d4b85db0dd69ebdf78e41f8d8c5a82b/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/cf91954ca84312858d653bd9f849cda8dbfdda74/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/9a4165c945924e58f448da6481970197114f737c/
      mipsel |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/664ea663a4915df27d1607858cdd948f4809cb0e/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/b39d57923d140b72a1aaef7a1e5e316c926701a9/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/1e7d162e3383cffe207ee6279134f8178d053e68/
         sh4 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/bebe480450085af33924e829eeadb23cca0920db/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/e8cc613adb0cce018e942096e097c42aebdce819/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/f58ec9417a791f533c5708515edd7d90e06e899c/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/a575726f5eb40c1c8a16ea6e6644d591ae7e928d/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/5297a8a90d5a11713a99af27d0b3ae577b8cc91f/
        i686 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/5203ef024849a0dc0c3464a41dc6af9006919a2a/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/087e8dfc093dc75e2f70c69f874bb04f58092cb6/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/3c7f4519200e63dd8b71570111e91457394aeeb9/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/67dae4a9e35953b2ddfc98f441dcb1481f803229/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/c63d8a286b75252e3042867fc697c9f9acd88ad1/
        i686 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/3d750ff60f2f8f4e9d3d2a19ccb82bae11343469/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/c0b375d34b1c1042d7cfe012203d7e7ed1466f7d/
        i686 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/fca92c280b4db5fc8ec226a38ec8cbd3bfb88a0e/
        i686 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/c328ae8bbe9d1c7fe9090d1785b89ee5d0842423/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/e0133c0170f267421332de31e49f72e55fb3d1c1/
        mips |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/4b42945c72a9a9f8b6ad07db96c7ebc46b690047/
      xtensa |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/e58cb016c5d09f72abec08254cd6456e6e4bf0a0/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/5235d9fa429c37ad6754adb2df8c82ff8bad1fbe/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/f7cca83961807aa4376a51763c5bacb90131bbf4/
         sh4 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/96c3cc680a2d2fcaff417555367c8da9988c97de/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/6458201181ddba9390ee0aff76b2c7ebce43489a/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/ad69c289f28cd0247f375ef506449a3fa3772dd2/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/f112191ca693f877b29c69cfb869d2149c4e4e84/
         arm |            gtk2-engines-2.20.2 | NOK | http://autobuild.buildroot.net/results/a23bfcfe4626ac5e160051804f3b9d345dffb9d4/
      mipsel |            gtk2-engines-2.20.2 | NOK | http://autobuild.buildroot.net/results/1cd9a99a8b81fd14ea3293c2a8f3f7ee1840791f/
         sh4 |            gtk2-engines-2.20.2 | NOK | http://autobuild.buildroot.net/results/7937cf577b8bf56aa8183ab31da6caec89959687/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/1f9309ac26131b045fc590b09b783b926f8d0003/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/ce082c2eb4b5969dcc8228b17e7c1c547cd6f27a/
      xtensa |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/36f5cda684fd7d438489cd70ea1dce82b762c3e1/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/29685de69d296c5cd527b0746e213944b9a7dfd6/
     aarch64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/58941dc6244f164e3c38eabc87a1e6e8e110cc98/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/a78168426c0f0fb9eca1a3bce5eb7a487ef09633/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/c77f57b1905db9e255814b4f7d4a5a75de20ed21/
microblazeel |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/e327305ac4bee4b109ec684515d92bfc1d0a43af/
        sh4a |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/b37fd310a9480901e1dd25dd708cec8caa732d5d/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/d37f1fcea9eb86817effc1a13562dd4d511aa69d/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/05597dc6e286aee63b2c0ab27f7c5de8c8b94e90/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/8ba2468117ea95f2b76f7267ca4c913194785084/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/82bdfb4ff3a7c516be775f6225aba1392de48518/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/54b2d62d6f33a36299be54b34429c2ed16c73f07/
         arc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/fb176778c9cfa09479220734d4b58da03d518ac7/
     powerpc |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/a441a42362621c947ad4d8f4686dece321d1e2be/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/c77ebc3020746d4166b1d3ac8cd9b1f8fbd9113f/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8ed0c52f50c0a62f7052707bc75f5f25db4a8d87/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f23f54291adb0e7568d68c9eb3bc209b8db0f9c8/
      mipsel |                 libnspr-4.10.7 | NOK | http://autobuild.buildroot.net/results/6913f5af6519463fbed39ef37b6a40ecf6a67b54/
        i686 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/8af1826f3199149e48357df9facff7eabd5f5782/
    mips64el |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/44f3154409f8a207c51a6a5c2a00115ae91eff24/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/3d44a8be0fb9c898cbc7bffcc1111aa3c45b1c31/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/1d8e6f715d4b7d1c52860527c36772a0e1429db4/
      x86_64 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/7ca12c4565f535506d3055adb1ca931c5c78b526/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/4726c77dc9571f686ef53859efb85e00d89f9e56/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/d40619a40bde63625ae3cb755b29aee99a4d6970/
      mipsel |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/0522b115d39a879bf226b95efe5db058b53e0b26/
      x86_64 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/8edec00cc2fe0871a2dc0f401f436473e852a8c9/
    mips64el |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/96d94941435e05ed948e66866ee437dc8249e51b/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/e0d0dd3d3c182e5cef8ed93bff0c38689d5b78dc/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/85a262f15ca5eabb1c9c7f0eeccdbff4abe13897/
        i686 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/af86a3529749aef88d70f2e70595b08de0347679/
      x86_64 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/d9abebf63a93b69c6dc52f5e30a4512c33d88816/
microblazeel |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/991ddb5420a6979904dcb944e5eb02be62a10f95/
        i686 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/a91a3edc375b38b6b4bce9cdb327d8a1eaaa2c53/
         sh4 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/623b8a4b9eba92d1fcdab99bdcc3454e679c8972/
        mips |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/09389ef99ec75a09d5727c26dbb51ee8224229b6/
        i686 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/8db5fa35c52dd87e15fec243bea8391f6f5818a1/
       nios2 |                 libupnpp-0.8.5 | NOK | http://autobuild.buildroot.net/results/ff0320452d09cc227f8d93d30b03d7ad22d1f0e8/
        sh4a |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/7bfa6ba7228ff2bb071e736d2cbe4858121265f8/
     aarch64 |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/b0ade370ebb14f76ff704695a76b9e278b5e9129/
     powerpc |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/bc1d167614e8b0826667038da33310baa547595a/
      xtensa |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/70c345112e289c3ec9742b5577e5716ff38aa915/
     powerpc |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/e1c420b52e078ba3abbf4350a7266be9ca914593/
     powerpc |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/c00f07012303e88571c26c65b039f4a6f610afb5/
microblazeel |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/576bfd253fa485c775cbc3e4ef14847e7b77ac11/
         arm |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/01dd79f0a1af895ac624a922000fb0f97295d867/
     aarch64 |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/cc76961ebd73abd5783a1d7aae40eb43edd6bceb/
         arm |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/50962741ac412c6f00568c4ff9dfd9cc101a6884/
         arm |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/478fe7c07a6e10ac9578cce92d9cda2ff06372ff/
         arc |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/a42fd0ca18388bebe547df8b1d97359c803fe9f8/
microblazeel |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/8ef392d29716eb63fa42d3f37613f95be72c69f9/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/5bf3a1571e664399424e755bb867998fd2125bd9/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/3651717a8dfdbcbe498ab6bfc0c2d9972b7cfab4/
         arm |                 openntpd-3.9p1 | NOK | http://autobuild.buildroot.net/results/0414076d97a1b6cc1f469bfe619236e1e16047d5/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/80486b8249335e2c6e8693934b8220f9358005d2/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/b4926307fc3826e3613f861bf44cdf35f3a0707d/
         arm |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/c0e48a73376af28516f45b56b4d52266ada0dfb7/
         arm |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/f0bc840f1f4689a8ffcfc5f4fe6ac424c08f38d8/
microblazeel |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/06e9a3973b5613ff718e4461185ab92e9cecfe82/
     powerpc |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/5b473cffbb5fb425a022fb040d4a22372f2dde54/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/b3a655ef794c9de84d58d8736f410bc6af1fd8f0/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/320e9f28e3ef391c1a4d92b1289e2899e16cc20c/
    mips64el |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/c03f8551ed72ddad42043995dc3d711c04e0fc3b/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/c9dbedcdbb1e4d3f16256d8b4f20006c965a02ef/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/7f59335c662f35bdf35d9b72bd16dbed8eab43a3/
microblazeel |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/ffdaf1dca6aba20696fdd5cc984df8ed7ae2d81a/
microblazeel |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/6d1ddb5b2bf9e90f77f31ba2319f859fab06fea3/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/9447c54c4f5d69258f0acd03940b845acfe36b2b/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/a7677d863f7df50fb7543481d0d26a62b66d8e14/
     aarch64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/9357ab27da49c0f4fca35f7234eb1e73ced530c0/
     aarch64 |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/29807ceca5de0da08f758b96a9efdfa9cb4e7e9d/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/f3feaa1404d1ecc3696856b1854a1a962131657d/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/c6b9049c86700387f80befa09010583a0f91e910/
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/a0e791d4039325bca7b060ed6b8cc98496df6cdd/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/29982a9a89a76e1c52133372c334b555f90a2317/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/f91e086b90ebc95f2a8f6fc3a112d4f15b87e574/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/bfe7217d29e75e18c481cf94a40de6ceb7abd2d2/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/947798f240a0ba1addb76f93d85322963e32f627/
        bfin |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/3f9baf65a695c0fa2b12a57df7712a053aa51dd4/
        i486 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/44083c212ac0f6eb58ebd3ccdcb32aafcc6de32d/
        bfin |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/d372dcf438a02b1592ed4ee635fc1605130cf0c8/
      x86_64 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/6310f9015222116d48e9c9ce093e2651942c77e5/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/28075d0e5ffdba6c947b90d2f9fc165e36ced98f/
         arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/0361f2e351bf06a6c7c4186b9d3cf0419f9335e0/
         arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/0ba11cd8617591edfa7ce79f995113d9a02b618b/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/d68537325fdbd2c63f7b8a1256ca7cd2d8f9d579/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b66f4294ab18b97033eac18d6f14d2578efd5d83/
        sh4a |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/59091dd92505ef49a97ef541bcb9630a7efe4040/
         arm |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/3718ba387b294706a09f347f95718926d06f77a4/
     powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/049c0b964f404bca7340a27bf5396decb7c6c48c/
     powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/50d2eda8e01ff15bc4c5e56b4219f3c84fb4e3bd/
    mips64el |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/2ac1e89fd4aa806cfbad8c0fdee7e99c934c4311/
     aarch64 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/85651f19ad8113aa87384b76c29303d45916d69d/
     powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/75d75468f78ad2917db42c65908edd4180ea041c/
        bfin |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/6a397646a1e7f6d5bfca95ebb99ff94f35241b7c/
     powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/1195c2c96ebacfd66585e8209559350293267337/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/ddfe6496906c323dac6506b2810f339dffa8341d/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/7ade5e73daa6fe93c5efdc098fe88a1c21721afa/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/0597e068c7769da1cb9f2abfb79d8b95dc41e9bd/


-- 
http://autobuild.buildroot.net
