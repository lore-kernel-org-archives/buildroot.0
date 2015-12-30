From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-29
Message-ID: <20151230073020.E9473103127@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-29
===============================

        success : 208
       failures : 212
       timeouts : 2  
          TOTAL : 422

Classification of failures by reason
====================================

                   assimp-v3.2 | 22
                  libffi-3.2.1 | 18
                  boost-1.60.0 | 16
           linux-headers-4.3.3 | 14
           host-gettext-0.19.7 | 11
host-vboot-utils-bbdd62f9b0... | 9 
               tpm-tools-1.3.8 | 9 
        luainterpreter-virtual | 9 
             netbsd-queue-1.70 | 8 
                  ffmpeg-2.8.4 | 8 
             host-boost-1.60.0 | 6 
                    libjpeg-9a | 5 
               libcap-ng-0.7.4 | 4 
               trousers-0.3.13 | 4 
                  prboom-2.5.0 | 3 
                 dropwatch-1.4 | 3 
                  udev-virtual | 3 
         xproto_glproto-1.4.17 | 2 
              gst1-libav-1.6.2 | 2 
                     popt-1.16 | 2 
            gst-ffmpeg-0.10.13 | 2 
canfestival-7740ac6fdedc23e... | 2 
                  aespipe-2.4c | 2 
                   mplayer-1.2 | 2 
                 libdrm-2.4.65 | 2 
                   erlang-17.5 | 2 
              alsa-utils-1.1.0 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
               dvbsnoop-1.4.50 | 1 
               linknx-0.0.1.32 | 1 
                      pv-1.5.7 | 1 
              rabbitmq-c-0.7.1 | 1 
                  connman-1.30 | 1 
             host-nodejs-5.3.0 | 1 
              libraw1394-2.0.7 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                 fio-fio-2.1.4 | 1 
                alsa-lib-1.1.0 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                    zlib-1.2.8 | 1 
                     mtr-v0.86 | 1 
          chocolate-doom-2.2.1 | 1 
             stress-ng-0.04.16 | 1 
                   libnss-3.21 | 1 
                harfbuzz-1.1.2 | 1 
                     tslib-1.1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                      gsl-1.16 | 1 
                 lvm2-2.02.138 | 1 
                 mbedtls-2.2.0 | 1 
