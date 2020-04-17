From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 06:27:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-16
Message-ID: <20200417062754.E5BDC875D6@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 24  |  6  |  0  | 30  |
  2019.11.x  | 19  |  5  |  0  | 24  |
  2020.02.x  | 28  | 11  |  0  | 39  |
    master   | 157 | 122 |  0  | 279 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 bitstream-1.5 | 30
              lsqlite3-0.9.5-1 | 8 
     python-argon2-cffi-19.2.0 | 8 
                       unknown | 6 
              gr-osmosdr-0.2.0 | 4 
             lua-curl-0.3.11-1 | 4 
                 lua-iconv-7-1 | 4 
              luaexpat-1.3.3-1 | 4 
            luaossl-20190731-0 | 4 
                  zeromq-4.3.2 | 4 
                  assimp-5.0.1 | 3 
                     avahi-0.8 | 3 
         python-markdown-3.2.1 | 3 
                qt5base-5.14.2 | 3 
                    brltty-6.1 | 2 
                coreutils-8.32 | 2 
               libdvdnav-6.1.0 | 2 
               libupnpp-0.17.2 | 2 
            lua-flu-20181218-1 | 2 
                     mc-4.8.24 | 2 
                  ndisc6-1.0.4 | 2 
                      tio-1.32 | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                    gcr-3.34.0 | 1 
              gnuradio-3.8.1.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
              host-grpc-1.25.0 | 1 
                 libuwsc-3.3.5 | 1 
        luadbi-sqlite3-0.7.2-1 | 1 
                  luasec-0.9-1 | 1 
        luasql-sqlite3-2.4.0-1 | 1 
              mbuffer-20191016 | 1 
               nfs-utils-2.4.3 | 1 
                 openal-1.19.1 | 1 
               protobuf-3.11.4 | 1 
        python-greenlet-0.4.15 | 1 
                 rocksdb-6.6.4 | 1 
                thermald-1.9.1 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/bb5e52ebf1f18d63d9ab637c50f1af644b5e4214 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4d99fc8882d5d7842a4aff3b2d384357d3e94996 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/9ae9b1ab6bc95d49c3ea0506cba764c8243662bd |     
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/91f102052a6fa7ddcc22b4bf1e357eced6668c15 | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/074cd66c3a15fb707bc569f8c60e62b3f191b738 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6bb99e2adc6525dc82f9d501215c7a12dabad894 | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/4f69ac7444f6605afed4e84338492c47ccf954eb |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/9fcb0329d9fd1e99b709052dd6bfc7717850c151 |     
microblazeel |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/3709a45caaed669aec7bca552ffd75ee14a0edc9 |     
  powerpc    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/32acee6cf5fa6240b5cf6afd55cba621553d64f4 |     
    mips     |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/0a8d87485f7604d4212e7567908ac5b94d4b197c |     
   mipsel    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/c0faae28a2e2543b216ac8ad656d03391a260a69 |     
   x86_64    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/df1b6a6644d8230731c502f9841876d266e06780 |     
   x86_64    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/6e700cf19afa190cb65c523cc3666428a2c1c816 |     
    arc      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/2c0adacbed73aa3b1e9797168c0162d9d26742d0 |     
    arc      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/fd609e9f72cf319b3e065ede99a8d35a8fd7c13f |     
   sparc     |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/3f5cc5eb471dc1786349cfc825eebf357e95d9fb |     
   xtensa    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/fcdc33ebb47a83c6e47a2c99a8681ed68db0c9b4 |     
  riscv64    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/f0fd0beb6a54bdba33f64e669669dfe91367f058 |     
    arm      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/973e92e64e7186653bb9569377bc9f1d66caf5aa |     
    or1k     |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/bffbd35e80e1d94a20cb861b80e76b27c5a3632a |     
   nios2     |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/a704133211c91b107b854ee70ca90240249107dc |     
    arm      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/ff583b02263852fe8709ba82162eb9bdbb9f9c7e |     
    i586     |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/cf1f80519570fdecacfeb45ac4a3ee9725be4b0f |     
   xtensa    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/0f10ab96a913c23224958b9c596e9766e40a97f3 |     
   xtensa    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/df9e5574789180a3e619b428273d965a4142503a |     
    arm      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/9cf47e0e3e8fcf848e8d7cb789dd1292e49860d1 |     
  riscv64    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/18679147de92f980a00a19a7c06d612e8b07f441 |     
    arm      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/c10c4ba0fc7da38833187adfb08173a7a1f9fa07 |     
   mipsel    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/f2d123187d0e496e85221bb62d792d6e4ef61080 |     
 aarch64_be  |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/8365e5825728b32f7bea816eea813de5e1e0a46c |     
  aarch64    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/430dea7b54251e8732cba86eecee8ad5446d5715 |     
    arm      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/fe668006058f20732e32c907b64963ed821d7946 |     
    arc      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/f3050c65b1ae821f40805f48214d7cdc32ba7fb5 |     
    arm      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/917e7a0dd07a18321b71e573cf152444effc901d |     
    arm      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/1c4f90d23a2d607813214f0e854904a458952840 |     
    i586     |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/b831a775c131d3756710f3c89c82477dd7cdb7ea |     
   mipsel    |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/cf22bf2d19bb6349cb832f69a9873c160408cd47 |     
    arc      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/5ff6681f7eee5098bd6059774cca019645c865b2 |     
   xtensa    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/ce8589c0b8d6b7065353701930b3dd76b9fe24fc |     
   xtensa    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/486e954277bbcb5f75807ee0071734e2e3bb28ca | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/ad483917aa912dc9d3c8c0a43d35753b70111a93 | ORPH
