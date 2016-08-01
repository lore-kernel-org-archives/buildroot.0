From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 Aug 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-31
Message-ID: <20160801063032.61BBF10277E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-31
===============================

        success : 179
       failures : 115
       timeouts : 2  
          TOTAL : 296

Classification of failures by reason
====================================

      host-uboot-tools-2016.07 | 9 
am33x-cm3-11107db2f1e9e58ee... | 5 
               libcap-ng-0.7.7 | 5 
                  multicat-2.1 | 4 
               host-gdb-7.10.1 | 4 
kmsxx-a706f157b86e906968080... | 3 
openblas-f04af36ad0e85b64f1... | 3 
    xserver_xorg-server-1.18.4 | 3 
                   taskd-1.1.0 | 3 
               linux-pam-1.2.1 | 3 
                   strace-4.12 | 3 
             bluez_utils-4.101 | 3 
              lirc-tools-0.9.4 | 2 
                    cups-2.1.4 | 2 
           argp-standalone-1.3 | 2 
                 libunwind-1.1 | 2 
                     eudev-3.2 | 2 
               tinycbor-v0.3.1 | 2 
           igd2-for-linux-v1.1 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                    owfs-3.1p1 | 2 
                    mpv-0.18.1 | 2 
                    lftp-4.7.3 | 2 
               libdvdnav-5.0.3 | 2 
                  openjpeg-2.1 | 1 
                     php-7.0.9 | 1 
sconeserver-bbb384404575f8a... | 1 
                openmpi-1.10.2 | 1 
                   assimp-v3.2 | 1 
                wavemon-v0.8.0 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
inotify-tools-1df9af4d6cd0f... | 1 
             stress-ng-0.06.02 | 1 
              libdvdread-5.0.3 | 1 
zbar-854a5d97059e395807091a... | 1 
                   ushare-1.1a | 1 
                 clapack-3.2.1 | 1 
                pinentry-0.9.4 | 1 
                acpitool-0.5.1 | 1 
                poppler-0.32.0 | 1 
                 opencv-2.4.13 | 1 
               openipmi-2.0.21 | 1 
                    qemu-2.6.0 | 1 
                 ibrdtnd-1.0.1 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
               logrotate-3.9.2 | 1 
               libepoxy-v1.3.1 | 1 
              kodi-16.1-Jarvis | 1 
uemacs-8841922689769960fa07... | 1 
                 opencv3-3.1.0 | 1 
android-tools-4.2.2+git2013... | 1 
                 xenomai-2.6.4 | 1 
                  fbterm-1.7.0 | 1 
             transmission-2.92 | 1 
triggerhappy-7e5abc69f21567... | 1 
                  iozone-3_446 | 1 
           libvncserver-0.9.10 | 1 
                  cairo-1.14.6 | 1 
mmc-utils-d0b46442b50794217... | 1 
                bellagio-0.9.3 | 1 
                wayland-1.11.0 | 1 
                   ncurses-5.9 | 1 
