From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-11
Message-ID: <20160312073022.7CB43100EBF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-11
===============================

        success : 234
       failures : 170
       timeouts : 0  
          TOTAL : 404

Classification of failures by reason
====================================

              host-libcap-2.24 | 86
                blktrace-1.1.0 | 6 
           libimxvpuapi-0.10.1 | 5 
               valgrind-3.11.0 | 4 
                  cairo-1.14.4 | 4 
                     dt-v18.32 | 4 
                  boost-1.60.0 | 3 
        host-gutenprint-5.2.11 | 3 
              gst1-libav-1.6.3 | 3 
                 mbedtls-2.2.1 | 2 
           lksctp-tools-1.0.16 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                   taskd-1.1.0 | 2 
                   mplayer-1.2 | 2 
                    cups-2.1.2 | 2 
                 setools-3.3.8 | 2 
              memcached-1.4.25 | 2 
                      qt-4.8.7 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
                  trinity-v1.6 | 2 
                  ffmpeg-2.8.6 | 2 
                     rpm-5.2.0 | 1 
                  stunnel-5.31 | 1 
flann-04b4a56533faf8c8228d0... | 1 
              macchanger-1.6.0 | 1 
                   systemd-229 | 1 
                 opencv3-3.0.0 | 1 
                 rtptools-1.20 | 1 
  toolchain-external-undefined | 1 
                 binutils-2.25 | 1 
  getent-buildroot-2016.05-git | 1 
      ca-certificates-20160104 | 1 
                libpjsip-2.4.5 | 1 
                  multicat-2.1 | 1 
                    quota-4.01 | 1 
                 igmpproxy-0.1 | 1 
               wireshark-2.0.2 | 1 
                  weston-1.8.0 | 1 
                    ustr-1.0.4 | 1 
                     mc-4.8.15 | 1 
                    yajl-2.1.0 | 1 
iputils-3a86a2542c6fe29413c... | 1 
         qt5imageformats-5.5.1 | 1 
                 opencv-2.4.10 | 1 
               linknx-0.0.1.32 | 1 
             fxload-2008_10_13 | 1 
                    mosh-1.2.5 | 1 
                  connman-1.31 | 1 
       gadgetfs-test-undefined | 1 

