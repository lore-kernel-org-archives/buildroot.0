From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Jul 2017 08:30:53 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-05
Message-ID: <20170706063053.838B221D5C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-05
================================

      successes : 129
       failures : 103
       timeouts : 3  
          TOTAL : 235

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 24
                       unknown | 12
     toolchain-external-custom | 11
                kvazaar-v1.1.0 | 8 
                    efl-1.19.1 | 3 
          linux-headers-4.11.9 | 3 
linuxptp-97c351cafd7327fd28... | 3 
                pulseaudio-9.0 | 3 
                 sngrep-v1.4.3 | 3 
                  lshw-B.02.18 | 2 
make: *** wait: No child pr... | 2 
make[1]: *** wait: No child... | 2 
           python-pynacl-1.0.1 | 2 
qextserialport-ada321a9ee46... | 2 
            xlib_libXpm-3.5.12 | 2 
              alsa-lib-1.1.4.1 | 1 
    azure-iot-sdk-c-2017-05-05 | 1 
                  cc-tool-0.26 | 1 
                  cppcms-1.0.5 | 1 
                dbus-cpp-0.9.0 | 1 
                    gdb-7.11.1 | 1 
              gettext-0.19.8.1 | 1 
          gst1-validate-1.12.1 | 1 
             gstreamer1-1.12.1 | 1 
                host-mtd-2.0.0 | 1 
                   httping-2.5 | 1 
            libpwquality-1.3.0 | 1 
                  libzip-1.2.0 | 1 
     linux-firmware-legal-info | 1 
               linux-pam-1.3.0 | 1 
          mediastreamer-2.14.0 | 1 
                  nginx-1.12.0 | 1 
              pcsc-lite-1.8.21 | 1 
                      qt-4.8.7 | 1 
         qt5imageformats-5.8.0 | 1 
               qt5script-5.6.2 | 1 
               qt5script-5.8.0 | 1 
           qt5serialport-5.8.0 | 1 
                   strace-4.17 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/ad9688560b332e47b330c3bd42ed925dc4eaabd5 |     
    mips64el |     azure-iot-sdk-c-2017-05-05 | TIM | http://autobuild.buildroot.net/results/dacd1da9c47978d605f6eb2aafa066aa63668322 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4ee5b6cf0efa7458000202489599961d13a70de3 |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/b9f47417aac7513acdc116458b36af430a0e28f8 | ORPH
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/715a914349709aaa8ffbd81aaf84e145403bdf57 |     
        i686 |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/3e468c7b1be376024422e2f06750571f64f433a2 |     
        i686 |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/d4f0b5c6dde57627fb647dd74834ab250a02956b |     
         arm |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/8c629a1c5c4a1d78c8bf09a091a332a424a0f757 |     
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/fe9378a45fd75a9f72013373ab67867826a0aa84 | ORPH
        m68k |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/a6a4039f23a6fbd2bdb5938bcef097a7310452cc | ORPH
         arm |           gst1-validate-1.12.1 | NOK | http://autobuild.buildroot.net/results/b1d277b25243810edc942330bdcb3afa9ea0a786 |     
         arm |              gstreamer1-1.12.1 | NOK | http://autobuild.buildroot.net/results/b4372ef8a1e02555c51886fcb03c115afb732dc7 |     
         arm |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/9e4a06b0ecf036f243140cf86c818c7be3fdb2c2 | ORPH
        m68k |                    httping-2.5 | NOK | http://autobuild.buildroot.net/results/e95e6c27bf8df1233c20c120cfc2a3d80bc73186 |     
 powerpc64le |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/6553b784b4db2a1245d841a88c29f3ba25040ab3 |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/87b022d60b16ff652c4a613f387c1b2b06fdbed1 |     
 powerpc64le |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/486757f04bc73736b64d18c3298216280be897b1 |     
