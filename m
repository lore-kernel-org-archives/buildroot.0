From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Dec 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-24
Message-ID: <20151225073020.E0480102451@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-24
===============================

        success : 238
       failures : 133
       timeouts : 0  
          TOTAL : 371

Classification of failures by reason
====================================

                  libffi-3.2.1 | 17
                  boost-1.59.0 | 12
                  autofs-5.1.1 | 10
               tpm-tools-1.3.8 | 6 
               trousers-0.3.13 | 6 
                  ffmpeg-2.8.4 | 5 
canfestival-7740ac6fdedc23e... | 4 
                 dropwatch-1.4 | 4 
             host-nodejs-5.3.0 | 3 
                  connman-1.30 | 3 
                 lvm2-2.02.138 | 3 
                   erlang-17.5 | 2 
                    ustr-1.0.4 | 2 
               dvbsnoop-1.4.50 | 2 
                alsa-lib-1.1.0 | 2 
                      qt-4.8.7 | 2 
                   nginx-1.8.0 | 2 
              alsa-utils-1.1.0 | 2 
                 setools-3.3.8 | 2 
                libtirpc-1.0.1 | 2 
                busybox-1.24.1 | 1 
 toolchain-external-legal-info | 1 
              procps-ng-3.3.10 | 1 
                rtorrent-0.9.6 | 1 
                iprutils-2.4.5 | 1 
                    exiv2-0.25 | 1 
           argp-standalone-1.3 | 1 
xdriver_xf86-video-openchro... | 1 
                libsepol-2.1.9 | 1 
               linknx-0.0.1.32 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                   kexec-2.0.9 | 1 
           linux-zigbee-v0.3.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   minicom-2.7 | 1 
                   hostapd-2.5 | 1 
               qt5webkit-5.5.0 | 1 
              gst1-libav-1.6.2 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                  prboom-2.5.0 | 1 
               libcap-ng-0.7.4 | 1 
                 gtkmm3-3.14.0 | 1 
                grantlee-0.5.1 | 1 
                     pcre-8.38 | 1 
                   open2300-12 | 1 
open-plc-utils-1f6e7e372b31... | 1 
                 libdrm-2.4.65 | 1 
                 fio-fio-2.1.4 | 1 
                dos2unix-7.3.1 | 1 
                     lxc-1.1.4 | 1 
zbar-854a5d97059e395807091a... | 1 
                moarvm-2015.10 | 1 
                  aespipe-2.4c | 1 
                     at-3.1.16 | 1 
                 opencv3-3.0.0 | 1 
libubox-e88d816d6e462180f03... | 1 
        ltp-testsuite-20150903 | 1 
                   libnss-3.21 | 1 
                 igmpproxy-0.1 | 1 
          libcdaudio-0.99.12p2 | 1 
              libsoil-20080707 | 1 
           host-openssl-1.0.2e | 1 

Detail of failures
===================

     powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/6cbc1beecee76282ac6e99f816560de45049ee30/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/74c3a8f3c770b5b8627f26565a41b396d8f077cb/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/ed7d6347cc0cd293864cd1068420bbc493f6c18a/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/bb1f515aa0f1f11b7ca3fe76408b469f71956864/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/40f8441659d0a45c8246c8dd0b0b83f275d16bb1/
     powerpc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b261ae2065c405916dbba84a2aaaf05da22d8c5b/
     powerpc |                      at-3.1.16 | NOK | http://autobuild.buildroot.net/results/9daa7da5c8ed9d12b3aba7fb535cfe0057ba24ff/
