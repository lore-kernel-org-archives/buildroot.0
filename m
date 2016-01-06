From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-05
Message-ID: <20160106073021.34BE910179F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-05
===============================

        success : 190
       failures : 146
       timeouts : 2  
          TOTAL : 338

Classification of failures by reason
====================================

               tpm-tools-1.3.8 | 24
                  boost-1.60.0 | 20
                   assimp-v3.2 | 14
                  libffi-3.2.1 | 9 
                       unknown | 8 
host-vboot-utils-bbdd62f9b0... | 8 
                  ffmpeg-2.8.4 | 5 
zbar-854a5d97059e395807091a... | 4 
             host-boost-1.60.0 | 4 
             host-nodejs-5.3.0 | 4 
        ltp-testsuite-20150903 | 3 
                 mesa3d-11.1.0 | 3 
                openssl-1.0.2e | 3 
canfestival-7740ac6fdedc23e... | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                      pv-1.5.7 | 2 
                python-nfc-212 | 2 
                   libnss-3.21 | 1 
net-tools-3eb367aedf1280f35... | 1 
             lttng-tools-2.7.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
              rabbitmq-c-0.7.1 | 1 
                   glog-v0.3.4 | 1 
              quagga-0.99.24.1 | 1 
                pinentry-0.9.4 | 1 
              alsa-utils-1.1.0 | 1 
                bind-9.10.3-P2 | 1 
               libcap-ng-0.7.4 | 1 
                 lvm2-2.02.138 | 1 
libubox-e88d816d6e462180f03... | 1 
 make[1]: *** [all] Terminated | 1 
                    ofono-1.17 | 1 
                rt-tests-v0.89 | 1 
                 qt5base-5.5.0 | 1 
             stress-ng-0.04.16 | 1 
               trousers-0.3.13 | 1 
                nodejs-0.10.41 | 1 
          sane-backends-1.0.25 | 1 
            netsniff-ng-v0.6.0 | 1 
make[1]: *** [default] Term... | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
                   erlang-17.5 | 1 
                harfbuzz-1.1.2 | 1 
                   kexec-2.0.9 | 1 
                    ruby-2.2.4 | 1 
                     vlc-2.2.1 | 1 
                      qt-4.8.7 | 1 