microblazeel |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/dccec701015edbad76686ed7490395a1e0ad6b0c |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/d07bfcb8efcb76cdea3c66e0cc24728f418e3872 |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/7affb0dfc1b5aefc70447b3c697bda566e4a3b0f |     
microblazeel |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/a1b55f33a80d93a857e8180236a3d5fe6d3d62ec |     
 powerpc64le |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/703c45a27fc91ded2405455acc00d0c04904f587 |     
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/3533f1e74fd18a05f42dbd689012928a1c2fd48e |     
         arm |                   libzip-1.2.0 | NOK | http://autobuild.buildroot.net/results/7922e74a0aef9f160e350f3e5597d98e043d197c |     
         arc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/3a0233f24f0fc643a36ffff10cd725e326009fca |     
      xtensa |           linux-headers-4.11.9 | NOK | http://autobuild.buildroot.net/results/95dffb773a06c7dd7fc8a29142158a159a3ded2a | ORPH
microblazeel |           linux-headers-4.11.9 | NOK | http://autobuild.buildroot.net/results/bfd217918deb582e1df0fb0e5e7c6c36b22e1c22 | ORPH
microblazeel |           linux-headers-4.11.9 | NOK | http://autobuild.buildroot.net/results/d2b745d07101f9a80f3f01ae05cbc508bd5f8365 | ORPH
     powerpc |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/87209fba8c1838bbf3f171434f5061f70cc355c1 | ORPH
     powerpc | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/28e7986bf14ab2df2280c7521186a534fef0c30b |     
         arc | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/868508304a9debe1d276d50cb34f6227d4221ebc |     
        m68k | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/36470db2c262d2e1fda5144a08cfe221831e093e |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/339cdfc9bf43359b489ee7a98a0c57acf603b1f1 |     
 powerpc64le |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/dea7f44eb479c4946c2f636b276c139ca0c99d64 |     
         arc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/a40ac7dfea98b88fb90f48d53f8c05efa988a6dd |     
     powerpc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/5a21fdb6bd6d8bb3995af76d41c7be185c119dd3 |     
     powerpc | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/2307d62b3c62f4a25d3d1fe0c99805701a84ccbc |     
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/394bed656bbcef7ddd66a0a4543302f3074e9619 |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/813e3187b0c4ee323b54e68d40bdf62677f7c986 | ORPH
       nios2 |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/3d1002c345dac4513da3ab0aa45ce1dc9797e99c |     
         arc |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/67f8f56d41245158cbab52197c10ebd5e6614863 | ORPH
       nios2 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/b69c347e2866a97cc2c5d4844d567c4448592d72 | ORPH
         arm |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/09c5cba1f17dba005b65bde252661cb7da7ae46f | ORPH
      xtensa |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/b63fd204fe36200ed5de70fff23cb59cf2bc778c | ORPH
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0f09c127c7e2c53f8acad2b3da6b05144bf976b4 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6e9f30c2b1c5721c3fb2a47f4d0b4ee3e2cf471d |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/57079023aea13152290de2f2028dced46daed35f |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/83d82aeb0b7785c87b5c2f5d296babf48a18f3f6 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/68292a8ad0711a293872cc1e8d6373c1a875cba1 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5ff29328b3a61018e1e638afe76c0073f5eaeff8 |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/92917e27085d8a14160ef2d65d58cda2e46d0b36 |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/46a96c89219ed6893fc53d23d8ed39867266aec7 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/30705003bc3f56be0ca99014be8e7e16325eb467 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e1c57dcd11ac6fe545c59dce090ac063c53344bf |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/57c82e87ca415ce11971ecd45d8c33b10dc768a8 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/823d047c9252b41eba319dd00b3e906e66a95715 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/45f69c037cc5b4d8f808f9e9f37a8ac2aa4f0437 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c216fb0298bac093b2cdb129996bbcbcf0a6e18d |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d8b6fe2d714718d8e336efb448de04384966c238 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6999eba2e6a49689aef315e0abf84d400e11cd20 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b6ac9f7abd4af601edff146e8e449ab3ca2b7bdb |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/891b3e1b8b312346391a05646402bbbad42453e5 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6505078235cead867b6e73663e739e0aa294a52e |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/61af9ba8405dbebeeaa5e273d1b6d81dfd3c2783 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8268478d0dd0af84d9270d2dee4f14d0596df56a |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/93d368de75d14ccba0815171eb4088a4b1c1b342 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1336bbd1e54ba72f1d294f82a487026aedac486c |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/35c04dfae80a4502103e2365a48d2e5ebdf5ee68 |     
      x86_64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/3ccf41901ef31bcd3266c8b843161550318b665a |     
         arm |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/710541a4688cb7d74fb993a11b42a02d24af9504 |     
      xtensa | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/a1a9eeb7fec07a2f9f0d05e6c1900ad7cffb6656 |     
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/1aa6aaee1b37960f15a5d77f922c40bfbbe35d44 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/032e950d17c4386f5c4bd63e31a475382d3a19c9 | ORPH
         sh4 |          qt5imageformats-5.8.0 | NOK | http://autobuild.buildroot.net/results/e15fe9587c4b99ecbc38e01c41b6d5530b82bbad |     
         arm |                qt5script-5.6.2 | NOK | http://autobuild.buildroot.net/results/833cbc2d163bc35a7e2808098bdc2bffc46b85fd |     
        i686 |                qt5script-5.8.0 | NOK | http://autobuild.buildroot.net/results/0ae9c0a041d0541ee741b68dc5a6c445aeb15bf3 |     
      x86_64 |            qt5serialport-5.8.0 | NOK | http://autobuild.buildroot.net/results/33eb7b7ef7d232bed2432d1d44fd80a4fc8c4e2d |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/c4f9c72313be0241c166cd8066e2db47c7810ea1 |     
         arc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/d69a05913dbb898dc5bd8e77fe0ddac896cd4919 |     
      xtensa |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/526658ed21943071082d969a38d1fd7e66c7e78e |     
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/d1b933bed2c2903dde89b997ec55f06fbdd29b29 | ORPH
      x86_64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/2f7ece7d40897db315dcb4724c2feb3442757ad3 |     
        i586 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/00f7ef6904430eb2b885bdfaa281e6dbded4d3e6 |     
        i586 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/202007b8194c458101d91bcf931fb1d5b439c77c |     
      x86_64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/734f5a9237f7eca35cfff9a0826feadb720f15a2 |     
         arm |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/ce80264575918a8f71d9eab1091c21df85b65b1a |     
        i586 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/b09054c1db4395c9fa2e95c79d7ee30031a3e50c |     
        i586 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/5813c75f9bd1beb2a4f0e44b38c9bd4b2722c597 |     
      x86_64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/d0b3a5e08c52b24df363bf586e6f30c124236fd1 |     
        i586 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/27aa5c3a7ffa05a92ca14754c76611cde81d8d49 |     
        i586 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/7ab19b51d31d34e7ababa07c4c3af1a9a6a03329 |     
        i586 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/910da35204d6260ba3b61f09df744b3267e84e38 |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/574e3169b9a6a3dd5d083142195467b20c7bc788 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/1b6b8f5c8e164c14caa08734266d9989fbdf790d |     
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/17c1a1b06a616f30d8334354811bf3e85af9e51a |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/eaeb2b2d6b5d9dea69c6e55c4e8bb41832284478 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/9c46031685a63af703fb7a8eda206b6bbd15b859 |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/98003efaea63ef3fa3fff9dd2b4264fcdadf5740 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/5c88c1ca9589afc97734aa2e1e0698a6b90b47f4 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/e2c82da71d629581680dc8be14d866f59401db4a |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/13b63984110425450798c02ce8d1597caa6b2f68 |     
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/36c0647beb0119dcc5c4be050f44893969e9bb0b |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/1719a63ff257f13634a06a14327abfb327984101 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/93ccb48e6fff5571b49632dd9589025b3b797f82 |     
         arm |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/f77f0d3d0cf4d84de6dfe5aa6e58e6284b9f79a1 |     
      xtensa |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/7ca771e3e6922b12b4aa52bf9e04f067fe58ce66 |     

-- 
http://autobuild.buildroot.net
