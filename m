From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 07:12:11 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-20
Message-ID: <20200921071223.E30358670C@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 23  | 13  |  0  | 36  |
  2020.05.x  | 38  |  8  |  0  | 46  |
  2020.08.x  | 22  | 18  |  0  | 40  |
    master   | 120 | 108 |  0  | 228 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 14
              asterisk-16.10.0 | 7 
        python-protobuf-3.13.0 | 7 
 Makefile:752: target-finalize | 6 
                       unknown | 5 
                       iwd-1.9 | 4 
                   attr-2.4.48 | 3 
             babeltrace2-2.0.3 | 3 
                 fwts-19.09.00 | 3 
          gstreamer1-mm-1.10.0 | 3 
                   guile-3.0.4 | 3 
         libcpprestsdk-2.10.16 | 3 
                rocksdb-6.10.1 | 3 
               target-finalize | 3 
              alsa-lib-1.2.3.2 | 2 
               apcupsd-3.14.14 | 2 
                  boost-1.74.0 | 2 
               capnproto-0.8.0 | 2 
                harfbuzz-2.7.2 | 2 
             kismet-2016-07-R1 | 2 
            live555-2020.06.25 | 2 
                  luajit-2.1.2 | 2 
                 uclibc-1.0.35 | 2 
                  uhd-3.15.0.0 | 2 
               apparmor-2.13.4 | 1 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                 dc3dd-7.2.641 | 1 
                  dnsmasq-2.81 | 1 
              gnuradio-3.8.1.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
