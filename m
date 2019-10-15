From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 06:16:13 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-14
Message-ID: <20191015061618.6B7AD86FFF@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  1  |  0  | 16  |
  2019.05.x  | 13  |  0  |  0  | 13  |
  2019.08.x  |  8  |  2  |  0  | 10  |
    master   | 108 | 66  |  1  | 175 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                clamav-0.102.0 | 11
                    brltty-6.0 | 8 
             subversion-1.9.12 | 7 
libsvgtiny-ea9d99fc8b231c22... | 6 
                    bird-2.0.6 | 4 
                   dav1d-0.4.0 | 4 
                libgdiplus-5.6 | 3 
                  ffmpeg-4.2.1 | 2 
        ltp-testsuite-20190930 | 2 
                    proj-6.2.0 | 2 
          xlib_libXfont2-2.0.4 | 2 
host-google-breakpad-7515ab... | 1 
             libopenh264-2.0.0 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
           libwebsockets-3.2.0 | 1 
                          llvm | 1 
                   lrzip-0.631 | 1 
                 mesa3d-19.2.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
           policycoreutils-2.9 | 1 
           python-numpy-1.16.4 | 1 
                qt5base-5.12.5 | 1 
                    strace-5.3 | 1 
               target-finalize | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/3dfebf6732e76c3ad38267274a23bbc9e0bbd303 |     
  powerpc    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/89c4d89ee2bc6a5d78b1d5468b6ec3960846ddc8 |     
   x86_64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/2ad21f2454d3284a5df1b58a35f7667563498668 |     
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/46130efae9b14c5849060563c83c96c233e5fa5c |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0934a66b9e7f53fc8a6f429f5ecdb8128e5c5eec |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f1700fb7c8733b1ab6e5cfa4958b6a5d75a85519 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e2a891c7a11535ab2e91e34fae6f666d19d0e27e |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/419fd1e5ac1fc78f1195dc07fe73bc2a9fc2d75a |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4d8505813e1f7e9dea02d4ab45e3459186143dbb |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ad1ea1ed2afe178b5de9df5f372cf2ba08382b15 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b92c61f11478a78fba279f2e09e5aa4da17159ce |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2c0f9a80a67c1daebcf9d9754e49ab5e2f85abd4 |     
  aarch64    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/0f6d4b97abfa00c0851c710ea91c4e26007f3e9f |     
  aarch64    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/daf3fc7eddc6ad0a4de4bfb76d9c8a1e96152489 |     
  aarch64    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/e8b1bd019937f783c051224cfe3e41a58eedf321 |     
  aarch64    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/bc5ad8b880f677d667ed71ba967d680b242f1796 |     
  riscv32    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/6fa25f487d8c2dbe884c27987fb9c0c79f4274b0 |     
  aarch64    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/ac9df55a16636b67c9ce5c9a9655c0439a155cfc |     
   x86_64    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/292ff9776293f0e41244e5d78ebafce0bfd1a166 |     
    or1k     |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/85d645d6294e03a7cc3b65d926712890d30e6290 |     
    arc      |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/ac3de72b7dfab9af46d7b02fa691604dce6168d2 |     
    m68k     |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/137e1b7585b41a8854e1f27c7ce02163df346c2a |     
   mipsel    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/712066d92f426ce88a00c0313896a7705fe4c638 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/c2e5b1d8c59d9ca37f06efc67c0928f7df1096ce |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/dedc44b17e2656292ed9e37b7862976a8e32ea2f |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/de1305da757fc13b16743057169679d3f8a3fee0 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/54a6ffe3bb23f3f8a1c20491c1cbca7f4a9b34a2 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/00b2030903aa23494ebd09ea4e4d322f8fa2b3d9 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/d6ec7c834adf1fca5f79bdfb2543aa45882ce58a |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/189ed675df5d00a1110dc78e46b9039214096b46 |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/18c0d162f634f107580a13119a19aa479483ac81 |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/b6f82e863a609b1eb9fb14cd4d2fdbac7de4e8a8 |     
  powerpc    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/ab9d6b83f92639e86e6d3eec02913c5488f9b87a |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/54cc6abb2e8ad5371f79f1b91f34202b8360f3af |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/9871461a788a30a274f88683bacb28b38922c44d |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/fef399b492909464bb8b57af244aefa6f904d8d3 |     
  riscv64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/e0dffee9cda981d40fc6225956a9f64f523d7fab | ORPH
 aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/fe157aa72cb12f5ad02d2760cc2ea48f72830849 | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/00b6f58a46d289fe2d660b4c30234cf93a645c5e | ORPH
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/51be63089209d38c2cf29b0e0b08f73a0e15c467 | ORPH
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/c4ad0698db5688d1c40bb69c4b647a4671864589 | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/1e89d26d3c3fd0ebcec8c69da72e0c41b65ca535 | ORPH
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/6f31c26964155a3d6c434bfb313b8a52423fcfa2 |     
    arm      |              llvm              | TIM | http://autobuild.buildroot.net/results/c9bb7d2a61aea3549453ec5e7270694ae25dc545 |     
  nds32le    |          lrzip-0.631           | NOK | http://autobuild.buildroot.net/results/7a5939dad1dda3a77e7915687cdf4ca85c574c0a |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/9155326e1ff7c2bb2218122c453872c2fc76f65e |     
    i686     |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/09fd94646b2f8d30a74db0574ff15b1600305d11 |     
    arm      |         mesa3d-19.2.1          | NOK | http://autobuild.buildroot.net/results/99823edc7d025d548261e59db8d80097080ed5df |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/30528ffcaf6c2abe31da61ed0c46fe0751c8f006 |     
  powerpc    |      policycoreutils-2.9       | NOK | http://autobuild.buildroot.net/results/43b5580fa9f26eac71afa9f3cca413f2791c054d |     
  powerpc    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/9923be2699b6b1a3b193fcfa187c6a2e71b107f7 |     
  powerpc    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/f8e261dd64346caeff568a23621b3dd15ac3967c |     
  aarch64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/5a6d91257aff434403dab554d7fd490a35d61987 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/92a8345a81b9b3808fefea0620a657e023acfd3f |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/8cd5374c578b20449fc36ef3e2a7147b11aae80a |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/fbd2c235f76f2bd401856d677d71030426a97bf3 |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/9fe629c1dd5d16834ed5fb6eb0a30df62d8ee216 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8bb3979c702c6e97dcd9b8f8a4d3cfdd1b286810 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/1c535ff38ff6ff2eca3e7a4174d047ce5c23ba20 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/0e404920368e1994123a9d5bf973c394cd6b01be |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3fefc90ef5b8d68ba30bfd79e5f6aa5dec060088 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6d1ea258ba03f54ff6b22a9c4b882aae478219c3 |     
microblazeel |        target-finalize         | NOK | http://autobuild.buildroot.net/results/180049321a8ca89f6eb43e2939c29eaf6df15b1d |     
    arm      |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/0342e67b645ce32acfb1250601926739757364b2 |     
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/bc1ddfc0417b85ce93900c4c16064bc41418bce9 | ORPH
   mipsel    |      xlib_libXfont2-2.0.4      | NOK | http://autobuild.buildroot.net/results/c89f6bab69fec83abbf8b888f5fbf7f4bf3b9aca |     
  mips64el   |      xlib_libXfont2-2.0.4      | NOK | http://autobuild.buildroot.net/results/e50941dc4c48a1262d9ad093a6fa2b90b782c923 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              swupdate-2018.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        swupdate-2018.11        | NOK | http://autobuild.buildroot.net/results/ed36920f997d102f6f8aab77a2fa25b969e5bc42 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
               libsigsegv-2.12 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/8b2d001befa049141a7e218447f5f0ae7736ae1e |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/6871e47be54086a2a08586929e73f21cf52d4fa5 |     



-- 
http://autobuild.buildroot.net
