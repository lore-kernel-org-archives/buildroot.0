From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Oct 2017 08:31:01 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-18
Message-ID: <20171019063101.68CB22083B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-18
================================

      successes : 139
       failures : 160
       timeouts : 1  
          TOTAL : 300

Classification of failures by reason
====================================

                libselinux-2.7 | 45
           host-libselinux-2.7 | 42
     host-shared-mime-info-1.8 | 24
                  powertop-2.9 | 11
           argp-standalone-1.3 | 4 
               libsemanage-2.7 | 4 
      host-uboot-tools-2017.07 | 3 
                   perl-5.26.1 | 3 
                    cups-2.2.5 | 2 
             dbus-python-1.2.4 | 2 
                   mp4v2-2.0.0 | 2 
                openobex-1.7.2 | 2 
pdbg-77158819158d1d7053a737... | 2 
                    qpdf-7.0.0 | 2 
           uboot-tools-2017.07 | 2 
                  ffmpeg-3.3.4 | 1 
       host-erlang-rebar-2.6.4 | 1 
                   libidn-1.33 | 1 
            libtomcrypt-1.18.0 | 1 
             lttng-tools-2.9.5 | 1 
                     nmap-7.60 | 1 
                openjpeg-2.2.0 | 1 
                   pcre2-10.30 | 1 
                    php-7.1.10 | 1 
                      qt-4.8.7 | 1 
          shairport-sync-3.1.3 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/5fdbccea8774ef27f148fc5e8c67c9bce5dc44ea | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/2d4e7931e2fda2ef1cbbfd45a624515ffa1535e8 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/c4462c7ee21f21b6011cbc088b85eaab61b58ae4 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/c76aee9199156434717a1e259e96707753bbc5ca | ORPH
         arm |                     cups-2.2.5 | NOK | http://autobuild.buildroot.net/results/055d379cb39cf06b457aa112afe4ba2e14026c2c | ORPH
         arm |                     cups-2.2.5 | NOK | http://autobuild.buildroot.net/results/6c21a6159ad8b38b86a87a3cabc2a591ff50a004 | ORPH
       nios2 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/c267c6283284aa801a99794d8ad5208e836154db | ORPH
      xtensa |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/8f3524fde05cefc4fb91a75eb59972cacea0ab8c | ORPH
       nios2 |                   ffmpeg-3.3.4 | NOK | http://autobuild.buildroot.net/results/7ca34283b87ece50d6281446825c3cd38c73af7a |     
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/7e71e9ae4980ed9ec6ef7c364476d18b92cb3510 |     
     powerpc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/37352cf43a61dbb639079af876b7622b2782a8f6 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/e526d0b8fda0781b6482bf24fb8537c8f9719c48 |     
    mips64el |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/bf756df4ce9aa0cb5df1d9b9f52bf17159d25eb1 |     
      x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2df0550cdbe2ad5740e77bc8c32f80801e0412ce |     
      x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/71f6d435b8aa4d47dc53056ff99ffa4f5b949276 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/3f6b295a90615f432df422bab4ce1f43dbfea88d |     
