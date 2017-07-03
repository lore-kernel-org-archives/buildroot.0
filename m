From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  3 Jul 2017 08:31:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-02
Message-ID: <20170703063113.D5D4C21E44@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-02
================================

      successes : 111
       failures : 76 
       timeouts : 0  
          TOTAL : 187

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 25
knock-258a27e5a47809f97c2b9... | 9 
               libsigrok-0.5.0 | 8 
               host-rauc-0.1.1 | 5 
       python-smbus-cffi-0.5.1 | 3 
                   strace-4.17 | 3 
                kvazaar-v1.1.0 | 2 
                  libzip-1.2.0 | 2 
           python-pynacl-1.0.1 | 2 
                 sngrep-v1.4.3 | 2 
              alsa-lib-1.1.4.1 | 1 
                   attr-2.4.47 | 1 
                  cc-tool-0.26 | 1 
                  cppcms-1.0.5 | 1 
                     efivar-30 | 1 
filemq-3dc89932903b0320853d... | 1 
           host-doxygen-1.8.13 | 1 
                 libv4l-1.12.5 | 1 
           linux-zigbee-v0.3.1 | 1 
          mediastreamer-2.14.0 | 1 
                 mesa3d-17.1.4 | 1 
                 mplayer-1.3.0 | 1 
              syslog-ng-3.10.1 | 1 
              webkitgtk-2.12.5 | 1 
                   zlib-1.2.11 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/4fc7bbea41907b9d0208c7b3a2a1ca5145ef86f7 |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/42748dccee4aaf062a9598913a7977995939ba91 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c78dd6ece64c2b054c349fa404cdbae6029f9a7f |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f6b2cbbac383f735f639742865db9398d5ad9e56 | ORPH
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/880653d4f8e15668bdc8003bb6ac311b206e4c89 |     
         arm | filemq-3dc89932903b0320853d... | NOK | http://autobuild.buildroot.net/results/d2cfe279d85dda345f0ab55b65f4d80782ccbd81 |     
      x86_64 |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/d177d3f8636a0b877c76b22cae66562f2adb8ac4 |     
     powerpc |                host-rauc-0.1.1 | NOK | http://autobuild.buildroot.net/results/a36ed9d2de296bace06e217245485cf17ccd2533 |     
       sparc |                host-rauc-0.1.1 | NOK | http://autobuild.buildroot.net/results/b6e9c0591734e77d2d43543b539e0bf3f4a24ab2 |     
     powerpc |                host-rauc-0.1.1 | NOK | http://autobuild.buildroot.net/results/d224687806a02a2256ff668f921aa1c0ddca2422 |     
         arm |                host-rauc-0.1.1 | NOK | http://autobuild.buildroot.net/results/fea6c3a97a7587f422122655b67a035adfd5b9bc |     
      x86_64 |                host-rauc-0.1.1 | NOK | http://autobuild.buildroot.net/results/641d135e0b53512847dd223e8a76b077955eb7f5 |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/eab0a46c22a43d36f2f68807987107444036aa31 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/955ada7aa94b6382bf1290602d5f2fc6453cf6ad |     
        i686 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/530fd0771926b5fa60db5384c9c5e2d940e3432a |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/405df182642fd6afe371d0c8458a088b97aeb3fc |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/174827a06e549887d3ee7967c74183aea608a484 |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/1da6435159a500475facc0f37e41cbaf3756d978 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/45998542d8b052bd41bb586675f62ef91dc9f1d2 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/2b2b1618da8032d32847b13fd71436f7ff2b686f |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/3141d5ba5587f72944c5867b37a08c9a48dd2ee3 |     
        m68k |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/eb115abd233cc02a322442e5c8614c5a3483b2ad |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/45d22c9f2f5b593bed286319105c82cbc3396835 |     
     sparc64 |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/cb35b17200d965095f1721117dd1322303a7f903 |     
