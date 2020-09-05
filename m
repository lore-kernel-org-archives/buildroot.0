From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 05 Sep 2020 12:52:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-04
Message-ID: <20200905125304.1020986A27@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 31  |  5  |  0  | 36  |
  2020.05.x  | 23  |  6  |  0  | 29  |
  2020.08.x  | 22  |  7  |  0  | 29  |
    master   | 136 | 92  |  0  | 228 |

Classification of failures by reason for master
-----------------------------------------------

                    olsr-0.9.8 | 16
              host-grpc-1.31.0 | 15
              host-libcap-2.42 | 8 
                   libcap-2.42 | 7 
              asterisk-16.10.0 | 6 
                easyframes-0.3 | 5 
                 gnuplot-5.4.0 | 5 
             kismet-2016-07-R1 | 4 
                       unknown | 4 
host-meson-tools-0a02e2d344... | 3 
                 fwts-19.09.00 | 2 
                 hiredis-1.0.0 | 2 
                  luajit-2.1.2 | 2 
                   mimic-1.1.0 | 2 
   sofia-sip-1.13.1-d10a3d268c | 2 
             host-pango-1.44.6 | 1 
  host-python3-requests-2.23.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                    mpv-0.29.1 | 1 
                 ripgrep-0.8.1 | 1 
                rocksdb-6.10.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                  uhd-3.15.0.0 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/19f128be99d641654e9e134bbba9dafeb39a2fa2 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/144eae3915f96de14419bf0e70a924e03ac3918a |     
  riscv64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/4330689d7a6707211fe116c66ea3f495199e7c10 |     
 aarch64_be  |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/bbbb5120ff7d5eb55484c2ee88bdca140e91f8b7 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/9c47144db15476c03ce96e80caee526ec672896c |     
 powerpc64   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/515199cab10eacf743ece84adf0f55d9247036f2 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/70f736965dce933cd9dffc78e2bfe32a46c6f692 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/79a8650f4aca75a427b4a52cf53a6e1407d4c816 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/ab59cbd2542c5122d1cb8e4196afc0c8711f2be3 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/558c0663e47494a9af0413c67f5371088c94ead3 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/a9a41254699e63985a8fc6923cb5d126427280c2 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/783e74e851074c2d6b7d7e1df6d9b4cff906ddb4 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/2725e9608c7fabc43f25486cff4611136997cd10 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/9ec4bec21b6af328f6d9ec13dce0316c39ee3e5f |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/5f293f7dd88f4959304cf5744d8adcb141e0358f |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/2593dab041c7b34dbe05887c698efd922ef0158b |     