microblazeel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/93ddc007c1058fa906a0d0aabd77cfdc93f36b0b |     
        bfin |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/670c71a69c6e8272a032ca1449aa103c909dfa24 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/969d8dac8910424a5d26d2dbd08130fdf493173d |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/67029044c55967ca28ded9662c07fb0a1f060d5b |     
      xtensa |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/65a26bdfc976c6bddf82c7f9426627717a85b7cf |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/dbf00fec81fe591ad18fb9c9e05e76fa646be074 |     
       nios2 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/a1b246cf4c7fb18c7a09bb8ee33da51522ae50e8 |     
      xtensa |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2834674b6b58bc32d1e2d15524ee47f803db3f7c |     
      xtensa |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2dcf471d551bb4a02d18a79831a383c15318f6b4 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/8c6e022f96db9679d2f6b5d61566848c5d9e4a47 |     
        m68k |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/b1cad564e1ba59c5d20739c2246fc90672ec4d1e |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/f043dff01f3edb144a5de8ed7120b30654799277 |     
        m68k |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/8c2bf33091913a24438c9b2aedf4167145f1580a |     
        bfin |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/559e89a047f56400e37e045562989b6bd01d2ed7 |     
     powerpc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/32bb99442b4b4e52e5294dde2fd2a65c16b9b244 |     
         arc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2e9edbdb8ad02ce6c8bebb12acc30b5bdfcd4bb2 |     
       nios2 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/1cad1a53faedf3ba4d6de9defaa12c1776104d08 |     
     sparc64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/30513163f5087436e88b2ba8f227cddddd947476 |     
 powerpc64le |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2ac9c3181bfe4d48770e6449339e2262242e3663 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/86837e816f786253a7175a84932a5719b838d186 |     
     powerpc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/70cfda7da6c72778e1cebf2e3bb8c8715f2c3ff0 |     
      x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2a293de00bc811b13b8f71e1234fdb0d24a80fb2 |     
        i686 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/ffdcc0b5491d9b82d19c46f0b1e7b32ecbb9fcc8 |     
    mips64el |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/c98245b9919f071a2f4daa648033bbe8b5d65c99 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/f9a5b991e5d35e82742d667d0777bf9a82e25e39 |     
microblazeel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/7698442f85ff5629253cdae3eaf3a16b97b7c660 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/a5bf60727ccbedcb7c59e98509d1b89f614d600f |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/7046d27accc0d1a72a08adf8bbf02d346b4c4fe5 |     
      mipsel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/90f055877ab317121a9f39fd683af39d761080ef |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/424b03ff1d6a55b3c9002ce50ce80f10c2e9e9d9 |     
      xtensa |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/126f236ee1e17cd43e4a9cf92dfbca0b096b3679 |     
        i686 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/54e26d6f71f315967910b541067747a66ed65bcf |     
        or1k |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/52772fbadbe362b580939067be9118669550319d |     
