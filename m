From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  4 Sep 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-03
Message-ID: <20150904063019.5DFE31017A2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-03
===============================

        success : 286
       failures : 86 
       timeouts : 0  
          TOTAL : 372

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 28
                  libssh-0.7.1 | 7 
libyuv-1ebf86795cb213a37f06... | 5 
libbroadvoice-f65b0f50c8c76... | 5 
                  mono-4.0.2.5 | 4 
                busybox-1.23.2 | 2 
                libldns-1.6.17 | 2 
                  connman-1.29 | 2 
                   bdwgc-7.4.2 | 2 
              drbd-utils-8.9.1 | 1 
xdriver_xf86-input-vmmouse-... | 1 
                  apitrace-7.0 | 1 
                  guile-2.0.11 | 1 
         qt5connectivity-5.5.0 | 1 
                mongrel2-1.9.2 | 1 
                  boost-1.58.0 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
                libevas-1.7.10 | 1 
               iptables-1.4.21 | 1 
              lbreakout2-2.6.4 | 1 
                harfbuzz-1.0.2 | 1 
          openpgm-5.1.118~dfsg | 1 
                    ustr-1.0.4 | 1 
               libgtk3-3.14.15 | 1 
                libnspr-4.10.8 | 1 
                 lvm2-2.02.125 | 1 
libsoundtouch-010a91a59071c... | 1 
              gst1-libav-1.4.5 | 1 
                   argus-3.0.8 | 1 
               dvbsnoop-1.4.50 | 1 
                 gnupg2-2.0.28 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                 iperf3-3.0.10 | 1 
                  ffmpeg-2.7.2 | 1 
               ibrcommon-1.0.1 | 1 
                directfb-1.6.3 | 1 
            xlib_libXpm-3.5.11 | 1 
         conntrack-tools-1.4.2 | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/a5698ca29d89e6242ec509026014e1fad1d42c43/
       sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/3a01387a2b8afac1fcb04dde3251827f93201eed/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/81a60ae6ae15e8f5e8b548461dac1d08be04287b/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/7dc004b86dc1ecf36ca5c224c2397152ebaff641/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/4ec0574f5c0736ea338a607630e7d45966aa6a9d/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/0f652f6bb1485191a112e2948c94e0ce4e2d3adc/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ab05b6dedf795cfa8e800c67144e7c09d2b92dc5/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/a95ca245cd5a832dc942fa4f6284ca64b204c1b6/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/1bf0cdda19c1d6ae431fb0cbc3488e82040fbbfd/
      x86_64 |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/4881c03d3d54406633707e26abb10410c2601847/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/dc8eac0831748be71b549dde84d757bbf06ecaaf/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/cfc1e879070a0e2417c5ae8ebb916b7e225804d1/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/d9e6bc0a1333092913b61ec2fe6bc342b2ac3f39/
       nios2 |                   ffmpeg-2.7.2 | NOK | http://autobuild.buildroot.net/results/8fc1e169e9cdd32e95d75db53a935f879074484d/
       sparc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/8044dc1c19f4b302df1e3740e96137406631ba74/
      x86_64 |                  gnupg2-2.0.28 | NOK | http://autobuild.buildroot.net/results/cb8f9b5f5dacd5e24ef83aef65a35ee3ca646182/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/3523d99c5dffbe603452916f7577c081f8d302c8/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/dd29222aa9e93d326c91161b111c92bb56cb8087/
       sparc |                 harfbuzz-1.0.2 | NOK | http://autobuild.buildroot.net/results/7b7a7dd175080a8a37908bc837564276c1fc7bcb/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e437838d99cf9443c5c8d035222ea39a0e95e505/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a2f2fb6398c262d9e35a4b77845a93de7b15b409/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/7afaa98b86a5cdccead16dee47d99cae5383bc4b/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f099d28df04afc2b9b68d74e241cc1227f59904b/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b1c815b1a465b8b0748618e2fcc5dd4a54a07ad5/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/c683e74430a5f6c05070d65c6545d885ebc39058/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/6208dcf8d871d2e2353857ec117d7904bbc5f596/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f9abede9de275686f37818c5740002696ad63c47/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/14a48590345b8aa6d54663b9eeb127dd5c0cf44f/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/0e915fefc10734b5056201e197c7e5465557ec0b/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/5a628bf2939b62fc5b0042e30df22d82059fed3b/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e9d69eae7f111fcf29b93974a3ea726493fc5702/
         sh4 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/525cd4433ccb575a1408727cb6e1f437121c1df4/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/810b22e15797199331cb464da59db4e5c62749f7/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d4efe41c68949b20a7352de4ffbfd789aa90987b/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b3c6b064c5b1d07438bdad7875df4569575fee1f/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/21f07cf0ab69601c0132e0b0bde939d02651d127/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/48c0d3101bb48a34da94a10a61b6bd4a5b9b011c/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f76a65961beb179fd9b2ce923462ceeee5c15636/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/272aaf28a2ecb8b17298c814c08c8f22f2b39fb0/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/56428592f59475097bfb3de7216fb2072fc4409c/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/8c8f5ed41b4af5cd705b35d5f16aa791398dbe24/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/69282f22ebb4e8bf2ce4f49e628cdc8ac62ac85d/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/58e22e4985822af3eab3407965309340cf7afc8a/
      mipsel |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/11c4f04a9f7f04b5b9c326ea43e1e4dc81f95ff1/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b95385b776da728cdaba884bc54430dee44b609c/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f5a2b8bbc470ec724b59baec628745cf3d22e9c5/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a50217e23852cf957eea6cf626d8dca5c2213fd5/
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/86e23f4182bf1bff425be37ef390bebad5696993/
         arm |                  iperf3-3.0.10 | NOK | http://autobuild.buildroot.net/results/0cde157d759ec36e9c4c6f60ecbca26a716d4785/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/04b3d94043724d12f91f5a9e48b102d67d412b9b/
         arc |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/3ac3ced7478e7fd03965b1c74b5a560a3060a225/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/66f20d6ea6127db7c6f981dc85a11756a8825da6/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/cf71652596c5c8fbbdc9eb17d69cd508f9840537/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/4f87937bd475ec0413bf3ff31ad171a91c8ec63a/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/1bb0cae2cb573052ae7eed0b77b66ad67a29b5eb/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/c13decc78633230b6e8e350de78cd956cee6906e/
         arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/41cc8545ba5a57dd3142d3500c83ae913c6324c2/
     powerpc |                libgtk3-3.14.15 | NOK | http://autobuild.buildroot.net/results/7f67791f9d0ac47d348b488cc6bf9630f642cc71/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/7c6985518bb068ef1764dfb44c59c9f583f07c71/
        bfin |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/3bf24e3e845ad8ebcfd0469787e7b7342ecfe3c5/
         arm |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/738eca48f4b359ad3358d339cc732cfdff68cc83/