microblazeel |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/f16bffe6301079f258bb6ca580dd38e9f89f9f5d |     
        i586 |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/6a48444f7d21de1a36eeb80040b5af01a24964b3 |     
      xtensa |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/61679162336f73df8f8d28b1c7eda62e4e97ae7b |     
    mips64el |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/826dfda210f10b43ad21379e3a1194be2ada850e |     
         arm |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/dad67106ef7f3439059148cdd5ec01d6a0d37f65 |     
      x86_64 |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/5353c2418c0c3311ef9ecb1f1ddc3ce769369b96 |     
       nios2 |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/785bc9cc2e39ea4eaf163e6b27599348cd2231c5 |     
        bfin |                  libv4l-1.12.5 | NOK | http://autobuild.buildroot.net/results/3ce1d551bbc063c4af23372bad9e5261609c7391 | ORPH
         arm |                   libzip-1.2.0 | NOK | http://autobuild.buildroot.net/results/c50ffa5bf565e75333192edc89e2d39044d07f26 |     
         arm |                   libzip-1.2.0 | NOK | http://autobuild.buildroot.net/results/24d5d9a55a98bcf7c4c057732fad5e6b9cd7e1cb |     
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/cfed5176075f0cb9e2f56ebef10f5d6c352baf10 |     
        m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/e86d1349e9691b3d30015729cb414dbe0fc075a3 | ORPH
     powerpc |                  mesa3d-17.1.4 | NOK | http://autobuild.buildroot.net/results/6a223ba864bfa6e5d9ae45a177d0e75f2c8298c6 |     
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8a3a0153ab339cfbc6f4b22247fc7405518b03f0 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a309e2b91f08e085e626df00cf35268ffbc9755a |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3b2a08900f96ba653fa5a63116b247f5af6d51d1 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c873f6862d1bcc030b3cadc63a214fabdf8b3456 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/74c58329a9f96c20a7febce75971d0a407fbab88 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f11ee48084961484dd111be06ec6b2a031dd7382 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/91de4064b4eee9f068c8dbe4d5c560fed533baaa |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e9f228729dec81f2382e64813b9b740572e75b7b |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8350d3583d07c0d807a28987fec9c097cbb90ea0 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/82824f321c636faca83d0f65cca498280139968b |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1be4119918e0c66308a4a6824424db4baaadc10c |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8598e2c73cc169243bd0d675268b6f95ef31a9f9 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/32229a73477bf484f8ad4ad6ec38eaa63b55ebed |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9c383fb6a227bff4f8c47c3ac3300d6c651aba50 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5d83cfb562790faceb4368877c94c18b3e05ff23 |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ba3bf105dd2f09f4b1e91e765c5cd89da7d3d4a4 |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/aacb01fe3c5d4cdb8ce1ab315c785b352ea7e28f |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/49a23cf6b16c349eb3fb4e10ce77528a6b9fd245 |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/89955b38508e017cc4155676dbe1cce788047c3b |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/fa230b83c3aae3ab1516f908b4dcb6f3677f4c43 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e91c5bd201440d88cff3816db4adecb73d373fd6 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/59a339552eff57fa14174323458fca64061a8949 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/33481bb78bd8d9c7fd2a1bb14d8ceed2ddb77e5f |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/82402ecc6848148068fd1016ffb0e7d73cb1a3b9 |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/87feaa76fc1f55dbc5ce2a382ad0659fedf39067 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/dae7d85ece1b68ff6a2fa9d749878f42e52ecd94 |     
        or1k |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/78d91f5fe3d5bdd49c315169497cc58249ad59f2 |     
 powerpc64le |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/e7b491376a4e9dd86c25289aa1c3fa2e876211de |     
        m68k |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/7080119be800f3cfb38eb42c3a39152cf81b2f43 |     
     aarch64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/ab06c7aac0459a93b0b02d0c07f725e45a8b1512 |     
        i686 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/ea7698ce27b3b575fdc2bdd75088061f6e54b56a |     
       nios2 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/7d7479bda2b36b12aa43f93a66e1c35b76865f7b |     
         arc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/1d3a6dd03f6b364d5d46a05097ee0e5da62be206 |     
       nios2 |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/b9fc25b82f3280872fe1593ac252a8529ba83576 | ORPH
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/a8a3e49431fbd569db0f39f0336a5f7e3ecd4947 | ORPH
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/0b485bb6f746f7fde5a22ca3d2eb8ec37be97d11 | ORPH
    mips64el |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/daed773441d1c5b016f4d750f6194fef9e979a21 |     
      mipsel |               webkitgtk-2.12.5 | NOK | http://autobuild.buildroot.net/results/303143161f394e394bffb8fec8e151f742562069 |     
         arc |                    zlib-1.2.11 | NOK | http://autobuild.buildroot.net/results/477e711c109853c30db7388e654df3cec0722d9b | ORPH

-- 
http://autobuild.buildroot.net
