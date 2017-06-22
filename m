From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Jun 2017 08:31:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-21
Message-ID: <20170622063115.90CF020A1F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-21
================================

      successes : 149
       failures : 74 
       timeouts : 0  
          TOTAL : 223

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 18
       linuxconsoletools-1.6.0 | 14
knock-258a27e5a47809f97c2b9... | 7 
                  cppcms-1.0.5 | 4 
linuxptp-97c351cafd7327fd28... | 4 
              alsa-lib-1.1.4.1 | 3 
           host-doxygen-1.8.13 | 2 
                    mpd-0.20.7 | 2 
           python-pynacl-1.0.1 | 2 
                      x265-2.4 | 2 
                   attr-2.4.47 | 1 
                beecrypt-4.2.1 | 1 
                  check-0.11.0 | 1 
dropwatch-7c33d8a8ed105b07a... | 1 
                  ffmpeg-3.3.2 | 1 
              gettext-0.19.8.1 | 1 
                kvazaar-v1.1.0 | 1 
            libpwquality-1.3.0 | 1 
              librtlsdr-v0.5.3 | 1 
                 libv4l-1.12.5 | 1 
                 mplayer-1.3.0 | 1 
                     mtd-2.0.0 | 1 
              pcsc-lite-1.8.21 | 1 
                 sngrep-v1.4.3 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
               upmpdcli-1.2.14 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/0ccafc216a5da8d3faedafd31091c4610a7cac79 |     
         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/19c412bd1fb606262ffb7ca89692ae2e26a88565 |     
         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/263a343b1ec7293ffc6cd85cd58690465638f4f1 |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/733605c696baf8d9d607970b6c030d71b0128685 |     
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2627573763a723093c0798d283f7da9f88e1ab9f | ORPH
         arc |                   check-0.11.0 | NOK | http://autobuild.buildroot.net/results/26b50fb031e9f885b0b59bd4390dd7220bde2e56 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/cc2e2cd16778e3a2a09e3c893a5c601293a390cb | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/5b93f05364ac5e924204e2dd59b4669af70321d0 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/63a98510ea440a11e45e07ee5b368d6d99ee36bf | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/4e849f39f3af1aa499bbd61f54d12595b074a860 | ORPH
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/b44e4f3bd9a8aa193ff10693fb9f41c566bdba2f |     
         arm |                   ffmpeg-3.3.2 | NOK | http://autobuild.buildroot.net/results/fbd16f507fb21e5dc0b83a1c57c42f9883577606 |     
         arc |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/f3cdeb0259fed0feecb0d6c7896e75b425d8d51a | ORPH
       sparc |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/689306dc424abe43d367e62bb351ee3ec68669c6 |     
    mips64el |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/34900460503cf0ec2b547c1c34cfe3d0bd0bb7e0 |     
         sh4 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/519bfaa3ee49369ba5c655fd2859cb2bfe2c03f8 |     
         arc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/aee898728f34b72f44687e83cfb0eeb007cd385e |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/90863b5adb769a346acd3dc4bbe8d5fa497a0581 |     
         arc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/e453f16639875e0d2704187242044833c5ca2237 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/d45567425bb8e85972065efa0acc4fcc67aca7a8 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/eb7908c17ca8a0ba81a2b7a293bf47132a808844 |     
       sparc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/39d8c501799581ff1cbbeed489dea7c7d3982df2 |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/48d9c24ef23b7a9596e197b9af1b6f359e5dcbef |     
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/88bce0113af16244269b530f8af319d5e018e6b8 |     
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/54b1e376432aea8272187582da0d9cc8d96a5cc8 |     
        bfin |                  libv4l-1.12.5 | NOK | http://autobuild.buildroot.net/results/dcc028d775ca641db4b0adf200c80308627d039a | ORPH
        m68k |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/c3cbb7baad66a7ab1f081be52630c1548faf32e4 |     
         arm |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/44f94eb4322bccc7c5c030d95482edd0679b1ee8 |     
      mipsel |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/e8d49970557bc6740700b63760270177114de4a7 |     
