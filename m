From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-07
Message-ID: <20160108073022.0B794101782@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-07
===============================

        success : 197
       failures : 123
       timeouts : 2  
          TOTAL : 322

Classification of failures by reason
====================================

               tpm-tools-1.3.8 | 17
                  libffi-3.2.1 | 15
                  boost-1.60.0 | 14
                   assimp-v3.2 | 9 
               trousers-0.3.13 | 7 
host-vboot-utils-bbdd62f9b0... | 6 
host-gdb-6be65fb56ea6694a92... | 4 
          chocolate-doom-2.2.1 | 3 
                  prboom-2.5.0 | 3 
              rabbitmq-c-0.7.1 | 3 
             util-linux-2.27.1 | 2 
                 dropwatch-1.4 | 2 
                      qt-4.8.7 | 2 
            gst-ffmpeg-0.10.13 | 2 
                  ffmpeg-2.8.4 | 2 
                   mplayer-1.2 | 2 
                    links-2.12 | 1 
             lttng-tools-2.7.0 | 1 
                 libraw-0.13.4 | 1 
                nodejs-0.10.41 | 1 
 make[1]: *** [all] Terminated | 1 
libbroadvoice-f65b0f50c8c76... | 1 
        ltp-testsuite-20150903 | 1 
                    kbd-1.15.5 | 1 
                python-nfc-212 | 1 
                bind-9.10.3-P2 | 1 
                harfbuzz-1.1.2 | 1 
