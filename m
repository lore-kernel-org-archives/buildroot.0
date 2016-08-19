From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-18
Message-ID: <20160819063024.55AF4101904@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-18
===============================

        success : 228
       failures : 47 
       timeouts : 1  
          TOTAL : 276

Classification of failures by reason
====================================

                  connman-1.33 | 4 
                  ffmpeg-2.8.7 | 3 
               binutils-2.25.1 | 3 
              lirc-tools-0.9.4 | 3 
                alsa-lib-1.1.2 | 2 
                   lldpd-0.9.4 | 2 
                  rt-tests-1.0 | 2 
                pinentry-0.9.4 | 2 
openblas-f04af36ad0e85b64f1... | 2 
                 jack2-v1.9.10 | 1 
                libaio-0.3.110 | 1 
                 mono-4.4.2.11 | 1 
qt5webkit-b889f460280ad98c8... | 1 
             libxmlrpc-1.25.30 | 1 
                 liburcu-0.8.7 | 1 
               trousers-0.3.13 | 1 
                 mesa3d-12.0.1 | 1 
                  libffi-3.2.1 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                 rpcbind-0.2.3 | 1 
 make[3]: *** [all] Terminated | 1 
                   fwup-v0.8.0 | 1 
                 openal-1.17.2 | 1 
               libepoxy-v1.3.1 | 1 
          sane-backends-1.0.25 | 1 
               tinycbor-v0.3.1 | 1 
           igd2-for-linux-v1.1 | 1 
              squeezelite-v1.8 | 1 
                     vlc-2.2.4 | 1 
             ntfs-3g-2016.2.22 | 1 
                     php-7.0.9 | 1 
   binutils-arc-2016.09-eng008 | 1 
           quagga-1.0.20160315 | 1 
               domoticz-3.4834 | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/e53f4e9676904ae78bd26bcd3fd5ce66401e9176/
        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/6794a876a14a4d36c120254649944b1c813a5e7c/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/e8acfe63de74ef4fddef20128001e8111d0004ff/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/c1475707f24f1fc4398a3a43f9750606385fc365/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/40c7cdd5ff8ea8020332b37628262e9636414b35/
         arc |    binutils-arc-2016.09-eng008 | NOK | http://autobuild.buildroot.net/results/00455b6a8324920ad843d90ce0413451522691a8/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/e88b4dbd4b79fc983b8f7d33da3287966854f8ca/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/bad3202ef2138ebe9c698e24e41dc6d418a99212/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/a678836114dd3bf247e01bc293949b2866582d2e/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/9f91c4c8d3dfdcf8ff763cc3956c307670efbb97/
     powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/3ea8018a063c697323579c272fd9e9174f3e369c/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/77b36f25c7296393da5e7b82d81d39397d26de0b/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/5dc71d61e615d980a610cb64a785fb800fa576e4/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/4f52271f4b4b5380c80efcbed08d9ea1f5da0df5/
     powerpc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/620a2bda1ae981716a69f4f41749d25d2460b98a/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/66aff89ea92f5a940dfa7ed3b0bdffb938dd998c/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8a8d533a0f785591fee10f1c09c9294f892ef7f7/
         arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/6e91cfb1a0a55d1e816de66353bf6a4053af05a5/
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/630b61c1d48fbd7bab3de2d1a4e2632dd8b886ca/
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/3efe300199759fb84ad8122abc36bbcdfa10e0cd/
        m68k |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1014a22cfdd3b18f349dde33f14acca4131dbd5b/
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/f519a1b18f05acfd1eae4e6c9770a49b4b9e34b7/
         arc |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/47787173c90a3fb43336d245ff3f9a97afa60a04/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/2770360880c9b265c8e019141925e56c35ba22dc/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/a3127f6b391f42c951b568c4bc476b10990e8b8e/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/fc2359b139c092be080359fc37555197ab9e2b5a/
     aarch64 |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/279591190dd7676ff4bcbb6017a109af7b7d67e9/
      x86_64 |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/6b92fa15853bfeca8dd1dff15fcc57bef81194cc/
      x86_64 |  make[3]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/bfc50447dea2d63f4a0ee69409f320bb5e5fa434/
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/99f006c734e59f0b47b1f34827012068d082a5e5/
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/cfe678940c0a27e592dc40577c5a7c9a17772fa2/
      x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/7c8b7b32feecb5f4ee0ecfed4d037b1ff7ce71e2/
         arm |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/7773282fdd31cc58ec6e63d561d2acbef64e926f/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/43e50b480b4aea0fdec745d7875c85377c114cac/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/62786f33f28c5c4eabca2e33ce4f4289c4d9c7db/
        m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/20b1586757450d6aad8583ad7a787a7ca11acef1/
      x86_64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/6be08c666f783d31f3bb1a6b591186e07cb28547/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/1d5c2b717ddb9d6c333fdb4d91dc19a0c388154c/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/98992860d20eacfa54f03137c8cd16178129a9ab/
    mips64el |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/01317aeaff7d127a05e0488a51e81f2d43750687/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/b4232c0d3f390c1ad2bcd14655dbdd1bc3c35027/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/ccd175ad26367e429ecc7cfc408fea13d097e329/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/a6051e2d1ecae9901d353f6bb4c9aac28ea3f93e/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/460f9a530c7a68e512495e0f3827ff315740b85e/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/007ded7d01e3746fc28013d76d04536758a2e2e2/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f1ed03a5e410c01910404876475b155f1672d47c/
      x86_64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/c9b13ae8d4af9ae6a65921de142c0e8da30664e0/
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3122287ddea1e316a64ccf0d0dc9415bfefebb49/


-- 
http://autobuild.buildroot.net
