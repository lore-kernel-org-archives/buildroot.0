From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-13
Message-ID: <20160814063028.9FEEF101E47@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-13
===============================

        success : 209
       failures : 64 
       timeouts : 0  
          TOTAL : 273

Classification of failures by reason
====================================

                     gmp-6.1.1 | 5 
                  ffmpeg-2.8.7 | 3 
          sane-backends-1.0.25 | 2 
                     pcre-8.39 | 2 
                  fbterm-1.7.0 | 2 
               binutils-2.25.1 | 2 
                    libiio-0.7 | 2 
qt5webkit-b889f460280ad98c8... | 2 
                 weston-1.11.0 | 2 
               linux-pam-1.2.1 | 2 
      trace-cmd-trace-cmd-v2.6 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
                 ibrdtnd-1.0.1 | 2 
                  connman-1.33 | 2 
                 jack2-v1.9.10 | 2 
      kismet-Kismet-2014-02-R1 | 1 
                  lshw-B.02.18 | 1 
                 openocd-0.9.0 | 1 
                 mesa3d-12.0.1 | 1 
               libepoxy-v1.3.1 | 1 
               tinycbor-v0.3.1 | 1 
                wayland-1.11.0 | 1 
                harfbuzz-1.3.0 | 1 
               trousers-0.3.13 | 1 
               openswan-2.6.46 | 1 
                 opencv3-3.1.0 | 1 
               nfs-utils-1.3.3 | 1 
                    qemu-2.6.0 | 1 
                   perl-5.22.2 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                    ustr-1.0.4 | 1 
                   lldpd-0.9.4 | 1 
                  squid-3.5.20 | 1 
                 hplip-3.15.11 | 1 
                   fwup-v0.8.0 | 1 
         systemd-bootchart-230 | 1 
                openmpi-1.10.2 | 1 
                alsa-lib-1.1.2 | 1 
                 xenomai-2.6.4 | 1 
               syslog-ng-3.7.2 | 1 
                  cairo-1.14.6 | 1 
                 mplayer-1.3.0 | 1 
           igd2-for-linux-v1.1 | 1 
               logrotate-3.9.2 | 1 
              squeezelite-v1.8 | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/5523a43fc8a280da9298c5eca071be41eaa596af/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/41184d81604875cc585b5d7db7b7aba105fe24cf/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/9a22344ced4bab1b4165fc2dea20b8a81d2f0800/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/69376aab4c59aa6761c2cbe61faefbfb9dc3a381/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/ae978431a931f057710abd8fdd628fd325b5f03e/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/fb7ba135bd12d6a1e949bd8ac8d20a2450278855/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/875a9deb15d47d348bb53dafdbb7ed2f2bbd3da8/
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/8c4a6cf492bccf4e1b99897bd9658e21b89b31ab/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/998e0d3a6b126aad875e648c7d9f39cfe6cfbd63/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/8153259ab5f2c2221bbd6e2a97a8096ab4d43d01/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/e29e93df7c5f5073dd99a4ab4f1f90c1494a7512/
      xtensa |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/56629d9f0cf59aacfc5fa4e2cc72bd584726c5c0/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/57ec807ceb73f1b3380ae455d161b7543ee0d8ca/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/dcb0448508471f57b387f922a4ad7d149fa639b9/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/64267c703aa32c4f9e57e82128651753d839144f/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/77c86be9a1356ccd8cd5ff536ab3134e44dc42e5/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/ac5a6a4bf1aa1c362eedca9fcf39feb624542fed/
        m68k |                 harfbuzz-1.3.0 | NOK | http://autobuild.buildroot.net/results/2024d940928adaa550ae69be75779f6d3264fbc8/
         arm |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/6d537369af50b27f79dc8fa8a9a854012607c09a/
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/8646894147889890facc6e1e54dc3c9fc12e4a4f/
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/663214072c8a39cb3710d282929d51f98f85efca/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/0753ebdb82b5e93f0a2f1a66e61d171e837f85be/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/570a097642250f05c3bb3d838c34d19e9e995638/
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0e4f7fcd21ab96717e8a3b9fdc1a3b054d6a559f/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/48344a719fce0a4c99ca456b42390e830f15f53e/
      mipsel | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/5c75b087c0786c8332867a66c3d4e4726aaf1c0e/
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/85f6b598c76b8d7ba33e375a4ec974dc7b029a53/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/122784881363be06d35a720ac7a0fca57896afd1/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/d56fbc38f307c1e6b50935ede7014cf2bb866b03/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/ebb65dee7855d02f65008d653ef54e249e6cc006/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/667f785a20d750ac02a6a9847e55771371594201/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/3aac275e6874de17ce95a911b1d75cee4179c541/
    mips64el |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/df160c1426e8c487a45782ff7348228f895141d1/
         arm |                logrotate-3.9.2 | NOK | http://autobuild.buildroot.net/results/4bb78f26653f0227ce983c503a2a80cc5409e27e/
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/c1ef015a5a0d8bee4a630de6a58bef392cf5c965/
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/1f79540f622a8fd94e98e5e989d1e8f41c3b08f1/
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/cf436f4000831b6a3b5e16a8ab8cf08d53c33c63/
        m68k |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/dd86cca8e25a1cd8ae683cc7663629102fda8f4b/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/925942dd33a8bac73313b1b4a3e681af5630eb8d/
       sparc |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/2ba804907961e4038a78f521e6bc846c322b7a5a/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/060426860fef4fb5f5ffd903ba47e75814febb7d/
        m68k |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/2a0064597e45b94d5b2cb62f9868f1c2279509c7/
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/243afe6845bf30ad7e3478e15827c49ecafd3c8c/
        m68k |                      pcre-8.39 | NOK | http://autobuild.buildroot.net/results/3cd724ffa5962d3841c50a2d0c9081d61f5bd71e/
        m68k |                      pcre-8.39 | NOK | http://autobuild.buildroot.net/results/8af6e8d8f31882e5546b4af9a88ba37eb7076d70/
      x86_64 |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/3ff3211bfa8f1a08184cf70c09dba08e7056b15d/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/32ca539b23e20ae61190cc12e2c1e97506ea74a8/
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/8a2f6951cc2a1cd79b52bc3b85003b1801fadbea/
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/a760967b037ced0aed27ffd926d6109362aede44/
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/8430dc2169f287c004cc2093bc26fe7e437ae6ba/
        i586 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/2ca14115977fa2f215ce5252b17c6aeaba54f0c7/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/3d8cc67547101befea2829ebe6f9f89c14ce697a/
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/395894677ab897f72a1670ae02f9adefba2ad151/
         arm |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/98676f36b1081fa8be2a237543bbde41a526c7bc/
         arm |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/66d85622db9f7ff5a4e8d6eed3fd3b32959685cf/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f50d404d08f209692b12cbc0b6657a87fc76de5d/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/126f2b2b62b6bc2f60d6023ba078915328142d5c/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/98377593246f8ea5ea8d538dfba4be88a088a13e/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/a8a15e198a6806ae944e966be86a9c864652ae5c/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/93626f55625ed7900c147bfd79ff7802366639b1/
      x86_64 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/eb7d2bafd0baf160f99caad055f82e069d7184f7/
      mipsel |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/1e8d17e917f4f0aa0bce572c81d0b888094c5010/
         arm |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/b740a670aef5a0ccb4460b375b1c3499ed0f8921/
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/ce06eb2dcb3d37b859c3c8640d4251ad3e8e1df2/


-- 
http://autobuild.buildroot.net
