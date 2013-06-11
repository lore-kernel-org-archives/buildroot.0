From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-10
Message-ID: <20130611063005.68C5552C08F@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-10
===============================

        success : 111
       failures : 77 
       timeouts : 0  
          TOTAL : 188

Classification of failures by reason
====================================

            host-erlang-R15B01 | 15
               libglib2-2.36.1 | 7 
                  zeromq-3.2.3 | 5 
               aircrack-ng-1.1 | 2 
               alsa-lib-1.0.26 | 2 
                   icu-4.8.1.1 | 2 
                  webkit-1.9.6 | 2 
                  ne10-88c18f0 | 2 
               qt5webkit-5.0.2 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                   dbus-1.4.24 | 2 
make: *** [strace-legal-inf... | 2 
                libiscsi-1.6.0 | 2 
        host-dosfstools-3.0.18 | 2 
           imagemagick-6.7.8-8 | 2 
               libgtk2-2.24.18 | 1 
                 libnspr-4.9.6 | 1 
         shared-mime-info-0.90 | 1 
                host-gdb-7.5.1 | 1 
          host-protobuf-c-0.15 | 1 
                pulseaudio-3.0 | 1 
             bluez_utils-4.101 | 1 
                 libiconv-1.14 | 1 
                mongrel2-1.8.0 | 1 
                 binutils-2.21 | 1 
                 zmqpp-31220ca | 1 
                  connman-1.12 | 1 
               madplay-0.15.2b | 1 
             util-linux-2.22.2 | 1 
               libcap-ng-0.6.6 | 1 
               sconeserver-211 | 1 
                      qt-4.8.4 | 1 
                    acl-2.2.52 | 1 
                  libnl-3.2.21 | 1 
               audiofile-0.3.6 | 1 
                  gnupg-1.4.13 | 1 
                  stunnel-4.55 | 1 
              e2fsprogs-1.42.7 | 1 
                 cairo-1.12.10 | 1 
                 libpfm4-4.3.0 | 1 
                  libv4l-0.8.9 | 1 

Detail of failures
===================

   aarch64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/257a8b9cb43228607610ebaa3c5f5d3e6635fbf2/
    x86_64 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/efe0fcbaa5206770072dd41ba2d4bbade935ecb9/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/fd0b28b8a5b23a8d456dbd22f28af03d4c6bce83/
       sh4 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/38c41e5e6939903c698d76c8194aced9224a0659/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4f04d1492a1c54bc8254f1da8b94a1522734ed1e/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/9cd77392a652e78729b895ffd82aef8889417b34/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/b6a9d56d78a75e38ab7130f46a06773de46372fa/
     avr32 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/1e7ea40a8f8a1bd5d31e29baf331e7b10205e948/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e543c32dc3e90f4bc348a0bedeed6c01041a3d7b/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/ffcae8283aa4cda06f71feb32df9425b87c436c6/
       arm |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/87abd683839927c2a0cd5efcaaf4f5561b8f1e4e/
microblaze |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/60f0af6f6be84a1589cffa79693b7f2e192bd279/
      bfin |               e2fsprogs-1.42.7 | NOK | http://autobuild.buildroot.net/results/9701d8b35228e0570063d61ff6303475d5e6e9a6/
       arc |                   gnupg-1.4.13 | NOK | http://autobuild.buildroot.net/results/f12d7798aede4d0105de6b75f893ee899c523e1b/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/adcc8a495ef7cb95b81d3d09144477b55bea29f7/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/aa2ffd8a862eb31ad6ce8c2c498d725640a763b2/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/fde90dc61fd233464465044526d39c16449803c4/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/653f6d3fef803282678bcf23db8f25020bbce559/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/bb15a8efd7d5cb1508a0a3447e26d6dc46ed3a9a/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/39da9f853a77a6e9cdebf43684842a3232ac755c/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/57db9a002964840da5c00643ca74f5356cfddba5/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/af9cb3c757bc9e98e8b9a8bd5ead931a7fee324d/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/b69623367553ef052e6081500d495df08f8cdc88/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/891b0654415ccb1be156e07c5b6a81799b7c4117/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/519295faa937033f016411784e747ab3ab7dcabe/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/be89d449e254ed532ad23848b97aa943962a89f0/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/4b4ad1aad6962e03c8657c59704233705231b2fc/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/03711f88598e69efc9ce88ce0cc787f3ce3bc315/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/3bd3e3ae4a620dd814e79de7f31956df1af88db1/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/8a4319d6640af4f9184d864e34923613a784e772/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/1d7169b6b468d151eeb7a2498f38903c19ee0cc8/
       arc |                 host-gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/35a171227214d265932c881552673d4b3091b27c/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/12822ef2775c2aa3343e879a0463a29cb27f7a2f/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/d92b53be6b41a30d1eaca2f1f2602d35d3d44df0/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/d152b8fdfc5e760fb000e389d1dfd80dffbebc0b/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/7c53ff846d0ecf586b2b3f1c6004cda28f81e82b/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/859eb26bdf071d1bcb5a66398bb4830434063831/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/a4221745365ee24a2a5cacc70050ca781e90273b/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/719d196d1797e3ab67b037cb54078bba6cb137e5/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/59ea8b39eac1becbc8fa00896a90ecb53d346d8f/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/2fcd701978abd817fab5f3057a83908386d8fab8/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/4672ba4ff04202f3318ece8fdf022eefdcc33533/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/fa17ec74cd99e43cc504d029056dfd14d003f48b/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/7c7c8640a0bb7755fecbfcce8c5cf2dc852d8ade/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/4e99b95afd4df531f595a47522ccdbbdea8db677/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/16ff95df8e99f84ac7f6289a1b06807910b203df/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/99496bd8a735d14495c59c4a278966876b72946e/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/19825a2a7719f253ad3dca74e69d59b05fa93ce4/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/20f9b5ad322116cf136fc35830bbde9bab1d396e/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/c0583750d22ed3d164be473ed5273c5623ffb03c/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/9506c0029aa6e9719cb01858224b3429e0999f77/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/a27219a8d59f7468a5113faa750508c84c601713/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/cd75d243f8d13375790449c2a4b270de304c33d2/
       arc |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/5f2eade9a821bf50a64d08872582855a9315e540/
       arm | make: *** [strace-legal-inf... | NOK | http://autobuild.buildroot.net/results/b61e1775cd1eec83470424e88ced5bd49e0cd469/
    x86_64 | make: *** [strace-legal-inf... | NOK | http://autobuild.buildroot.net/results/5b3140a02bd073b85381642a144555831cafbfc0/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/a3afd2bc5e92ef436a61d42292d4b96eb18cbd0d/
      sh4a | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/de1249c1a0adc41c0bdfaceca236fed275ef7e57/
    xtensa |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/5440c1ddd86e73eaff5f013612999a8daaa19b1e/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/af8e9a80f1f9e9a17c656795273667c76e79ed31/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/d225f9f1e4c72bbbe6edac5e4e9a55cbe090d23e/
       arm |                 pulseaudio-3.0 | NOK | http://autobuild.buildroot.net/results/98fa28da93bb80015b7ef046973f0420471ef9e0/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/37ac462d0bfe3adcf56b06cc94f48e789b9758db/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/cb63e275d3170fc408f1e13381b7b6a4e5f781d2/
      mips |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/6e37db47b065f8500d3de7086698d38b1e4aeb81/
   powerpc |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/c1707d6c59faefb2c8f6a4a181bd24fcb3db35d5/
   powerpc |          shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/dde625835c0fbe7d7fe40550437a72858d579604/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/4d1c62ee65eba6baa9fc401b6b87f593cc1ebdb0/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/d932bc5e347300e6e6148274b6695d5c183e659b/
      i686 |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/2feeea9b3f3d48f77349c7662cabb0c53840dbdc/
    x86_64 |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/13a4ad4622be0c9f395e8c81db2a842b71962f61/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/d30501c79fe7fe9551d93d0994f53955ebe692d1/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/17651017bb951f959c02c5c63c567af624e37291/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/a3a3ae6bb3605e5c9911e5d36c0b5aa86f93f0e9/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/ce23ad53599215db0e0390fe2c118f070866449e/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/d3febf27aa597c83456a3dcb5ea7e52e2dfece99/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/d5b7c0ce71eee78b21603a58981f9488fa7a85c9/


-- 
http://autobuild.buildroot.net