microblazeel |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/9e0a9386949ffdba3814a62a433ad9934b4556f7 |     
   nios2     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/cfcd7bcf10012a39e76abb93dee44886d9db969f |     
    arm      |         hiredis-1.0.0          | NOK | http://autobuild.buildroot.net/results/856f17e37d7814243f16d68ab78286d4f990f29a |     
    arm      |         hiredis-1.0.0          | NOK | http://autobuild.buildroot.net/results/830ec3398cd29b9fc5cde06a225ef531d7a9d850 |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/dc048ea51d2c4549986ac8a2325996c110fb5c99 |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/2bb001a9a4c987474ef35e0a84c7ebd180f635c7 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/c6b1cef250c2a7e738f4d0336181837fe6f2542e |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/5e4fbb25ae337fec8c793d5f05116f7888c8a840 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b88bcf9aa8ec8d17c432edf730a068c7f901d46b |     
    mips     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/e12fd750c7d7c2f2efdf9be2b971c8f8c7b1a551 |     
    mips     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/59e81ec80b44c23ef90f65b1e54590460e16a6a4 |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/1ec2c2f0a963f96ad5b75c736d8bccd7a6d4b675 |     
    i586     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/da5e8aec413cd2130c9033a8192b785baf8bc7dd |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/0aa0e7ce78392cbe95a42d5e03429b6caf3b361d |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/f2d70ce8fab10454924d050fec9d1bac2102016a |     
  mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/ea7c1be4cbc8d82aeffb5098edfe1b50d276392b |     
    mips     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/86a5388abcd3ad6391bd0bdce8b5f61c7ae72461 |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/489ef7037fbee2a1d6634c233a90ff000a1ca4e2 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/79f907ebe0f716cb2a618d0862ab5ce3cef942d9 |     
   mipsel    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/6a4aadafabb22badae50c68ac42f6b1b3540146b |     
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/4ba862e6a14959b3dda0b63c924ab7043e5c6f7d |     
  aarch64    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/103d6ee6daa78a391cd16e47cde4f97f75adc024 |     
  powerpc    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/2c301cc41af73af64d312e159c3db1fb683f3f57 |     
    arc      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/5ddca8a9d1e2c6353b628fbe8d65b440bfd4c440 |     
  mips64el   |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/25e0c56a4edbcaa8984b9396360ba001bdba4ed9 |     
 powerpc64   |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/c00d09ffe809ee7afee674277e30d62ce03de612 |     
  aarch64    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/cf9bc299e2129f49820bc867c0c9c07965d0e8ad |     
    arm      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/9d67cc2b6a132818417df55cc40867d509ab05d8 |     
   mipsel    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/7db4cbcf3380e29536a3ff1c370413c25b66dfd4 |     
 aarch64_be  | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/4dbadd40264d838808e7ddd915f7b3b8b2d09c1f |     
   nios2     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/fff8887810ad661ce4e300c4149fc63843cb1a94 | ORPH
    arm      |  host-python3-requests-2.23.0  | NOK | http://autobuild.buildroot.net/results/fd73a948ed43d3fa3fdde5237a04cc5131936105 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3fb40b4ee97d29dfc74cb0a498abcaad5cfa8e4e | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ab3f5b5aa0ce6047b207624d1cdf7e135608361d | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b66575be24612b0767b7b8f6a89f3f5c7bcff1a6 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/cbf118a207b9978434a38f2181fbd6740c28da28 | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c73a388e2614745e12c8bfc25ad6af3dfc9f10bd |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/d38038138cfb4ebab075f705b9b214d6835c92a8 |     
    i686     |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/68c940f5ead95408660f376b820b07903db64396 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/d5a398a492ca8419deeae50c30e5884bcae201af |     
  powerpc    |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/05c6625850b591f6fa5f0fb2b3019b4e16347ea9 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/0f6dba00a23ad6ae9ef8ff3ec88342641602cfea |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/3c0f31fa63c9c3b2d77aea85cb48acb2eb6f9a27 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/95e3e70819e107ed7f8aa519d64e0e72948ce1e1 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/d0da3bf1d38650a515be40494d09431a1ab60f13 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/30beaaf457e3d87985c835e12d968315852c0491 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f48dfbc3ed723696fab8ef68324520aabba6ee4b |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e2812768bba4aa4da499680f76ea90792f409a0e |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ba5c92482f516cf893c02b9f6d70edb1eac91fa9 |     
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d6b3667fdaee8e61c57951f559c816c0a345fd8e | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c8404651cec9c9f4fb4d52f9c273bb7c8acf55a4 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/63778d98330696c7e0cf763608699a7fca049b71 | ORPH
   xtensa    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/7de09f8534950d8762e0e3255272a0c382b3bb1d | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3eb3c4ca6c315897b30a52eb2282c61a2de20a4c | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c7186c5d76a3b431593aa90c17cf1c8dc9030408 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/71e34a0488a46e6b6be0065ef9f05f2a2fe35505 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6f369099d9ef4629981c2eb58c9a8055a80181e4 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/7c53b2d19a767452a292b8322636cb8a384fd3eb | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0913b1cdf5c0e9d2d7646c31d94ab7012896f716 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/62840273db18eb67b62bc02ca7848d3c3d03ac84 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5587b11399be853557dd70b657466ced0c6fe8a3 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/599b17ba054183e846e0dce3a54cfb4fedb661ee | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/131f8ce162c9ec40f36aa0f7b847d50d0b5be079 | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/821ef08752918e710f583f0aed2d9eca97fb97bb | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2ea6001c3e4d25123df3fb555a7e8e8aba73183c | ORPH
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f2eab5752da4119b0ad3d29f5da31bf3e86294fb |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/79784534f17af0d8bc7cbe3f3ea557ddcee63281 |     
    arm      |  sofia-sip-1.13.1-d10a3d268c   | NOK | http://autobuild.buildroot.net/results/c405be3ab50d55ec74c78af6e7d58759e33d63da |     
    arm      |  sofia-sip-1.13.1-d10a3d268c   | NOK | http://autobuild.buildroot.net/results/3e38eddbb501877ad1bb5a8c34fecf60c3c59815 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/66174934c7b1428f9fbc4cc18152ca5e94d51357 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d6b2517c8433706ae191428c099ed9304be9aa3e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0ee6c5ad23e65bdd5f45c9a0caff97850cfaa532 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/ee1e988ea3f441bc928026a87a1d9736eeda95f2 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0f963beaf6f622aad0b7327823665d7476a38838 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/55dd550ffffa331cc4307e705b3d43d8f8584d17 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/8f0b4aefe79e1dcaec62f314467220970d59a4a4 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

domoticz-0f411f781ae4fb4a82... | 1 
                   expat-2.2.9 | 1 
              host-grpc-1.25.0 | 1 
                   libiio-0.18 | 1 
        qt5imageformats-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c23e87601c935886e68b0723b970dcd4fcd15f10 |     
    m68k     |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/07ab1fbc156677f0248b4d731dcbc8ff65236366 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2a5e9bcd9277eb38cdbc5087df0fb32e782b3c44 |     
    arm      |          libiio-0.18           | NOK | http://autobuild.buildroot.net/results/70adba80ed34b4f42d4f1764a53ab4ca1cadc563 |     
  riscv64    |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/9e13df31533b4ce602e80de3a1bff3959c9b6681 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
              luabitop-1.0.2-1 | 1 
                 rocksdb-6.6.4 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a17e34c0aa90414ff4f7d992f31ff045c5cfacd3 |     
    mips     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/1dbdf5feaa87020bcfe732dbac9d1d7eb1eca8b3 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/722f58d426aaec92227d9f20b3f5e7d4f8404ad1 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/b2971823692230c0b6e8f56da7ee87954df3f0d2 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/566e1efb3a9b30692a3b9380dc7c3a39ca9f3854 |     
    arm      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/0ef27679d32ffa711d9b30a27ab13a236b58b433 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               apparmor-2.13.4 | 1 
              bitcoin-0.19.0.1 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
             kismet-2016-07-R1 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/9d9f5145ed9ef14f2182e44ca18d20b404910a80 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/c461f3fcb9f56c9e19f2166d6dbf1d755597fcfd |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/f57f2347d2f96e3b7657ca3e0e191e31a37c6cd5 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/fe373e6175685cb0595df51d87a7fea086e76ae3 | ORPH
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/1369386ed8cd5cf99cb760068628e1d8669107f4 | ORPH
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a225f00ef42abefcc3c8af0aa8f137b57c00f425 |     
  powerpc    |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/af14f4af56e0ad7d71f6c86982eb1a0801a64f3f |     


Gitlab CI results for 2020-09-04
================================


-- 
http://autobuild.buildroot.net
