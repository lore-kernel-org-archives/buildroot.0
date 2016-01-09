From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Jan 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-08
Message-ID: <20160109073022.61124101A9A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-08
===============================

        success : 203
       failures : 127
       timeouts : 2  
          TOTAL : 332

Classification of failures by reason
====================================

                  boost-1.60.0 | 18
               tpm-tools-1.3.8 | 17
                   assimp-v3.2 | 12
                  libffi-3.2.1 | 11
host-vboot-utils-bbdd62f9b0... | 8 
zbar-854a5d97059e395807091a... | 5 
                   erlang-17.5 | 4 
                      qt-4.8.7 | 3 
                     vlc-2.2.1 | 3 
                python-nfc-212 | 3 
             bluez5_utils-5.37 | 2 
               trousers-0.3.13 | 2 
                nodejs-0.10.41 | 2 
             fxload-2008_10_13 | 2 
              rabbitmq-c-0.7.1 | 2 
                   libnss-3.21 | 2 
                    ruby-2.2.4 | 2 
              gst1-libav-1.6.2 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
                bind-9.10.3-P2 | 1 
            shairport-sync-2.6 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                moarvm-2015.10 | 1 
                  connman-1.30 | 1 
             lttng-tools-2.7.0 | 1 
                       unknown | 1 
               nfs-utils-1.3.3 | 1 
                  prboom-2.5.0 | 1 
