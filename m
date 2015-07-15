From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-14
Message-ID: <20150715063016.E7B93101906@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-14
===============================

        success : 240
       failures : 121
       timeouts : 1  
          TOTAL : 362

Classification of failures by reason
====================================

             qpid-proton-0.9.1 | 12
                  zeromq-4.0.5 | 9 
                libtirpc-0.3.1 | 7 
               libglib2-2.42.2 | 7 
                  boost-1.58.0 | 5 
               libsigsegv-2.10 | 5 
             util-linux-2.26.2 | 5 
           host-heimdal-1.6rc2 | 4 
                iproute2-4.1.1 | 4 
libsigrok-fe473123ba836445d... | 4 
                   audit-2.4.1 | 3 
                 setools-3.3.8 | 3 
             expect-2014-05-02 | 3 
               openswan-2.6.43 | 3 
               alsa-lib-1.0.29 | 3 
                  ffmpeg-2.6.3 | 3 
          c-icap-modules-0.3.2 | 3 
               upmpdcli-0.11.0 | 2 
                busybox-1.23.2 | 2 
                   tinc-1.0.24 | 2 
                 empty-0.6.19b | 2 
                 qt5base-5.4.1 | 2 
               libglib2-2.44.1 | 2 
             btrfs-progs-4.1.1 | 1 
                 netperf-2.6.0 | 1 
             libselinux-2.1.13 | 1 
                  cppcms-1.0.4 | 1 
              lirc-tools-0.9.2 | 1 
             iputils-s20121011 | 1 
           aircrack-ng-1.2-rc1 | 1 
               lightning-2.0.5 | 1 
                coreutils-8.24 | 1 
                  cc-tool-0.26 | 1 
                     ola-0.9.6 | 1 
               qt5webkit-5.4.1 | 1 
                       unknown | 1 
           libfreeimage-3.17.0 | 1 
           host-nodejs-0.10.39 | 1 
                  bcusdk-0.0.5 | 1 
             dosfstools-3.0.28 | 1 
                  libftdi-0.20 | 1 
                 python-2.7.10 | 1 
               arptables-0.0.4 | 1 
                 libpfm4-4.3.0 | 1 
                   squid-3.5.6 | 1 
                oprofile-1.0.0 | 1 
                      qt-4.8.7 | 1 
                   bdwgc-7.4.2 | 1 
                  acpid-2.0.22 | 1 
                  guile-2.0.11 | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/b3a5ca14dcc0187a99766e38be0f57a672e23551/
      x86_64 |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/f839d102ea9a9862f3117bfbdcba5eb8632dfbe4/
         arc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/519934a75cbe6bfdd522fe33b66dfe0522956046/
         arc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/ec53d93c116441c84105f3a27d250554630ce553/
         arc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/af9596843794610560a77374408fbdfab21aa891/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/599faad3d769a04d713e80955e1a79441c57a667/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/46c4905f2086cb1f714192ccb52a6a23d03cfad4/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/e2a9efbc60f5ff0badad1194c0aa1154d6d5f181/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/692f1d16fa09c59cfe0a122dc0fd4c0076e39edd/
      x86_64 |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/12ece891e9a94a79784d977f5bdf817fb997b795/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/a8da009b386853f75480234a1ee269a930c17769/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/596c2eb1378946b8c0fea6b3ebcf80ee7e14995a/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/0dd3ef96bbd034a41d908cdaa6552b27fda78132/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/f67d8251ec1e6dd61f8fd02a7455534978960455/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/16fd658176b4e4927f7c7dbe5598b7a38b819af9/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/0585f6c926042d7c859150dbf7b33928c4687273/
         arc |              btrfs-progs-4.1.1 | NOK | http://autobuild.buildroot.net/results/e48c8b7ce150a70af175f78d67f90056faa6fd3b/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5a1e56e8f2de0893cae77dad5103893cf96937ee/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/55716094cc8f3f87f43d77fde5ebb2537e1e7b20/
     aarch64 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/8f7b03b1908d0b139521e1e6e17ef7ad303db771/
         sh4 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/8755ff78b533e340545a32c59d3a2128e59bc9e8/
     powerpc |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/fec7050ed7a378c2856c77ffa44766c1a203025c/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4abbf9afb6f27948c86132e2e738e0f644642ce8/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/76d0e4c7f3fb4128956be9750b328e2cbbcadfe6/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/0fedc7c87cda5a2d1c8ff32522146890452b2749/
      x86_64 |              dosfstools-3.0.28 | NOK | http://autobuild.buildroot.net/results/7b778b7a9ec8c91ec3cea6ee81c6f5c75f0b959a/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/1f165bd5a30bde96a699811b8af332a0430ad780/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/763f7520c18460e17a45872120a64cfc153b61a2/
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/b8791e92834789a64f3f8ee3ba475d08668a1861/
microblazeel |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/f62152bc33747e8cd4f3ada63ba3e085740e2301/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/23399d252504f8d394934b15230ba4082df44803/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/e002acd55042d43b7f40f1b890830b9f24826162/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/6db5e63dbb3e48c76df0777212b133a654b6cd12/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/5f32bc99e9564160274dbd6f315c333dbf7b34c1/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/76577d43f177f32afeddc49dc23f4871291c75f4/
    mips64el |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/4acc01685dd74300d7b7e5cc3d45e7d87ddb6b49/
         arm |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/244e55f16ab27363e0fd1785543b0d83b1d39f68/
         arm |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/364c34e4783dcf4ad0dfdc9ac14d1588e96603ba/
     aarch64 |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/ff08777a22f2cf3756b7b8b1220e04a56cbf51ce/
         arm |            host-nodejs-0.10.39 | NOK | http://autobuild.buildroot.net/results/02871b06144d2ff7cd11262759ed594514fc8dec/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/213809d3f2c5b1149968d5dbfa3e4b650aa3ef30/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/b6c712fd0966a48c7facba04a0db41d070eab9b1/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/b2bb488a056e8d53fa9307627c6e8b1ba71214c3/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/aa062f8446cd85fe6f0bff7adedc04ac3d421d2f/
         arm |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/0103b747a8c5d990d25f1dbf9fb546046a8ac17c/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/407e2fddaad74dc1949b3b8d5beeb53cc8b400ac/
      x86_64 |                   libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/7fad592b99b050119c72bf1af3a4bd1b55746c48/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/e526e9b55fec60c116d01f3d1a5940ef91a0d2d8/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/c7f646a77396741507e6b6d9f3b1b3b1df9f2848/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/c798c47799011149d236f575f049d7657dcee592/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/296f5cee943dc824a985c278b288b86e67dd577d/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/e38b3bafca421807b372b8a3f256a5e4b4ec2120/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/25ed6500fdc889e1ede802957ca46385ca6aaa3d/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/34c4451f3039aaa9baabb1bdfc567e090db4fc0a/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/937090e4413401541da82d432a091cf42788b611/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/86efa5bed36382509b847239af319f535ebb3534/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/e094ead10b68eb720c1649372a58372321ce46e6/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/40bdee839acd8dfb5c78aead953a690dbfc461d8/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/1fac2745a54684a589cf649b57e031ba9b408564/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/65902ede99d49f579c385daaec383b998c101ab4/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/1a0de5fb8572ebe2984f31759d94c616f74c6714/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/7c82406663dfebbdf36a014f794e971a5f5d6e0d/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a17fe5a519767356888f0c7747a4c9d5885b2957/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ffb60cc615912560c491fc05e8c894cd6db7d144/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/4d141ed0b19592c08296c97c4fe6b032b7f49fcb/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ee93a836609ef19b544295b322cbada8279f7be4/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/6663952c4966fe44b4e6e86a78c3f0b60aee2c1b/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/d6490c120d4a8a7aab0140d360e222e772149b90/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/50b79394db4a27a7a8ba44798be64f36c1531d2a/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/33707c079b6eb46a96b848dd9c9f233a9a4750ec/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/e4b2e75b2244646970a3aa958cac4fe3e4c6d937/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/f6d36534a7d3f04a03c8f75637e7493f4407b5f1/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/1667814e7b365fe187ae5c2217f277e231ffd673/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/ac1613718e7329e24f9143fc03d94c7af0929e5a/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/c510665ae3b5b16a10f6d306b26c408aab517b13/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/8e7b27499ea80a912ac3effbee597e6ed2b6e48e/
      xtensa |                  netperf-2.6.0 | NOK | http://autobuild.buildroot.net/results/00604fcd60dd412dc37cdbf78f9b967a38244aeb/
         arm |                      ola-0.9.6 | NOK | http://autobuild.buildroot.net/results/2461c4a171935183f3669cf2887b4bf4f3f677f3/
      xtensa |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/6b2d60cb5227c8531f21a2a459ec8b4390e041e0/
     aarch64 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/2ecb098b01bd44d75182b15f98c1fd2a8c927438/
       nios2 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/18f0166f3fa831f321818e286d9c2e9037f8c8d0/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/68558ddc850e9bb190cce74f80ed18096077f451/
         arm |                  python-2.7.10 | NOK | http://autobuild.buildroot.net/results/dd61ffd73bdd85d772ba57621eaa1300ab48c849/
        sh4a |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/33f6e15aa9ac21bd0d4de118d1b7f0e66b9a0a97/
     powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/9c15b8de5d98482d9031dbe30ae19e5f60ed3f21/
      mipsel |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/2bf85fcd346c475fb0e01c7616727dd3dc11775c/
        i686 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/f35a8d22e17d4d6178844e4d84b797c239d473d9/
     powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/bdf94981b52dc3a04fd21ff770a0a20d883bb1c3/
     aarch64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/66964a00e44502ae00d5348a5ca2b632c729a417/
      xtensa |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/554f0a620d62a7474ab7ae322fff0b0813dc4f66/
         arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/eff48f8a827f8b4dbbdb7cb648a6c4a3ab4ac8a5/
         arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/30d2fed1149857b11375f2801f522a84f441fc1e/
        sh4a |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/883d58057462a3da94a609b204c4ebbc9b63ca9c/
      x86_64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/7dcc3894b430502906322a99528b4e8085387111/
         arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/5308a6f7f2cee9cbb0c787dbcd43922dbe427576/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6d90c4616d63226a87bcb858d228776b0c0d29ad/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/7f23b19f426fb2388a27e3a19152cce0332877bc/
    mips64el |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/8916553dec6966fd8ef8ca0aa9a71dd5532deb3a/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/fab536ea6665668acbbe39e51b6710d0561bee4d/
       nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/8f95e83411552397ca29e9aee5c457a1a762b364/
       nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c349dd925698fcf18d764f5c3de534b4ce485eb7/
       nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/db380f21a2e546b04ffc7dd8a033e89d55990608/
     powerpc |                    squid-3.5.6 | NOK | http://autobuild.buildroot.net/results/e0a0f6250fea31d2b7bf9cf5dfe716fa83f80ab3/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/60319063757340810fc6545f5da94e45f9b6c811/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/23f9cd11c1abb72fbad70b92f35e52582864576a/
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/a64e2df24ff91cc8b0a610a229579c70d434ea99/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/d660a9409552b3e1ad9e3ed716386fd0a67fd8db/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/247b3f1ac3d3a9712e9410eef298fce8d885f92c/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/bc7995f1e4e0d103c83c8e43703b93ea50829899/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/d60738b7ef7a266d112b19006bcabd7a818213ad/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/94c0185c88b0a8107bda5e0a590f2f77153860d5/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/d82f06660557d3d43a7f7c806d51217f607ce8c9/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/eb2182939f223ceb697145e3b450113ad770ad21/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/506e2903b9ac5f2027d8edbe2ae9f90ba04991ba/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/705b82af4951779a7c672e51461db4624df8436f/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/77c9fb8ab581c9ed70fbb3d29ad1cccef291a84c/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/a2891e9ef98f5505d88d9a2f84e0fa3e81ca779c/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/021d3efeb0dab244885e9159d6f579f3eb04ffcf/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/409cc6a54937b72b0524d7466472d9178e6b07e4/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/50e9be0896da86c042f3f4eae1cdd329dddc9e2a/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/621c2b77197963d229a3b322ee35ce85ecfc01cd/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/17ba855ba6286c202d032667e6b14fcf5d697ebf/


-- 
http://autobuild.buildroot.net