powerpc64le  |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/f4daa159b4f6f49c1a6b2337599914be00140d76 | ORPH
   x86_64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/9b432cd91c27178a05574ded222c8798ab8807b5 |     
    arc      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/37c8bd017c0e9859dbf7e00825f07b2dd13c0abb |     
   xtensa    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/6df63307e0b81ae11dbc3de2f010c8bad8e8a735 |     
    mips     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/8cbf0aa08178e7907857b7b0010e364f228fbac0 |     
   x86_64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/3d6434cbdda34c563544394914b5565c87a1872b |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/4310ae8dd930472b9fbf6bc7f25b4439cdd81d27 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/91efc8945c07f8821e3ae32cba89288615878854 |     
    arm      |        libdvdnav-6.1.0         | NOK | http://autobuild.buildroot.net/results/46bd6a805303e515e614d52ffb70d00dba129f06 |     
    arm      |        libdvdnav-6.1.0         | NOK | http://autobuild.buildroot.net/results/8c1581dfed0b995dea638b97f12b85d839e736c6 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/81e97e7910beeaecd4cd33731f9eeb7e03a563d5 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d6fa45ca3523623b4d8fed0709744d02742e45c1 |     
    arm      |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/1bb25c8ca535255e5d4a66a0e8b441fd4d214e9d |     
  powerpc    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/ef66efb3180c2ad0e0e147abc5521da2602b208d |     
    arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/10dd930acf2928a56c938fe1b0a810c833401f58 |     
  sparc64    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/eea9e37678ddfee3cf040672d2d162b465c2d188 |     
    arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/c4108835cf6a60c818e505a7313d2849a6a31d74 |     
