From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-04
Message-ID: <20160105073021.6CB4110127C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-04
===============================

        success : 197
       failures : 140
       timeouts : 3  
          TOTAL : 340

Classification of failures by reason
====================================

               tpm-tools-1.3.8 | 25
                  boost-1.60.0 | 17
                   assimp-v3.2 | 15
                  libffi-3.2.1 | 12
host-vboot-utils-bbdd62f9b0... | 7 
                       unknown | 5 
             host-boost-1.60.0 | 4 
               trousers-0.3.13 | 4 
                   erlang-17.5 | 3 
                bind-9.10.3-P2 | 3 
                    ustr-1.0.4 | 3 
zbar-854a5d97059e395807091a... | 2 
            mongodb-legal-info | 2 
make[2]: *** [code/CMakeFil... | 2 
              alsa-utils-1.1.0 | 2 
                   libnss-3.21 | 2 
             bluez5_utils-5.27 | 2 
          chocolate-doom-2.2.1 | 2 
canfestival-7740ac6fdedc23e... | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                mongodb-r3.2.0 | 2 
                iptables-1.6.0 | 1 
         qt5connectivity-5.5.0 | 1 
              gst1-libav-1.6.2 | 1 
                  prboom-2.5.0 | 1 
         qt5imageformats-5.5.0 | 1 
                 fio-fio-2.1.4 | 1 
make[3]: *** [all-recursive... | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.5.0 | 1 
          sane-backends-1.0.25 | 1 
               libcap-ng-0.7.4 | 1 
               linknx-0.0.1.32 | 1 
tstools-08f6be304040e7b8476... | 1 
                     fastd-v17 | 1 
                     vlc-2.2.1 | 1 
              rabbitmq-c-0.7.1 | 1 
                python-nfc-212 | 1 
               madplay-0.15.2b | 1 
             stress-ng-0.04.16 | 1 
             ipsec-tools-0.8.2 | 1 
        ltp-testsuite-20150903 | 1 
                  ffmpeg-2.8.4 | 1 
iucode-tool-1cbd73013cd4c6b... | 1 
               openldap-2.4.43 | 1 
                     ola-0.9.6 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/a5beca78281a9adf17aab7b98eada3faec2563f8/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/b0407ad99de5c24a67bd09c804c3f78683316626/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/215690fd21450a9047280bc0f061109db1fdb8cd/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/576bd005187238004237e0304b21b777d13dfe09/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/10c1eb1daff736e489122eeada54c2ee2d6e202e/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/39ec7d675097dc7178a6d347800f50bcbbaeb724/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3ff7202ad4b6dc1b2497724e1c7f3ef248fa2643/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/67f451cb1614d7ee26f471faabba1fdd77d2e714/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a3c94d4a4a7dcb74351724a6a1af267c2942adb0/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/aec6d7f03713b84cc6e36f87a996bfa60a358436/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/cab50841a6336ed8b81f3ee36873b6c22ee3e388/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f8387a69840937cf3ac9d29ecc2dddd1b4a08125/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f6183d8b69c389e4ffaa90b76b653ec0b6530a7f/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/dd1985854d0beb72211941844b752f1d19aefbc8/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a96c0ba0ee7c56a0309eee0d53f3f4bc1c5540c6/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b6c32b74f853e9e3efc636d45cf00bcdbfa22204/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/695469cce81ce5fd4748a48c7e1cc11bc538e240/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/409dd0542a3fc15c2a30ce9922d5ce6dadc150e3/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/100e1c80192e6a44f81e1311665967febbfd9b29/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/5ec6d0f188d5e71039359eb5c9826efed293e5ae/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/bd3b2e2cf21ee5c6404ae5a893f458147f8e9625/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/aed833418294c472b162373625366b78788e51b8/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/39d94f45efb6b67ce16bb933b40df7e5603dfcc0/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d71838240fc6a9d7de56995039f2b7326878d9fd/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d086d83f2a1b4601902dca7883a201b1f0284408/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1d0a7edb706be279a6aa3c0f519edfe288e6ae51/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/44d984d024ac04386485938d86b327d731456eed/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3f047bab4792f36ed8d2cf7977d7277f5d3c46ab/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3cce01f86e31a2d2d0b43bca94913868aa7cd585/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ef5f2cc475d551001bcd0f915fab9d7dc25f9b0c/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/957b2739e689e0b133554485ffa7234c046a404f/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8281bf187547aca4788b051d05e4c54512ca4806/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3b1fced2c496e16e8ec207e482d7b0d05482534f/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/614d852892ba984b149faef329fa250f1089b265/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b73391041129eb635047181fe27a13d9f1793b86/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cabc71a4264ee7d9010be4f7bc1180d8dc6000e7/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9ae275328189a2011db7555a668b52e177844d0b/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/11ea068b7db8bc3ffb6a4c40b594089dd60e83b6/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e5417bbbeb2d8cf846efd709396f415bc82187f5/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2a02b10f0d71e0c3c45e0b7986c79772d97d1bbb/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/8804d8cb2fdbe2cffa5f3add56c69bb133c5fdac/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/3387f0717ead4c21aa7c5d39a83ec949617d3066/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/b087d87471df68e6f52c9cd2e7aa33966e808231/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/626b3335911a9fcf1e2ec0a84a2b45776368f329/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/cb584a5aa1dd93a046abd77d95ff7fb68899efdf/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/e56f224ef695d8f20b0577ffa36f890fca0cdeb9/
       sparc |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/bd71e8bbc621e0085ed22fa8838314fe8d508719/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/86f22388e067aa8d8c2aea3a490a0d85b8c8f695/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/9caf9068f7745e930fb6e40b7671a5284a54e68e/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/6ba988addf44456af0756082be5fb6affcdfcd03/
     aarch64 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a395f91969f79a8a4c0deffca4cdfdad33d48bd0/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/85212dd41db76d4e32efd98736ad8506e1917a8d/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/efc91ff17e68a68315ac5987aa1e0bc40a153284/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/963d102aa1c42efd84447d68d0856074421fbe05/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/79b6b302831fccecb12a1e92b68b1c4864ca0688/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/ca134ee543e93cb7da36dbba2670460bf7b76790/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/199fbe68e11df7fac890b79e774dd0369988c917/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/786b2d83f7036c41a7e461ce9ab334c2ba0a4820/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f19114c40a4ecd2642e41bba36e97987623b0149/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0d9a3693b1f8f9f94640c5d5a7c3aabdee015818/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/57a45d77cf8549f572579f39c9dba7e31f8f02fd/
       nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e058f1d7915e580ffbe1586beac652057e4d8515/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e7ee5dedc4f62d9007875fd47ddc5c2c0d210968/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/e79dafda38ade866d1247009b8713b9dcad66e7c/
         arc |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/b6eb05b4ebffb5be563b60fe31d34af0330717ce/
      x86_64 | iucode-tool-1cbd73013cd4c6b... | NOK | http://autobuild.buildroot.net/results/bd090f3c37a615f9357586b59547c8ef05fbd7ec/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/6f1ae0228468cc462f61724983e7e452822acc0d/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/280c21bea9dfd38819b67254d69fd43b554e4cbb/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f447e1c8693de7fd9c9eeb7f3babb749d6815747/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3a3b4e78baa12cd92a0d5f85dd2bc29ec8e4d866/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f3538b98714a72fda055c5b81056cff5d317c855/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6cf74807b877f93b3b2bc6f94802b8a9f4a95661/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/98445c54a04a176b7a13e61e6b4bc7fb4a157ae9/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b6126750d1063684727a3b3b51cc90a65d0aed09/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/820d252a10f4e3b4fd32f755b4ffaaeaf181edff/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c28ec0eede01a5488ccc8b5640de8ef0e3e8a65c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dca7654b5a4295ccdbc085a2e7f65ebd61a23e9b/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/687d82f270d1018a6129462ed6a4b64800b2827b/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dd4e785b445f4c91b6d35d73a668e994d630e5da/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/cb3d4e7044d4943d39a45c9d8a26bb6f365e0bac/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/c2487a6dc992dcf26bb23614db70ca636867f519/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/59b6496c1c5107ce2131ba8d7575103811bc27b1/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/638ce9357b1a328cb5e39ab57b33c7f854922849/
      x86_64 |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/5a36bb14ea6355aefce083351b9fbb45022f557c/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/abf3dece34fd83b6267a6ee5298c953a3bf9a2fc/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/861558620e3cffdd179059ea610d26d0e3823abd/
microblazeel | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/65fa70c500a5aa4da220325fb47e64fd0969ff10/
        i686 |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/87faca89bc9ff6ff4699c4b50bbb890ff80b95ee/
         arm |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/ea54721ef0d1c210b2baa9eef7c6c68863020b50/
         arm |                 mongodb-r3.2.0 | NOK | http://autobuild.buildroot.net/results/589a02f511939531141135def73785b600113152/
         arm |                 mongodb-r3.2.0 | NOK | http://autobuild.buildroot.net/results/0a5974e8c21b503793641303d5fc20bf7e57c95b/
      x86_64 |                      ola-0.9.6 | NOK | http://autobuild.buildroot.net/results/d99ca60cc4bf86c338fd61f9fd2de0bb9598d670/
         arm |                openldap-2.4.43 | NOK | http://autobuild.buildroot.net/results/ce545f7140fdeba1971f526d9d44b5285368bca2/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/09acfb6dfd84d2fb230fac84a5b29517bb374021/
         arc |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/62589af852b0e4709e1fc9c027f57c7cf11b61c0/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7a3ab76ed536a6dafa063bd6869c24f638c7b2c0/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/2ee4021551bce9272805408603f95bbefcc0c3d6/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/b42e9f58b0c04ed845215cadb9627ae84e1080be/
      x86_64 |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/482ed0448241b89534864a8bd9712f2aa8f6f1db/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/0b88ed2af2f6063966762ce081e9652df5fc9349/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/69a0e2e8de937956cfc6a00d5e4da14108821076/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/5ff455434bb35bf9481d5e951d7f2cb8a56c96f0/
     sparc64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f3a28efac72fda100a345f9dc511f1d3ab80cc09/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/5463180ed0c389815b8de113b68479e23825d26e/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/15094e3cc03c900e7321333f38bbe2102fde2275/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c8a81906903277b742e6fbbcbb65eeeaf2563377/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/764c43882074ed36d5f16c0945d63eac2c6c9f9d/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/ddbd9feaf7e0dfa32216a0843726a7c3aa04a9fd/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/95b5d0b2e10a841fed4818b1b810ecb0d1bc924a/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6216dc3ad12bf9e9a6b29710ccb42ede83ddad14/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/15969957373dbfc17b5b880cf79928dccb34fd92/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/894aa6595e03f07c53c2aa0e5fee5358fa90bb8e/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d9fd54cb2ad245748e0f3863b2bcd4341b869dbe/
     aarch64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/2450e92467660890ffe2b228647f50a2cac2a160/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/0538dd7c9b6d5679ab29b88e0e1da149299598a7/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/aff2ecb09fa1eaa0ee500514b2aa0abd296eac33/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/4f2dcf23b21eba8b653d8002bf22ab596d2952a7/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/94a0dc2746aaaad30887e0ac3d2e453cedfa0660/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/221a17fe267a9a9ecf966db67f51f9c3bce1d8ae/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d91819f7868b42c8b6e73ee657d5d58becc882f7/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/e2cdd5aea3ccbf69ac9e705bbfe020f1a6ffaacc/
     aarch64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/e939f320c531a9f244f6b5c6bc7cf3f4b1fbc6cf/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6a51d033d3acfc7b243600879e81006a13926677/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/b01638e65ec86e3846ab13d77028d61321943443/
        sh4a |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/14c748c64711b621d4cc9093b20dff2a06e60ccf/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/5225924c516b15115d58a044b77dc6f1fad78dbc/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/9626d841bd8ebef64d479079757ecb5edd03c096/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/b8b0f7fa447ec454bdd68168eb0627e3d2a2537b/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/23abae32b2eccf404f2e1fcc4c701b11def93407/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/11c95e74b621027e14af863a3f812135272ecfe6/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/b73c4f5327e3bc6ccd84bef004adf7db25a5aa90/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/c2421a56396d46b0776e2e63d036cd2dd79a00b9/
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/d96aa77e02954bef6fb6e9d244fbf9d1e939a374/
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/f9f5ffc24419c2bd1132eed47a47ce209ca500df/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/4b16c9797c653c248725a55d9b8eafc4634b968c/
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/d2021084a54dace8d5e94121b1c84c9fa8408a78/
        sh4a |                        unknown | NOK | http://autobuild.buildroot.net/results/dee0a5b7a96878ba14358bc49fcbc9a7d2e55777/
microblazeel |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/0274d348ae159e08d38953ef094fe013ea7c9044/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/07f8d06a3daed87cb231382bc53513425e02627c/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/ef3d125efd955fe2cf79abe2d1911766d8388252/
      xtensa |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/f93771b4f76b82197b930e6fde5eb7aebfe9c910/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/7df6ccf9438241585a1fecf4fe719e4381c0ca3d/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/377af8fe6bc0e46fd86c5783ff6b5cdb2822fdfc/


-- 
http://autobuild.buildroot.net