make[2]: *** [code/CMakeFil... | 1 
                     rpm-5.2.0 | 1 
                   tinc-1.0.24 | 1 
make[3]: *** Waiting for un... | 1 
                  libnl-3.2.27 | 1 
              cryptsetup-1.7.0 | 1 
               ipmitool-1.8.15 | 1 
                     nut-2.7.2 | 1 
                 igmpproxy-0.1 | 1 
               libgles-virtual | 1 
               qt5webkit-5.5.0 | 1 
xdriver_xf86-video-mach64-6... | 1 
                pinentry-0.9.4 | 1 
                      qt-4.8.7 | 1 
               valgrind-3.11.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                busybox-1.24.1 | 1 
                xcb-util-0.3.9 | 1 

Detail of failures
===================

     powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/862f1dc95ed4cf90e19794cb2656e2136ea69b27/
     powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/379d643df32a8ca12fc17d70f4e2fb94e70d4251/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/041fe468462b3e6187244c5ed31d228ddd9c2833/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/5fc7ac9d2774991fc51c3c500762986b30d3c2a2/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/e0c87571acab78ee14b20ccb634d39025dcd3ab7/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4cb0d33d4db36551e012ccfb2ac7ad562c5cd3b3/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1e79d9801b9224fd39683453fb23d2fa096b34ee/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3b73c8bca5bd1720ee842a78b4e44d1fd43aef7d/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2c10493b6e1c641328dd7664cc658e6adfee715f/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5bd67ea68a353945ca2978b77bfffb6f436fa223/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3338d79b7942c107b84f2159c67edbab6926ec6f/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1d9025d8952f9adebf99a18b2bc67803623da676/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5fe5dc1c504b648a4d810f772edba2bb237199b7/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2c2146e5d275c42b2b1523d7fcbd4c8c74cb26f6/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/95578c6e2ac16170e0a87c89455bf4b6646a979d/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c4d042119d2eff9c36f7054e1cff7866d5d1ed84/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d55c3dd11821d046613ffcbf1a5352ee7a060de6/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b020115912dc00dfcc4fa59bdb7b234ca3e89d7c/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e9aadf8e717aecdbe50a7524324d6a4852b471bb/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/9f67a48631b3cab3dc26e036b00ec9762acb0ace/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a840499c56e7878f76fd0c2606465b4b18e5a73c/
        mips |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4c52ecce0a8216f4a469402866e2c145b7812c86/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3054e9703a708c92b247dcb60ada6a29b40e838a/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/df2ea3f65ad3d698270353eef6ae77ff2ab07822/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/52e626251250d48fa817220d66806465c6603a2d/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/7d7a5643cc31c5ecb145d5f741703899e4eedeb8/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/8a77196c792277b72d469724a7c727536c43e360/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5c38b97eecf79a0613b492685d99c08bb60bcaf5/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fab7934bdb0f96c0e769882ab6d1b0dfc3396376/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a9f6238ccc6e589e431864a425ec4483c866c456/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/666eba4d877f69637194f395b96f82f98839dc0e/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/62854da8190a1d3e0dd1546b36d7e7e0479c1d7c/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/00b409be45a18c36afb312cdcec26a0ad82c2290/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/de57642d7048543a7594a44f66c39fd695333d2b/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0fe29855afd7eb3bb1031e4001fcc65ff5da4585/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a689ff19afadf5cb74dbbb093e32c4f776746cca/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f7065c13454cdd85422e4a7c50d76e2dcdcb9acf/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f2acae7abf191ed3e833bf22a83bd24cf108d943/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/643af6d841f5b6b6fa37483413ab414161574877/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/61d7ec87533d422275b9367d096dba98982fcfa5/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6133ef1c7a055119c470b82b695e7222b050fba7/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/66955654e1bfd67ac59545db92e9add4403ec1ee/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/992fcc84189176d1987dbdaaea191fdf11f68717/
     powerpc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/04099130bc5a4a9a880827c8e23073272966b12a/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/0de8d19124e9bcfc4f9d592e56ad093d66278623/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/706887b0878cac57d5cb139e61e24579843be634/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/f4f0108cdb3c078d95f676b349c84e283a6a113f/
     powerpc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/0866b5a275274b0ae951f48ea86a23021f966de4/
      x86_64 |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/ee9891c0298202248977e43585596ada86fe0c3e/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/702cf5f03ef87bb0ab8186864d4871a6e653217f/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/a33ba8c489e56fed5040f77938b8a36e4b18a4a2/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/1d2d3824cec1e2f29d51754d97c4265da2bea71e/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/6a37abcd1b8f997c1d5ccd157eb4d99eeb503c21/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/c0fec31675698c8c5883f9c3805123749aa59e4e/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/057fde4792d25905f61617df8adfd290509530d1/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/8c4c92e3bf5bf1112574fbf18ab4f666739217b4/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/cacbfa004a19d5bab029036e079fd575c0e1ea51/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/3277288bb1cc8316c8a6f74a3616dfe5b0f3d9bd/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/793ffb205a7e19c142a86dc2e108b16c8fd8f51a/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/cfc91a21fd4ce78608f647bc61046877cf9d5d7e/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/8024aa644389246118b6462e91e64a252e0213e2/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/a67794bf4bf9cdacbd0df2bb5d187ba1e714065f/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/585fc664ec8f0f07bde65e3a7099b0c6468f83cb/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/fb87fa0806d0e7d39de0b30483f3672bcc54837b/
     powerpc |                       gsl-1.16 | NOK | http://autobuild.buildroot.net/results/dcc9c9f332b186ef228b1e82f8ed55ea4c1c1fa8/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/b72812fcd100b4fbf8eda046bf8e191e178969b9/
    mips64el |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/d3cf38ce763a5aaf168a9ac55511c4640779c9d3/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/a0769dd0d2c10831cca3905ea7c73523902789f1/
      mipsel |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/b6f77b0b65dfa103149603ecb7664862f665599c/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/ab8474d6b72a1d73d7c5adfe2fe51c3b29eaae7c/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fc942c7353f2e5fdfa162c6f0d0fb69092b406d4/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a72a8d9efda753ad1fa5c58ac00d9795b23889f9/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9099337b27a9dbc019439b6265f80448a8ae70ce/
      xtensa |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9d784ec8e8a4515924353541661c59498fa37891/
        sh4a |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4b0b717e9a2ed01975899446c0572006126eba06/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b6379f895cddc036c08b0d31aec8786157b3e7ac/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/ee122166476a6dd8dd0e372f9396281eaa0fbaff/
      x86_64 |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/1a70dd82a630807fdc44473e553cee490085c89a/
         arm |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/c9b0ac6a11c775bf1fa95192e0c0600d6634387f/
       nios2 |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/a62501f3ebb8c6c982b6f2236f009c00cab2102b/
    mips64el |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/43d58f1e5fb1c7015005cec158e6c3a83ea887ca/
         arm |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/1b7b1244ccab111dbcdb6350525077d2a7157d91/
      mipsel |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/f203a938faa5dcf4319dd4a3eea02f0b131e85ee/
         arm |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/bcbaeef72d7b700c548f83fb0329aef07ee846c4/
    mips64el |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/d60e73c4bff8c1c0fb4d1317e84364fd417cf84f/
     powerpc |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/dec0397ad6eba56e875a841ad7a8c89939d415a4/
         sh4 |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/4ac88b0f5b6c68dd64c6ec73076dc3eccb843a7c/
      mipsel |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/3a063bd1079d0c7bac95efe41ea65572c9c804c5/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/4589dd076585d6472ad1e65926ffe68343b94422/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a6360fd21314899321071c34fcb4892c5eed9bcc/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0af3aa4a429c45d3a2609913ec1040f32378f3c8/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/cc4940fd6f51b31d71014f5aedee5223180eb36e/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/95c8708411fbb116f313a0fdeccacf92cf9e3d8d/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/cf4aa60f9fc9c48ff13d3233994b77b7c0950afe/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/33b16d7e93c33b7a0ed748a4ce4ca59ef68749eb/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6f7dcafde693f06dfc88c922c5f8dd70ae2e30b5/
       nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a2e95784d32c8842f6947801fd0d8c48f68b84e2/
     aarch64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f69ae4c9eee27df43389ae76048fb4ddd5a3eca6/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/789b74637557f6944e1706002982a951a8ffdb11/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/94351db663123f02d017676b188c04a5299b5438/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/3f71e7eb29688304ae4298defe1997932112a1cc/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ba876fb463c5fd959469ef6f17d310b5797d1347/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ab8f071daedf9a8da2230b790b6af270ada541ee/
     aarch64 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/b50d31c5f3f8f96223f8de91af1f2cc2d0a86c76/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/2fa9c2f40b3c3f905b0b0a3c9c028459b68e1802/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/114bc6b75685e20f1c00323b0ce532857318321b/
      x86_64 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/2cee149336b80126f4cf5439cbe4e1cb31fd5686/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/d24f48e7ce5e2c1d1795f08167d1e00d28e35fc8/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/b467832c2bbf714adcc1e3fac48695bd80d6aa41/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/10f47e7b81387d640aab562e6dc9f6fc60d5e6b9/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8e9c59ff989d2a4f9b94cf0de9a1d05c379548a6/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d8b6d39d3e794d5aa67c307cb8909fae3d2d516f/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4d6d5741e33c569d15b3e6c6b0cfb06f625cad19/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d09d8bdc5b5d4b798d87ac92b147b66409a3fe7f/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9c7db0014c692c5dda6d08a93d774aa3f58b65d1/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5683a1845f6c4cd66ca2723927f3c929b058dcd7/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8bee7ac14a98d9b8918b982ad9200abda7bef6bb/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/75d3d16de47c35ea5b9e467614eead8d7bbef826/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8602e034974b196628a6eda00aeacfc3d9bc4ab0/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/57e64fc0d086ae8658f569ce191208001d1691c8/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/21526d86093ba8a931bbcce8732465f825d3c39e/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/27be790a489bc350cbca45c7b2e17df81e892801/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/bd1448df8e70e8b332912a529b7b3f2ce91b087b/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/12cb51d322f203cdaeff5e5e02d3ea774b0f2f34/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4801283ce3759313d16b4508f14f303607e20c66/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/624ddfebd52506b53eaa0d33b8d6e07b54f0163b/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/df069c61fd35285a97fd7310cf7e85efc5bc48ad/
     powerpc |                libgles-virtual | NOK | http://autobuild.buildroot.net/results/061379c9a06ad73067df9074a76322cd26bad393/
    mips64el |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/7000a4424c35d22af3724bf6a4578d92b901f38d/
      x86_64 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/0f675567086cb5049d7cbeeb26fc4c98619d93ad/
    mips64el |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/ea7f6a01cbceb3d756d0da9fac76b52b2afd117f/
      mipsel |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/831341d05054566d040e9ae0b1d6cd0e48f556b7/
        i686 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/02abf051835d17dd53d775b510f8e553b699f543/
     powerpc |                   libnl-3.2.27 | NOK | http://autobuild.buildroot.net/results/2b1e643c9bceb5a592e7dc4a89530dd10118549f/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/bb42b1ce3bc53316872f0f05f7c38fef1909b1ff/
      x86_64 |               libraw1394-2.0.7 | NOK | http://autobuild.buildroot.net/results/9b56c1eb7a790d6df6665e8592004f20ed3f0693/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/665801c57b1435178d42a047ad82043a0ad2073e/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/a6302c2d20536a225e047940a6767cbbe0f8d163/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/e8b3735847b19cff4cadb1dc484386c2d96a9305/
     powerpc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/9735fc0f3b8ed75520562edf2a24d569a20b5e52/
microblazeel |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/fb794b0b8fa88b2ed0ab28d60723e02704e92308/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/56ece4849d5391502deb1d82c517bfc0adab813b/
         arc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/0eb0b1dd0186100cb5c05ad3517e920cd0d23054/
     powerpc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/0a0bd3da8c2805a3963e4720383e3bcbaaf24e77/
      xtensa |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/0735de8a7250c270b1c04b237c8ec83f258bd3da/
      xtensa |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/2a9e5d27b34357819b44f573a834da1ba5079030/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/f2c4c51ac86c67541c76bb1af26118d22f7cc0cc/
         arc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/622e8d233646f028de5423f987cb10cc96d9f6ef/
         arm |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/ababe16c53502eace2ecb19f1ea38eefa3370f6c/
microblazeel |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/68bce4d7eb2a43918b81a29ce76fdacaf855896e/
         arc |            linux-headers-4.3.3 | NOK | http://autobuild.buildroot.net/results/d059c0d7bcf9a2bd6e64944bf22e299df17e9e67/
      x86_64 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/b7152468dcf6a0c0a53ac58393f0cbfec1962545/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/e8bfd511f074bcf58ce4f6990b3b05cae4ed46c4/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/71b7c40dbc820790a56648ded7438df8e9d9e44e/
       nios2 |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/21aff59ac4d48b07c3e0e8e2e30ba5de21ca1e62/
      mipsel |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/c6a0a4f3fd5e244e4064104b2f65d7284ca5166e/
         arm |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/7014dae04d7c184b91b7134252472fe77cf9775f/
        bfin |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/021714a76da743a76bc5bfea2a729dc7f0efb6b9/
       sparc |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/92c5b97ffafbd68e49bd64e5e6ac3e70390b4aad/
    mips64el |         luainterpreter-virtual | NOK | http://autobuild.buildroot.net/results/86431403be996f34147b6eababad58b951b19740/
     powerpc |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/5deea595beda74ea892d2cf65db5cee7c0fac347/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/076f09c983a41acc7ccad50aae2a68922a038750/
microblazeel | make[3]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/cf08dd260ac0f8d3fc32905b945d3af4382523fc/
microblazeel |                  mbedtls-2.2.0 | NOK | http://autobuild.buildroot.net/results/be96a93a584626d8fec1734cfcacefc95dbb20cb/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/55d7ae305267c7bd2fc6e42d27f720063869555b/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/57390307557f13cfa3b684494de22dcf13bc5bee/
         arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/38e3b6177d3cc53b0344f159b6c4f62ca69f9c11/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/4ed581c4726374b9437ba97506534e75681fcd71/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/7f32a93862185899fca32baf3601e6ff21523ecc/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/985418ad876f6797a76ef1fa47b7f81eef5ec45d/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/9c02b29623f63f812f987d00e5923a876821d384/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/af334ff5c1b852b66406a01dd644bd3f5c69ef31/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/a5fe6669555a76afde6e2ea621ee3eaaa9b737a8/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/15c9a80fb2754ed1866b59d5e62d02691b57834e/
     powerpc |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/936565e6f1d293c6b8008ec4153f710a670a6fb5/
         arc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/d895256b99712713d1e2d1169ed10defff871f78/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/0271e02e2c789a08249a06b2c34d0ba1685e4de8/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/4a3333b0c31df08a20c259b933d57cd3c1a3baac/
         arm |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/31806917f78c288798c60ab347054b91bc86379a/
         arm |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/e1389bb8e48aa3d3b37c437331b2576d09a75fce/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/95e47e830df51b1ef4bf2cf5f47d7782f3511e1c/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/496c0783924b988801640448f46c8f554c5d7ca1/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/57e20d119ef5f08a8610c17ac33f65c5663b296e/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/dd68a14db87479e06e72343ed9cf3714bb60fb78/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/48eda7b183f7a0ce801155091a36674ba0a9b36d/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/99b82e20fabe8670b7a21e23a13ba0eeea466504/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/a270a2b23dd36265f1aae454bf5517a62edc745a/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/05787e30d839709bc7c39edbc2eb7fd8da7efc75/
      x86_64 | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/df0593736777ac35033bd4d189566d1f4386b999/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/e317207e004547bbe3c19c6fbc524783e80e86e6/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/f2e76df34b06d590df4d23c1f7faad93b66367bb/
         sh4 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6832873f2b9a895a8feb44f20c6d3c1f1f451e37/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c82a6c1f41c561b15f10e7b7ffcaed15fa0ec895/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/5f8e3f0e55d3212bde1f153c7e736642ba555402/
         sh4 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6e088059f92504d187685405f69fac930058d6e6/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/43c9e89c787f08eea3974d67955f153de14ff3bd/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/dc8d75f11d75095d3a2ae9e4168a5b04c3364330/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/16bfdd2fc782b448ea331cb7278ef34bca836594/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/7924dce8f1f537f32ce254b196bca4d55d88b1ad/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/3a60afb3eaa70790e1c2cea87f908d8f500d025e/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/981b2e98f39fecfb91eb485af91e208b1b6e619b/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/48b86385c00a9ccf1e68bcb08a7a47499de1dfe1/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/7ed433fefbe8bc863e8889df75c49b488ab126db/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/2fbb23a30dd3aedb531b5315e988c60c79d6d250/
     powerpc |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/3d98a540dbb2710fbf6d7be3bfbf780144ddbe3b/
         arm |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/28713478cc6edf8e5d5c3e830fee86a42f0afa8d/
microblazeel |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/3b47b21625d845c8cdce3cb01ca6f96ab3a56539/
         arm |                   udev-virtual | NOK | http://autobuild.buildroot.net/results/829ad509621fac99dd161cea9a03f1dde7c7f7dd/
      x86_64 |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/bd85f48823e1acd590dcfc00ba7d2e53d837d154/
    mips64el |                 xcb-util-0.3.9 | NOK | http://autobuild.buildroot.net/results/bfbc2c04e37fea2c11f5777df712074022099fc2/
         arm | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/3aa15d758fedd53f20ba3703779e6d5b8b28fd62/
    mips64el |          xproto_glproto-1.4.17 | NOK | http://autobuild.buildroot.net/results/fb12bedafdbbdaa7adb3e7c691cfde08cf057ff1/
    mips64el |          xproto_glproto-1.4.17 | NOK | http://autobuild.buildroot.net/results/611fa7164db577b2f8321fa6168db95e814958d6/
         arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/51f478dc939e69d6dcaf4b370dd251c3659c4bfa/


-- 
http://autobuild.buildroot.net
