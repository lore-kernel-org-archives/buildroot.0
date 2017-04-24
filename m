From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Apr 2017 08:28:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-23
Message-ID: <20170424062810.D9913207F1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-23
================================

      successes : 165
       failures : 98 
       timeouts : 0  
          TOTAL : 263

Classification of failures by reason
====================================

           host-protobuf-3.2.0 | 33
                    ola-0.10.2 | 14
                 xenomai-3.0.4 | 9 
      binutils-arc-2017.03-rc1 | 5 
toolchain-external-codesour... | 4 
                 binutils-2.27 | 3 
                 efibootmgr-14 | 3 
                libepoxy-1.4.1 | 3 
                protobuf-3.2.0 | 3 
                    ffmpeg-3.3 | 2 
                libmpeg2-0.5.1 | 2 
                    mpir-3.0.0 | 2 
               acpica-20161117 | 1 
                   atftp-0.7.1 | 1 
             bluez5_utils-5.44 | 1 
                busybox-1.26.2 | 1 
             fxload-2008_10_13 | 1 
          janus-gateway-v0.2.2 | 1 
                 libxml2-2.9.4 | 1 
             lttng-tools-2.9.4 | 1 
                 mplayer-1.3.0 | 1 
                  nodejs-7.9.0 | 1 
                poppler-0.53.0 | 1 
                      qt-4.8.7 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
               upmpdcli-1.2.12 | 1 