microblazeel |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/023fb2ae52f7a3f76d7656d28ab67ed50ffaa8bf/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/de53795facfbcd32020e29332207a89bbb4738b3/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/007460cb5727ff22f1e206eb005c5425f6f06d87/
     sparc64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/5f0a69ff0df0c6785ea01ab3695788cde60b0556/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/4479382b2d4d762991cab2e93fd08ad6160c2921/
         sh4 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/669598fa7956006e3a6be7c189aabd5fd5b5fa62/
      mipsel |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/7d39932c064405070ec9fa1098df0d4e890ea07c/
     powerpc |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/0876427addb0df5434da0582dda99c2606107ba8/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/74a9a75a1fba2ceacc4a02a320bfd2cd1146e769/
      x86_64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/c8f0ed57a960e6038895438d838a0c4b387c2b88/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/75cae8743ef9dbca293fc7ab75440f349133646f/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/3dc1c38e187847959b574f3bf7b903a46311f035/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/909328597c7adb2516c3a3e7cf20f879ea63cd82/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/c4ea144807298eab5493981d87fe38041e5333c3/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/3b52e9a24fad29cc22d8e27e464fbe9e45506260/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/21bf0309e9b0cec7aa2bec66e6cd9672c482e9da/
      mipsel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/02eb4986cd923fbd0142964d7c3fa1c87665a32a/
      x86_64 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/b238127563251405121ed5ed0a0b51bff7eb5a79/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/fe50db6a80fd70f7a3e33286417d488bceb5e15b/
       nios2 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d54d4d27723b37f7fd494c36f46ae0613e789463/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/6ee3b78d83b9928f80f3d81707fcb20dcd829622/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/5aa6f58bfdd008453981e92b3edd70a5fcee0b1e/
     powerpc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/e66646a4e0daa3697fc8dab45be5831976504a47/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/fc45aab962b6a88fafdb3bd9d789e29b74124e60/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/0ffd74fa5a648e7bb74cff04433a5aebc3c157cd/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/63377f1ec99bb42e2f260b0f7591fda6351d5e2c/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/184c4fb9a0c65c023014b3ff27154af7a52cc69d/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/c6d817824ff38d1d115a8777f2cc2b181c340028/
     powerpc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/db5676e6ad6fef99a06f110adaf5144c0e5b85d4/
     powerpc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/f6ee8ab3a6300f1f527f9e92b8c2ec81e63afb27/
      x86_64 |                 dos2unix-7.3.1 | NOK | http://autobuild.buildroot.net/results/9115ddb411ec15eb8bfa1d4f03a804f48e77ff76/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/46c1806eabdbbd02df8b1ce2276ab8e0ec60804b/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/bd2ec8988b950399ee680aa92de338c04dbd99c9/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/37d572bab183ca76cc8af2b5499d496dbcaa77bc/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/87a20a93d23bbbea7c2f719cfced7a21f608a51c/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/be1b492502c78f70d51b96f3e00f7d1dbba4a07b/
     powerpc |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/c05513b8aa5caab73380fde28944fcb5d8fd4b05/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/8fb07522bea41d94a06fceabdbd042e19498f7fd/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/66caddaafeacacb7af42d502e914574b58bb0236/
     powerpc |                     exiv2-0.25 | NOK | http://autobuild.buildroot.net/results/67352f03c7aaa6f6b5d07a07b87b7dcaa988af10/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/277be857c151f8c0da42436ee03481e2fa482a00/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/fc6d6fd83d9bca15ee46a5664629c5bb6500223e/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/31cbc11dc771a1351dafb2d170215a185a50bc6f/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/26e9ec31b839f920f5fecf67dd011da663cb24d1/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/e7fededabe8d8c1f990b933cef182cb437ea3495/
     powerpc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/4a3211ac79a43666ac197ce7a9bc2a253d4ae7b4/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/e62b8c84456b47a9671c29035ca9c89eb41fc0b8/
      mipsel |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/db95e0b7ffae8dfd8732bcd6f86ec2177ea7e37b/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/191e38fa4fcf0857ac6264f51ae0c86ff81a97a6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/0bc93d44f4a9e96d81e564a594e26ad33e69a139/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/3c062dd0acd5b346a6dd21dde75fbc53d78056ea/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/827d60403ba9c9aa3f58b2c6181e8f0017c25673/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/9fe381f962fb012b9d3443e72ea6d97349e0a683/
        i686 |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/c5d366850001e8745db1977bae76ef6e864a7af0/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/b71768e158055a2b7b23be3d94920a561c1b88d6/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/90879233118cfce0840653ed93ba2b517b859b77/
         arm |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/f0aac1fb79bc5f1b7c55a3d0f08aa0ae6db7fac8/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/67d57120f1654c2180ba7f1a917eae2030f94ef3/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/7be034ab2a8a685eabcfbc42a47b21924c7b0771/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/8d03549b647fcaaa4f3777f5f4ef05b4b2f11f67/
       nios2 |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/5af17f7bd3e9e5f274d2797a38010896f310a759/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/c8f4593399efa3fefc1e3e604dcd7b4d011ee1c9/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2a40bbad657017ed2f1d370b040407067d244fdd/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ac1bbb07ab19dd29e20b3104a7122b3df514db33/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c12d4be7d5a3d8ab0a1bed8000c552e84cb82d7c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/74e4e492dd31da7561e1e872c00dbbae052a5397/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/36132ceaf65ad20e84987ac57d8924e4dab9b9c6/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0d3be97f312ba1d29cf07f05079eccc302266772/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/32f4411cee297f2a564880b544c4d4864e85bd10/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c698f260e9bcbec9a73f711609bc3357c21697ac/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/00b62ef4a9b8b8b57fd298157acc9e71893fad14/
     powerpc |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/07f27d80a08fb33412ed8b85f59d5ceec0e39bee/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/019b73ae9d459ba4e97c64414b022e49f1a3ff8a/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7cd9153e9c15d82026bcda6e557f5a05dd3d2c74/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b4a6ca585e871c77b246d7e50c1c315a13a61df7/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8109b4035349a0fc76a8d9f92adc17594a1ddf65/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8468efc53638e779bff514c668605628ada8e500/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4a83ac6b2a15762cc4d39de9f8f59f5fd00f5b59/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c64d004d40ef0d2583da28ffbcd3860ff17d55ba/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/750e01f20a1564e4381e21e96ed7e82f8573a45d/
     powerpc |                 libsepol-2.1.9 | NOK | http://autobuild.buildroot.net/results/564d17dac053bc597a1e851a9b3d10e50e1f088b/
        sh4a |               libsoil-20080707 | NOK | http://autobuild.buildroot.net/results/5a508e17740971f8cb975d42a4f7fac6fe42ef4b/
     powerpc |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/b6203e85bb24dda5ae283a3a9b5a664c1ee39190/
     powerpc |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/8841468f77b57ee4330cfae36a8c375debe41296/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/5ad570f9d783ccd25b2fcd8699e45591057162ff/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/3f0269a7b71c6d022d4ba1868b3beffdd21617a4/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/977350a4fd04a16dc4cc6ba9f7ebbd4b99d454fa/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/cf4977c5f16444b1bf7d02d72abcb9d3418f30d1/
     powerpc |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/0e8216e2cbf83ce4b649baefeeecb234964e9d39/
     powerpc |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/6aa1511c483368c2d3edcf4641d6705954a239e5/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/111c1abe8b401bfc395af97c2040cdc36d121d15/
      x86_64 |                      lxc-1.1.4 | NOK | http://autobuild.buildroot.net/results/52da7ccde83364169ce85c26a6ac701c606036c5/
      x86_64 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/ea72a5aee30a89251c06e6a916499e39128437c0/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/628d6a9b39c15876d4927458fbbb2e39189187ba/
       sparc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/70f52f4ba0f81efc516098b3b1120e92dacbe4b6/
       sparc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/5d77f4e2c646f3daa3262289a0cc54b0f9201eb3/
     powerpc | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/24b294b9804da93801790b594ce0190e2eb7a4c7/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/9c494388434e31d2636ad693f8e4cc6893d96ca2/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/1bf5b7ba3b5e811fa2ff5a33bb46af2a39caf2a3/
     powerpc |                      pcre-8.38 | NOK | http://autobuild.buildroot.net/results/0d0d4643238023df300854cf01ef6bdced13ac5e/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/6b53128e9c1fc25d1e4cf6f9d16d63a7e0d7cb18/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/ab1e9742fd4285ed850496f59e37382c2c8a1463/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1148f435c33fc99550b93c191f716e374fd94e75/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/50038ac2d085888168799634297a6514a16fbfb7/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/85f85d48bb05074459b2d4e91cbf958b7328d284/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/d8f04c0979dd0eae0e665fc3adeb8aa5af3e8541/
     powerpc | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/2ed05ecc070232690357eb4c8c84a132cb13a8fa/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/8bc392dd6a0367646d663b172c935c944cb2a942/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/2baf9f296fd1d36de798eafba4ae11636414499e/
         arm |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/6ef57310769eb229837d387f64733b6cfeaaffc3/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f68b12ae5b7f28b1eb03ce91275d4b83d1c09f34/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/5e26cc4236cd3685f3f7443631d499926a7ce689/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/153165cc7eccb9207786f50ef9b4b7cca22521b7/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/fcfc46b9a69b0012ba7c4aae97d03d33f4aa0aa9/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/071dea42a7e0da05703bc93c411d5fbd645e0b5d/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/da46a3c5f3f7f723cce104acd099431239304514/
      mipsel |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/fdba4810938af71c2b4593a9890077385b4aed4b/
       nios2 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/9f50cbac0c8059a7002f6b46e86a2186b976c855/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/8566303bb3efccebfb0f1f77529b686f3daf02ef/
    mips64el |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/e90d9bb75ad0333abd9c0d454ab4048558ccede1/
      mipsel |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/67e092227c721e53520a7f307acf04485166c0d5/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/9bcc8576fbf640101b4568cdd5117022f0aa2682/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/b0e8ea54099a451c7dff15ea0e056811b0b5e779/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/dd8d67b58295f06089f842defa4b3368a9755503/
     powerpc | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/b9f321bdf2a45bba6bcd34822b3d7619838dcd1d/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/288c241b1663ce62aaa95001e57c923ab53c091e/


-- 
http://autobuild.buildroot.net