microblazeel |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/8871df72ea8633d1fab0185b9718a394821c80c3 |     
microblazeel |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/d74441794839c3f1642eec6bdf5c516e00329652 |     
    arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/b2f442d1bd12ca2a1ce05459d669e2217861295e |     
    sh4      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/b2696a8bc770bbccdf04e187cf26475f3d0bd7b8 |     
 aarch64_be  |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/cf42f0533a2d8dd1072e567a9d45f33d2ea2aae6 |     
    arm      |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/4da23154789f200edfc9673e6ac3537e2c63a1bd |     
   x86_64    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/c72e40979eabeb4d7d38ef7dae6f933f9322bc11 |     
  sparc64    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/dc5ed2a430cf3fdaf93e83a7181fa87a2e825632 |     
  aarch64    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/ca6bdb0dc0e6b1407cdb9d3fc0fafc7d58cbe9c3 |     
  aarch64    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/bcb431cfe473b435e65df5de6ded6e6b5f44b069 |     
    i586     |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/29edb776aeddd4e608e5370e3aeefc9d1d7a5d26 |     
    i686     |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/10799dfe65516c5d8bf0dd30d7ea110787185f15 |     
    arm      |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/d4ddb87b8c1c8d0c6028f060e568429606e8b7c4 |     
    arm      |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/8ad429b5d9a2f746a3b997775095e953f0f4fef3 |     
    arm      |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/cfbda4c021645d7c472ae3eb25991c072ba861ff |     
  powerpc    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/fc7dd6bb99e10fcd3f65684ce73b210a297b22bc |     
    arm      |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/106a0e86d60937b1d7889ed4f29e048f4a440411 |     
  aarch64    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/835050f366a9470cf9aab500bac14eb141031335 |     
