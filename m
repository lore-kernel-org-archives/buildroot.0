From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jun 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-13
Message-ID: <20180614060011.096DC20737@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   1 |   0 |  26 |
   2018.05.x |  24 |   0 |   0 |  24 |
      master | 196 |  88 |   1 | 285 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a74e0a19c802335f5b657781363e1ea90c62dd43 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             freeswitch-1.6.20 | 26
                linphone-3.6.1 | 20
                libtirpc-1.0.3 | 16
                      x265-2.8 | 5 
          mediastreamer-2.14.0 | 4 
               asterisk-14.7.6 | 3 
            f2fs-tools-v1.10.0 | 3 
                  mender-1.4.0 | 2 
                protobuf-3.5.1 | 2 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
               mono-5.12.0.226 | 1 
                pinentry-1.0.0 | 1 
                qt5base-5.10.1 | 1 
       shadowsocks-libev-3.2.0 | 1 
triggerhappy-b8228880661293... | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/e45e351603746b9970c1e53c49173bad78c8eb0a |     
    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/c6dfad6145455af4e67625e79158df7e4d793f6f |     
         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/b9817445b159f9f6564aa4d8d97aadf95dad5bd7 |     
         arm |             f2fs-tools-v1.10.0 | NOK | http://autobuild.buildroot.net/results/3577d413dc16bcec7a403fd8857ec5dd64470ba5 | ORPH
         arm |             f2fs-tools-v1.10.0 | NOK | http://autobuild.buildroot.net/results/d987df1ea7f8043f05d5221342888892990e9252 | ORPH
         arm |             f2fs-tools-v1.10.0 | NOK | http://autobuild.buildroot.net/results/819a8a528764a68c02b1b98431a1d09929c387f1 | ORPH
       nios2 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/b34c8ee75e3511b9a9a9e65f7b122af4dc637d68 |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/cb65a6069e1d263e1958ce9f1391d4416160d3ea |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/6a9248b7e24be253de60683d20dcf7fb5121c8c6 |     
      xtensa |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/6a067c8aa34252230673b03fec2decbf9c061a9e |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/bee609ec726d70abdb9fdb4a9904d746cff7896b |     
      xtensa |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/c5f026b670b22beaf157ced71e1650edfc6d3b59 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/dd428541eafeae1a1d8ecfdc81e81503fb670502 |     
     sparc64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/f3a9509bb4a9cfa20959415c35a14e96d63ce1f4 |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/4c86350f24a8f85161b19441b8068d01ddef90c8 |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/545c665b2ec42a1fce3685e34c3c7d18027f2095 |     
        m68k |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/e5705974183c6f199365bf93ca17d991b2437637 |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/4b9976749aeb4a3535d37efa751ff08b672fd4ce |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/b9fdb91468927a97ade61635532960467ef6c3be |     
        m68k |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/4ce7a7d43044e1b692739623548d7f004d4bd819 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/b8b0f865b22c81f5b404e9ea9206f9d02db60a06 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/76e2a26d9cae40d90775c19a2fbbfb5189339a86 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/124c377e4d0a4284700ff27f00038fb197b7d5f1 |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/b86ba41ddaf2a3ee7043b63dc83cc564bb7985f2 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/e84cc94cff446466c9cada69a048bc1bb64d832d |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/802e5464bef039a35bfac9ebcd292a304fcc4c1a |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/2ff5c46dd179cec80da570be987e48f04c99adc5 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/9a1fbeb48f9328fc07670694c950f8f14a1d1fe4 |     
     sparc64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/d32875136325823625f2dce2d9bdf0019b42ba0f |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/27c9d7fefef357dd50341f2a0c09bef623b23f73 |     
     powerpc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/e8378eecad01f3ed6bb77a9570ea937c7f631e4a |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/6013c8524c10f08adbb7b5bb340828dba3a1afa0 |     
 powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/5b14e00022b2ccaff2c0edd52aee6a273eacfcfe |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/31e2d75ab257144ea5c083312bf461b2f2586bb9 | ORPH
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/2bfb5b7de142a3db7c31127d52d98bcfc80b8e27 |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/4bf831930a4ea03ca8bd8fdc21c6d73285080a9a |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/1054fcb929a78cef1d3f6d6519d98a07d77b8983 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/3fae54d27c65bbe40362963821187d106c819a84 |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/6a2192066c5d872448dfa4dc2711aa2970a16b8f |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/a5439b6ae1d28c36d11c0ff3d6d6ff5e021b2a8f |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/8b4385731fb40e837cbc8dc692c73a6a6b0094cb |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/0c4707d46f8abf7565492f951993ed1a55ba5e27 |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/2f8e64e184f9e591a8db8fbdb5a48fb4c0f88501 |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/e25aa2c5c3abd99a01a4da768aec4cf00004bf8c |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d821dcf373ba8a385e436dee0b035942a4b51cb9 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/eafe68ab664a08789b335672d65b92598482f7d2 |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/645274cc973cb348ce5ae80a3e53b36b5f9d945a |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/b9e24666bb2b67076acf031ec581a868c294b46c |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/a645640f77a08f42495ad06fe7d1b6e5931c0c90 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/670e85bcae72a35a287e3d5d68794ab08625a659 |     
      xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/cea0fb4f0244e028fdc602a6fd16cdd3b61e035f | ORPH
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/144cfcfe329f3080ee4ac7d973f670d02bb06717 | ORPH
       nios2 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/7f9c94801f94eebb0fd5caa5f587fe258e0ca499 | ORPH
         sh4 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/a288db98c06b8f85306fcadc607bbcf8719996e8 | ORPH
        i686 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/9b7d65bea6deac99e94d1c5d5fb3da2450ef4dde | ORPH
         sh4 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/435427b5df4ad1bc702a2b97e4b442f46be3eecc | ORPH
   powerpc64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/c44d815304a6f883ea412138909637e5eb3a7d4c | ORPH
      mipsel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/08bf2a612598544a7fb76ea065cd76327d88cbb2 | ORPH
      xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/3b3757f66be76584948c1f85c6481ae68a5845f1 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/cd2e055b7896255fb843c75f9c6b4dcf36b22fdb | ORPH
     sparc64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/de80ff4337c825436a597a819cecb2ea4410c8e1 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ca2ed532248ae37b050919836ff59ee9859b32ea | ORPH
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/d2ae4d748cfa73ca3fd690c2e3795e6a369a9bcc | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/284793da60d8151ddc1b06b115daed4dd12182bb | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/879b655fa9e819d114a6d540474da4546b10bbba | ORPH
      mipsel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/5f8e45014286d854f4639b447b40dcbade69dcc7 | ORPH
     powerpc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/4b19420c1040c873fc42dcea26dc8616b5889269 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/8bb86f18e8cd1ffc2c4b11794d55beebdc31f36a | ORPH
     sparc64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/1d7062c5fabd0158f138f7f5daf78b3df87f2873 | ORPH
         sh4 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/cf83233b0c61fd526c0542e84a0d54d9579ae889 | ORPH
         arc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/78949fe1a212d1fcfe0bb58eda017320b846ff98 | ORPH
     powerpc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/d7d32e126c14ab85bac5e6ab142235d67fb4aff0 | ORPH
      xtensa |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/23e4645c419fdf7633e99402d0f5fcf57b9cbb6f | ORPH
     aarch64 |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/c8e27ec9196756dcd962bd102b90ee5b3b9dbc5f | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/c7a6470bc9e3e27afac1d92c6b6e8deb1a50df62 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/5301095fcf69d147c28f0ad3377cb3f75140723e |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/d8dabc64595713ddceb7ed1eb1baeb0f2658107c |     
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/fd6bee70ff20bee9607a9f6f557a3a793d00cd9f |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/147020731353d0ac5cee2428c7bce509bca224a8 |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/14098ab7a2cd14036fd3f0edc5dd9c3f8fb34cf6 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/9b3098665df67bb5b4ee258be8ee0817ac50f6c0 |     
       sparc |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/3d27a03cca94faebfe410364fa5d6453565fae58 |     
        m68k | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/9e7d4018af730b14b5b5114fdd8a8bbb659086e1 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/be5c702aeaffcb959fa8a52a645a0d5bc5bb26c2 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/4e93bffd58d2d4f278559c27ec4e2a061c96e369 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/0edb6c5769fc5e1cf354bed58115add0cfb15b44 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/231146ef53fa418969e3b306afe60755915dc2ca |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/aa7e36fed8309041842ba452e3da9c57231d4424 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/710ed475551b943a388cef964b40c583168e4dce |     


-- 
http://autobuild.buildroot.net