Detail of failures
===================

         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/f27f6b31b5d4ae971b5d768f32e24ab1ee1c38b2 |     
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/539c3d4a1a9e21aea54df4156428a8b89b15d556 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/fb95cd7f7fcc532d036ed8f13853bc6f9a64d1b3 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/7423763572b921b74071d2ff17fc8b82f45b3b97 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/436e9fe9ce91677e52bb46592a1e34055be7f971 | ORPH
         arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/66c19cf2a79cd38a81983431cb46cd3dc151bf52 | ORPH
         arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/32788b572382a68f5b511be6875f54e65a637be4 | ORPH
         arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/67fc8e2b08692225d3a6d6a6b72de7940c11e2e8 | ORPH
         arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/d08a2ccc48c3a04001fc5077f61ed4762ecac88a | ORPH
         arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/f67c905979870936d8050a505b61186be6dad85d | ORPH
     sparc64 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/664fa4bb0e8e0de0edb33e6c4423a9fa6f352b58 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/66f4be61e97af4f239d9e6c28a3f01d5ed3f4908 | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/662ecb5ff2ada066fe5278a21f3516d422f32357 |     
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/94a89b1c1c95e0be42c9b725619af297a1dd3582 |     
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/4c462980fbe58b78835eece43e40ccf44ad1bc66 |     
         arm |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/9328a787ce30695cde981e49cfed6a6ed5a2febe |     
        m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/792a9fde184acfa7f7e643480d92e2be4c0f55d7 |     
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/6f485325f86909addeef3ad632eed820570a4c02 |     
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/895cbb64412b0c2851a1a9f4b5e2848bb6fc9465 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/105648cf02c32238423dd0facc6585bbc11f020d | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b24f7fba026424b2df670e7aa6291d494c2e3907 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/16bfd8e07937c3f2f273834725b29f4587c5912f | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/950f4287551a5dae5ff5fce7f2b42c3448fe6ba0 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3041886d0347991ddd43341cbca1425fcbc1f5ec | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4b59e00ed85d1164a9a5cc5e26119997308992ca | ORPH
 powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/9b20c8467a93c03fbc2dd6122b35c1792dc6e159 | ORPH
       nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c80780b9d960730352952e51c8907babbde5922d | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2d4532f091aee2258be32736507825e9cc639406 | ORPH
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6ecb2fab65e78f84ebbe07655d707ff7f7d0c13f | ORPH
     sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d890206c41e59aa933df32cb21980a757c39c9b4 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/9713a970f33fc41170f59c8a9939076dc043c3e4 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4001ea8e1aa986034e3b06395c795236bdd47963 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f66c65f6516df4527733d4c626fe5cac1f56395e | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6a815b06d3a15ac929b647a12baea65959dd2843 | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5e088629277842b7b3961d7ec81cf376403b2c57 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7106550e809720dcf8fb956565e435ed789eba9f | ORPH
         sh4 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/cbf14deb3e6ea518896806068a4c92179bc74965 | ORPH
     aarch64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f615c59c54b2c9e0639fc7212f60cfa53250b8a4 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/83b5cdd12cc67b75b949060ae93c1d6ce60bac90 | ORPH
        sh4a |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4bcc4b008ee45e175f220f703f4776ef23efe2c4 | ORPH
        or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/26ed231bdcf5feac6305e4784049c73248b88ac5 | ORPH
       sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ffceca9b943dec7580ac882fb568940b4a9e6742 | ORPH
        or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3c37f105547978a65a95cb20127bf18ec870b2ff | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1a7f20dbc2b5e20a28bf32ddb0cfce1e69e38ee5 | ORPH
   powerpc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/294ffba493f6a2dc3cc32b8225ce729349072a53 | ORPH
       nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2e94fdc94d0d46c258ddd16e522c66d020e53ef8 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2218d9debb713ab832b1706e96e19abea9728b1b | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a8d97229689fdffd43e70071b9beb6255b3cdeb7 | ORPH
 powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3f9474ce02a01c0597a4555750cbce63a5b9dd3f | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3e2199d3273f4da5ca8ed9e8faefc9f9b54beb0b | ORPH
       sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3a6ec76525aac2fc120be5357adcb72fb7d32ae3 | ORPH
       sparc |           janus-gateway-v0.2.2 | NOK | http://autobuild.buildroot.net/results/4bdc8e0b0113f1dfbc890b8f7eebc7552e9c8b54 |     
      xtensa |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/284403f7d6ca9dd0e8e0e6dd935dbb6120f63fdc |     
         arm |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/f54947107d62b02bc2b62b4fcefc64dce12c453b |     
    mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/bc88d12a7fc2402c6898c780680cfe3914f404a6 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1de00cd5b4e565cf357a67a11a0a4a8dc6650342 | ORPH
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/2c1b27c58a9be44e3518407800ffc173ea4a0605 | ORPH
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/0c7efe99c6fe8934bb5fdbb325c99055e990c437 | ORPH
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/f2c9e4e0a79410ccad3e6bad1c649aa8f441fa42 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/2b65c5a34420fded9a58ed386bb17b53c80037a6 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/6b429456dcf6b21e7eedebd961f4b25011af1939 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9fba5c1cef2f6d2e85239c0ffa4dde123205b2d4 |     
         arm |                   nodejs-7.9.0 | NOK | http://autobuild.buildroot.net/results/fabf2f5f25c62be615fd09e59e6ad9234385645f |     
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/7720ed4a4369aae4c08ed43e7b7ba78c7068a0eb |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/3e6b172a9a3873cb5cdfc74b0b00c6d3df77781d |     
     aarch64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/98036e01a1cd2f106fb94ff9191fe03eae13b722 |     
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/9ead739157a19d0b72b7046ecbb822d9662124d1 |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/abcabfe2d64fef615d19a3cffb95d23abd7435c4 |     
        m68k |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/4e86bebb7d23c805021832276dde3681971a3ccf |     
         arc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/c1422b1c867412cb9f6f1420c10eb538fa4938bf |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/0f86697559cbef0f0ff2963962b822a15b87982c |     
     aarch64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/df31d651af4d6461697291018dcd0f245d6b306a |     
      xtensa |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/632b91f545ca6eb1961deae124064f76a3c9c610 |     
       nios2 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/a7f31b1e8ade85f02ecc411416f8f41472a5f617 |     
     aarch64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b8581b14e70763042b68f3a582d00929142d62c2 |     
      x86_64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/5d8edb6a8c83fba90ca9525d65ddd98c0b410bbc |     
       nios2 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/8b787a78fc5b63fdf5c102bc3e364ca841e1d2f3 |     
     aarch64 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/1830e699cce6324a964e3fbe4233ab85188fc04b |     
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c18c504947b55457f173d955fae4bd141829d56b | ORPH
        i586 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f6a66df6356c48e4a5a7bd2f06bd67902f86a160 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/de84d2e28b07f606329235da01b2237da926790e | ORPH
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f1f9310611bc92c09370d15792a155b42d53fd5f | ORPH
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/46f08e12ff37dceebe49e5db1b588e13a78eef4c | ORPH
      xtensa |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/adc815ec4e10c6e08d83e7c91d9e53a53854d464 |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/c5f60ec9e3ed98fa1a6941f0dc7e7010fd6d5332 | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3582cffa482f60754cf018cca9e061ad2e41c8e8 | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/fb8e5e6f582d770894f7e6a9c0eddf4bb587363d | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/1f08044b6f0a1a7eee8475a978116701b3be657b | ORPH
      x86_64 |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/6c1292fd96ce5be8c9a00e7b8351d08c255de552 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/01ef2907f214a2e5107ce5eff9f351c479d7847b |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/2b0d00dc714f998ded3eec0466c3fe975fadf890 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/7c151b2ae70d31d3757511520a89654dd7676aaf |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/ed656ed63a69ebc2caece36cf0cbabb1c34533f9 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/eb8f16f38b202b67513a6c16aed4798d8a9c5466 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/c22da2011d4025d8a1724f7d06b993a52981d41f |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/f0154774bb7508daa9dcbe256117b0b351d6b753 |     
        bfin |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/145ac9904f12be73f8479ed08632c5a3164bdb2c |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/131b43d60def6000b80a244c17c6c6cff1615ba0 |     

-- 
http://autobuild.buildroot.net