host-binutils-arc-2020.03-r... | 1 
                host-go-1.15.2 | 1 
                libconfuse-3.3 | 1 
                libtirpc-1.2.6 | 1 
               log4cplus-2.0.5 | 1 
                   ncurses-6.1 | 1 
                  ndisc6-1.0.4 | 1 
               qt5webkit-5.9.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                  umtprd-1.3.6 | 1 
                    vlc-3.0.11 | 1 
               w_scan-20170107 | 1 
                    xen-4.14.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/1ee3ad7ae9eba3bed5ce9ec4bdf8122a387b41ab |     
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/169724ce6f749f8e5d9a71052ea7be5fe4b2af9f |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c853f1b2dec5da44488a081c64f70525b0cd991f |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9bc2dc3de29fecbe331192879d0c94c1c047562f |     
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/072ceb78a6eaf503180a6a3487c272a46477d1fd |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/f0551ef4f9c2b26df7e90baad8dfe2ef956808dd |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/f66be1ee04b7da842088dfbc440d5cf270e4f402 |     
  aarch64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/de3e4b9d254e47f2db9f2d2ad75fbb0046885009 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/0b8ddf25ba9fe195ea5b9483a91627816983a25d |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/a3214eb0b727a31cf16215a56e46c8e5dd2ff4bf |     
 aarch64_be  |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/b7a54e1ba1620a1c8b7132294da114c8103751bc |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/f95adef00cee92abb4385020c1e71b684faf56ab |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/b699bef5cc44832657c257ac601d9add2320f909 |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/952b922e96e3bc6af68896b7b8ea759ee6257b79 |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/78a96895616bc5c8120488f8f12db1dc2e1a71cb |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/297e7a1abc1c202790742e96b76245c9034350e3 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/991a79732aa0cd71a519fa1d2ce8ec2d8e3dfd4a |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/4f7006a93a1a00d01182a118a6fa06540095592f |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/25f00bf12cd1daf084032ce2d28368a8a6fa58d1 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/055832c543c01688c7af8894ef8eb95cd1aa4c64 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/86f95bb82186d04ffe6fef5bf1cafa6635090364 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/a3a68fe131b743cc792e4b29ed35e400cdcf2e5e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bcd7f55e2c678569cb6e731669667939d0de07af |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3ffcb2ee0aefbbe06e3b047e3541c587cc1d10fa |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f94f689135d99dbac5f3ef80264c7d7717eb36bc | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/c11a311604eec8f4d3f0af6bee63eb51be066b9b |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/014f27a6c915f8422be5c32f1b6ae7ad93e2e708 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/1f16ec7a37183afb2346faa96f1f201188f1b7f4 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/b587c448cb480f86dbcd227b1539036308a8944f |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/172e3aadd35152cea2a340179452013241d41ad6 |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/82953d9d4614152a5f8b011553c44445448d09e5 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2985929c32c3fd396887afb223b7e559950c0c5e |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c28dfe405ca868ec29663f0636f28f48b3155939 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1c80854874bacccb500b391c8fdc01ec14e3a9c3 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/9283c5e9fac2891c64e6bd5453ca26ce79308f74 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/9f246375cb7cf652550320c8f938656e1358de73 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/dde9af4834947822553fa6cd8f880da415bd1a3e | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/d0855235ac390110420d60a07925f27a90e08137 | ORPH
    sh4      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/fec6020f640859bf89fa6d75be342993e28797ce | ORPH
    arc      | host-binutils-arc-2020.03-r... | NOK | http://autobuild.buildroot.net/results/35c39bcaca46675798aeac7f21131622067fae85 |     
  mips64el   |         host-go-1.15.2         | NOK | http://autobuild.buildroot.net/results/bbb6711857bf2a0d4847b6cf2366135ddb13ceef |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6fcbee070d730a858ca855426731aa833b2509f8 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/51394d0ab5e7f8b9eabd7673c605e9a6937bee65 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/19a4da106999badf55421cb7ae0ba56b0487ed96 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9e3b5069bf389c0fd1c2eb24e6bf1c59cee16aaf |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8b108d3cf6ba0f4bd9d6065c3d6504552f4919d3 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6d7764c82aa9bdbef82133cb98e6f63473e5cf48 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/df83361f758695ca0220f5871a74756411a6a80b |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6ca4d9116a39da06a6f6d82ea148a33cbd4520a0 |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ea475a18b85af6c2dfedd96162afe2c6301cc70c |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/96a291c34a4fadb831715c6c32bfbb7006ecdc0f |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dff25db339df3a36147cc7594a6dfee2aaa9986f |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/668964ac5c674470871f6288ada8378dfd35b504 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/986d9e340e0703f6f24132c6dfc9b1f29f8043a4 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4ad17bedc932b32907591665a69ebb39e5c4c334 |     
   mipsel    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/757ea5a3341f8d0ae715b15e7af470df7dd95bb2 |     
    arm      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/f5267a637f60d86dc55fd14696dbd654d5aee3e3 |     
    arm      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/09c9bf6b362afe0b809140336090a2eac2df622c |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/f1fcc17c9d6df14d8c4a618da5245df2b9d5bca5 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/03bb7b402696c2dc5ea381daf329bd47ec8cd4f7 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/571122d8bd1c5e02c5868c75ade44b9b7761e76b | ORPH
    arm      |         libconfuse-3.3         | NOK | http://autobuild.buildroot.net/results/acdbb5efe687194fb2b483dfb4c3a07ec85b64d2 |     
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/158da4ac250bd81a0754851493a2e16e569853f1 |     
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/5edebaec7c18cead1524b113cce680a1e772fecf |     
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/9697718abeb53f7acaf68751dce0de078fac0032 |     
    arm      |         libtirpc-1.2.6         | NOK | http://autobuild.buildroot.net/results/b41ed0eb843f94e9d88061a4800373dacd84acd9 |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/bb53e391f80965115996a4bdc4f1024782df810f | ORPH
    sh4      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/c84aa97dca8bc307ce9cd948102a938fc062d914 | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/59a32ad48282fff50eac25cb5afd54fb47f7f6f6 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/16663820a0d850c1c35c713793296211a265c2fc |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/33a1fd8c9e19108c3ce90879ab6e3f5cbd316442 |     
    mips     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/103c12644c0989aa6b3225900a697960704458cc |     
    i686     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/563b1c38533e7360ba43d3ad880d1425dc15a122 |     
    i686     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/2c4afc57e153058d0f70c1cd9e9976614d92815a |     
    arc      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/859c6285e60c9294ee21c1808e938b888dfab5da |     
   nios2     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/cd5db0ee10f380eae9deee6c270825d47a4ad111 |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/6111e0a1d2ee8d1d3b4880b656e842f865caf39a |     
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/b829360b0dfdd30423dd4169c125f34c5b8fee92 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7fe634ff90c8d62405c11a8f125eba6be75c0d82 | ORPH
 powerpc64   |     python-protobuf-3.13.0     | NOK | http://autobuild.buildroot.net/results/e8f633064715d4f97479197828ce42a3369a7170 |     
    arm      |     python-protobuf-3.13.0     | NOK | http://autobuild.buildroot.net/results/f3c1ba1abae381bc0d793e682a7e979bd33968db |     
    arm      |     python-protobuf-3.13.0     | NOK | http://autobuild.buildroot.net/results/2df8431d929121d6523d6ef7e215ebe2f99a7928 |     
 powerpc64   |     python-protobuf-3.13.0     | NOK | http://autobuild.buildroot.net/results/34a892a6601b1fcacfc3c6a60fac7b27905ef949 |     
 powerpc64   |     python-protobuf-3.13.0     | NOK | http://autobuild.buildroot.net/results/a35f2c14bc1da53c3b133b7954a740ed49cd4420 |     
  riscv64    |     python-protobuf-3.13.0     | NOK | http://autobuild.buildroot.net/results/3b1f14165834f62b4a0d466618d4d773d7a44b4b |     
    arm      |     python-protobuf-3.13.0     | NOK | http://autobuild.buildroot.net/results/371c686a10d6870933011b46d36b1879d29046b9 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/66d037740a68af5817a15da0f170fd3bceda3fe1 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/7aa980092e66033889ff75a5a1eda80c6213272b |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/07a3b3b2f4447c81e0b00c585713715e9c45628a |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/b99c2e6543706fa2532879e2fdee2c884eb86b4d |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/8b9967e56ea6954cd57291f0948f6832bbccebce |     
    i586     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/48ba68006ee6fd83f4f07523182a1b6e515c3c09 |     
    i686     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/f219538a574903b90591c8e36a95b9166280ea52 |     
    i586     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/59707d96cf9f7b1d40fbec667e92e377f1a09c4f |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/9289869726e9fe9c287bb452e4b35b01f79f4515 |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/253ae1831190994ccc92718f58c4a9a41c79f8fa |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/73121642b35320b31c4d327e9e1377a4a2414f7c |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/1ea3be8841bcbaa8e0d23fa2b8e41ddb6f52a260 |     
  aarch64    |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/ff1c14da37d57c61afa082cf09a1c0ad0c2b2a1c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fab88ce09a430eaffe4fd365049dd440e4e5d57d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/937b76ff9c68fee99f58d2ca7544fc4cc19856cd |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/fa593f2e63e6125cd9f8c3a3fb11fedca5717b40 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/138e17fdf8a2e20b5b61df9938a253f89687b238 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/9b8fa942016d6fbe13dfd28628eaf102f8c23a01 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/245bfad5e17307e7a145b5f71eadb693f9a57d5e |     
    arm      |        w_scan-20170107         | NOK | http://autobuild.buildroot.net/results/5640442cb4ba06bcbcf31540a64f5665862d39f7 |     
  aarch64    |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/2dd6a84907d09a9dd480df94ed9963f4724c22fa |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/ec14e94a87cfad8d150912762f569b4ee9ee341a |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               ipmitool-1.8.18 | 2 
 Makefile:753: target-finalize | 2 
                       unknown | 2 
          gstreamer1-mm-1.10.0 | 1 
                 haproxy-2.1.4 | 1 
              host-grpc-1.25.0 | 1 
         libcpprestsdk-2.10.14 | 1 
                   mpd-0.21.19 | 1 
                  ndisc6-1.0.4 | 1 
               target-finalize | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9e4bb3149e7a590f8e578856124558a8bfe05f50 |     
    sh4      |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/379a40f150316dc200ad008330c78d3e8187ffbe |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/90add37b71f8fbd3472f4a918620ca646cbbc40c |     
  riscv64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/7b095268505a15bd3295b4c7404889c3c19ed5a7 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/749317eeb603956e5cfc74640c4a0087f26d4c3a |     
   x86_64    |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/f047296d28bdc069fc3ace5cdacca4fb17e8027f |     
   mipsel    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/f3c15735987baf40f6147cf0234ee5d2a8a72db1 |     
   xtensa    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/e53c1176ba6d5b0186d64195e7d64b54085c870a |     
    arm      |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/fe2dd00eb5dd48392de2edbee642f5719711a507 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5497d441017bd3a091bc46b18d1737368def4b8e | ORPH
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/7de4dc9a6ce263723fc581f33122676bf91d957c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a6349ff0a6b530cd2e5b4e6b572526fafc3da8b1 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a4c87ff6df45d2b125a62041aa71ecbaecc2d2ae |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               ipmitool-1.8.18 | 2 
 Makefile:753: target-finalize | 2 
                       unknown | 2 
          gstreamer1-mm-1.10.0 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2e6a22975dbb8eb1115e8e45168c5ce14491e941 |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/389272814419dda54e9e55d7cd323cc1ec3ab2ad |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/82ff454bef8fade87440461d127afa7d194f13ce |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/e64aad95d8c1d58c4b121ea7e8e2082ddece4281 |     
  powerpc    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/0dbbcd5518d142aaa6102750695fc0f2ecdc83dc |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/3f43066b40ffd4a18ea0644d1cc051a51bc77b09 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/a638c9467d329d5c40870fd66c12f595cc30a31c |     
    arm      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/b22942dbf12f5a31a62fa2548d8765867412fa4d |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               ipmitool-1.8.18 | 5 
               apparmor-2.13.4 | 2 
               apcupsd-3.14.14 | 1 
                coreutils-8.32 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                  ffmpeg-4.3.1 | 1 
            ghostscript-9.53.0 | 1 
                     kbd-2.0.4 | 1 
             kismet-2016-07-R1 | 1 
            live555-2020.06.25 | 1 
                rocksdb-6.10.1 | 1 
               target-finalize | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2fb191dd635e9ca5f18d5137bc252c233eadb860 |     
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/3db69a8a869fc10ccca60d3c107ade0b5f5803dd |     
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/2d6e160e2c120d3672292f1ec1de04fc2b231a0a |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/3f01a4fd51039a749ccc0f1c5c0ee3b2800fbcb4 | ORPH
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/8fc2a981ee74d4b77ab81a6575edf9f4e5d05358 |     
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/d2d73f3c7075ca6e9782b9bb591dae40ab56b6a2 |     
  riscv32    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/c58d9ae0df61b312ecf5c2d72997a30925b9d3ff |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/b3e3f906a7fe17d0adfdeb8aff4f38d9f99c649f |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/166b3eed6d802e53b97e84d44f1571d07dd1e24e |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/2dbc913f40fc2d4e3c1243493e96cb01307c0c5e |     
    or1k     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/387352ead4489ee0d05ad10edf730128d4e0c81b |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/7d3a1be2f47b578e3a3b5b27131075fe2fd0312e |     
    arm      |           kbd-2.0.4            | NOK | http://autobuild.buildroot.net/results/face335fe1d5e2e228042f6e80ce43b674dc3760 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/758682024ab0f14641ac7b7152b548c9743cbf68 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/220655d01924bee580dacdeec0ca00efb8efa120 | ORPH
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/8dc6c1e1d9c6813df50d1d8ba5dd9e7be83adafd |     
    sh4      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/620d8f77462dc339d8188b8847403ecc3fefcb0c |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/76b089dee6f8340c8c8ab086deafbe9fa72043f0 |     