libubox-e88d816d6e462180f03... | 1 
             util-linux-2.27.1 | 1 
               dvbsnoop-1.4.50 | 1 
              xmlstarlet-1.5.0 | 1 
                   mplayer-1.2 | 1 
       openpgm-release-5-2-122 | 1 
             iputils-s20121011 | 1 
               libcap-ng-0.7.4 | 1 
               libsodium-1.0.6 | 1 
              alsa-utils-1.1.0 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                 openal-1.17.1 | 1 
 make[1]: *** [all] Terminated | 1 
                pinentry-0.9.4 | 1 
               lightning-2.0.5 | 1 
                 mesa3d-11.1.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/61946653496a997867b091b006705008b09db9a2/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/7aafdc2633bad96a2a17f4e8664e09aae78a3bbd/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/82524fd19751fe3270ea190de31cb943dade4038/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/30ef33f7dd53715b5e9834a4ad01998f7b5f3cbf/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3b3621c0fc2192cdeffd6c992018539d782ef9b8/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/dd843cad912e1ef76366eb527f08f197211a2981/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b22558e6d14201ceba55aa91ff0a4b96d8056924/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2ac674a6b5d53ab5b866c7b32559c92d85e59871/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/70dde7cd650841eb672c9a31f973bf243054fecd/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e636eca58ecb6266f2b169ab3197ca82d2b5a80e/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c73d6fb73b852aabc404e205d39ce4465b50cb3e/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/8853b192d16ca7ef769c5352a2df0540a7a2a4fd/
        mips |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/cc4fcdea25f882b9daca5b310d2fef988fe3044f/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/a7e035500426868d2535301b6f59fa67c7bef641/
         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/946dfe317f2d07b2fb4173bd74beeb349cb448c4/
         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/515462f5d4621eb3a2087376b550f82b9521f929/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4e98da56241c76b7a28f8319da314af5761a6b7a/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3ede95a94a486e7c0d20aded9ee0f5a128f7cb97/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e1dbdd7d5f66759d2fd8ed1fb27b719c4db1ce3d/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2148966a040f0c07a325013c7ccba94fd509f702/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/71465c5d8a119649dcbb8b26c0762bfb317868a4/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/53239a9933a4c7d097e5cbabf42573da9c179dfa/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/87c372549461ca7260984282150a9a77682f0e0f/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/132f51cfa9c2eda32e5360a6d249be5709607279/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ea3623af140d5a7c41c702582394f301a49443c8/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a18f3e20413be50a64b5ace3185b3bc1369372bd/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/31e83e6dbe11adb5e51a34db2510ebc400f16c80/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/54f07ea5b2232289a72644db005463c4525d1524/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ec9edaa948bc875c8b7c6109336cd7c9b91846ec/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/862303402a111da818969a6893d99c9b76a9ae20/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d3c33ce0607a01577eb29a2bc16b7f47a162e1b0/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e21f310250741cd3e797c66ac69338a59b7d37aa/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7dd017ebc322d01bfe9f515076634d745ffec8c6/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4e22e3e4690440c46369cf1933aed4938b03931f/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/1fed4db64f14623c3613582ed7b47e05e75ddd91/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/84c4827f02c6413df4dd8781b88b9d05546e936b/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/343579c28c897e374bee0517f38de70a84db85f4/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/152bf72845d2aec340d98d3ce53db6e582eb1af4/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/1a089f52eb8eeb3d45f1a843f9d0789121143921/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/f566f09d6e392edbf488ca93f3ec5d24570455b7/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/ca9171277527e6a1eaec923f196bbefdd1216d94/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/b649c2d16ab477d7a6c91f8fd535144689a56b43/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/a46658e8e48dec81971da72d4d9bd83aa06f381c/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/dfeeeac39424d613504e648a3c0259d164a6d85d/
      mipsel |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/6e357c3946c0995476e4f395806a143d75576ec6/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/eb0c4ba1fa049fa025660b98274f61333bb5156e/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/1c29631bd0696a2a6b478fe0315570dc320aba93/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/54fe397915a75cb64de64181698eff07e32328ef/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5e403fdceb2e2ddc757caf3b9310689abc3e7dd1/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1dc04a4980bf5418a78b3be10c6828f4c58569a5/
     sparc64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7b30fa43cbec5fbf46dd4ada97755139534721b5/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a9e273b4eabffac1e0849494a13be5e1270355ba/
         sh4 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e85e602f5c2c60c23c51716ff7928aeebe6c4123/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fcac709f8352594c045545ca2ec82724e441052d/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/27170376c8fb63b4866b24f8d02807f39adc2620/
     aarch64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bd44f40997079a5030ccda6418a948d7bd1a5184/
      x86_64 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/7db18e8a8184e485b4d387b02b87ea9f085ec025/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/a135a820ca6b83334f6f627fd56f5fe6679bf2a3/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/9b2ad6520fdd5ebf73bc24f50d29a1458513ff62/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8d25a0e94b71e0a843d59f2b434e358137f45a83/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6af89f3c9416c00e6596abef2035ff51403e5f84/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c7e0f7454b5fd2bc6ae2cb9882ec0967583698eb/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/91d78d3637759c5a31ace3975ea1d2aa2d0c6231/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/637eb51c790a12b066ffe8641c986720d1b4ba21/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dbd70a8c78dc217722eb49be4214155a1e72a975/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6287acc9babf1f13ff9a15d1ab41fce2e8c1ae15/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dff380bbdc1aaa2a6ce16682e18886b28992afa1/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3920ea730a9d77ad060b91b482a8c52ac08f8564/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cd92a0077289cac206dbd2a4bfb4393bed8f77d4/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/838d4d4831eb25a6c87b4f3cfb08432bacef3ba8/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/4fe13cabb8b7af1e10875a0a6112e0a2f5035f3d/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/90a8b3b30215f7c16fe8754d4c1e3eb03d76f404/
       sparc |                libsodium-1.0.6 | TIM | http://autobuild.buildroot.net/results/cfb56c10a92161cf44fb00f89584411fce9fc125/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/a821667bfeb8f936ee22d6314cf39f0196d2d11d/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/10b89988c081fded52879ff58c61c037a5864797/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/4a43bbbeafcb9907bec7c004003039fcfbecfa3f/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/8c9f6841f846e533aa52052827afa874865f0263/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/7d94aea8db46f020e1c5d6ac60f2c147daea9049/
       sparc |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/7bcb2928fd0a702bce7c7ea91e2225052d3e43f3/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/159e9aefbe44a365cb7314a480ba5142afc375db/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/e3a273f8cfb64a68b369ce0866e26bf4848115dc/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/9b988dc063b0692f8d23a70f2d5947af603cf86f/
         arm |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/8a3eb7288621f3653db144a3629afefe7e15d4ff/
       sparc |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/82e3b7a60d0184c04a115334052ee0665da61a79/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/0dc3c8e1809caaba5d28b6451c3212f96983bf5d/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/864dd614c0b3132def86717298aa3912b7c991b3/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/cc7ce875ae4581ed12db6bb10fd946aa7dd64bd8/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/9fca0704be35e12ad7fbbfd7ce57849566de7933/
        i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/dfaa011ad0feb94c48751b63847a4aaff214b5b4/
    mips64el |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/d84777269637d9655b994f7756fc849cac2c4dc4/
     aarch64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/bda29c705654f4ec5407ab45bca5e4717094dbdc/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/061d16d54f92529bf009a542d719dc43c4cb68e5/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d32dffc2d776f671eb51a5733dff03719f6a46dc/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d9affd81d73421eadb6655fb44f1185df3fd98cc/
      xtensa |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/a03ba2c96aec0efad0d3155557b7ae757e472ceb/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/677dbd8617fdacc7f60e85c9d757a9f3007b9b6d/
     powerpc |                     ruby-2.2.4 | NOK | http://autobuild.buildroot.net/results/64c3430c006ccb418dd33193a51d3513bf87497c/
     powerpc |                     ruby-2.2.4 | NOK | http://autobuild.buildroot.net/results/83d27636b5000ebab76536af8f1a49d40e49b61e/
         arm |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/b85816c6f3a42a740bd3a314898534d36dd203c2/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/dd2d71be3f97054f5e42acd90224b6cf304b0603/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/4cb28588e0125ad0c193882d61666636d5e6fe1f/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/4923805a417a43b3427428d77ed5378dce82bbd8/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/369f513542ebc04f0cd5201301bcca966790a8d7/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/44e00da2948164ed72212310617d7d621fb0416c/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/9c2ef3a6d424fe32bf58628f7daadfd8d0a66fcc/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/979908a5a159d65b56f196629330892461c0a5a1/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/9f50ab632916a7ddcde0970dc988e447cea89a0e/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/71ab585bae7aecf2511592873cc2650adfdfdacd/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/085f16c292c607d4afe62aea3a5fc27c6cb358f9/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/1e6dc448fd6c89f9aa8a3a5b3ca6f1d5e46739ca/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/af722b9a6558cea4ed1a36b45a4c9c2599537069/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c3e3bfb22dd8e6972e74ce248e4af692aef1b0cf/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/ca67c40e265fd07b727b12ea5e81690f05ac5a3c/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/53f85bcde19dc79b1266775a26e51bee1266ba7b/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/cf936870c99cbc070975330fadd7f4d12b59322a/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/680b891287f27a87484fa0b3a0a5f4feec15b40f/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/61470bf5fd538a848ad5ff3ac4f2425820b8ed68/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/8090b7540c400a4616c512f16a4808297beb40bc/
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/e9932eae44084a1315c745e51b445758f5078d7e/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/16f4b8bb12593397101b1b7f1ece4494850030b9/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/f74929f303cdc2321200a5dd1b0355e93e1341c6/
         arm |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/6f3fd73128e998177a3fc9620548b38cd6e7c13c/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/f9d249cd8e279aa88811b400c971940677347f86/
         arm |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/22ce763be685b127279407308ee58ceea9449801/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/c15da364674c06222a6e9f2d7e44159b00c00942/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/293cd1ec487219f394e47e3d99e9d9820345a854/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/0bddb7769d34f7020a25a5194091ca4ba42fad02/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/096966191aaefae71e71d89df4f5621db723c6c7/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/1292289a590bf187518780a8be377d3e0c9d2277/


-- 
http://autobuild.buildroot.net
