From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Sep 2020 07:12:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-17
Message-ID: <20200918071236.AE02587526@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  | 12  |  0  | 31  |
  2020.05.x  | 26  | 18  |  0  | 44  |
  2020.08.x  | 28  |  9  |  0  | 37  |
    master   | 116 | 126 |  0  | 242 |

Classification of failures by reason for master
-----------------------------------------------

               ipmitool-1.8.18 | 21
                libpfm4-4.11.0 | 15
                       unknown | 6 
                  boost-1.74.0 | 5 
 Makefile:752: target-finalize | 5 
                   guile-3.0.4 | 4 
                       iwd-1.9 | 4 
              asterisk-16.10.0 | 3 
            ghostscript-9.53.0 | 3 
                 gnuplot-5.4.0 | 3 
              host-guile-3.0.4 | 3 
host-meson-tools-0a02e2d344... | 3 
                  luajit-2.1.2 | 3 
                qt5base-5.15.0 | 3 
               apparmor-2.13.4 | 2 
              bitcoin-0.19.0.1 | 2 
                   dav1d-0.7.1 | 2 
             kismet-2016-07-R1 | 2 
         libcpprestsdk-2.10.16 | 2 
            live555-2020.06.25 | 2 
                  ndisc6-1.0.4 | 2 
pistache-f2f5a50fbfb5b8ef6c... | 2 
            qt5location-5.15.0 | 2 
                 uclibc-1.0.35 | 2 
                  uhd-3.15.0.0 | 2 
             babeltrace2-2.0.3 | 1 
               capnproto-0.8.0 | 1 
                   ccrypt-1.11 | 1 
                   enet-1.3.14 | 1 
                 fwts-19.09.00 | 1 
                      gd-2.2.5 | 1 
   gdb-arc-2020.03-release-gdb | 1 
              gnuradio-3.8.1.0 | 1 
                harfbuzz-2.7.2 | 1 
              host-grpc-1.31.0 | 1 
                   libcap-2.42 | 1 
                  libmnl-1.0.4 | 1 
                   libnl-3.5.0 | 1 
                    mpv-0.29.1 | 1 
                   ncurses-6.1 | 1 
                 opencv3-3.4.9 | 1 
               protobuf-3.12.4 | 1 
       python-matplotlib-3.0.3 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                 systemd-246.5 | 1 
               target-finalize | 1 
             xscreensaver-5.43 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/6d0ca83da5d96b08bd81928b8d003634e5c2d00e |     
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/6c80e1f913c62f72f79176c00456747a15dd78b3 |     
   xtensa    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/9c291e0effab08ac9b7c7483f7d622802257bbd7 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/033a8dece2e5841d12a4e461e20b4e7bcb29f94f |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/06737cc9323e3058a683a0448c2b6acf867a8638 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/5d59ab79ccd4a9e741f151ad1d54f77983562ab2 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/e38caa72958481dd09bea44ad6bb4d87be7eb5c0 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/4cbe3566613f95788c3cd636f851ab655cfabb23 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c9349c9b552f0051b0d0b6e2d162fc62625c0a9f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/332fe876ccd35d7e76b1b388a571d9222c17bfb8 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/8be8e6ee3727db598f3c5ee2f63cf31ee49d2fd8 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/a64f2a644032d83b25bbdbcd915cf23d4c9f2830 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d1d5c6e19c1dbb9a9cbba4ceef9325d57c3cd842 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/985c66efc1797759543a97ef48f0b732da3b11f1 |     
    arm      |          ccrypt-1.11           | NOK | http://autobuild.buildroot.net/results/ac2d81606137e4788d23abdc180baa3c6a3732d9 |     
    i586     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/738ed309784a4a02be8d163ee5016c7fed2246aa |     
    i586     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/6d79d1382797c344d43a74179d102d0a98568ab8 |     
    arm      |          enet-1.3.14           | NOK | http://autobuild.buildroot.net/results/ab8692d994cee60a654a22579ce78312880d0acb |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/c5ecfc1ae335d28e45d6e0bedbac9632547b31be |     
    arm      |            gd-2.2.5            | NOK | http://autobuild.buildroot.net/results/cbbb8177885c507348d792b2c5c818c44fe33d92 | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/6bebf2c303e80aed6d9e2198579f33cf781877e2 | ORPH
   mipsel    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/d5c708715a4d6dde72f37a44d0f49b2711aabd97 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/78a3a8d89d09559b97e803d1f1032dba0d04eab4 |     
 powerpc64   |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/a50a3b5ee286ed89daad9e64bdde80dc2110a779 |     
    arc      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/5af5d678895e19ffcd82160c5e5a35277ad14a83 |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/dc61ab88235cdd0e0f7c3e93cd4edf1f1c8de2b2 |     
   nios2     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/19b8c06c79a3de8dc6eeddb17c51ad4e43ee06b8 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/9a60e7e08b2c61da2166435d05a6330da70cbf8a |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/8f82a7e63957f2a760aca791a2e7d947f2dcf0e0 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/0ad2dbfda2278f512ce26c16da0db2ebf9e73cec | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/c299dfb6c64eb9f9aad27d38265427011a6dd3bb | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/25b474b6af56226a64105525c82c6a7eee55cd94 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/d68c9cf89571c55e0d7b3a896eff5ec63e36594f | ORPH
    i686     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/9f9738851e38ec4fa386c698fefc11fc661d0fd9 |     
    i686     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/480c0692543721d9891a249906dd7617fa8bb1f5 | ORPH
    i686     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/ce5021849e7c9e20f5d3dbc3c924a6b98ec0b44b | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/c3328c1b77c93e169e7a34fef634051c23b76938 | ORPH
  aarch64    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/cbf522c76bfcc3022680697778415103efffd57f |     
  aarch64    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/9db83310d15ed6124198e3c918389f66db70a719 |     
  powerpc    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/edb84e0df7b66ef62b000a8081f38f0b29b28f09 |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/148861e7beb3f7e2b8daa3415466f1bf782e5336 |     
  aarch64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/37ce47c6b13362d6cd593d24cc73e15afbe77da6 |     
  aarch64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/886de3616655fc3a7c14553064a05b146b579d34 |     
   x86_64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/7e01818987bf0c35d589d5894c7d2e60adcca02d |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/63281c1e8b1a2c02bcda2ff97a6f68021d4536e0 |     
  aarch64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/335ec369a582a71ad4ec3f1e0bd269768207789d |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/0e9da1473fca4b52f222683a68200044d6a29462 |     
   mipsel    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/a392032cd92b3e8f7f8b1884212af8ab3975571d |     
   mipsel    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/9d0d07bb9bf37ea7d434708ca049fe5a36c1aadd |     
  powerpc    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/a91ade14d6942687094c9639864cdda84a2fea03 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/3bed768cded00047b902163aad06ae1c58d82900 |     
  aarch64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/ee3465c3ad1148cc92a482febe2bb2e96caf2d99 |     
  riscv64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/b25284e61606ad9aa329cf6a97f3ae5ad3ed9e9d |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/c843e86e3c965f0dfe2b8fd06de9bba3ea81c3c3 |     
   x86_64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/fb492cb84fb4ec4ac44fa40415b77961c7b25afe |     
    i586     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/d62e9ee734a4cc0e35c2c73913d78691d93f015c |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/187b769e989cf1809429b24c833cdcaced786871 |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/2c814f78186d87314c36f380f0d94a89be03efe1 |     
   x86_64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/5ec63dfd4329fa766ead124aa27d559fde72cc6f |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/b0b20d1eb8fe33fbe5b908a192a25899f06b52bf |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/83c4fd29d97ac35033711ace0942105fd5e03486 |     
   mipsel    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/a1af96b7e4fbda09c0205a344360350161da163d |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/74d851f16d4bc3935d92f1b8d597ef40618f04db |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/1a397f527660d0cedb3ea117e81eb6dba0609c3f |     
    arm      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/7e4f05679f5b1ccf65b4922ce4dc352d42dc968e |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/2a0819180991bc679cd354eb7a7bb94ab1952b4f | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/f66e2be021161128f8485802ee51df669dc1ffc6 | ORPH
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/c6ee5ac1febe3adce020321049ba6cbac0b96e22 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/a333c89ca6fcb501d995b55ae246f79377539e8b |     
 aarch64_be  |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/6fe1fbe5d14cefff1131793890155fb1ed7ac9ea |     
    arm      |          libmnl-1.0.4          | NOK | http://autobuild.buildroot.net/results/866e3cbd699d12713cae06ff05e8f6819b586b71 | ORPH
  aarch64    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/cf258564758673e9aa02607fdeddbbf63b8fdb29 | ORPH
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/d608fe27beee79713a50f85efc92a7f2ce8f498b |     
  riscv64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/218ef590eedbe71260b2ae52bf8a5debe4eebd5f |     
  aarch64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/7b05ee2c3830230ff4dc5216e80ccdc0a0f2cd20 |     
    i586     |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/291c88b6750212e9c867abc7892fc66aed31ba6d |     
   nios2     |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/475ed66432dab56ef7dd0ba2d0a4f1886bbec8bd |     
    sh4      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/3cfc2843ecccef5e4363e60a896b81a2f9482e2d |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/eec8a50160879fc13c49673057ea485c120c999e |     
  powerpc    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/7a80935d1819140b5944414e5683faab3473a32d |     
  mips64el   |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/c5028b23e916ad74cc4b7856c8f6b7ef31734458 |     