Gitlab CI results for 2020-09-20
================================

Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  DISTRO  | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8.8          |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 3.38.0       |     
                 android-tools |  DISTRO  | https://release-monitoring.org/project/13989 | 4.2.2+git... | 11.0.0_r3    |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 9.900.3      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.10.0      | 17.7.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.38.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.2       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_02_20... | 1.0.0-pre... |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2020.2       | 2020.3       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.3       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/21396 | 1.2.0        | 1.2.1        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.65         | 1.68         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.3.1        | 4.5.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.3.1        | 4.5.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.3.1        | 4.5.0-alpha  |     
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.22      | 9.17.5       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.33.1       | 2.35.1       |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.7.1        | 3.7.2        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.20.1       |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 2.1.0        | 3.0.0        |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.0.0-alpha1 |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.6          | 5.7          | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.7.5        | 0.8.0        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 2.2.2        | 2.2.4        |     
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20190110     | 20200601     |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                        cgilua |  DISTRO  | https://release-monitoring.org/project/58440 | 5.2.1-1      | 6.0.2-0      |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-beta   |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.15.1       | 0.15.2       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.1          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.2.2        | 2.2.3        |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                         cjson |  DISTRO  | https://release-monitoring.org/project/21330 | 1.7.13       | 1.7.14       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 10.0.1       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.18.2       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.6.0        | 0.8.0        |     
                        cppcms |  DISTRO  | https://release-monitoring.org/project/21334 | 1.2.1        | 2.0.0.beta2  | ORPH
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.3.3        | 2.3.4        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.27.5       | 1.28.2       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 2.12.90      |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                           daq |  DISTRO  | https://release-monitoring.org/project/13264 | 2.0.6        | 2.0.7        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.18      | 1.13.18      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 4.11.1       | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 9.1.4        | 9.2.0        |     
                       dnsmasq |  DISTRO  | https://release-monitoring.org/project/00444 | 2.81         | 2.82         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.12     | 19.03.13     |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.27.3       |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.4.0        | 1.4.1        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.12     | 19.03.13     |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.18       | 1.8.20       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.12.0       | 9.14.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6          | 1.6.1        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.03        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.181        | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.2.8        | 2.2.9        |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0.4       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.0.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.5        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.1        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.8        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.25       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.10       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.6        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.37       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.22       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.38       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.20       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.43       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.9        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.27       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.7        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.8        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.4.1        | 3.5          |     
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.39         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.19         | 3.23         |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.1        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/10437 | 2.1.4        | 2.1.5        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.14.0       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.09.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.8.0        | 1.8.1        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.37.91      | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.12      | 2.40.0       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.1.4        | 2.1.5        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.4.0        | 1.6.1        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.53.0       | 9.53.1       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.26.2       | 2.28.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.64.3       | 2.66.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.65.3       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.12       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.5        | 6.2.7        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.1.0      | 3.8.2.0      |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.64.1       | 1.66.0       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.20         | 3.21         |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/21447 | 0.2.0        | 0.2.2        |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 3.38.0       | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.16.2       | 1.18.0       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.0       | 0.13.1       |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.16.2       | 1.18.0       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.16.2       | 1.18.0       |     
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.16.2       | 1.18.0       |     
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.16.2       | 1.18.0       |     
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.16.2       | 1.18.0       |     
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.16.2       | 1.18.0       |     
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.16.2       | 1.18.0       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.16.2       | 1.18.0       |     
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.16.2       | 1.18.0       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.8.0        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 10.10        | 10.11        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.6       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 3.0.1        | 3.0.2        | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.2.4        | 1.2.5        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.335        | 0.339        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.2.0        |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1637         |     
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.11         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                igd2-for-linux |  DISTRO  | https://release-monitoring.org/project/21356 | 1.2          | 2.0          |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.10-28    | 7.0.10-29    | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.7.0        |     
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.3.2       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.2.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.2.1       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.490        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.8.1        | 3.9          |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.7        |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.7.0        | 5.8.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                       jansson |  DISTRO  | https://release-monitoring.org/project/01417 | 2.12         | 2.13.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.10.3       | 0.10.5       |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.20       | 2.0.21       |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.4        | 2.0.5        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.2       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.2       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.3        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.74         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.74         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.74         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.74         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-09-R3   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 18.8-Leia    | 19.0a1-Ma... |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.3-Leia   | 3.0.0-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.2-Leia   | 3.0.0-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.5-Leia   | 3.0.0-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.5-Leia   | 3.0.0-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.4-Leia   | 3.0.1-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.4-Leia   | 3.0.1-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.5-Leia   | 2.6.0-Matrix |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 18.8-Leia    | 19.0a1-Ma... |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.6-Leia   | 6.0.1-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 8.0.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 6.0.6-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.6-Leia   | 5.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 6.0.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 6.3.1-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 7.0.0-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.19-Leia | 7.1.1-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.21-Leia  | 7.0.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 6.0.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.7-Leia   | 5.0.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 6.0.0-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 7.0.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 6.1.2-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.6-Leia   | 5.0.2-Matrix |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 18.1.19-Leia | 19.4.1-Ma... |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.3-Leia   | 2.6.0-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.5-Leia   | 3.3.0-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.5.0-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.5-Leia   | 3.4.0-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.3-Leia   | 2.5.0-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.3-Leia   | 2.6.0-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.3-Leia   | 2.4.0-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.3.0-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.4-Leia   | 2.4.0-Matrix |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 18.8-Leia    | 19.0a1-Ma... |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 2.3.2-Leia   | 4.0.0-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.6-Leia   | 2.0.0-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.3-Leia   | 6.3.0-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.4-Leia   | 2.3.0-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.4.0-Matrix |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 2.0.3-Leia   | 2.4.0-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.2-Leia   | 4.4.0-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 551          | 563          | ORPH
                       libaacs |  DISTRO  | https://release-monitoring.org/project/05562 | 0.10.0       | 0.11.0       |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.24         | 2.24-1       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.3          | 2.4          |     
                        libcec |  DISTRO  | https://release-monitoring.org/project/21468 | 4.0.7        | 6.0.2        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.14         | ORPH
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 5.1.1        | 5.1.3        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.1        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.4        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.5        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.64.4       | 2.66.0       |     
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.37         | 1.39         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.13.1       | 1.14.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.25       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5.2        |     
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 233          | 234          |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20200521     | 20200907     |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/01632 | 0.5.33       | 0.5.34       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.35.1       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.1        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.2.0        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.18.1       | 1.18.2       |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.3.5        | 1.4.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.41         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/07470 | 1.4.2        | 1.4.3        |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/07953 | 4.28         | 4.29         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.56         | 3.57         |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 5.1.1        | 5.1.2        |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200718  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                    libphidget |  DISTRO  | https://release-monitoring.org/project/115726 | 2.1.8.201... | 2.1.9.201... |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.1.0        | 2.2.0        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.2.0        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.14      | 1.26.4       |     
                   libqrencode |  DISTRO  | https://release-monitoring.org/project/12834 | 4.0.2        | 4.1.0        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.48.8       | 2.50.0       |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.4        | 2.5.0        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.1       | 0.20.3       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.1          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.1          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.3        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.72.0       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.7        | 2.0.0        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.14.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.7        | 1.14.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.38.0       | 1.39.0       |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.8.0        | 2.9.0        |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.10.1       |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/11083 | 1.8.2        | 1.9.0        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.0.20       | 4.1.1        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.20.2       | 2.21         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.3.1        | 4.5.0-alpha  | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2020.06.25   | 2020.08.19   | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.5        | 1.0.6        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.10.0       | 0.11.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.1        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.2       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.12.1       | 2.12.2       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.23      | 10.5.5       |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.6.7        | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.3.0        | 4.5.0        |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 20.1.8       | 20.2.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.37.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 9.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.2.0        | 5.3.0        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2020.07      | 2020.08      |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.10      | 1.14.2       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.9        | 4.7.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.27.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.12.0.90    |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.1        |     
                           mpc |  DISTRO  | https://release-monitoring.org/project/01667 | 1.1.0        | 1.2.0        | ORPH
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.2        | 2.5.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.0.2        | 4.1.0        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.13      | 1.26.3       | ORPH
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0          |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.11       | 1.8.12       |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200919 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.1       | 1.25.0       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.9          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.27.3-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.9       | 1.19.2       |     
                   nginx-naxsi |  DISTRO  | https://release-monitoring.org/project/20448 | 0.56         | 1.1          |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.10.0       | 1.10.1       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.18.0      | 14.11.0      |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.13       | 2.0.14       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.138      |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.9       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.5        | 6.9.5_rev1   |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.10       | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.29       |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.50       | 2.4.53       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.5        | ORPH
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.10.0       | 3.11.0       |     
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.1.5       |     
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.2        | 0.4.3        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.9.0        | 3.10.0       |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.9.0        | 3.10.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.9.0        | 3.10.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.9.0        | 3.10.0       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.21       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.3.1        | 4.5.0-alpha  | ORPH
                          owfs |  DISTRO  | https://release-monitoring.org/project/21559 | 3.2p3        | 3.2p4        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.21      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.46.2       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.2       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.12         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.6        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202008       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.34        | 10.35        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.3       | 5.33.2       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.25         | 6.26         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.47         | 6.48         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20200907   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.57         | 8.59         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.26         | 1.27         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0206       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 2.9.6        | 2.9.7        |     
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 77           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.12       |     
                          pixz |  DISTRO  | https://release-monitoring.org/project/07490 | 1.0.6        | 1.0.7        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.7.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.1          | 20200710     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.116        | 0.118        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 20.09.0      |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6c       | 1.3.7a       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 7.0.1        | 7.1.1        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.13.0       | 4.0.0-rc2    |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  DISTRO  | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.2      |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 2.2.3        | 2.2.4        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b3        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
              python-aiozipkin |  DISTRO  | https://release-monitoring.org/project/56569 | 0.6.0        | 0.7.1        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.16.0       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.2.10       |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.3.0        | 1.4.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 19.3.0       | 20.2.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.4.3       | 20.7.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.1.7        | 3.2.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.1        |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.12.210     | 1.18.1       |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.3        | 4.0.0-dev.0  |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.1.0        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2020.4.5.1   | 2020.6.20    |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.2       | 1.14.3       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.1.0        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.5b7      |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.4.5        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.2        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 4.1.0        | 4.2.1        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.4.2       | 20.8.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 3.0          | 3.1          |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a6        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 2.5.0        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.48.1       | 0.50.0       |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.10       | 3.1.1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 1.16.0       | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.3.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.9.2        | 1.9.3        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.15         | 0.16.0       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 3.13.2       |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 1.0.0        | 2.0.0        |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 3.0.8        | 3.0.9        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 1.1.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.4.4        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.5        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.36.1       | 3.38.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.2.0        | 4.0.0        |     
                  python-hpack |  DISTRO  | https://release-monitoring.org/project/19034 | 3.0.0        | 4.0.0        |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0.1        | 1.1          |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.2       | 0.18.1       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 2.6.0        |     
             python-hyperframe |  DISTRO  | https://release-monitoring.org/project/19035 | 5.2.0        | 6.0.0        |     
              python-hyperlink |  DISTRO  | https://release-monitoring.org/project/19142 | 19.0.0       | 20.0.1       |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 2.9          | 2.10         |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.1        |     
                   python-ipdb |  DISTRO  | https://release-monitoring.org/project/12710 | 0.13.2       | 0.13.3       |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/11475 | 0.14.0       | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.18.1       |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.12       | 0.1.13       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.0a1      |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.1        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.17.0       | 0.17.2       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.2       | 3.0.0a1      |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 0.9.4        | 0.10.0       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.2.0        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.8          |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.98         | 1.0.0        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.5.1        | 4.5.2        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.2.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.3.2        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a5      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.4.0        | 8.5.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.45.1       |     
               python-mwclient |  DISTRO  | https://release-monitoring.org/project/09693 | 0.10.0       | 0.10.1       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.4          | 2.5          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/11718 | 20.3         | 20.4         |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.7.1        | 2.7.2        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.7.0        | 0.8.0        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.3.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.5.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 20.2.3       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 0.13.1       | 1.0.0.dev0   |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.7        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.13.0       | 4.0.0-rc2    |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.8.5        | 2.8.6        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20200714.1   | 20200910.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.6.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev12  |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.7.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.4.0        |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 0.9.3        | 0.10.1       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.7        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.14       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.30.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.58.0       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 6.0.1        | 6.0.2        |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2020.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.1.0        |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.8.6     |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.10.1       | 2.10.2       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.14.4       | 0.17.6       |     
                 python-serial |  DISTRO  | https://release-monitoring.org/project/08305 | 3.4          | 3.5b0        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 50.3.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.5.0        | 4.1.2        |     
          python-simplelogging |  DISTRO  | https://release-monitoring.org/project/21134 | 0.10.0       | 0.11.0       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.3        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.4        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.6.0        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.1.0        | 2.2.2        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.19       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.3        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 1.1.2        | 1.1.3        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 4.0.0        |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 1.6.2        | 1.6.3        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.10.0       | 0.10.1       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.49.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 4.3.3        | 5.0.4        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 20.4.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.1.1        |     
                 python-typing |  DISTRO  | https://release-monitoring.org/project/10922 | 3.7.4.1      | 3.7.4.3      |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.7.0        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.1        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.1       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.3       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.61         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.28         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.3.4        |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.1.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.5        | 3.9.0rc2     |     
               python3-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.5b7      |     
                python3-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a6        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.7.14    |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 50.3.0       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.1       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/15197 | 0.8.1        | 0.9.1        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20200229   | 2.20200818   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.1          | 20200710     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.4.0        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.10.1       | 6.11.4       |     
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.15.1       | 4.16.0-rc1   |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.1.3        | 3.2.3        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2004.0     | 8.2008.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.10       | 2.7.1        | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.45.2       | 1.46.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.45.2       | 1.46.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.38.3       | 0.40.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.2.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.2      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.2.4      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.1.4      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.13      | 4.13.0rc4    |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.31       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.0.1        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.2        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.2.1        | 4.2.2        |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.4        | 3.3.5        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.0          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.0        | 0.7.1        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.8          |     
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.15.1     | 2.9.16.1     |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.3.0        | 4.4.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.13         | 5.0.4        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
                      sshguard |  DISTRO  | https://release-monitoring.org/project/13819 | 2.4.0        | 2.4.1        |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 1.20         | 1.21c        |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.5       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.11.17      | 0.11.21      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.9.0        |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.8.31       | 1.9.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                  supertuxkart |  DISTRO  | https://release-monitoring.org/project/04912 | 1.1          | 1.2          |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.1        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.8        | 6.0.0-rc1    |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.27.0       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.2.1       | 12.4.0       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 246.5        | 246.6        |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.96         | 2.97         | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.8.0        | 1.8.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.3          |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.2          |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.2        | 4.3.0        | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0_rc0    |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.3        | 3.0.1-rc1    | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.9.1        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 2.94         | 3.00         |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2020.04      | 2020.07      |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.0.0.0      |     
                      unixodbc |  DISTRO  | https://release-monitoring.org/project/07344 | 2.3.7        | 2.3.9        |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.3        | 5.9.4        | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.35.2       | 2.36         | ORPH
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.6.0_lib... | 2.7.0_lib... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.50.0       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.1718     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.11       | 3.0.11.1     |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.62.0       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 2.6.11       | 2.6.12       |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.18.0       | 1.20         |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20200623 | 1.0.20200908 |     
               wireguard-tools |  DISTRO  | https://release-monitoring.org/project/62381 | 1.0.20200513 | 1.0.20200827 |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.28.4       | 2.30.0       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.16       | 1.4.17       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.2        | 3.2.3        | ORPH
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/15059 | 1.0.3        | 1.0.4        |     
      xfont_font-misc-ethiopic |  DISTRO  | https://release-monitoring.org/project/17195 | 1.0.3        | 1.0.4        |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.8.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.43         | 5.44         |     
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.4        | 0.8.0        | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2020.1       |     
Packages having CVEs
====================

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2016-5080    | https://security-tracker.debian.org/tracker/CVE-2016-5080   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                 at91bootstrap | CVE-2020-11683   | https://security-tracker.debian.org/tracker/CVE-2020-11683  
                 at91bootstrap | CVE-2020-11684   | https://security-tracker.debian.org/tracker/CVE-2020-11684  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                          bash | CVE-2019-18276   | https://security-tracker.debian.org/tracker/CVE-2019-18276  
                          bind | CVE-2017-3139    | https://security-tracker.debian.org/tracker/CVE-2017-3139   
                          bind | CVE-2019-6470    | https://security-tracker.debian.org/tracker/CVE-2019-6470   
                       bitcoin | CVE-2017-9230    | https://security-tracker.debian.org/tracker/CVE-2017-9230   
                           boa | CVE-2009-4496    | https://security-tracker.debian.org/tracker/CVE-2009-4496   
                         boinc | CVE-2013-2018    | https://security-tracker.debian.org/tracker/CVE-2013-2018   
                         botan | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                         botan | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                         botan | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                         cairo | CVE-2013-0800    | https://security-tracker.debian.org/tracker/CVE-2013-0800   
                         cairo | CVE-2013-6425    | https://security-tracker.debian.org/tracker/CVE-2013-6425   
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        cereal | CVE-2020-11105   | https://security-tracker.debian.org/tracker/CVE-2020-11105  
                      civetweb | CVE-2019-3821    | https://security-tracker.debian.org/tracker/CVE-2019-3821   
                         cmake | CVE-2016-10642   | https://security-tracker.debian.org/tracker/CVE-2016-10642  
                      cracklib | CVE-2016-6318    | https://security-tracker.debian.org/tracker/CVE-2016-6318   
                          cups | CVE-2012-6094    | https://security-tracker.debian.org/tracker/CVE-2012-6094   
                          cups | CVE-2014-8166    | https://security-tracker.debian.org/tracker/CVE-2014-8166   
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                       dovecot | CVE-2016-4983    | https://security-tracker.debian.org/tracker/CVE-2016-4983   
                            ed | CVE-2015-2987    | https://security-tracker.debian.org/tracker/CVE-2015-2987   
                          flex | CVE-2015-1773    | https://security-tracker.debian.org/tracker/CVE-2015-1773   
                          flex | CVE-2019-6293    | https://security-tracker.debian.org/tracker/CVE-2019-6293   
                   ghostscript | CVE-2018-18073   | https://security-tracker.debian.org/tracker/CVE-2018-18073  
                   ghostscript | CVE-2019-10216   | https://security-tracker.debian.org/tracker/CVE-2019-10216  
                           git | CVE-2018-1000110 | https://security-tracker.debian.org/tracker/CVE-2018-1000110
                           git | CVE-2018-1000182 | https://security-tracker.debian.org/tracker/CVE-2018-1000182
                           git | CVE-2019-1003010 | https://security-tracker.debian.org/tracker/CVE-2019-1003010
                           git | CVE-2020-2136    | https://security-tracker.debian.org/tracker/CVE-2020-2136   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2020-10029   | https://security-tracker.debian.org/tracker/CVE-2020-10029  
                         glibc | CVE-2020-1752    | https://security-tracker.debian.org/tracker/CVE-2020-1752   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                        gnutls | CVE-2018-10844   | https://security-tracker.debian.org/tracker/CVE-2018-10844  
                        gnutls | CVE-2018-10845   | https://security-tracker.debian.org/tracker/CVE-2018-10845  
                        gnutls | CVE-2018-10846   | https://security-tracker.debian.org/tracker/CVE-2018-10846  
                        gnutls | CVE-2018-16868   | https://security-tracker.debian.org/tracker/CVE-2018-16868  
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2019-14865   | https://security-tracker.debian.org/tracker/CVE-2019-14865  
                         grub2 | CVE-2020-15705   | https://security-tracker.debian.org/tracker/CVE-2020-15705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                         iperf | CVE-2016-4303    | https://security-tracker.debian.org/tracker/CVE-2016-4303   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2015-9251    | https://security-tracker.debian.org/tracker/CVE-2015-9251   
                        jquery | CVE-2019-11358   | https://security-tracker.debian.org/tracker/CVE-2019-11358  
                        jquery | CVE-2020-11022   | https://security-tracker.debian.org/tracker/CVE-2020-11022  
                        jquery | CVE-2020-11023   | https://security-tracker.debian.org/tracker/CVE-2020-11023  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libcroco | CVE-2020-12825   | https://security-tracker.debian.org/tracker/CVE-2020-12825  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                       libexif | CVE-2016-6328    | https://security-tracker.debian.org/tracker/CVE-2016-6328   
                     libgcrypt | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                     libgcrypt | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                     libgcrypt | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                       libgit2 | CVE-2014-9390    | https://security-tracker.debian.org/tracker/CVE-2014-9390   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                      libressl | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                      libressl | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                      libressl | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                   libtomcrypt | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                   libtomcrypt | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libuci | CVE-2019-15513   | https://security-tracker.debian.org/tracker/CVE-2019-15513  
                       libupnp | CVE-2020-13848   | https://security-tracker.debian.org/tracker/CVE-2020-13848  
                       libxml2 | CVE-2016-4614    | https://security-tracker.debian.org/tracker/CVE-2016-4614   
                       libxml2 | CVE-2016-9596    | https://security-tracker.debian.org/tracker/CVE-2016-9596   
                       libxml2 | CVE-2016-9598    | https://security-tracker.debian.org/tracker/CVE-2016-9598   
                        libzip | CVE-2017-12858   | https://security-tracker.debian.org/tracker/CVE-2017-12858  
                         links | CVE-2008-3319    | https://security-tracker.debian.org/tracker/CVE-2008-3319   
                         linux | CVE-2014-3250    | https://security-tracker.debian.org/tracker/CVE-2014-3250   
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15889   | https://security-tracker.debian.org/tracker/CVE-2020-15889  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2020-24342   | https://security-tracker.debian.org/tracker/CVE-2020-24342  
                           lxc | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                        monkey | CVE-2013-1771    | https://security-tracker.debian.org/tracker/CVE-2013-1771   
                        monkey | CVE-2013-2183    | https://security-tracker.debian.org/tracker/CVE-2013-2183   
                         mysql | CVE-2020-2923    | https://security-tracker.debian.org/tracker/CVE-2020-2923   
                       ncurses | CVE-2018-19211   | https://security-tracker.debian.org/tracker/CVE-2018-19211  
                       ncurses | CVE-2018-19217   | https://security-tracker.debian.org/tracker/CVE-2018-19217  
                       ncurses | CVE-2019-17594   | https://security-tracker.debian.org/tracker/CVE-2019-17594  
                       ncurses | CVE-2019-17595   | https://security-tracker.debian.org/tracker/CVE-2019-17595  
                        netcat | CVE-2008-5727    | https://security-tracker.debian.org/tracker/CVE-2008-5727   
                        netcat | CVE-2008-5728    | https://security-tracker.debian.org/tracker/CVE-2008-5728   
                        netcat | CVE-2008-5729    | https://security-tracker.debian.org/tracker/CVE-2008-5729   
                        netcat | CVE-2008-5730    | https://security-tracker.debian.org/tracker/CVE-2008-5730   
                        netcat | CVE-2008-5742    | https://security-tracker.debian.org/tracker/CVE-2008-5742   
                        netcat | CVE-2015-2214    | https://security-tracker.debian.org/tracker/CVE-2015-2214   
                        nettle | CVE-2016-6489    | https://security-tracker.debian.org/tracker/CVE-2016-6489   
                        nettle | CVE-2018-16869   | https://security-tracker.debian.org/tracker/CVE-2018-16869  
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                        opencv | CVE-2017-1000450 | https://security-tracker.debian.org/tracker/CVE-2017-1000450
                        opencv | CVE-2017-12597   | https://security-tracker.debian.org/tracker/CVE-2017-12597  
                        opencv | CVE-2017-12598   | https://security-tracker.debian.org/tracker/CVE-2017-12598  
                        opencv | CVE-2017-12599   | https://security-tracker.debian.org/tracker/CVE-2017-12599  
                        opencv | CVE-2017-12600   | https://security-tracker.debian.org/tracker/CVE-2017-12600  
                        opencv | CVE-2017-12601   | https://security-tracker.debian.org/tracker/CVE-2017-12601  
                        opencv | CVE-2017-12602   | https://security-tracker.debian.org/tracker/CVE-2017-12602  
                        opencv | CVE-2017-12603   | https://security-tracker.debian.org/tracker/CVE-2017-12603  
                        opencv | CVE-2017-12604   | https://security-tracker.debian.org/tracker/CVE-2017-12604  
                        opencv | CVE-2017-12605   | https://security-tracker.debian.org/tracker/CVE-2017-12605  
                        opencv | CVE-2017-12606   | https://security-tracker.debian.org/tracker/CVE-2017-12606  
                        opencv | CVE-2017-12862   | https://security-tracker.debian.org/tracker/CVE-2017-12862  
                        opencv | CVE-2017-12863   | https://security-tracker.debian.org/tracker/CVE-2017-12863  
                        opencv | CVE-2017-12864   | https://security-tracker.debian.org/tracker/CVE-2017-12864  
                        opencv | CVE-2019-14491   | https://security-tracker.debian.org/tracker/CVE-2019-14491  
                        opencv | CVE-2019-14492   | https://security-tracker.debian.org/tracker/CVE-2019-14492  
                        opencv | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                        opencv | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                        opencv | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssl | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                       openssl | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                       openssl | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                       openvpn | CVE-2020-7224    | https://security-tracker.debian.org/tracker/CVE-2020-7224   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2020-7064    | https://security-tracker.debian.org/tracker/CVE-2020-7064   
                           php | CVE-2020-7065    | https://security-tracker.debian.org/tracker/CVE-2020-7065   
                        pixman | CVE-2013-0800    | https://security-tracker.debian.org/tracker/CVE-2013-0800   
                        polkit | CVE-2013-4288    | https://security-tracker.debian.org/tracker/CVE-2013-4288   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       privoxy | CVE-2019-3699    | https://security-tracker.debian.org/tracker/CVE-2019-3699   
                        python | CVE-2013-1753    | https://security-tracker.debian.org/tracker/CVE-2013-1753   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                          qemu | CVE-2015-8345    | https://security-tracker.debian.org/tracker/CVE-2015-8345   
                          qemu | CVE-2015-8619    | https://security-tracker.debian.org/tracker/CVE-2015-8619   
                          qemu | CVE-2015-8666    | https://security-tracker.debian.org/tracker/CVE-2015-8666   
                          qemu | CVE-2016-1568    | https://security-tracker.debian.org/tracker/CVE-2016-1568   
                          qemu | CVE-2016-2391    | https://security-tracker.debian.org/tracker/CVE-2016-2391   
                          qemu | CVE-2016-2857    | https://security-tracker.debian.org/tracker/CVE-2016-2857   
                          qemu | CVE-2016-2858    | https://security-tracker.debian.org/tracker/CVE-2016-2858   
                          qemu | CVE-2016-4001    | https://security-tracker.debian.org/tracker/CVE-2016-4001   
                          qemu | CVE-2016-4002    | https://security-tracker.debian.org/tracker/CVE-2016-4002   
                          qemu | CVE-2016-4020    | https://security-tracker.debian.org/tracker/CVE-2016-4020   
                          qemu | CVE-2016-4952    | https://security-tracker.debian.org/tracker/CVE-2016-4952   
                          qemu | CVE-2016-4964    | https://security-tracker.debian.org/tracker/CVE-2016-4964   
                          qemu | CVE-2016-5105    | https://security-tracker.debian.org/tracker/CVE-2016-5105   
                          qemu | CVE-2016-5106    | https://security-tracker.debian.org/tracker/CVE-2016-5106   
                          qemu | CVE-2016-5107    | https://security-tracker.debian.org/tracker/CVE-2016-5107   
                          qemu | CVE-2016-5126    | https://security-tracker.debian.org/tracker/CVE-2016-5126   
                          qemu | CVE-2016-5238    | https://security-tracker.debian.org/tracker/CVE-2016-5238   
                          qemu | CVE-2016-5337    | https://security-tracker.debian.org/tracker/CVE-2016-5337   
                          qemu | CVE-2016-5338    | https://security-tracker.debian.org/tracker/CVE-2016-5338   
                          qemu | CVE-2016-6351    | https://security-tracker.debian.org/tracker/CVE-2016-6351   
                          qemu | CVE-2016-6490    | https://security-tracker.debian.org/tracker/CVE-2016-6490   
                          qemu | CVE-2016-6833    | https://security-tracker.debian.org/tracker/CVE-2016-6833   
                          qemu | CVE-2016-6834    | https://security-tracker.debian.org/tracker/CVE-2016-6834   
                          qemu | CVE-2016-6835    | https://security-tracker.debian.org/tracker/CVE-2016-6835   
                          qemu | CVE-2016-6836    | https://security-tracker.debian.org/tracker/CVE-2016-6836   
                          qemu | CVE-2016-6888    | https://security-tracker.debian.org/tracker/CVE-2016-6888   
                          qemu | CVE-2016-7116    | https://security-tracker.debian.org/tracker/CVE-2016-7116   
                          qemu | CVE-2016-7155    | https://security-tracker.debian.org/tracker/CVE-2016-7155   
                          qemu | CVE-2016-7156    | https://security-tracker.debian.org/tracker/CVE-2016-7156   
                          qemu | CVE-2016-7157    | https://security-tracker.debian.org/tracker/CVE-2016-7157   
                          qemu | CVE-2016-7170    | https://security-tracker.debian.org/tracker/CVE-2016-7170   
                          qemu | CVE-2016-7421    | https://security-tracker.debian.org/tracker/CVE-2016-7421   
                          qemu | CVE-2016-7422    | https://security-tracker.debian.org/tracker/CVE-2016-7422   
                          qemu | CVE-2016-7423    | https://security-tracker.debian.org/tracker/CVE-2016-7423   
                          qemu | CVE-2016-7466    | https://security-tracker.debian.org/tracker/CVE-2016-7466   
                          qemu | CVE-2016-7994    | https://security-tracker.debian.org/tracker/CVE-2016-7994   
                          qemu | CVE-2016-7995    | https://security-tracker.debian.org/tracker/CVE-2016-7995   
                          qemu | CVE-2016-8576    | https://security-tracker.debian.org/tracker/CVE-2016-8576   
                          qemu | CVE-2016-8577    | https://security-tracker.debian.org/tracker/CVE-2016-8577   
                          qemu | CVE-2016-8578    | https://security-tracker.debian.org/tracker/CVE-2016-8578   
                          qemu | CVE-2016-8667    | https://security-tracker.debian.org/tracker/CVE-2016-8667   
                          qemu | CVE-2016-8668    | https://security-tracker.debian.org/tracker/CVE-2016-8668   
                          qemu | CVE-2016-8669    | https://security-tracker.debian.org/tracker/CVE-2016-8669   
                          qemu | CVE-2016-8909    | https://security-tracker.debian.org/tracker/CVE-2016-8909   
                          qemu | CVE-2016-8910    | https://security-tracker.debian.org/tracker/CVE-2016-8910   
                          qemu | CVE-2016-9101    | https://security-tracker.debian.org/tracker/CVE-2016-9101   
                          qemu | CVE-2016-9102    | https://security-tracker.debian.org/tracker/CVE-2016-9102   
                          qemu | CVE-2016-9103    | https://security-tracker.debian.org/tracker/CVE-2016-9103   
                          qemu | CVE-2016-9104    | https://security-tracker.debian.org/tracker/CVE-2016-9104   
                          qemu | CVE-2016-9105    | https://security-tracker.debian.org/tracker/CVE-2016-9105   
                          qemu | CVE-2016-9106    | https://security-tracker.debian.org/tracker/CVE-2016-9106   
                          qemu | CVE-2016-9907    | https://security-tracker.debian.org/tracker/CVE-2016-9907   
                          qemu | CVE-2016-9908    | https://security-tracker.debian.org/tracker/CVE-2016-9908   
                          qemu | CVE-2016-9911    | https://security-tracker.debian.org/tracker/CVE-2016-9911   
                          qemu | CVE-2016-9912    | https://security-tracker.debian.org/tracker/CVE-2016-9912   
                          qemu | CVE-2016-9921    | https://security-tracker.debian.org/tracker/CVE-2016-9921   
                          qemu | CVE-2016-9923    | https://security-tracker.debian.org/tracker/CVE-2016-9923   
                          qemu | CVE-2017-5957    | https://security-tracker.debian.org/tracker/CVE-2017-5957   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2020-14364   | https://security-tracker.debian.org/tracker/CVE-2020-14364  
                          qemu | CVE-2020-15863   | https://security-tracker.debian.org/tracker/CVE-2020-15863  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                         quota | CVE-2015-9534    | https://security-tracker.debian.org/tracker/CVE-2015-9534   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       rsyslog | CVE-2015-3243    | https://security-tracker.debian.org/tracker/CVE-2015-3243   
                          shim | CVE-2014-3675    | https://security-tracker.debian.org/tracker/CVE-2014-3675   
                          shim | CVE-2014-3676    | https://security-tracker.debian.org/tracker/CVE-2014-3676   
                          shim | CVE-2014-3677    | https://security-tracker.debian.org/tracker/CVE-2014-3677   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                    subversion | CVE-2017-1000085 | https://security-tracker.debian.org/tracker/CVE-2017-1000085
                    subversion | CVE-2018-1000111 | https://security-tracker.debian.org/tracker/CVE-2018-1000111
                    subversion | CVE-2020-2111    | https://security-tracker.debian.org/tracker/CVE-2020-2111   
                     syslog-ng | CVE-2008-5110    | https://security-tracker.debian.org/tracker/CVE-2008-5110   
                       systemd | CVE-2013-4327    | https://security-tracker.debian.org/tracker/CVE-2013-4327   
                       systemd | CVE-2013-4392    | https://security-tracker.debian.org/tracker/CVE-2013-4392   
                        thrift | CVE-2019-11938   | https://security-tracker.debian.org/tracker/CVE-2019-11938  
                        thrift | CVE-2019-11939   | https://security-tracker.debian.org/tracker/CVE-2019-11939  
                        thrift | CVE-2019-3552    | https://security-tracker.debian.org/tracker/CVE-2019-3552   
                        thrift | CVE-2019-3553    | https://security-tracker.debian.org/tracker/CVE-2019-3553   
                        thrift | CVE-2019-3558    | https://security-tracker.debian.org/tracker/CVE-2019-3558   
                        thrift | CVE-2019-3559    | https://security-tracker.debian.org/tracker/CVE-2019-3559   
                        thrift | CVE-2019-3564    | https://security-tracker.debian.org/tracker/CVE-2019-3564   
                        thrift | CVE-2019-3565    | https://security-tracker.debian.org/tracker/CVE-2019-3565   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                  transmission | CVE-2018-10756   | https://security-tracker.debian.org/tracker/CVE-2018-10756  
                      trousers | CVE-2019-18898   | https://security-tracker.debian.org/tracker/CVE-2019-18898  
                  vorbis-tools | CVE-2017-11331   | https://security-tracker.debian.org/tracker/CVE-2017-11331  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                        xinetd | CVE-2013-4342    | https://security-tracker.debian.org/tracker/CVE-2013-4342   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  
                           zip | CVE-2018-13684   | https://security-tracker.debian.org/tracker/CVE-2018-13684  

-- 
http://autobuild.buildroot.net
