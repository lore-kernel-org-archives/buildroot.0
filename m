From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-13
Message-ID: <20130614063007.2732C52C08F@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-13
===============================

        success : 97 
       failures : 135
       timeouts : 0  
          TOTAL : 232

Classification of failures by reason
====================================

                  imlib2-1.4.5 | 33
                     gd-2.0.35 | 17
            host-erlang-R15B01 | 13
        host-dosfstools-3.0.18 | 11
               aircrack-ng-1.1 | 4 
                 lcdproc-0.5.6 | 4 
                  connman-1.12 | 4 
               libgtk2-2.24.18 | 3 
                 libnspr-4.9.6 | 3 
               libglib2-2.36.1 | 3 
               openswan-2.6.39 | 3 
                  weston-1.1.0 | 2 
                     m4-1.4.16 | 2 
               alsa-lib-1.0.26 | 2 
               wvstreams-4.6.1 | 2 
                libtirpc-0.2.2 | 2 
                 cairo-1.12.10 | 2 
                sdl_ttf-2.0.11 | 2 
          openpgm-5.1.118~dfsg | 1 
                  ne10-88c18f0 | 1 
               sqlcipher-1.1.9 | 1 
               qt5webkit-5.0.2 | 1 
          host-protobuf-c-0.15 | 1 
                      qt-4.8.4 | 1 
                      bash-4.2 | 1 
                 libiconv-1.14 | 1 
                  boost-1.53.0 | 1 
                  hiawatha-9.1 | 1 
                 qt5base-5.0.2 | 1 
               binutils-2.21.1 | 1 
               sconeserver-211 | 1 
             gdk-pixbuf-2.28.1 | 1 
                 ffmpeg-0.8.12 | 1 
                   mplayer-1.1 | 1 
                directfb-1.6.3 | 1 
                  libedit-2.11 | 1 
                    acl-2.2.52 | 1 
            kismet-2013-03-R1b | 1 
                   icu-4.8.1.1 | 1 
               audiofile-0.3.6 | 1 
                coreutils-8.18 | 1 

Detail of failures
===================

    mipsel |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/3acaf5248fa22bdac99384d52107e6ab4cc96393/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/9fdc94bedea8eb57233a78c8ed6a318e3e1039ea/
   powerpc |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/28556613f267fc1db6bca62f086b864fa31902ea/
     avr32 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/e4821a78364eb99ee0cb0f65b75b88bb27037bd8/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/cd7cee187566070398221227ceaadb7b212ec534/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/c9eea12318f58241979709354d2df3376ca00ba1/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7b47356c5a8e6f30a015e51301bcf1c9498f8a7c/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/5c0e2402ffe970e65648e75842c76fc1073d2b3e/
      i586 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/f17330e7995d24a5de6c95f5e74a2a96156db059/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/5c71a53886f151e213db4140eddec0404315d732/
       arm |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/83e239226abdd668a6bfc7d41bf88fa1248f1d0d/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/926b0ac4f60742792bf9fd8e179fd7700acedd4e/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2b8c731eb34dff5f82585c2b73939caee87d23f7/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/6b0e3b654999eb0c370f649778b45525b4cb009c/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/5b6394ae9b59c7d334bfb85c6673590d999c9ece/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/88295e8a89e4b0090a12de9218a4161bb4f90936/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/62820efd2e9ba3a4690e34346f87622c71b231eb/
microblaze |                 coreutils-8.18 | NOK | http://autobuild.buildroot.net/results/1ad0b0b032a665edba73483241057e5e2c6324d1/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/b696ac199f8303d03c79793b05edbe37f269411b/
    xtensa |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/2ac997c3e7742cc18a6bc1d015e2d903f1cdfc9e/
    x86_64 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/51e5d4ec1a42a1ccaf62c09e9c4f0721e758186d/
      sh4a |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/47c69e91454d0ad7090614d36b046e0db441b572/
      i586 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/9a58d3c9b3eb805289f069ddd8ccb09ef79d29f4/
   aarch64 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/6bf3c4690477159a6450d4563dd206b42470d8cd/
      i586 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/11ea6025121ed64741498dfe8b7e480a8515e85b/
    x86_64 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/2c784a6ac98d2890a158867b7235ebfa1bb4be0b/
      i586 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/ab41a5b871b45219e86a3ded097c9585ce0360b0/
      i586 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/bc1ef13c357a8087f07d8262e323d879e06c1583/
      i586 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/95c1b1589d492130acd62c68503cd20e84af88b7/
  mips64el |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/db2d3b8f8f0aa8da7ef0ee27c3a00e3a1913e34d/
       arm |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/6d9c0b2f8f4dedb7f8ea071699df57b12ca35175/
   powerpc |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/2c3243abbc967e37fdf651e4bd7f776079fd378c/
      i586 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/1c70ce0ff350623cc38baf4b8b61c8a7a8586aba/
      i586 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/68ccd7df922e3c6c7cf80e808b46ed8db96f4a2f/
       arm |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/20f338efef4d9e84c6d6ad513af6b13f2a10fc4e/
  mips64el |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/3e4ede6735dcf2d1aa818931b177fb0f255b7987/
      i586 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/44b7b2afbfd2ee5287d60009f683b63441cb44b4/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/3dab9180428b0b7577b25c0c66db85f652971bde/