linux-firmware-b0668886def6... | 1 
                   dante-1.4.1 | 1 
                 lvm2-2.02.162 | 1 
                   fwup-v0.8.0 | 1 
             ntfs-3g-2016.2.22 | 1 
                  snmppp-3.3.5 | 1 
                openssl-1.0.2h | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/1481bbcc0faf10f06b1408ca232da4dfcc136fd0/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/3d4241f39fd132d318f26d035b8f272425f4b357/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/8030f01832fba63b5cf84e7c7296c4f3f89b8905/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/812cb150813854bed8b9d61ce6d1389ec1968382/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/a22a513a4f70a0d74cae4962eacb8dbfa7bc0bd9/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/11d28b63019030cb3663f89d21220fa28a37dc68/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8f907041dda0637b37f23ed96347df6883abec18/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/e88711398a307dc9e06de10f209d46df24ed16c3/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f61dc3477be8bd1d31d679055b6e11b2f744c22a/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/29ce18c08a0a70d9c0c474e332e41317b5cc4aa5/
        bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/102ffc8d792fb383fe3e0923f999acca3038e98c/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/f795cf1cbdcdd63a41b8e9b0aca88df159772c24/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8c7dc4f41a6143d8891b31ac48269d8537814455/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b9479d797e839fc5dce874dae3dba0af0d9b8253/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/780ca22d7b36eaa8782bae4cdea4e969feb9e66c/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/6c15e57fcb7fa4103936b752706903741a4c4512/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/b5427951f31c02c3c1eeb8dfbf3e48347e68947c/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/77c017b59098a8ceec91bc96a9dad99aea44cda9/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/8818f98814fb80711722e642618af0dab1ec5720/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/69e65227c4f63e0ed911df9bc44450bdc0a1bd27/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/00abce5363274967d0161edc952e80b2c5ccf29c/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/61e69070c9897a8e1a43cac92bce1a4029a480f9/
         arc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/34e558e62c7d3bd1e7fbf5f5f9f7ce9bceaed1be/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f821af5e620d5a28581e0b79ca88e6362e1d4f01/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b825a4e36386038425994c0138f2b7fdc0ea28b6/
        sh4a |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/531aedc5fc006b3648b5ac8b30fb828da7a8f1ad/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/e3227c75164026d2bed5f42dd427e286d3570403/
        sh4a |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/da6aa436e642fbe14b61832f7997a5813c8eab2b/
      mipsel |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/c6fdcdca13a17ccc12c1fb5f8446b9bf5e336fff/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/bdd3ad9fef302ed5041846479889d830f707ba3a/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/6a5c02da338dce2723b91e784184c7742b4d2c0e/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/3dd6e0fdf9bf1f5e2f48a588ecba6a5cf33c3da3/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/fe367d98f89d8a9b67c30b9135d716abbf7d74fc/
      mipsel |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/8aa004cc965bc40d6bb98f5838c81d04e0807ed3/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/ea49598c051521472eefd6ba681f2c28e345e30c/
       nios2 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/0c5c5889b1086b4b3bbce16392606c0ded442ba4/
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/2e3d1e57476db11c50574ad457aa1cfc9b828a47/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/c9e146512284563080ac780941fa74607d6852b9/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/fd9e678af4c4816359e2ecd8c0934b6838cf9d93/
         arm | inotify-tools-1df9af4d6cd0f... | NOK | http://autobuild.buildroot.net/results/5e06d9b4e8fe9de24bb484b11c65256cd4b3ad04/
        m68k |                   iozone-3_446 | NOK | http://autobuild.buildroot.net/results/3960f0eda0199c2285224fd08e0237033281f3a5/
      xtensa |       kismet-Kismet-2014-02-R1 | TIM | http://autobuild.buildroot.net/results/dd3e8306d8ff03be87e731cce8672114e780bd61/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/c140b851a089d24d3b25974e62dcb995172ca98c/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/bb3840f14382b6ed77d5947eb3ac5c229286681e/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/d2b8e7d04f59ba6516dea0957b97415ec5ee52c0/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/0c47e1db67cc26492aecfca6679fc77869387b71/
         arm |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/a9f4c510c00f391a6314672369c7d015cfd3e24c/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/779846d7b4ec426ff6d10219ceb74b0eb2977a73/
      xtensa |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/0c1e4dee4b203e573a8a8292e0aed117b5e29b96/
         arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/bbde05f4a1b096e959fe29d7aff023df878ae8ec/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/c248346460f027eb820bf01f1ac14f0e6a64d2b6/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/d4fc1e72e75a5504d7000d94cb2218f01aea333d/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/740380ca726c4acdc5c3ad34811877f161835977/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/aba52693a9735eafacfbccf53a1828441c04d8cb/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/3a205aa5a50857c9b0b134c54a7850accc9ca285/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/9336e62ba5f06276ee9bdd7c67c0c7eba1cbecc2/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/4a5b7c7cfebd2bacdbc6d28a65880e893bada78f/
         arm |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/b9990dc8f3a103805279cc618cd08e651bfa71fc/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/9521cf3a5dccdac1d9a3079d13ba67c59c54e0e4/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/efc493ca5bc39b027f192a26f74ced1255c4caf2/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/cea5732b368a3cce818f092b537006584d093e49/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/277532107dd5758d5ef8c071237fd82cf1c608aa/
      xtensa | linux-firmware-b0668886def6... | NOK | http://autobuild.buildroot.net/results/c796276ddc95e0ee51c4da8469f48f0f185c596f/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/ce9b181e8aab94a092d6026a5db5340ea52e78be/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/9a945679582c981f8fc836f9d1534c077db3ee9d/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/237a3017a3a185569f7e6f5be15655e6abc3831d/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/ccb52c3bf84d2dab6925a6adbe167ca9bbbaf3c0/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/d7233a07ebadd7427538eabb98db1d343c545542/
       nios2 |                logrotate-3.9.2 | TIM | http://autobuild.buildroot.net/results/d951d3bcbb9ec0b397ef1a7bdf21d235f6444900/
        i586 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/ac62a27d14dc1ced3ac58bd09f085ac7f90eb818/
         arm | mmc-utils-d0b46442b50794217... | NOK | http://autobuild.buildroot.net/results/ffc332089174b4eb3211986fba44fedeb3b2a978/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/e6d383ea4d72cce95ca9aa2cb4c49f73fd55e48e/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/d5c625d438943dab5a33f404b32844472f1c494f/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/206ec6cf7b272b5869a0bd22c2b06c15584e3dc7/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/58fa75a93ec004a477e31469c77824897f521c79/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/6fb5b161b34a80d3f780694062991917d8827642/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/26de6183f6ffe1935f6f4a50d3f352de76d7a055/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/14065d5f15304e9b10d25b57c83dcb64f6369f5d/
        i586 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/ed3709baae53e5b37238311befd34e3f95cdce4a/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/88024d4ec4c27bd2d5a4ffb2783665e2dc481764/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/746fade2f43af73bb8d9b5cf3ea5d30694be2c66/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/03026c4057c835c36737209fceda238b2b8a8a97/
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/adfd14608350cd49ec80274089f95fbee4163820/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/7a6d4c72886ae555d8fe4b017e41544b2c8aa082/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/6526df6053644a8f91375a37f85faa53083e31af/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/fee0cc59c640fd7c9eac5ec8dea1b877ee15646b/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/dbd319f7ffe9f72800e7d7a83aba7425e23451f1/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/a678ad5ba95c30b56e8a99c8fa1305e6f45d1c61/
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/67ea54e8b93f4c934008cbe011ab70dde9983ecc/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/02792b48d5eca12167b7fbbf54a58bfa98af1f18/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/f4362511ea18b05939e75a0e76374a3dee1e53cd/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/a097e58bee8d4768d5a70127134b8f78ba4b37e8/
        bfin |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/dcef429090d2c5a596894d3dc11c9b2dc26d1b40/
        i586 |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/09f0bb496d409f4b6399843c6469e721ff2124f0/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/958a03eb96e2992da4f4701db58e9db5d3357d5b/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/525257ca09524bb2a0aeb609bd4675f542ee0eab/
      xtensa |                    strace-4.12 | NOK | http://autobuild.buildroot.net/results/4ad1b0c42206243bd76e94b34454d4108fb31070/
         arm |                    strace-4.12 | NOK | http://autobuild.buildroot.net/results/aa6badae8b3d58d6d48161f261988103271bc2ef/