microblazeel |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/429bcc8df261541ce882d6f4e366e6888372ad14 |     
   mipsel    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/6e4f264c4cfc04fff05c6212fe69727cf8cb33af |     
 powerpc64   |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/86000e506d1be7b1543c0fcc469e1b6dbd061b9a |     
  aarch64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/d743d34b80e728f4679436d09f90882adc3064a0 |     
  aarch64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/e3288bb02f7ed65daa9507881f50dee273805414 |     
   mipsel    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/d7ed344f77bb4ca8ec613a12842eccafd2a17877 |     
  powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/1bc370bcdc4462d15404eeed06dd5fb8c69124af | ORPH
  powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/031aa80ef66e56b897eebfb19bc8c6cdb7c39fee | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/89abdd31d15ad8d74dc181b10152b285b0f46c23 |     
    i586     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/ce7f31ed3d555856c8305f3dd8a49b66f9c00b2e |     
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/b13065c997702df38e0b408e330d9985187f1961 |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/c5a4b5b1a72f911cc79f3f3a6dd0c7d647b281dd |     
  mips64el   | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/9d14ed693e29dc185e8c706ae4bdcac5285682cf |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/07cc5cbf6f560e4fa91231b3604076ad2bc16a82 |     
  powerpc    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/aa792e83dd20d2ff4a45693a431ad7cbc8e20182 |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/0347fc9de1ee183aae7c9e3e859e09d69bfa5254 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/42e2dada6f55f0bbe96d55de59a8f80542643e65 |     
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/843144c2238418c858f9219b517b0ff7851c01c7 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f32e8d84482e8b5cd186ffd9c3f6bf1a938cde66 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3ea379316a7e874f849a81f25a371fd4bb92b965 | ORPH
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/a8cc8b9c50c29260fcdaa9badeecf2415542d884 |     
    i586     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/2f9ba216af6b2e3413203e0146bac7c53f98da7a | ORPH
    i586     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/0e4084ec9e49004ddb217454807b5e7ddf562daf | ORPH
  riscv64    |        protobuf-3.12.4         | NOK | http://autobuild.buildroot.net/results/59c305088a0b5093e98e0f65c21d28d1da4164b9 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/4b0c4266b8d68095723cbba3c1d3ff927a79e9bc |     
    mips     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/3d95ac93b87458b8d6c655c272e9005e6e6432bf |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/1c8d65c627422357a0ef456c88f533e87d22e1e1 |     
    mips     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/5d66c1e23206e2bf57a85120cf4415d11e4d2213 |     
    arm      |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/ddb25ebb591ed6029a7bd4934464171358553936 |     
    arm      |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/ddda7cdb9400f6ca7d548e9b5ada18674fbe42e0 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/925d10d0e82ca98a4823b2b99a2d969e9cdc8f6d |     
    mips     |         systemd-246.5          | NOK | http://autobuild.buildroot.net/results/ae011492ca4c4a65783fd61c15beaae6fb8f3a14 |     
   mipsel    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/9a52919e521dec4c28b6ed9655f7030d0af7f1e3 |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/9aa0bfed8358625dd760168fae3b7b6b6711964d |     
  powerpc    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/c4d97ec4a4994ee21082427d01dada6ecd752340 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/fef7c2a1aa7414cc0bb6adad8cda2df6024b57ae |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/5b0b4f4e95c297976e856f8cf402b1610395cdf9 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/606a313e0dba4bdd0cfc4af17c4f743a9941c607 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/8f1bc651574c34a4165ddeb49e0e149dd11df67a |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/7a15c06e9318358ec11fd05544cebe40aae1186c |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/41a30e09854318ce155db5ff1f98516606636972 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/2fda8a4512cc63adcd6a048e1801ba08a4fdfcd3 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/94eecd24e9dd479bc13ae374f65b50db115e3d5d |     
    arm      |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/893073fc47d35bf1319c6488ff7e7d6328f97dff |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/44b9343f14a3bfe329bf5d53a95219673937e0ab |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               ipmitool-1.8.18 | 7 
                       unknown | 2 
                  luajit-2.1.2 | 1 
 Makefile:753: target-finalize | 1 
              openjdk-13.0.2+8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/06ea38f68b1e1f108bc204c265ce90076afc842f |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/8e5b429e4d5ae8421795ccb2f9dca4abf03a9880 |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/1c0c16ae3cf40c42460c7fcf62b246f395e3fc47 |     
 powerpc64   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/24e7cf4e15c55ecac4af926cba96c45b5ba50b3e |     
  sparc64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/c99f069fcf91ed53eec68c8fdc52ee4748b96183 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/7f8f226e7901a1bc46e85e9abb36bae778a51012 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/dd934d62905ef5449ec6bbf612ee6158fdd02cc0 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/02c5e0ace083c066487f40411d28aeb6945fcc58 |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/79a4f46ae348e0c47aaf4d48f5b93dde0777050a |     
  aarch64    |        openjdk-13.0.2+8        | NOK | http://autobuild.buildroot.net/results/29290d73948f1c2b2db0473a42f3259239ff9138 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/bdb2cf465cc7f330b5833b2a8a2ca3d03636a75c |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/64e0d10547f414572e5dee4a3b92094b262243bd |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               ipmitool-1.8.18 | 4 
            ghostscript-9.53.0 | 3 
 Makefile:753: target-finalize | 2 
               apparmor-2.13.4 | 1 
              bitcoin-0.19.0.1 | 1 
                coreutils-8.32 | 1 
              luabitop-1.0.2-1 | 1 
                  luajit-2.1.2 | 1 
                qt5base-5.14.2 | 1 
               target-finalize | 1 
         uvw-2.5.0_libuv-v1.37 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/07752ac05fac25ec09add80ebda39bf3b05ce266 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/b04bd8671d94503d02e3c578aca39b8bbe38ff12 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/041c5cc6a736d6532ada1bc6954e9c517562ac49 | ORPH