microblazeel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/c47e0b87ca2dba481e741f04233b95a115083223 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/d295e38bcce17442afeb6cc2c0c730f4b03e416c |     
    mips64el |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/1c3bc4dc5cb7d54dc1f64dc96394352e299cad25 |     
    mips64el |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/f890b8d4bcf8080dec37df36ba7adf45bd33a1bb | ORPH
        or1k |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/fe78dbdac8f8b3d76a2a91a2870a3199b2a6d248 | ORPH
        i686 |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/05c16d1db2c0914be767266968a1ef9f8d46b7a8 | ORPH
      x86_64 |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/768628480af87d14dbd2d90a10b86988e3b270eb | ORPH
     aarch64 |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/cf14a474b8795f6e47cf53aefff36dd1ce03d6a7 | ORPH
    mips64el |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/d353a8b94301deef5fce5eb161ca7c4ab73a865a | ORPH
       nios2 |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/9bc5036a2a3a98390d160711577a23fd52f20fba | ORPH
       sparc |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/ece191119bcece6332eeebcbb4d17dc29817340e | ORPH
       sparc |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/8b09127c67b52547035b14865fa437509d2afcab | ORPH
      x86_64 |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/2e6b2cc38362f3e83c9a6e6fdc3a0f2335c0ab5f | ORPH
        m68k |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/e8bf9b3a1981cc5ae038056108411d9a63b0fb4d | ORPH
         arm |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/e7b5834cbd16b1dbe0caa0f98c02bf8b4ac1884d | ORPH
       sparc |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/ccfb497222bfc9f362e109d664208f8f3a510b90 | ORPH
         arm |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/2004ee6209bf1fcc3c436d042ad00f1b0690ab23 | ORPH
        i686 |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/1e66d710ebe3adce1258b26d1e30ec5d05cfa583 | ORPH
      x86_64 |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/0c62ef89d81712f52a425ed4eadd4b1431191f92 | ORPH
         arm |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/440c9edd34d56d9207b9f1ee326a14a1c757b27d | ORPH
        i586 |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/0f059ff6e0063b4cbb3fbe3f91abc80afa4f2798 | ORPH
         arm |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/51e9a1eb539c6415f97d99281b6acc398a3fe136 | ORPH
      xtensa |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/c9b2454b4063d1a3e13a0622609d9a7c50bbcfd4 | ORPH
      xtensa |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/6883f203278ff2702e7eddb69d0ad676a296ce71 | ORPH
         arm |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/4dde5d4d78d101424bdf1086225c61bec48480f5 | ORPH
        or1k |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/82a3e0a330a1619393fbce672956eb09df94a37e | ORPH
      xtensa |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/86b05165a2f2ce2b1437dc45de2bec9591c357dd | ORPH
       sparc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/6002fd66b69be9f46146c78d56b26e7695254d20 | ORPH
      x86_64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/4e26ad9c52eafda1828a82d29adf8ec0b097cf9c | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/307c25274c62f14afa4e8d07bab58e7fb642b368 | ORPH
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/4aa82702296cdccd83f0fe297d17b848481496b3 | ORPH
      x86_64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/3d352417e2da8ef8c6f1422595eab345f6172410 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/5a3a64815dbf4c015482be0c3e88639f7de82aee |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/a5d8f181cd9f6e93d801c69aeb294777f6ebd8cd |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/ffeb4086afa8c7270c08a86359c615fa7e54a318 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/4eb1b662ed73fa67c339606e2765066d7d32ab45 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/b4d1428ada9a28156fdd6e6e469bbb1a9aefc64b |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/6bcca9959e7824ab07c5a331a2918a36ae276562 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/9ffaedfdcda496a3f4ccfb0b466fee59ae70e4af |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/48b9c68ac9863c3cc16a74255fdfcdc3d52bb56c |     
   powerpc64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/ec8c95b6a6284140c95222cbd61601af40f3cec2 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/c8f4ff0aefdc0939f9f0afc00e938ac359e72f17 |     
      x86_64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/db9d7d8137f3692879cf49e13ad2f1d7454b2272 |     
     aarch64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/8cc14b3b1b5d41061144264537cd549553095551 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/990aaa4c05bc28dd19668442f2b672d6bb095dcd |     
      x86_64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/49eb28feafbd7280baeddb69b2d123e0e4647cd6 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/b75916684292192214f3c4a74907ef86547cc5bc |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/e7f8c4d773d8c015cf64f44f69b9aba8520dcc8d |     
 powerpc64le |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/ffd8af2cd19eda65d0e7c3c27bf0d8f5067e1b0c |     
     aarch64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/966deaa06f93482e64d489412c6087524f408c9f |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/227f7bb58b610dc4a853967fc96e37b89a853be8 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/57072eebf7d67c431c47af1cce0f6ad295a88072 |     
     powerpc |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/efd8544e4f08156ad2c692f776c93473622b11a0 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/1e23aba7aa43634ae494c2c7c6c1360475a53eb8 |     
        i686 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/cad7ab04dd0bed60082417744be9e0d7f9fb6176 |     
     aarch64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/45115362f3a34a2e18b9feb715d3806fecc70ddf |     
      x86_64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/3ba7cde8451f910f37120a08cca6be9f325ab93a |     
    mips64el |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/44953c087f10a32640687d4756a238713af0f272 |     
      x86_64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/0856ffa4abf6297242882b917da295d4be6d3a2a |     
       nios2 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/1c70ed44ce25e47654357f8d1ab1dbe95af7d5d5 |     
      mipsel |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2af4f372cda17ab3aba1dec3cb05c67f2051b7cc |     
 powerpc64le |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/94f619a739484c8b19e801b14efa0384fbd9882f |     
      mipsel |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/db54c6f5a8bc50d9291729c93ccedcfcd49d1022 |     
      mipsel |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/ce78e7953bd9101547a06a614526e97e575f9219 |     
      x86_64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/6cacb3de1a9b81d2913d84dff41a1229d35e17b5 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/445bbbacdc2508bfede46a8235cc154e78ac8e78 |     
    mips64el |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/fb360a5377af957329bbb42d8d0ef8c3f2b08203 |     
     aarch64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/d12b2bb96c9a1333141db087c71d07c6486d32e9 |     
      x86_64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/f0aab193083fc06fbdc73a0e5500cba39e56a9f1 |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/57f440a26d85ec24d6cdd76a8d9bc23e65e17d9c |     
         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/31ff62aac34b5be6be49e541abb857dd5f029451 |     
     aarch64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/08bc17bb3381ca275e92b20f23b1cfc0f357c34e |     
        i686 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/f716c40a934c9bb9589bbcbf57d8bb90a3bd4991 |     
      x86_64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/5dd69e1ecc791286624e54aed38b74d4ec0b5288 |     
     powerpc |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/d5f0f497c71eae0152f770ad4819982873285714 |     
 powerpc64le |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/3e5979cccccaf547d19c934ee8181551f4c275f5 |     
      x86_64 |                libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/a036141793f6ca34379b7a95f7c7282ce680a770 |     
        i686 |                libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/fecc412905edbb266c8a8a572fb9cba1db80a116 |     
     aarch64 |                libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/7269da61b024210d7cb3dfdd99b0cf785dcc2f6a |     
         arm |                libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/1cc66ab0e163c5eb8aa1a67d36d0b3b35ec788a0 |     
     powerpc |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/db90f17a6cbe23a92546ce4a01d09ddca7a717d5 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/ca0add04428245aadd7009a87a9852bdaacb57de |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/faa0f2134842132d0d4ae22fa9c1ab776fda82f6 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/c506ecb55fc7972c6e5964d22b502eb3ee581a8e |     
        mips |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/4a44ecd317be74ce789b6e53254d8dc45ee5f520 | ORPH
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f31d0f17123de20643070dd2f648ffeb57f431a1 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/9002430a2f8b76b6332f092c8c65a84903fa7786 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/c6aeefdb5e9262b62bbea8015963f2db1a5857b0 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/21241f319403b4cd905bba3c7a3c9e6d6dfe4fe3 | ORPH
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/4eb7978909f488aa6c7c81dd5dbbfcaf6eaff13d |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/c9a89b66f5d407999fb1861dff69f7f5b74b1eae |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/100eb82d0aad731aa949d188d41e4db368cebae3 |     
        i586 |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/97f8e654995ae4fca6499a230d313b0485b86987 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/f14c335d8323e47590f210f63b06ca76957527e2 |     
         arm |                     php-7.1.10 | NOK | http://autobuild.buildroot.net/results/dcf7f7c17ae8b15945f5a93f514bbad15a447c10 | ORPH
         arm |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/2a55758918dc24db2057accd1b2252d44058027a |     
     sparc64 |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/3bf8daee559e2978f8602c56397afda771299032 |     