microblazeel | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/1629703bc3160143875a1771f1ac25a079ec94ff/
      xtensa |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/f94fc904e90bee7a166c9b8283768369bf93a882/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/6a20f29e65f446165b21cba3d55294e6ea446ff2/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/8bead9cfd826843482ccc37e9c1290b8774c8de0/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/5d4e40fc4bb9c5a7ede26434c3d6ab325c631ecc/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/40100e6b07c3057ba427975ffdf3c3834c6fb385/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/55c00309bc7497529d28e48dce14299adeb11ede/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/d7083a8b197e1833ddaa30620ec1037ed15ec0ce/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/97207ed46a519368e242f0621e4363d522e21ee8/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/d84d54d85183296c57c9131d946e4517ddcaa84d/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/2d73ccdfd5d06bd6dfdc4e303fe48a554460fa1c/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/c189149b8d2a0242da06ec68863db23cd0fa65b8/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/d552e5e46c263ff9860192a993ee9ed11d7783a6/
      x86_64 |                  lvm2-2.02.125 | NOK | http://autobuild.buildroot.net/results/e6be7b7b10645b65f185acd0a5418ab22687243b/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/005cfe74c41a9aaa172243ee668cefbbee539da5/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a3678744ded94906961430f3a4523cf1f1b0099b/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a8c768d59792f5354fe63695fd225ba8da6d4a43/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/8d2cd5619ba4d9cec5c8ac7fef467f47abc18aea/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/fa7f5b8475879ab58b5c7c3992147fae140bc98f/
         arm |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/568d92bc7029a331d91f4e4cc30eee61e469832b/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/7714d5db771e4862a8e4d1e9f213bb8f3de0b81e/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/dfd1656d5b186b2483332612355a20a0cdb04937/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/a496f9f46b803b96a7a62ba454579fc0a8041700/
        i686 | xdriver_xf86-input-vmmouse-... | NOK | http://autobuild.buildroot.net/results/cd3730ed0272c3f335ee90e0cbc4027b07945db3/
         arm |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/712c2b7e0480a32cdf122e6bd308c515ff09a7e9/


-- 
http://autobuild.buildroot.net