microblazeel |                    strace-4.12 | NOK | http://autobuild.buildroot.net/results/1c6c88a7163529a666d1661969736f66e9aba7f7/
        i686 |              stress-ng-0.06.02 | NOK | http://autobuild.buildroot.net/results/46ad0fcbc086a9d969438e6d2199a0939c8c1fcb/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/3ead83133e78cb9abba3ad48c0ed9e677f7a9c04/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/6b0c4eba8ce0da0a91944a581ef75fb10abe7cf8/
      xtensa |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/fb7c995c851654ddc3b71c3e968afa2894b8a78e/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/74c6713e868112a76f6adfc08b287d4ef3318e96/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/c96134add5570a41ae61911c290e0e5d143d5e44/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/ce4eefdc3c8918f587843c11231b6d004951354e/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/15b1c452a1f5cba7286ece633b39def8b65c0df1/
      xtensa | triggerhappy-7e5abc69f21567... | NOK | http://autobuild.buildroot.net/results/3d07de291ec64a16d03e10f0cf1faeb19d546412/
    mips64el | uemacs-8841922689769960fa07... | NOK | http://autobuild.buildroot.net/results/0e6257c05a127b0288febd75a27ed83f8f68e008/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/cc5f3a896f5a22e57693001491e5d56230c5b42a/
microblazeel |                 wavemon-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2e1a31e80aa3b03e45db80a19be76b67bb6b04e3/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/f373ee7a872aa6e1e79e614e7be845897e1d01e0/
      x86_64 |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/e36a21c1df33bdd3fbc61d516a3e8f7c5f7c41af/
     aarch64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/44aaae6af6703308b718bb31224ef0f4ab24465e/
      x86_64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/2d38637e7904f3e382e41745a82ee1a1cf19ba71/
      mipsel |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/dacbbef965e73d98bb6acc1c86b6c80268372479/
     powerpc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/4cbe6cca5b53c6ca565cc7c28ab9dffd4cc1fdf0/


-- 
http://autobuild.buildroot.net