microblazeel |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/636b33e058806f20baf17206ac7f7c1c23be2a23 |     
         arm |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/f9b4f113a333107a972fa51bd0347eeb0d52496f |     
        i686 |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/c62c64f78b51f804a526792ad751cd0dac365e94 |     
      x86_64 |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/6fd669e8851b674eaa083bfaa4d3c84953df122f |     
        i586 |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/0675826888b6f89e76291c7835839344300ca9f5 |     
         arc |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/800d1f2d2a0ec76442d6f8dbfd44cd7bf839d002 |     
        i686 |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/147d4a285935545d669d1a4d8609561f7f2b34e1 |     
     sparc64 |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/1a226d0fd16b7407c509b4dc4fb4058e6c7f2254 |     
       nios2 |                   powertop-2.9 | NOK | http://autobuild.buildroot.net/results/132293276f1be9d10073b3f11e8a2f6873f83556 |     
         arm |                     qpdf-7.0.0 | NOK | http://autobuild.buildroot.net/results/1abd0814de200abd6bad42675405a686cac4eb58 |     
         arm |                     qpdf-7.0.0 | NOK | http://autobuild.buildroot.net/results/a1fc72c482078bc3f35635ce7c095e042cd54049 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/55b20b9c35c26b1cf751ab0ce67308e39e53d612 | ORPH
     powerpc |           shairport-sync-3.1.3 | NOK | http://autobuild.buildroot.net/results/61e36b524056f11bd777e67393a26e6c0be3b12f |     
         arm |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e76727fcf6368701bf7262236cc8521ec1ccc3a1 | ORPH
     sparc64 |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/366f7c6faffc965c93050ed4af50d00a969d0a36 | ORPH

-- 
http://autobuild.buildroot.net