microblazeel |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/c2f61a392d2033e9007c4c0b8bd9a5c1f48d361c |     
         arm |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/f0de5c93d3f18e57ad256c2412c7be2beefa70e0 |     
      mipsel |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/308e2ca1f39c86cf8523c0362abf2b60dbdb90c1 |     
        bfin |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/6552c7621228ac6ea9b30a7dd7158194aa3a3538 |     
        or1k |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/7c8bd0da7b2d6299e235436c90ec7edbb8398bb4 |     
        i586 |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/a90e2c285d2137c65f8627e5f25eb2dd739cd983 |     
       nios2 |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/3a737472959ce23fc105f231c1563a2dd2320cf1 |     
    mips64el |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/1ed1e232f76f12fb37f3411d69546b42282bb409 |     
      mipsel |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/409d069beedc1b241005f9e5088f1c9a66ce743b |     
       nios2 |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/bb37f92d6238d0627626dbaf67740d00a746ac56 |     
      x86_64 |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/529b875a08ca16e27acf406b8d7f3643674325f3 |     
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/caadb329fe4428cc5000f9cfbc37d319659af4a9 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/42a0c645eb6d771851c79b826ce666dea32b1db8 |     
      xtensa | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/240bd93be6ea2a28faeb185f8d22a592523dc477 |     
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/08943f607e5c897aeed4c11a42b9ffc2c746ca70 |     
    mips64el |                     mpd-0.20.7 | NOK | http://autobuild.buildroot.net/results/2005f2a7f2857e59ad1a896db0421bb0328b1766 |     
    mips64el |                     mpd-0.20.7 | NOK | http://autobuild.buildroot.net/results/80410b62d4ca292df8ecbaf7b0e2a020767111b6 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6104302fdfb52ae525be09cd56d752d04790b492 |     
         arm |                      mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/01e478f582d3f8f22d5290de011590ed5c8bbd26 | ORPH
         arc |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/d82691429f52026a15784532c8c5a196643429db | ORPH
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9466e0950c2ab4ca6bebc7c0b12b6037d382087e |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5c0c7e73ff76dabf260cb127e9975939d390faf0 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/30be03c9faec46f5caccd3a8c04e5bc4c224b6ba |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0c2f0f0149487278c6b1de3aac78378648a875e3 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/653e57e41cbeeeec32fd063044ce57521c3fcacb |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/50efd345af8fd26fe631647c2b5e84d0e788d1f2 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/59d52a77edc952a37f1f8dd51af6b357228d868e |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c66062b4f5c0e05a3c36eabec8c80a0ea1ef713d |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/dc9fda97f79fccc836743f1ef24c123735a58900 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f098a68f24804ee68c3f7a5c68c9eb8d526e62f8 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d33983a141a25f056ad4adc08495eae19a8da556 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f410eb226ed4900cabd00b83ea019499da959cc7 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5b8ec2c7473b8462bad951906bd78afcac63f585 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/730acfd0ca4e07edf0c0c12f3faaead8148f31d1 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2806e811629639fd6d3c78226a51fa8bdff6ae78 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4584198c659f61927085dea8e166b3858906b61e |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/be45e7bd62b9f27ed6abaf890b79f1f18f258a12 |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3a6bcb4c83d359e34017a9e71b316bd5e724dba5 |     
       nios2 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/199cc56660e0e46c5b527009f152c2297cf6d0c7 |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/e6415429a20d83f127b168b989f7a4a4dbf83a7a |     
        or1k |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/84c901409f3dfe1f61c8da151ee77d05d1f52539 |     
        i586 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/b2ff380d8bc62c3c0365f179e38a39d234bb4337 |     
         arm |                upmpdcli-1.2.14 | NOK | http://autobuild.buildroot.net/results/ce3bf66ab52c7a1abaa3d8895c239add94805426 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/a2a4dfc23be0209f7485aec0a524ee0f46aa596f |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/f9d5f3b43be5bd3056fc725c4e63d27db09052e3 |     

-- 
http://autobuild.buildroot.net
