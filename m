From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Sep 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-21
Message-ID: <20130922063004.E423F52C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-21
===============================

        success : 44 
       failures : 126
       timeouts : 0  
          TOTAL : 170

Classification of failures by reason
====================================

                  zeromq-3.2.4 | 60
                  civetweb-1.3 | 7 
    trace-cmd-trace-cmd-v2.2.1 | 6 
     xlib_libpthread-stubs-0.3 | 5 
               binutils-2.21.1 | 4 
                      icu-51.2 | 3 
                  connman-1.12 | 3 
                libroxml-2.2.3 | 2 
                   dbus-1.4.26 | 2 
                      qt-4.8.5 | 2 
             alsa-utils-1.0.26 | 2 
make: *** [/home/test/test/... | 2 
           python-pyzmq-13.1.0 | 2 
make: *** [/home/test/test/... | 2 
               w_scan-20130331 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                 fdk-aac-0.1.1 | 1 
               alsa-lib-1.0.26 | 1 
                     rpm-5.2.0 | 1 
              vim-699f8d8f096d | 1 
                   attr-2.4.47 | 1 
               libglib2-2.36.3 | 1 
      host-gcc-initial-4.8-arc | 1 
                 libssh2-1.4.3 | 1 
                aiccu-20070115 | 1 
                collectd-5.4.0 | 1 
           argp-standalone-1.3 | 1 
                 libnspr-4.9.6 | 1 
                  nettle-2.7.1 | 1 
                openssl-1.0.1e | 1 
make: *** [/home/test/test/... | 1 
                  libnl-3.2.21 | 1 
                oprofile-0.9.8 | 1 
                      bash-4.2 | 1 
                protobuf-2.4.1 | 1 
                  iozone-3_414 | 1 
                    orc-0.4.18 | 1 
                 pixman-0.30.0 | 1 

Detail of failures
===================

   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/62c208e41b947fd8d177d274262f48a1655a7e2a/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3a3b1899de374590eb4fbc424277f0b3864e2f85/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/7846eb7308bc8fd5e19beeee652c43dc6b3283b1/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/76def6a9e649710262ca2f1773839df3bac795d9/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/5552dc935feeade75f469219ae787661ccf4e9fe/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/5fab3cc408842c634665ff22cea3f6c50574c0cf/
     avr32 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/1cc8fc579c3d12a34d934bb57900b600f58503a9/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/537eec7eb99797a39913a8b72c94328c2c1a975e/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/84319978342813cf8e926a15b91016bfb6ff3523/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/9bfaae322c9a04156b440cefae01f58653f6da46/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/f8a8dc16c967e15ce2b1c45e6c400a37b730a21a/
  mips64el |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/f5b6100e24003c9534c3487c081ef5b1bb75b251/
   powerpc |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/f9526c7e5c97ef3b19ac489bb429220b1d4dc494/
      i686 |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/38a720d383b4fe30812766a366b4a1275529af4a/
   aarch64 |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/cb72457fbe8b8940b47349175065406e31f24f77/
   powerpc |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/4c2c778e6f11db12d678574e79d86d73e032ad0a/
       arm |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/ba4ff3701379da9fb67e5d18247f2730b1045356/
      i686 |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/d69cc79d6c0502141c28fc99919a8485290bfe05/
    xtensa |                 collectd-5.4.0 | NOK | http://autobuild.buildroot.net/results/80cbd164bdebda59ef91f67521c2f67c9d4fd30a/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/d5ac0903f0437c1ca796b293d058b56f529ca4cb/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/772d4d1877b51c7259ca17e067cc4fe46033aefa/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/7e9bc2b9a3f4227d558a4597939ced6320fd961a/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/d412ea02846c7309f30369607e3807f3c7556ca8/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/587473ae584b252935702bb9b6c046607d5a379e/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/7655fb84528818b7b2dd56f7091fc023f5c0c9e5/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/c34f1d0901d5aae6f67774641418cba57cd996ce/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/feb6a19585dfa561c737c0ecf4aa387070ab3ca2/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/db1692bb08f4b0a0ad4786e6e9c3b19d6648a53b/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/a0dfcc5686dd3c7f4a80e8c72081a1fc9a421ae0/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/531b09d26c6956896f7c2f4f218bfadeb5154dac/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1b888b046ba774f4e2c409ee8fa602dc16d36228/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/33572aa9f20ca467d91bcbd9ae4d571584ca940d/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/c85fc2697f9859f66d379932574a97be00a986ab/
      bfin |                 libroxml-2.2.3 | NOK | http://autobuild.buildroot.net/results/17e11a810495d04a172b94d667504202358f01e9/
     avr32 |                 libroxml-2.2.3 | NOK | http://autobuild.buildroot.net/results/105f7a5a48a70e8e9a0a8263025c716cc3932ec5/
   powerpc |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/5aaf72d9c4fcab8ba1d2ecaf7fc84c2022d4b8a1/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/7ec7ca5534dd8162e2815c10e6380b5df341cfdb/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/7fe40f0e72367ff2e06cf189e564ca43e18c7341/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/7e67acd40294a7892d2f3a061a02ff8cbd242de3/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/a10f02de5fbb2e8619386cc837cf4e51361da27d/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/821c48a2a4ff0d75a53673118422fe84c5d27d2b/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/be4133134d2ff08ee68955d0ed621b073b6915b9/
    xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/3671039ed6d6d449f70afffcacde94e4fa288849/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/6fb97759677e68acd89349f1cb38dedd38d099fc/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/b386adecbb2078ab2a88dfff3266493c0b73cd28/
  mips64el |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/b7e6cc0fa8f0d3e1a4b759119a8ef86351e0e76e/
   powerpc |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/05a7662fcc144d153ed9e8aca68ce8ce45ff9c62/
       arm |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/c7f8dc04a16724202fc982007b4a3271c412ca07/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/4d0d04458e62cc4ba7cf83db02b606d258c5c731/
      sh4a |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/49e13597f3886bd93102a09e4a1880674cc688f4/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/912ab0ee0d9d4a61b14783bd51a2e0ad5915d870/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/11b7c671109d8980f916815aeeeaef7b02c50c96/
   powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/e9ebe7b952ed2e19778b46ff1c50f116a9d53a32/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6b87c81259ec85ccd2044415e1709824ca73944d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/996dfc439d0613c3dbcb1e282fec793a58a635df/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cb7182da2df369b12cc1ac303865c7517648a5fb/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/367f6f2e4c852e5cab23a2aca7af892534b92a04/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/360811cb44458448d36329cc15a4b3d33c24ac38/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ecbca28f0ed10c9509caa65dd43007a8246561dc/
    x86_64 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/a54ec07faeb14b3c81df5e9b99038d354bd47c61/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/e908a6ab3e779ee892180609e0e60d29370b68b7/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/bcc58ddd767d96745ea3562abf35c5d4c02b31f9/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/b41a5008002d09ac14eb1711f758ab333a92f4f2/
    xtensa |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/aa10b58631daad52d312a73322360e15bc5df9a9/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/db98c66fd794c0b55076c3c8af207ad5c1f5d494/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/31b3770045247e3d51ef8f09adf3a70977660d63/
  mips64el |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/25a8c6b451caada252201b4629c3169bb0a20bc8/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/19ec7e8574ce9aa7e5c796641d4a8345738f44eb/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5a35ef9681d0f67b3b2840e5a8cd2db17eafa3a9/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/401409da24e1e8710a2b1ca531cd2ab9b3304fad/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/30e501819367cc972def46315575470a9f2d363e/
    x86_64 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/92106f87174059350162562d302e0ec448a21ba5/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/576476a64c7c811f5862e0a3bbb05811667066e8/
    x86_64 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/020b89130169603d7b151cd95feb6584644ce29d/
      i686 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/bd0d530e8ede92e58b3a8cfdb9a8dd3abe050aad/
  mips64el |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/f208c8d1d82a2823dc64e0b96a585164a0801a9d/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/88fec2c8f803e1d69a83c1e80b609bfc473d70f1/
      i686 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/7dcc3640021899ff6bace322212f4a545627425d/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/c1dcfef1b0a7f6fe427f7f458e75132c2e893e19/
  mips64el |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/d4a970fd44dea269e7b469d0fad79d081b7d4dec/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/7b2db731126da791673950b0e190b8c1357032de/
    mipsel |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/3f7f2e688f740567db1904373e3e3237d41c9f0b/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5ab67e3c44092ea01ae72ee1efe8c36c6410aace/
      i686 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/9c4a6c49a465bb3d21e295008b46c5584915e5b0/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/06c5c12e6fceb09e0437ac939f67bdee5b810e62/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/98a6b26e5c3e5777ea8e34d4e914547d589694e1/
       sh4 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/c8ddce48d15c7fa83bed54a49143fcb612f61ebd/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/68d6b93d26428758f5b77cbbb65f903cb4f74818/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e65a44f7ab60db1286ddf6eb177bffdc73839c4b/
       sh4 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/f17acbff5e265636746b01ad43d1c59bd5a36040/
    x86_64 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/00582e20ca03615ec64d314d08b1b299e7911b88/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/8bf0c7f4102706be48152c2823fee738b5a515e8/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/2b8aac5694acbdb1a59f90db54bea5dbec433848/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/956c604a4c8776cae48b37a76851eb7cf103bac0/
      sh4a |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/4b2baa44fb6059e67e0f4011c81969909b36afb7/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/6669288616ea577c0f46545a8fdc4d460ff4371c/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/7cdfd374bfe1045c864d7fe328256cda42417be9/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/c2d75f50a01ad8f253316db67674805bda3d4af1/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/92fadc26bd916a5e87bc1164f8399efc0d8c03f8/
      i686 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/9c2eefc995d524aa8d8ef75c41d344a2d4f2fd26/
  mips64el |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e7c26497efa1bdfe82437edd5cb44fe7b24f2f10/
    xtensa |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5761213e9f2070dfa432aeb21de1c2b1b489c726/
      mips |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/0331b55111d8dd038679d16beddb69c78c2b4bae/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/b717bae4c602306215fba9665296b7d8e2c0ec6f/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/76504ec7071ef4426813172097e50a54f8ca6f7b/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/d17847c51a1743f3a71ae37e0b243638f44fbf7b/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e55ec32258c8985923b4fcb1e82d5b9932d6e1a3/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/a1cbfdd219297be7b4506db0d6866a2c2d6808b5/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/7e4c60f7e6d91a0408e6077fc06e87fb50d06d13/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/b245f09e5a50db099228346b419e375f72af1f0e/
  mips64el |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/502b87fdeb7553fe6e0f8afd4afe44fc463f173f/
  mips64el |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/6f4a8d4f59e6771078b6a397308cbcad327f6866/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/428fbf786df432fae99b9081052410fd629c4962/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/0999a5bb0022b91c78bd062c8276ee4bf4c29a52/
      i686 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/11404524b61bd89e425f33b66e26c3e7b8045db2/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/1e28a546db89f9006d60f44eeadbb53f40267c74/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/498af3910c7f5a2e07e15fe75d4a5f57f75f588d/
      i686 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/c301bb49330c9b1a638c3888e46f4e91334cbf8f/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e816218b6b878e033f77fd60facd97a3e73dcdd8/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/686a58602e404e98ae142943a3ef10034bdc50f0/
   powerpc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/226db2e181ff6ee236c3d9537cf4934cab102927/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/0ae14720cfe47885a1b8813d16fd63c381d82823/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e8c8ba8c31fd081c34c8772790d4c581eb3ec3ed/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/6478dfdc380ec6f2003e015ef95e5d1de6a46564/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/3577b62b59c35db16d6a11f5a83ce3f1d6d6cd3a/
  mips64el |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/61e4ca5d84bbedd402530f2d06d5a965b9e07250/


-- 
http://autobuild.buildroot.net