microblazeel |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/29979ffc18e63a4b9b8fc6a00f406d59d2dbea66 |     
   x86_64    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/e6d00fb8328421e04b608d0eed421f641ec19a4a |     
microblazeel |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/f0dfc69570ee2f8ceafcc45139931cefc3adf049 |     
   nios2     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/612132fa709255da257a114789cb8e9adede96ae |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/e9a58517db321003b9b40ea1a73deda621f75ee6 |     
  nds32le    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/191eef51099b95822e407dc32535feac51205491 |     
   nios2     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/1022ea2b9dc075c7b55635a2d8dafec8ac273a5e |     
    arm      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/fb47a02aa35266e78ca358f6672f123efac3a7c6 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/5bd114548ecff5872ff53198b51b921c6f5fa67a |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/87eccd09f72afc39c394a43f4ea5ca7e1351d37d |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/902aa39fc696239d9c43cea9854eb2b7ec78a852 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/d2d9a4046730d0a86b02c71002f03d386f066839 |     
   xtensa    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/d5fa8818f47a83dd903eb968adffcce9304a3492 |     
 powerpc64   |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/957bc8102f0b25727023e2ed1e68d3e0d8e8f581 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/eb3aeac70c12ef40542d8f75384060729116e38f |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               ipmitool-1.8.18 | 4 
                     efivar-37 | 1 
                host-gdb-8.2.1 | 1 
               libupnpp-0.19.2 | 1 
 Makefile:752: target-finalize | 1 
              spandsp-20180108 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/aa1a0fe2ee0073268e5ca605300f67ddddd9e0d8 |     
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/3f95db8b46b3ecab95e13cc18a8570dc030bf7dc | ORPH
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/a6e743214458ecb6f3601363b8207fc8561c41f0 |     
    i586     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/4a01faae71abc6efea73ce6efedadf8ba679a192 |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/d9bfcd0388b0b9785fe4950cd7a47a98ad79d5d7 |     
    m68k     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/a681811f978c1d9c6022d22ad997f06c734191d4 |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/242eaec3737053cefdffa967a6ea50afe8785c94 |     
  riscv64    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/a3e5235d8089334b0bee593d6994feb10baa208f |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/ef13caff3d0f5e1628a2e5df6c48d9c641257535 |     



-- 
http://autobuild.buildroot.net