hidapi-d17db57b9d4354752e0a... | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/096fa2f22bddfdf839c49018acecad9ef5e2568e/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/0ad266efea6dd48f1b3879a259747fc8f31c236f/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/41c952fd755702610b768490d8d89074dc75dcd1/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4e2b5ac2c521c9e886f475bba45c25eb48e9cfde/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e5aecdc1bb8b0784712c2a341694076ad2eefe94/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1b60aaff2213a07828b209c546cb07b5e378270e/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3994c08ae452541615ff80d207d5108084a8c2d3/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b115953d8e9438afbc98eb8cbfd4a8894aa4abde/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/7712627b957e5fd8d138249a64cb0f78347a7182/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c1cdb940556690097cc8dd57f5956b2aee73d183/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1746840ba8061c5a2c1bf1dd8751e48500d7ef62/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3cbe036e31c847be719070b7d179af237fbfd434/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/236216b53d248ddf859c2e4b2ab49e8e7dfa067f/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/7700715bd1a94acec771fa3fde4c159d2796696f/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1a2351698c2376c569af2f648e7ab8105d5d4aac/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/eeb6a5934c267cf3098bf87bcf9e6e9c93d8e717/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8c4af4c1080b397deab31be19fc4802dc503e2b1/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/04a2678fdb6e048ca25026546b7ceb45037d5321/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/29069edd9ece837db779f47e3262b3605f538f9f/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4d50dbc012b90415fa25a17774fd0005ee192bf0/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/845ae7112e3519ea9c4ddd40332d10f9f9b218c1/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1524f0e7a4ddb160d73b9830b5665bf767962dec/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4cb14ee61d23f39fd7e8ed7f6e79a44d669d051c/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/131c4cbf6e61a335241f22e483611a50ab32a69d/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3290d0b7d9da6391acebd88adbe2e5feb1f13f6f/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fb043bdcf3689507b858073376b694fe8a9210f5/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3c6f461af6043981851e10110a3b4b2ef4fb0a17/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c80eb18893996df65f5fe9487f1d9a7b539d96be/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/db43f73a3ebd1bebbf20420ec560cd711b1c74a9/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/837e8b518e8d66f5aefc7ed9821a2f620c2eaab6/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f6dcdbe41ebec5b895ca54e2e6e004f0cb6384d2/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e2d2d772dbd9f5afea426dedd95842ff1f543c25/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/77e18c3da2e8c5731ee716dff9806744aa828dee/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b4c59fcbf3310f2e6bc56173dc6dad435372aeea/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e08de21f47ae6457f47ff735bd055c936e8e2c5b/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a354345ed3353455d82477c3106038c83b8d2b45/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2f0cb6b657e4ffaf1f707ae6e1ad97253cbe7abb/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/3895cd66e215a88d36f3bd5fe4b92ef88ae26ad8/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/5dc0cbb16056e5fb215392a5d6d352149b491103/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/997df661ac3d745419d4aa24a9e2eaff10902725/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/c2e5e08c5f9185b97b3558e5205424d47a2a9b07/
      xtensa |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/f15ab3d00210be35b2350b0dafd37a365349025e/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/35800317879dabc0cbaeb7d418a3070f233f96f0/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/7a8a44b96a5464aea0369d3017f8f06125a8c9d7/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/7ee3bebb104eaebb656c12ffc99e3697ee7f9358/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/5e111cb830f0143a48694c7c29ccd97a524bba2f/
     powerpc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/83437e5e6cdb68a31d3b22a91066f20fcecb1db4/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3cdc30a5b6e05de99787a20bf71fcf82842c15b3/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cf6bb9fb29233f6d300b22c8f34878548da9b64d/
      xtensa |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c2bb2a47600dc680b88aa19234a8a6997a23c37c/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d86f584a36c18771b3502f2064f1fc800101a8f3/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/37a527370c1ef131fb9eeac0e87a299f57117342/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/a83ffd04177b1c75da9ea916848e1135a7b495f2/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/c4c9bc0c4f6d5211cab6360c750391dbf6d0fa7a/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/14bd39426b1b7155330c18b9ab323b5bd6f0ea26/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/e8ada2b34a088ecfefca42555f579965571910b5/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8f17f6ac5bf65c503002a9e4be385f7660eadabb/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3087ad44d1a0918f5732f51dcd93f81836af623a/
     sparc64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a567f1aad7e8c88716f75a5ead93eec087fdfead/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/caf888db3951415b30e0eb2a224f89f0228e9959/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7464521c0346bca851fda0d80fd73d88ebb83dcd/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/db190328bc4f32ab92c052bb62bec7a386d48996/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1f1043e090094f358561910c88c8b0c343a582dc/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/72844c093e6110cff7b3695536c83b683c130fb2/
      x86_64 |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/c19a016b7fd50b8cef110e70e6f3af7cd0369368/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/2cacbbc6316452afca55afc9349dd973fc8f2d54/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/6907c9de7bf5a205bb93a28d3c9e6244257f66cc/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/80911c1e72a8e7525636b49c4640dafb4f9956bc/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4aa5133e2a7e8834d4b0c9aec08c9a95f10e37b9/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cc91d53492494c6dac1f403c68b1f73c0a72cc4b/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5e26c921034d8c735612330ad703a485562e6b08/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3308f414e0b06c6f26172a4134ee2b22445d4873/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ecefeb41b99328fd672ef6b23f17a23e6d4ff303/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d63566127cbaab2878cf24961b763e338286c143/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/79239eae9966e9621a2b714beeab80264f3e94c0/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/91ff0e9208474bb333aa651df5bd8e99340afc08/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/799623271aca524c9c0dd1907d86cbdf281d08aa/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/6052538d10779a21ac242d61bb43a371497ec684/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/8caa090987f17e50c127d0b0b66b6b2be4d58397/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/e68823f4c6143934f56b4c2a61261090888d8dbc/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/a175610ac6be269d97a196dc200d00ec4df87c2b/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/19fb849094226c162315e32dfcefc2e46fedc189/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/cc01768f6ae41c3245bf29a07e4515df1065cdbd/
         arm |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/f82e59e3a64a2f1b3ec7a7ec80a495e0c7c0d689/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/d7e6fb2f23a47cf83a086c3bfada0f337f6fae18/
         arm | make[1]: *** [default] Term... | TIM | http://autobuild.buildroot.net/results/d7baeeda501bcedbede35d560bfa868833e0bb06/
       sparc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/2ca9328ca645b9fee1eed89dbcdf7ca324167f0a/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/6a7be8f5027524080a60a80402a36bd59163ea01/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/00211ac67dcf74de999d6b094d3481aac603d038/
         arm | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/9f46e7450f98f0f29dfadc806c4a6968c1aeb2d6/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/9e68356574de96857586cb7e4900d4fd326a9623/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/91923f686f12d8b19653a60a1680f95cd02a3312/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/d8df09e18f2fc5cb0a8682712ece1f9f5f618db0/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/01f14631a498163797b62e092977e4004fbf71da/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/474f79523f26570c3522cb555ed102c97c5ec301/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/480375a0bcf658329ae1ccb4780b23a0304c5706/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d4f864bfa55ac087cbd0d59abde1adb0ae7019e3/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/2f30486f2d72e0277fc30febd4012825a59e4f41/
       sparc |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/fadc6fc5500d68b91aead58b1d74887db5244f52/
         arm |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/0b7c48bcc7316bf7691a473ded48dbc03e726a5a/
    mips64el |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/b2767ba578c94c0cfe585e54525b77ad550135c1/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dbcec2c133cdeed8fd2548ab3e194f4430301e76/
     powerpc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/8e28342176fc3f0e6d0d31c2b13eee4f58c9afcc/
    mips64el |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/37d07500ddec04d0ea790c25fed5820233945748/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/d57a03da71cd7b80333442586358a71b9b817cf5/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/346b1ef8a8d5f95486276cb254fa518aa463fdf0/
     powerpc |                     ruby-2.2.4 | NOK | http://autobuild.buildroot.net/results/372b9a5550e84fb60e1776c8269b9a3f37aeaf00/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/4299a03031af93bf722076962be2a6a3d73a7ca8/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/e5f256fb23b5030720fb1a7c2a9965a196e1630d/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/8f784aa33fbec7002cf789fe6c36325b0ee9b2ff/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/7b358bd2a15d23017a145eff8f047e83c78fef30/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6b9b21594a0617ad00187a38d20df01f5e29dbf8/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/8ed1113516ae2b11e7ac5ac91bd6cb30bd525ec1/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/232a3a6b8a5e7ff828dccf7de2713e55b131b039/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/1082449c71d97cebe18f370302b0a096e6180991/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/256efad94a616150c9c45885a75d7c67cbe9bcff/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/782ee158f43716e9c2fc3ae76e4939efdb35e02d/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/96d139a5067daa1685feceb04c41dd470718de10/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/40c99e9e6e58d4b4d07337435cfa8a89017723ea/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/91f842195ee233e39876df0cf514caa2849a789f/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/1ea9ee645b76c8b76c0c5de7ee587a047f159248/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/62a2a546c4b3e422458d323c2714bf43615d1178/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/a2e4869c03eaf34c6b3883c734290ddce965f7af/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/1cfb37f329633238352efb010fa7533f36bb7bce/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/457a773411ccd368d69f88c76fc4c19f659433d6/
     aarch64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/301699b3989f936bf62d012a3730c6ef7b97745b/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d84ca024b9f63b86b698ca2846d23088b25dc199/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/86ae5c2643d80c1892969dd0e5bb157e5984ae19/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/636d438ba97269dd877878d99f7fdb08d7ee8047/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/eb593f63dd95b2469d3eb3856253fc009ebb7b69/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/dd5c6479f5f15fb104eacb2329140d0535276a1c/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/9a3f2efcf459df9132688c77a8055e1089fc404a/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/5ca7d54195d216d6742b647f5fc2af608b4443d4/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/cf50252882505e14548965c1ebf49e24fe3a0fd5/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/ef4489fdfa4785c67616e8e16096be979245e30a/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/eeda91afd4b7a523fe49c56c2e10fb048671dbed/
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/0bc40fa47f5baa1705ffeb1894a228d7cc726fd4/
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/d6f8134baaa975e8763a9398a866fa911aaa821f/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/adf6086d70ee02c0d9893c235e4c29eaea3f138f/
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/9690a67083f31070e27c95b053fc0fd389fd373a/
        mips |                        unknown | NOK | http://autobuild.buildroot.net/results/66e72b5f74ce8469536a345ced66d66a4ab18420/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/b997931efabd1673d4c4f7f16cda3438b6eb25b3/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/dc9bdb63d3e718b600bb4e1b1511fa10cf48864b/
        i686 |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/6135546892225fb3579b19694cb660ed0cc5efd4/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/5d220adf2f4851cab1c759b69dee01e53fec16e1/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/34c4cb2958a4927e9f76aa308f81704851593ee3/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/3ed59b722320abb08fa59bfbbd74aaceb359ea52/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/b94203203eee74ed90c9c4b1e94f20c255a0fe55/


-- 
http://autobuild.buildroot.net
