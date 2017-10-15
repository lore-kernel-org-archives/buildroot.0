From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 08:31:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-14
Message-ID: <20171015063117.0DC4E2046F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-14
================================

      successes : 170
       failures : 90 
       timeouts : 0  
          TOTAL : 260

Classification of failures by reason
====================================

                  dbus-1.10.24 | 46
      host-uboot-tools-2017.07 | 9 
                     nmap-7.60 | 7 
           argp-standalone-1.3 | 5 
                openjpeg-2.2.0 | 4 
             gstreamer1-1.12.3 | 3 
                 mesa3d-17.2.2 | 3 
                 msgpack-2.1.5 | 3 
         xkeyboard-config-2.22 | 3 
             dbus-python-1.2.4 | 2 
                   perl-5.26.1 | 2 
          host-libsemanage-2.6 | 1 
                libressl-2.5.5 | 1 
pdbg-77158819158d1d7053a737... | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/9bff3f448a930298c43a37ec4b87cb6ccb65e67d |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/ff94fe3e9162a8d83ddbc5b7610e72525ca0cba3 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b01a40f9fe24a15929a2a833347a60de03480fc4 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/073a9d566b7c039cfdb468b883a260753e79dfbb |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/194d31d597724a0451d44af918969e8ed3a1174b |     
      x86_64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/0c62df1408b1fcc26014b261e203d30c27d5bfb8 | ORPH
      x86_64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/6c0f84511cd411ceb989f0cad14f04d08a4f53f3 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/f7394ff812954d534a3d718d5e581038e0e530e1 | ORPH
        m68k |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/d73061868c266e1191db7c42b787737c1d6f3a5b | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/8af80460c657aa08e5927041e02be62b26ff2b82 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/0975c81ccd23d2840b0f518f5bb68beb5c29d7f6 | ORPH
      mipsel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/7a3976606af32e189a1b7db3dd1f0fdf0099d14d | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/94b17cfdd6c955ddef0806bd3718d5e623773e13 | ORPH
       nios2 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/d704920ffb8f64207f843eb2f8259b36b2fa3366 | ORPH
     aarch64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/9c9d012854d9280526020e45c6d1ec1ed567016c | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/d4980abbc6f96170f4ac3a4b88a5bb16302ac66e | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/a677b7d87834e28c53ad24fea9c3af238e220091 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/a79474cd3b569d47ade451347db52d16c035ad51 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/83632736f3ac081b785470a87d4aae7609d4f507 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/dd60aa5f59e1e15fcfa9d57934ba932d8d2e99d6 | ORPH
      x86_64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/72c9988dd6ac0777604fea48081baa076c9eefd5 | ORPH
        m68k |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/9626deb4ea8100279b901db325d50b9062880200 | ORPH
        i686 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/b02ab0a0d190add9464c69f0729315a134d2fd27 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/5ceceddc68e3628913b11b69c0a13b024a1ddf73 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/e14eaf30acc413cbf8fdeb48e264a9afcb5fc41d | ORPH
         arc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/2a1bea7a3af01c6e7e0790f9c4257997e406dd14 | ORPH
       nios2 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/876cb05a98fd1630b3feaf502f44cfd7e38708ad | ORPH
   powerpc64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/2c20390782721e6e325e39ec8eaf653d81737293 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/4d03aa257a4ae2ef9cdc41305dbd192cf286429d | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/184c8c328c592160ff6ee6000eefedc46c1ebf1f | ORPH
      x86_64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/52c78cb1815aab56e93ad7e2f754c1eff4ec9b77 | ORPH
      xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/dbdae2075846672bdc76a6bdf289223dff83a089 | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/7602a7ed9b9572a93a786fe50e0a5d6fea393f82 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/3b40a25b24774f33fb30ebff6e3e94f61bb250ad | ORPH
   powerpc64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/ea1fa3bbfa73f03a3b198958c8689b21025f0810 | ORPH
        i686 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/9d78c9fdac156fb3a669cc09eab377c589a52963 | ORPH
         arc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/788a0a336f2ffa74900e36293298d9fa47f41a16 | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/85ea6a830ab03429320782b38c75d05550189d47 | ORPH
   powerpc64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/855eaad540bb3688016811b4e669341b88562abc | ORPH
        i686 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/029318aa30d5977a9e743062b346e00074db68ad | ORPH
       nios2 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/3a944f4aae7b99b79e1782530d436b6af3197270 | ORPH
      x86_64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/40b3e0e4a378eef2097a814c1ac364387d0c13d5 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/e1d61969a8cc3a9ee7561f032eab3579de7dd89b | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/9337c0853cb40a7dae145d0dcc72664b7313b439 | ORPH
         arc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/f3a16e4cfcedc7eb43dc5b10c761232bf863088b | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/bdef9cecdc30f676b8ee5c567251102495e8bb4d | ORPH
      x86_64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/9e3ad4fe8dea957caf84c7de20b85dda042cfac9 | ORPH