powerpc64le  |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/f85a8b7a85aac6149eb1a78a92d918149c6dea0d |     
    arc      |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/6f02b81fd04ef3398f827eebcaa14fe8e2aa7109 |     
  powerpc    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/e423f98314d9fdcab19d31d7abefea5216a4b3c8 |     
    arm      |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/d6b599c0bea10cf6747fe06b3886fb80af8ed176 |     
   x86_64    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/0527d025939f0031b2fd895144a48132e6f71cee |     
    arm      |          luasec-0.9-1          | NOK | http://autobuild.buildroot.net/results/37e4b838d72570354b744ef35fddcdbc61d76b2a |     
  aarch64    |     luasql-sqlite3-2.4.0-1     | NOK | http://autobuild.buildroot.net/results/bcbcc0843e9ee91a3cf81167b7a90cd89f2fd7cf |     
  powerpc    |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/1fd5fde6db3712ba6b406dabc07c3ac1484b250c |     
    sh4      |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/324b6074e5b5280c29c69d9f84e6b50e0afa3c70 |     
  riscv64    |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/29ca4e870c0b54bb9894633ba97ed3c5e00db120 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3b14a9f792eaf455b1a1659489f1b0c7ab14f845 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d441eca795729a16a22439749c232214e99541eb | ORPH
    arm      |        nfs-utils-2.4.3         | NOK | http://autobuild.buildroot.net/results/35ce3dbd63a658953008ce7e7b99e0580d3f2c4b |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/cc36868de6367be2409ea228c14e92639d2632f5 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/3800bfeaaf170ecf27febc7bfbe07801587c0b0b |     
  riscv32    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/45c2e7251469e815412631210b8bbb338ea98e7a |     
  powerpc    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/9ca724ca094758054486bf5a0c5c01dcc0db01fe |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b38dce6991d9660260ac49484a1f4e3eb0637547 |     
  riscv32    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/bfc5251ab2eafb6a4b38a87e9228ee326dda4d60 |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/8bf05e4a810ae3fc85105a725e235560c1b26d49 |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/59613950bc8fca88731dbaf8b80ec93510ba66e7 |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/2938a8b1470b93c02358a14410162e413fe297c6 |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/cde7633a5fb4813655780c47720cebead2a8ec5b |     
    arc      |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/e262dc68a5f7ff954f914d116a8fa4d0a89d690b |     
   x86_64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/5c7ea15685ffb192a853b206fb85e160c26e889a |     
  riscv32    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/0d53d36bb0774d78d042b74bd6863bc1b596c76e |     
 aarch64_be  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/40e8352ed4ab9a928b9884502a37a66575c9ccb1 |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/db704efee73405e5739f831f9e1aa882aaefa744 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4fef8b6c164015254b19c8aea04a1e98d08589eb |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/89658e93fa9ebb4418a268a0e236305a08a1c81f |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e21d0fa2777aca729fc2ee3b5e5e03ad749d423a |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/40873bafc1dd3524830a27d19dd85f05862e6fc2 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/aa724cc0b20a699bffd3cac060bafce294a4cbb2 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/88b3937f8ce41a4202739eb15e924c6a6a8aac6a |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/29f74e7cd0e1dd19dc187dd5da2e12e244e6f3b3 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cba38289cd650964bc03a4b88a2e27438b77afa4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/04a3e38fd621ff130cee5503689add8385dd482a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/0d8c5e33f2b6201bcb0deb1041faabc7e9e6ee6c |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f14f8594d9573f7f4310e5810d4566d1e1fd130e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a11e49182c1af84f8930cc04de498452fb003e71 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/cfa61cb268b7d243b658e7371d038c9796703746 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/267f40e7feea38cc6dae1666b1af9f2dac529777 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ee6be21cacd4249efc243f0a843fc849fcfe3807 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/21354f100462fa3424eec16507b71287635597f9 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/0d2644a33b56412c95b55b86d3a2472bb2bb8b36 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 2 
             gstreamer1-1.14.4 | 1 
           host-libselinux-2.8 | 1 
            safeclib-v03032018 | 1 
            supertuxkart-0.9.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |       gstreamer1-1.14.4        | NOK | http://autobuild.buildroot.net/results/446164840f8fa16935eb5a52565a506eee725aea |     
  mips64el   |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/1e091e1cce690f9c103a3ac359c3be9d1bb3d7b9 |     
  mips64el   |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/01a80a968b6e36f2834b40ea5578fd68fed43238 |     
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/19bd5a81ebd805eb4807f635913c246044de744e |     
    i586     |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/5c394d14833197d492b1fcb1611572aa250b3050 |     
    i686     |       supertuxkart-0.9.3       | NOK | http://autobuild.buildroot.net/results/a36460eee52b8221976acfbb5b06e139707c8294 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 2 
                  boost-1.71.0 | 1 
                  flashrom-1.1 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/046b3af2c0580779d67a9e3d13c520f760abe67e |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/6b21bda3fcbc0fcaf0b5ffc575188bc36a68b4d2 |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/cd2397fef9b2c52d90503fe9372b8d2929c4be40 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/7ef82f92874e2a5efaa79ea6b7143a57a4099011 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/154ed0d67ed35244029926a77b8703c1be6bc5d7 | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.7 | 2 
               acpica-20191018 | 1 
                  boinc-7.16.3 | 1 
               libglib2-2.62.4 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-19.3.4 | 1 
                    mpv-0.29.1 | 1 
           oracle-mysql-5.1.73 | 1 
              python-pyqt5-5.7 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/9a5b62070a88a634b54b314b113d9e1a55be955f |     
    mips     |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/03cf344569fdad10af1a8624959618e0c12545ae |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/2318f3cf5842cf8067a8923ff7a71792a144c16f |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/de9fcb04e20e35dfd82f3e34c46ae79abc094d50 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/ca1a4fb2db3ab371b05183334b72fa0290d1c5c1 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3634db8dda6ecc3cf919990d2c078303cbf1eb85 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/26af53e7b028ee6599ecd4b98cca0298fe34e0a0 | ORPH
   nios2     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/f8a9ec7037c78813e537145318384d48b9eff7b7 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/af0f143bd01c1d19885f3d00c038d05e30345fc8 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/6f2e5424b651e934aa07fb3817eafc2ecdbb4830 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/4f67511157b18999052e859f97ec361029fef719 | ORPH



-- 
http://autobuild.buildroot.net