microblaze |                   hiawatha-9.1 | NOK | http://autobuild.buildroot.net/results/702e134377f44ce247ec148eef73a36641c87664/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/6c8caaa4c101bd0496d8d9cf893105fc0bcf563a/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/a2315bd9122656a77db7d920589d41eadefa71a4/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/38a6f2a943d6afcb4348dcb1bcafdb408db2d3ee/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/0883682d87be6ccd2f8a125be9582ec979b1e043/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/0e1aab50e71a25d9e8ca7de4011c910bd8720d76/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/e4d54c72fa151cbd389a817ec9adbbc68b693eb6/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/988c04c2081930e1506c84dc34dac22416c59e3f/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/a92253e16091787216370ebef1937b1e5b049831/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/6d6d93c0a557cac2d02cd51ceaaadfb7d651a279/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/c3519cb2f3768a6c10f848e2c7593a2056b8fb58/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/2c24f1528733e08fd3ea7d4effe66f9f484d4df3/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/c57b9937bd0f5c987b7cb5a1762222df33d3b241/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/84099ff92e808375c80f35840181caa10638c06d/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/8367ae40598edf6467755fc5c201f19d7e31448d/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/58ce7ee06303b439332b598c9bdb4292e72fb9e3/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/f4806872e68a6f346506986fe5a3bb0e82dd95d3/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/35c727470b9023d126fca65396cc4a737864cad2/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/f0dded1297a09e47091453e7e6573daa0276d0e7/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/e2f56c0c275cc9acb2ff6619f74439457166dcb1/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/abe2b17b0124cf5e6533fdb316d890dd5df60a14/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/9cbc851f0f08b028489ebd649a4e0cb0cb731bfa/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/4a9d0e2d27f60cf52f5ea26f27365ea706757fba/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/e6ab32098d1a7f87e9e8fbef1c95759d5fb5ce6b/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/f17dca61eb234960d3bffe89c5fb587cbdb4aaa2/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/16e75764f5c58894e0dace60dfb6e2fc6f001996/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/fe67a5ec3b2ecf0f07e071a6febcec4ea1fa97c1/
       arm |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/3718fc1375b08afd4fe807c6c5ce25ff031bde58/
   powerpc |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/32e71e2dcfe61a57c55c4d31b46ac0a966118b84/
       arm |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/9861ba447d80be69ad61ffd73563fcc3715ea022/
    x86_64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/7fff42149bd5efb95ffc60fa8304eef62579c810/
   powerpc |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/49cbda48a67eb7908500587cd3538609dc8eba71/
    x86_64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/f5532d834f22345ab2faa57f6e9bd195de810bf3/
    x86_64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/28850399bbf7b5b521fbc0a6850c9182292a6ade/
   powerpc |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/3ad2d25eb6ee6e840edab49c1c5123d1cf9e1b76/
    x86_64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/d4f6d67db414ec02e7d4653716e972d3f73ebdef/
   powerpc |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/79d1969f834aba47e5e94b51ae005d444fdb4c41/
   powerpc |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/0a616fc89cc4e82db0a657b52e7246d9cde9cbc8/
   powerpc |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/755333bbdcbbb42717bf63ddb6720352fdc5aeab/
      i686 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/c3657e8fba912ab9dfc28f841891c2032f5b2247/
      i586 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/cef5d321152b343e534fb4a16099a249d880a402/
      i686 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/649669ad0c4be0169dd4eb2e6116a070e5b96f48/
      i586 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/07a410956894d81ecad887f83dcf9174c6a1ff74/
       sh4 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/4fa7cac4e4481dadaa6a1906af67f140f639f24b/
   powerpc |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/3f5b21f33c47c116ce3feb3190384f1bbc63726c/
    x86_64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/9e0e2868a9107e1f61dec1c0cad77c767c0a0e60/
      i586 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/a0ecebe56da2a5175739d4d9d08f271fe4ba8e4d/
   aarch64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/10e6c9af435e32c2bafb5e90adc337b5b719d180/
       arm |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/3e8fbf0f31efb0a306b8734854236f329346b326/
      i586 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/fe6983f247ea868685900e35e7c66fd9bb0f35ea/
       arm |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/13f8ae98787ee5228eb027a47068b024ebaa011e/
    x86_64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/5bc5c26c61735f44f1558874967a406b0e5d62e2/
    xtensa |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/d466fd650d59e817fa2b8f7995cd3c847e541067/
       arm |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/1b24dac75ae1a9bb7f5a021fe1ca44c598de908e/
      i586 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/c15baf0c7891e2d10f13b59d85caaaac8a9a5292/
   powerpc |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/55395cef7489bb7f22eed27d95be86f6dc58213d/
    mipsel |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/5b1811938093d67d7f4df33292e21eb3d9bf9a86/
   aarch64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/31316185976a79b45fdd69c1b84abae4f496fff1/
       arm |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/c78a4a8377ddb33c824ee6e92d4191aced7e2ba1/
       sh4 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/4a235506690d01de60d3bf40b6f49c8a81b5a3fd/
       arc |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/581537eac9da1660ad5b7147b9672b2553b22cba/
       arm |                  lcdproc-0.5.6 | NOK | http://autobuild.buildroot.net/results/59146f057cb2ebba63fd00bb544533fe88c2c39a/
   powerpc |                  lcdproc-0.5.6 | NOK | http://autobuild.buildroot.net/results/6a1d4e6240683309bfa1cb0b4389111b6c47e7da/
      mips |                  lcdproc-0.5.6 | NOK | http://autobuild.buildroot.net/results/8e381732dcb02174ca32e68492894031a82b1ff7/
       arm |                  lcdproc-0.5.6 | NOK | http://autobuild.buildroot.net/results/080bb5520e4450f57eaa84c74afca0045f8eae9e/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/71e70a30a1d2aba70726398ab8311717e82a8719/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/2ba8914d85268306edeedc7df9430887a00dba63/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/627a2f0d2c9c43f6208107d72f705a099f7c636d/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/4dc2ddc266f25be7a66bc2afe378db781d037f80/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/4a406442c2bf3c7faf9ace2467807411faea891e/
    x86_64 |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/b2c21aeff271d232ba411cc889cd62349f95c1c6/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/fee8d751c3aefd90896dc899f85364efe97bcad1/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/a99a06c3381c2082be61b84904e85f4eafcba4b7/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/d13263c8dce6c84c83a012ee1250a9960a5dd196/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/3cbf86f1492407486d62c811f1622599e0835240/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/27851a616ca23d168ad4b003ff23e4de74aca2b0/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/63648f4b1f280997091f2d63065e6fa78056eeb4/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/a2af03424ed7df8ce8c557918c62e6a173720970/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/48f2d1632c933b3adf6092020ab2f0fc84cc226c/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/f815cb38a7c9e88de8fed564c4c731dbc7d49e47/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/049887db04de9e067a70cb628da64b86153fef5a/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/75f3be659f133aac619134d64d09d2881141d0a6/
      bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/7d36a98ea06a39c63263edf2780f9a701ee28cad/
    mipsel |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/6ed438afbd92605bde801d14b165ec0e4f49250d/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/0a54fe92e392708ebaec92e290c97e878f8c8e32/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/459cd26d1071e07beb697a1768113db3489c5848/
      sh4a |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/5f1bd45a710973e75f2cbd4c352b8d9f7c058e88/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/7c8a31655532038631e2f9c459dcaa71ff556351/
  mips64el |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/f0aeeb0bc0a60b1d630c12637896bb00bd378e55/
   powerpc |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/14320bb54f01c4cb8ba32c96f55b07e8c7ce0cc7/
      i586 |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/d20d285f2343f57c7c0aa465cd5746e12854c54b/
      i586 |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/ac44da1f29b2382db075eaeeecbd8646e8804bf9/
       arc |                sqlcipher-1.1.9 | NOK | http://autobuild.buildroot.net/results/97f5b8ac63b9095a2410b1803d3a649e174f66bd/
      i686 |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/deb06bef18db535cab19b81d5b3ec853ca1002b0/
   powerpc |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/17a5b76a34f519b2ee7481d48facca9877b17a83/
    mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/e2e7619744653d91313f68c08cb65092e3220929/
    mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/9e083f27b18e030cb5b95e32513534cdcf19ab9c/


-- 
http://autobuild.buildroot.net