microblazeel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/fd19354f14b0802854c0162f26be7b87a8a4e3d9 | ORPH
      x86_64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/0df053faeca95debdf97efc8a5972b2b043f362c | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/3f10d839c2d9c306625eb7ed1876c6a24293f5c2 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/1162f5295d380b428ff384c2768dafa510eb73ed | ORPH
        i586 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/686e98972f6a20436b89b5298d0543116ecaddac | ORPH
    mips64el |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/60cfc9800ad1f686a0356ecabc68cc6316a95f12 | ORPH
        i586 |              gstreamer1-1.12.3 | NOK | http://autobuild.buildroot.net/results/94b0652d081f2cea0e8c73c11c9478ddd3899c6f |     
         arm |              gstreamer1-1.12.3 | NOK | http://autobuild.buildroot.net/results/4c8a2b81b86d1d51626d6c0088a9b91a394c3e4f |     
        m68k |              gstreamer1-1.12.3 | NOK | http://autobuild.buildroot.net/results/a6cb7b8fb69f5f6f43c8e5d68dff64864aba673f |     
         arm |           host-libsemanage-2.6 | NOK | http://autobuild.buildroot.net/results/98078519f2989ae42e69713cb4c7c23e96892967 |     
        bfin |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/69c0fc88d9c468a92fc431723da83e8d29780889 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/85ebae1f7b5fba346d16fcf1249bf4f249343b4a | ORPH
        i586 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/8247fbb81e893acb88dfe8141ff976e76792b8ab | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/830c4ad4b615e15e232cde99e04c618b06fa5cc3 | ORPH
     powerpc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b179be289b193ec05ed77ff30ce27f3a100ad4fe | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/8ce96d4e5e67fd89d9b1e952b1410a4e136c8997 | ORPH
        i686 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/82d1940e1cdb7016ee752c40848c62af38b2dad3 | ORPH
 powerpc64le |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/7bfdea2c1712ae9b43d0314fed5bf61b982cffd1 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/c659c0fbcc0804dc4d082bd28489e0db5e8a245d | ORPH
        m68k |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/4c16beea36212404bcd85a635abc73ff9760f89b |     
     aarch64 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/c474a0fd6793bfbd2a26254e5f38fbd42214b642 |     
        mips |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/d43b3c27fda77dde4af13465009d9aabd7a981bc |     
         arm |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/492fa543ccba66c9bdb8f8048a55e429dea1af04 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/b22a80cc120eebef69d2ca9d45a58f5fb7a19272 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/9d486fca93136bb9dbf22c9101186d9d1fc0eb66 |     
      xtensa |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/499069f6821ddd2dcb83201b017a58eae00ebe16 |     
      mipsel |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/88306b1594731a8aca59485c8e747439dd4a9073 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/5358ced52ffb0e6fbe90d9bc691f8469357f7cb1 |     
      xtensa |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/b3f870c044051d83f3a2e6bc0a2ae372775d30a2 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/17197873de152002258e7a4ed01db0b2865d71ff |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/797acc018e6c681f55256343e3777fc541ec441c |     
       nios2 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/5b4029591e23d5cd219a5502d538b2a0f41b46cf |     
microblazeel |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/83343ed17b87c495cb43226dee115fd7b66feafb |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/2c814d436647e29b0fe28eb725c30bab9e924998 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/26962addaeae351d761f2289c96922291902ec8a |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0b3d65574cd5db69c2c27d358844be18f56ae235 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0e55230208e68f0dafd8a5ca8c1af02b21ed85db |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/4b19cf3668d24860fc77f2213fc6df00024396f3 |     
     powerpc |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/b811e6f36684f30a137c88bb5e6f54fcaee83c30 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/38b8bb504ff365f87723ae77ab791694310dc7fd |     
         arm |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/9777fe6126d59fbad4cc7e9d01b3fedb22ac7957 |     
        bfin |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/cfd3bc67d584fde3adf12a228f21c56b7b06fcab |     
         arm |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/d8b081076b4d1c0bc4c2c73e4dbd08ac4a96e383 |     

-- 
http://autobuild.buildroot.net