Detail of failures
===================

      x86_64 |                  binutils-2.25 | NOK | http://autobuild.buildroot.net/results/3a0477700da96b412a0ae2b3954da196c5c00b43/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/86572bc288138a71a9bc1107cfaad81d5ad39668/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ae3d3611cbfce0eabcef222c8329ffda0704a05f/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/047cfb7812488f819745a22ba79e72f81d0ff1f9/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b781af6c555bba212333e669940a2bb42707a74d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b7f04902da9d087720a322887992e13ff65c31fc/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/6c09cab300477980a7bddb07c5364e307f96a396/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/af2989bf26d6af481692f05110ccd442d7af96cb/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/52d42698903c6c3ac7db69aa4f64f246e78467f3/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ac98f3202ac3ac57c92744c45e82f665078f391d/
         arc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/59d1f3057995877eb7f65758d110f6149d6976aa/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/e49b5fa8d14a23da70c2a1cf96dd644b201afb74/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/7dbf6fdcceedc796e48a93bdcfc1ea0de582bab5/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/e0094206c0a7ca4c18bc67c508db4ff69fc6d61d/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/970343b86007ef7a379f8f7619c58b7850fcad2a/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/5e11e6587c99f70ebec98592277dccb57ebcd466/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/bc53c0a7a0d712b5de7e3e1593324a80fbe2e5a8/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/991031728b3586969f5a6c2bab579178bc70742c/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/555327dd9c5cf85509f9da677fc3f0f0beff58c0/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/d904c58b34ce223562ed8bc735f37e3e5e0d7846/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/100ef022f63acb3ef2c039fbf52965f291691fd0/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c8f9771c66e496cbf7f0757ffe6b11cfdd6eb747/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/6a9d22e237562b7d9b254ad8297010540ab1b66d/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/b5d3188b9cb5ff0c7b2aecc505195cb62c633a82/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/ca8a9a24272225eff5dd880bb19fca32ad0d1d2d/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/209485715eaea923ac07eb1859b26ae98adf9309/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/6339178015fa7806c25ea0b226fe2c8de1b2a2a6/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/cbac631ea55bf2f69fbe72beb3c54e12cc7e334a/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/b51c1d09b345d01b49d5bb2dee8d319847429773/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/aec3e2a617edc43f7d6e911eba3771099b56bab5/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/b1c6331599a5d36effefa681a41ddded2d459967/
      mipsel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/dd73022d357331a560772487143e644ab56a4be3/
     aarch64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/8c8c9f6ec9d0be296063d7ac5afa693645867f83/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/863597b7490bd13957819ffea6e68ca734cace38/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/fd4e0c7b9105e93a7fbea0a89b308c9748613311/
      x86_64 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/c3e377d41dc8ac7b2c833a3584c1d08c2757ee6d/
         arm |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/66fd280021edb69c1642b95679fa3ce6914c6bc2/
         arc |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/4c96a40c3ed63a201970faa96a509e056d854097/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a71a7346df46fe7b396a622510b24851bcbc97d8/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f3ec5830d3baaba97af4c45fc96b10ec706d2e10/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fec79a2c76d2736c812d6147298f9ac7c4fdf107/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c90ec11f5bffd259f4087413500dab799cd3352a/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/61bccddb299e257d9da058ea29c1c11db13344d6/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a85c5b261897ecb56b461c91f2c6c6aedb7c42e6/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/89145d409d1b3ababb90b11e22dbf9928ca7e995/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bc393fb439b77955997080944f3eefd33cb39a5a/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/422c1f3a7c8ba06c20a84d208e9335aa23e15d83/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/612c5c247ab68ebf12ab66044a20023c4a95c44e/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fbd2539a3c9255d3b36a34282126437b9c18d548/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b451b1f3129b2b8ace87c07b700a3ce84d61d7ef/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1b35bf7b0053476b6ca08f24748c83a1b969b0eb/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1e5b36a11325972ada0685930afd50517e468835/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f4676bc4a47427c292f9e327225c7b552f961136/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8bef14fe29777b817766f76d2c9a38f81f7c4aab/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2183156d7a96c67331ce9fd2bc869c5f9764ae66/
        bfin |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cf9be14973ed44891cedc941dc15417e905a7e7d/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1d021478aba7af75feed29f340df32fe7f5f1633/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dc4e3196fbb1d07cd10b78a1d6d5695bdcb6edea/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3e3fe86b02a167fe94a373867e185109890add8b/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5672e4e156e2047717d08408c3aa636c4d044805/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4dd8adf02db53fad3639d295e09830a1884d7ffe/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5affb11934569497faa4db246c89848efac83d7f/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dc6c4e67b4aea872caffd4c824330ab581420c4e/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/403bbe5c990e16d5306301cc08478343d5f97bad/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f24569dad4cc3618f279aa9c8ed96a593cf9d6ae/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/669bab8277b60278144999aa09841765b0206043/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/92fce06e809d7205f8bdde5c7dbc8fcbb0f26bde/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a2ca4f65cb7137e244b4ec74f5b3b52d491c1677/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/72236760010c6f4e92cce1c45e23d9964081576c/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ccb54c950c58f2802f37cbf55f4411739dc1ae28/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/68ed732e46548bcd004f708f41a2c14d398584d5/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6ff9ae6c7698ac4d72c3f890ee67706f7f260062/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0c5803465ef29bcf281e616556a47e3a798c07c5/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a7d017f252d7975206c3a306d0e72f9567ac0e6d/
        bfin |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c30e92fe4dcde21db8bae19d80c37ecc8d8441d8/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/138299b73d41b98a956ee49248bc002b995998ba/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5f972664d76334f9a38e7246f6400effc2bdd9e2/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1b5c3ce0a74e1e685bec5beee78b59cbcda17343/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4c7b91877d30202f8c11ab239b4e6734e0c8bdd4/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bffd55426badbfb8e0eb48af1f5ad80424764f94/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/336453701f098f80cc80d6f6b7d5ec21c9e82e0a/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b3a74cd253bf6bcad098fd7055997b42a9993c96/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/200b036c0c14547ac3cd5ede49ec75ebc9d8b69d/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f5192a05f8f5f42d767f032e4e7ce4031fb8607c/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fe793f49ed8b04ace0aaa44906f71236584bd07b/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f8a6702d73992d26122fc9c8e75113a3a8130f40/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d5878569a0098be17c865c9e9ae728730986a8cd/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ac10fcae15fc6ed6753a228e4991032107a9776a/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6516bf3b66b02a509fe71cb21c50c73fb47a7cd8/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9da6d5a1a749eaada8e5ef1d8caec01bdd07ab26/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/790eef3e2a1df47329d57845e428d115be1f9a09/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/917267a23a4fb1ea85a381d87fde7f9e5a03f05f/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7efdbdade1b55c13af208fd888f757a67d2297a0/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4141e6724b68177a9c70aa3b61be4d16c50fde54/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f82f3c204160a681d84334137d7b964aac248c50/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c9653b7c3f659e9fae3b5db1ac427e46be29a2df/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1a1c73a8b8b8da6dfa70c5cef50b947762752dce/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/395b12850fb0e334cd741693c4471455caf4ce13/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7810a49a3236a73280881ed5ce5d034ecd140032/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9521de1b5a7ceec24176488d3b1f6bba5bcf8726/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0675fc3f137a83aa8c59aac2d1ae0bc35651e3b8/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9a6d8b0045ab12f50fd69aa5a068026279cdf149/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/af68394986d68c3f90c07632bb9b350294eba2a2/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1d48a40e8f897e29f64d9ea0d6012bac26727de6/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ebd0dc4af2a34159af68fbe34668d1292187a4fd/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/235280655425ef362c563cf74967ddda3a8edcc7/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/89035cc1962096f89baba60d0da46e1d805a15fa/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/76e30c7c1d1ac191174dfe5dff3d8fe77798cb0d/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5c18ec96e477d3fb0ddc62840945758c9e94c114/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/56809dc73f6a87b8d5a0be5b68d04d9e44bf71d3/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2d4576c70b7907af61b22937f0aa1ad7b6005e2c/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/db489b25384905baff7e63afb24b21f865c8a91f/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5af3ad178f38f8601c9191dff8f0aa11359da9ab/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ad2033527db04f6d12c6d4a91ca51de8edf1c300/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2c2413b8eb2763b188e11e4279e3e06ffb4580b3/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/98b0b4fcf6880217fcaa1aa3b51dc32a0664983e/
        bfin |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4f26dadb8527e425fc6f6a86097780c80a6801cf/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4e754ec381972d7a6749f5939ed65eb932d0e9a5/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/71b4f59c50717cf83bb2bc2150630b20d7ec37e1/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/52e98e5d846cfae71fa53d95c3566e4d22cbc71f/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d6126866f8db19d2be9f8f3e71796dde10aa91eb/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/26c16801d6c9972d39940f727644f13ef70fde5b/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b0a7ed7f534f37cea71b49021e4df5a53e03d210/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ffb5287bdf4280cca387b69a064df66fb4e16f45/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/893c331c494f288b039f4cc9f087bc2420bc2258/
         arc | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/ae7a23c397c22116d3761342c48af1c83b6824c4/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/880999482c7642f2db236104f9d7d69f4bc3da73/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/804630f0eb44591687ab90639ecf8bbdde0a82a1/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/6a05096bc93fd2ab7b8f63c3558dd634baf7c7f6/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8edb4e5849855a48261efca4c4b5e91df03d04aa/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/6e6710b32fe34cf2cde270b6d376c6475355c051/