make[2]: *** [code/CMakeFil... | 1 
canfestival-7740ac6fdedc23e... | 1 
                    fltk-1.3.3 | 1 
                       unknown | 1 
                  gamin-0.1.10 | 1 
                   libnss-3.21 | 1 
               dvbsnoop-1.4.50 | 1 
                  connman-1.30 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                   erlang-17.5 | 1 
                 setools-3.3.8 | 1 
             irda-utils-0.9.18 | 1 
                 qt5base-5.5.0 | 1 
               libcap-ng-0.7.4 | 1 
              squeezelite-v1.8 | 1 
                     rpm-5.2.0 | 1 
                pinentry-0.9.4 | 1 
 toolchain-external-legal-info | 1 
                 mbedtls-2.2.0 | 1 
                  monit-5.12.2 | 1 
                   systemd-228 | 1 

Detail of failures
===================

      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e3a798eaa2bc9244602a017880aa1ec887544ec5/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/fb7491d408b6991b3baab24cb0d598119ef00154/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1621f1d233bc2c293c8eed8ad51311100f005b51/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/df7ccf172ea7860f0ce868da74343a2c2da631a5/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1f1e1b058d8a9495d6baab487cfc3bf20bed403b/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/9bf1727b4a8704c8b22b0731bd0c4b3f76466ba3/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e9960cc80b188b5626fbff242ab808169a3f58e3/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b75201db8e1b71da230ff053f907217f01fd7466/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/da3b057414c3c22e954d53831861b7dd2c389bb1/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/236e75d2e26f342b3d4992e766f67b567644f1f5/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0e102f19541cd56934f25b039bf93bae2fc7fb9d/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3fbbb1d0830b7764e69c1dae8beb28d6afeba7be/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ff643b7ca8d4419b4abdc9d7997af94332c87bcb/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/463330592b95566dc720e7d07f651aea4a2668ad/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a89db51a8846b5864ef5be071158769619625bed/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b1846a2b610ed85e608cfad88ece5800735f1132/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0c17ccd8abac7541e22afab72d083abbe599a139/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/01b56ad7489ef19885439c3ffc541a45f3e88eb9/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5ffa20e11a9489ca9827db30911798b612a902c9/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bae91a1805f6301e883ed526dd691e8318aadecd/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bc73a6fc0c0533ae70a855444701a9e1f1cd562e/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/aae1cdc748c62512e988f131c943871a47f00d84/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c9f0cdab4862ea729c2a0d3bdb93d5640b980513/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e1320686a0f068cc2246b2cbae009d3c34d5cbf0/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/5208b932d333b5317def2c0875acc9cbea9bcba8/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/8ff49862dac7f2269c2ff62af3aebd0c152e1567/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/768cc28041351a70b2ac006d703acdff38ae9a0f/
      x86_64 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/eef3814ea8708a93ea6264f638f93d17a3f6c083/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/d6f58c5dbf9800b7761ffa07657ce3f87c7e0c32/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/d86273e54f006ef019a2a862fd28c0a40e4b6366/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/94e9358bd9426a52874263741255c5e78505b04e/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/a633f0d6d8347d3056890658d3bab1074c0a3782/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0fa0b84d1d239e511d1c3261ac7559923380d27e/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/c56ed4be1a6240f3f88f18fefa5329dc861ff42f/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/56557e0ac3bd041b3c69e1d628f125ac3d259b39/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/4db52e1d77f5aa684c0de55815108e554e78f664/
        i686 |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/18ad4ccbb272aed5a86ac2650ab579420327d0f1/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/ff242b771b9ab690c12022d10a76270551733a64/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/b755d182a6cf15e016e8e59004a83d3770aeaed8/
    mips64el |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/19ecb25e4185dc8cbf7a221f09964c4bee47bbd1/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/038e25671783115a211f4f51443d114d716f98ad/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/bd32c74ff2e4431c35de9d7f584b017c48512b4d/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/bafeb9d7e79c22f2cde3630adba92a3ae3c1df74/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/cb6fe16b55f7814b5cc1e8887492b7f9e11fa71f/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4591d210103062ab625bc022949f5f8f137384ed/
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b432d6ea91b3b57326001d3da31983a4fd08a0cf/
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/023e49cf2ac13f47246fcf21be31b4dba23fbea4/
      mipsel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c7cd09880e6d06b315ebf877770de03bc99b58cd/
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ada2fdfbcb14ee86ab41f10a6fa9b86586ffff57/
      mipsel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4df6ca5611f51762be2b1b18489691c4ceddd14d/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/820a7eff0de05767033c9cb42cf9b662585184a1/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/014e033d1056ec49de8783e0b7bf3bb11081e9a6/
         arm |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/cbd8f4ccde45e157e97ca9ef3035fd9e108e10ab/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/1a0bec102ec869e69af51fd8a61e3a71739eae8a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/6af99026bbeede06a5714c4cd1f85574c9492d84/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5ee104f3e4634bc78eaa7a3a1dacf2fcb4f9f300/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ede8719e58d95ade6cd307a8455b127eed8c37ae/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4112fc9af9057b8d071878e9f4ba156a3ad06a4e/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/72590cc42f57c6f553a4f076958bbe7e1c0411d1/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/77dfd9305de06093c4a07fd24c3027ec6d79a8b6/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/89cad1eb2a513f00e10de7de87c7ff17773e0d88/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/66b289ff96d18c9b87b1d257d41c3f3ba33c84f1/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/697d89e3ff5f08f87451ad2b054d878fc547dfb7/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b32505f6e80c11da57f5745dbb56d70aa824da64/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7c5b6d7b5e499b893736f7035726f5b4d2c78d21/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/06de9a04418e559f3c45dc60eea18fec0e7f60bb/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/30747b448ae81eebc402f5e6508da93541542375/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b586a3d19b4a84dab93263951723c293b741c42c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1744cedd9d31d035101152accd5ae14175268b7b/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/bb8cdf854c2cb1bb20b00c7cdff45d9125c2b625/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/988d1ee4336af799d1bd7a38ec65aaac325af87a/
         arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/7777d5c7382f4e1c0aff8417d8bb5c9fc3fb9c21/
         arm |                     links-2.12 | NOK | http://autobuild.buildroot.net/results/c9495f54db388bde9d64325bb57fc4e58741f7a7/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/35ca8625baa577d2453cce8c684f8fa9e3a07b12/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/cecd5192afe01f557ecdfb001c1ec584ab957053/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/bbe3bc8f54e70b13c21a536a78b52e485f4711f7/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/c9d316e02867f4f61ab1ed3b653efe49e5b73ece/
         arm |                  mbedtls-2.2.0 | NOK | http://autobuild.buildroot.net/results/7ff19b99f8ed923ccf3ef33254e5f340599ad2fb/
         arm |                   monit-5.12.2 | NOK | http://autobuild.buildroot.net/results/aa1c06324b066ba13d82bcb7afa452a4974f1254/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/08b8a3a788082191d0327221dfb96eb2d39e29a9/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f37b38ea3c91a816de2ca6cfaff5920d7158996e/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/98f0ff44b5009b31987e1ec56999e53625dc82b3/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/cdc5ec54de3b83c247ba21550b07e82261f6a4be/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/70309a42d204ea9ad56a3d7b2a79f255720df91f/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/36fc0e8a1954687ec44d9201351a0adc03fe1675/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/52341cfd645b90ff7f3f1536f52120609c181978/
      x86_64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/77d596dc153b394b32a499bf0d748e8656c07380/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/115eb01f675fe401580a3516a53121db2bffa4f9/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7b703d7a83d3d73bb605f9ad64fe67a222452c27/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/2991b3043bf5d1646fb55467f685a283015bd577/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/312f0e59e3f83868e86725ee552b320d0e739f9f/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/04b4334b3f97fad057f0408622511c7a6192d90d/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/aede0b84ca0cd4b7718c76a4effe811b5fdb90a6/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/db576c087a4723eb327bfe978193cc068296cc54/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/24afe6e1a62a8f9e58509fca95fdea0f5cd92466/
         arm |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/38201ac27b2813f0e9784d63b7aecd0cad06efdf/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/9a091de5c0e042a9a7e6e1e3b30a5df2744e750b/
       nios2 |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/5a13f1c9a3c9d1a4ce213402b79fdfca2d5906a4/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/2b203a1383f685f9157b0e1c0b3c26922d6ee3bd/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/7d6552197efa4633aca7955b6ebdbab2d44da4df/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/b3f167941b9f7298e1c5ca38149a50a6f63d3236/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/0975499dd00b94f20660c23a762696bcde13de69/
microblazeel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f6574ff5d8d0294a43f68e4dd053f5317ff4f054/
microblazeel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f9110a9013160647ed179f0432178d364c975d2f/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/e0782b955338f5693049b4a97187d453972fc36c/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/9221dcad6eaf55737023a10c7f6b3175efdfc68e/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/e32395b7c200805428b0ee0dfc66f809d0f98a21/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/0c930edd4923b28d4d8bea1e5ecc944a361c1663/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/3071914e6a5b0bf95b176ff2cb0114c6a279ae32/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/7ed0c3e8937841e598cca9364362eb739e02d756/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/4b2288d6d8efac6e3269753dea212d45683dc562/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/91d52262beaa5db7971ff79289a61f6516abee34/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/78e582aac041a8180a29588a8960e34155571828/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/2c27d8e25e5f4fb0977b3f5fb96eeb37790ab206/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/e27cf7d51f1f15480c696d415090b005f554d655/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/0fc177cf10ffc48254794280fc66a3eb578c93f4/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/3dcb6c99d425373a443f802e12e01ba73fa24881/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/7ec967be2225fbdad580e0271c3df72bfe09fa9e/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/0544e233924e7f912de1d99c60050003c48e0c32/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/a3e7f1747ea8075ea10ccd99aa7ae957ade731b1/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/b13ce3408192a1c5576c8415e5a9276dbcd779fd/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/16678b62b5e40716fb7d67647c0b19a18e779663/
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/140da490595ec80e6b10a95e28edfb5afa56a520/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/5edf919caf95a1768cc119ed72acef10e29898d5/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/caf53066ba11d943045dde10370c5c914b963cdc/


-- 
http://autobuild.buildroot.net