microblazeel |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/17357c695d77fe0b010d7c38971489c35c07f5fb/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/4cc9c8bd223d1c9d604322ba04060dd35fc8aa45/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/433396f33b3d3f337ebb4dad91d23227b832a716/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/28a080746b29719fdf664b45b56ec3b20268866d/
      x86_64 |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/62b36a495f5d44227dbc490ee8d7b72e0616b87c/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/6634a6857032fbcb1a202fc2af0ed592c9b54d34/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/c9ae03c201f179588e84257cc8c836ac3675f0d3/
      xtensa |                      mc-4.8.15 | NOK | http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/
         arm |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/a29f4d8beb72124fc545d251f1a917bdd2c446e2/
      x86_64 |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/7d8ac4180145f361a7adca334cef3578a2a64c60/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/536320403b7610687fd1758054f8c73b1f1d8d2b/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/60e0c5e9b3d1f0e5ba357ff43abdcf89195f60b4/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/75bd0aff2207eec6b81649b76e43a16e123c8a47/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/2b038feb77e7c57d84c88df10da5d0f19b812279/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/88c95d560d5f26ca57716ff6d633a72db18df61d/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/6247487694509ed8f19dce562afa0dbd057d8c38/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/60028619ed518171b2c4c789b51a1fd2cb7012d1/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ce00568f7898856e34e5736869aee4b106620dcb/
     aarch64 |          qt5imageformats-5.5.1 | NOK | http://autobuild.buildroot.net/results/18f336fadf4a2a451dc8062f68cfed4bcbbb5677/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d9055eb94e37e52c4351d7751a0bd665a41653a7/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/f49ba35b59da43b0d960b6d1aeccf9245623fbe6/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/3d6c6b23befcf0dd2882d43602e106afdb4a87b1/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/ce30764413165d7c54a1b2dd1bcbd58ba1703f0b/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f321e37055b74723a45dc8409105ba01d2a9dc83/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/cd92ab0059b30a39f3ba6ac33862395a4c1bf0b3/
     powerpc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/7d2bb686b16834a1ab8172da40d589c44e98590a/
microblazeel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/4f322457fea1bfc836edcb2baa59d834a9cbec4f/
microblazeel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/b65f4c9ac336b753337d7a5b96ceae76f2eb6f91/
      mipsel |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/000c4e8481cf51179f33781eca82905c2fc75286/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/a5618be75914dbe428282b51f381fd4f89477d9c/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/cb4c9b3fc8d62166477c6e9ea753c3df0f888648/
     aarch64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/8ce32149e4ac9a285d3c08d92c4469bdd5cb4c38/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/7752033648d0ce1c32fb1cb1fb6f0751fa411792/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/487f0177d8608f251ff8d8a184823072bf4c05b7/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/b8481c9fda4846066e3d8ff62cf4c1a634843db2/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/e5f831a421f2859a66c55de6e5122462d29309c4/
        i686 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/1d0618caa287553346163071c6f92f1e5c6df7a8/
         arm |                wireshark-2.0.2 | NOK | http://autobuild.buildroot.net/results/642c1c5037d092976875d3bd78b2af9ca6b36dfb/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6e57f9191a76684e18e263708b38308d38668447/


-- 
http://autobuild.buildroot.net
