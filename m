From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 04 Jul 2020 19:52:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-07-03
Message-ID: <20200704195254.E204A88453@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-07-03
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 17  |  8  |  0  | 25  |
  2020.05.x  | 19  |  3  |  0  | 22  |
    master   | 99  | 111 |  1  | 211 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.14 | 44
          fuse-overlayfs-1.1.2 | 7 
             freeswitch-1.10.3 | 5 
                  assimp-5.0.1 | 4 
               domoticz-2020.1 | 4 
              host-grpc-1.25.0 | 4 
                       unknown | 4 
                     avahi-0.8 | 3 
libcamera-96fab38e02792a109... | 3 
                  boost-1.73.0 | 2 
      gst1-plugins-base-1.16.2 | 2 
             kismet-2016-07-R1 | 2 
                 openal-1.19.1 | 2 
                 ripgrep-0.8.1 | 2 
              tinydtls-0.9-rc1 | 2 
                  xvisor-0.3.0 | 2 
                     belle-sip | 1 
               belle-sip-4.3.1 | 1 
                 dmalloc-5.5.2 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
          gstreamer1-mm-1.10.0 | 1 
                hiawatha-10.10 | 1 
             host-pango-1.44.6 | 1 
                libcurl-7.71.0 | 1 
            lttng-tools-2.12.1 | 1 
                 mesa3d-20.1.2 | 1 
              micropython-1.12 | 1 
                   mpd-0.21.24 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
               protobuf-3.12.2 | 1 
                 rocksdb-6.6.4 | 1 
                 rsh-redone-85 | 1 
                  rygel-0.38.3 | 1 
                wayland-1.18.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/8bb42f76b980cb61e0eb0b9577f638182dda1a26 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a2697df0a1650a476ae50ea1c2585eb48ca630d8 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/9459acf5cb438c1450cdf6bdc3355e95d4507a6e |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/df4e5ed41697bc31df6c9f28709fb67d7a78ebd0 |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/99755b7518e7d5e222194aa4eb7d384c3bffebdb | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3d8114c4b47d1abcf6dbb1f870e18ec4999519ec | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c8dd95414076bc4bbd1ab1c217ffd93af0552b40 | ORPH
   xtensa    |           belle-sip            | TIM | http://autobuild.buildroot.net/results/d3dbd1efc9e4df0c61e5a84a28f6f851def7495f |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/917f4844f0e0c997415da3aa15a950fe34e2195b |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/9ff7c5c3d395da34a28eb95ad7b4f1b3640f2c01 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/221ddcd25d39fae10a99d544ac68edee6d64bc07 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/abe2222a22e4a68b63c02b70763d96e85d1bdc44 | ORPH
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/a0949a8e7e7cc5e469390fa42a849e440d5eef9b |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/caa530e1d1b9811bfe28d0e1d3bb73f5d6202e22 |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/729f9fc3e9c39b3354ff3d733b1381f2d7ea0df7 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/b80bd20eefa94dcd84504df14bcefed2f89788e0 |     
   x86_64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/b6d2fa5a69c5514c8bb6df15b7f8fee259149449 |     
  aarch64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/ca9a9a00b4fe29c2cc2933891235d14cbe6c0c0b |     
    mips     |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/1039f5a2e7cd3f7bfecdfc5f70f37c774ba28e9f |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/baf2fcb57dec9fc34a5bc9e2cb6a23fee20f0f2c |     
 aarch64_be  |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/c1e6bef18baa0e94c8f7d9abf051de2e3c52cba6 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/ac4d778ab9af97c471623eff99ad42018d314d55 |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/9bb462db8fc014254868ca11df6af44748d336ef |     
microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/c6976896db58f23731bdb0084854d6e5d0d36c30 |     
  powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/e3a66877e11c800886de7a565396bc67495780a8 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/59f3ba5a2e8116a904725e9f9c60743746f0a71e |     
   x86_64    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/ae9fa18c902d2e4b3790b5f4057f24926f868445 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/96f7780f951a4451b3bcb726116dc9e41dfaa86b |     
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/b2c67ac94e5a13cf7d4eecbbf3215d8fff2f9910 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a43c1de9668295bdbe56d8653b5c95d7aa4e5844 |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/4fb5a62e055f1d5ee0578ffecc3e393e3354beb8 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/3c3203eba48300d451c7b0934036660401d4914b |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/adc25f67b19b884f760bce76e03ebe4717a3cad4 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/e9ce32c3b28b1d6cecc9221751902d1a0a2dfc9d |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/4b071d195cf94767ee253cfea04dfae711656a3b |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/1dabcc8e7302737b25f0088c7987c2b86d4b996a |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9b5c009e12e8585a8e517e2d618e6684d154a8af |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/da2b2ca28b3973778f890a506474719c546df702 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/1d3cc0acd6aca53e67360ae1c3e818d9b901fa5b |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/75dfa6a7927306cb439035add03034036af783f9 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8c79033e7b651e3d87cbb2a3469f5e433f0feb36 |     
    or1k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/13cd6ddb4ac29cece1cd76576ccd52ed3ccf952b |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8073dd3428232c7ce33c25afdc57017c747fe781 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/7eb9fa4ee2c8b895d333e9742f52e7c58deaafa7 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/079a16489c31958a628d65a650ec9ab27a56d5c3 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/c82150a9d59aa1651b6f85796fe8388f7178aa8d |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/7f26d17c2873edd8dd5a5ee75befadfa007855a4 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/21031de716b97e496012a12d81fc808cf156eebe |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/84c33e9eab6611ea6ebf2f81618440dbf822ab68 |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/eb1a8daf541f3595cfe3cce6712d0ff7b77b7772 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9295a6476823e7b15ecba8980a303d3e84784959 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/d041e66473c904e8ffe55f13f9c7e058b26d57de |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/2f4250cde10cb952504cfa1ac34ac5c487c9deb6 |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/37ca6f480a1352a4f4d47fa2bb62adbdcc196aa3 |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/79f98b25adda1d403f302e1312a2438fa8ae2459 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/98678854593b374aeec2f37d7538ddaf7ce3983a |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/eb54a33ce5221b02b2f901e02e9c689553e5c46a |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/eab5c478a10237a2cb31e744fba0c2f9be9a30af |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/5e6817a4ca1071bd1038ffee6230fde68c2aefaa |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/2539c3375dddd84ee92225011c53178f77a29258 |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/54070f082a128430cbb1d22eea88ddb9b575922d |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/4b3ddbb1b5bc9d8c0fb7aacc979528667ff9ba8d |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8745b231152028c0278ecbd08ddf1963ee76e296 |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/3ee4306d3e9edface6cee0460f3a8c2a3da3b054 |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/655cc6f6cd696afa3ffee2efc64a48b43497b397 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/038a68a20a5e4a301f6737548d405a62d300fecf |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ecc762b0f12c6e7fa7c4c2df84cf30b68b1d8cf8 |     
   sparc     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/74e87ff9d5847d4fb1d626edbd108a4051aaf3dc |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a6c7d49f6ff21a2e709e845b1729cb1960921583 |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/f5ccfcb25e88c4c0264d7e681f21e53d17ace2b4 |     
    or1k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a26792dab29bfa2999f18879592da7a43124cc14 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/3912cfc0c3f21258142997cd3999fa7da1233f62 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/bf52cf2720600290ca29bbadd3ba1cce1cf1d8e9 |     
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/dbe3de7e59266ef62cbad7bad06ef057891a87b5 |     
   x86_64    |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/32d778ed6811c5292f1d30c2483a9a8e61d87700 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/55272aecbac915d35fa704f72dedd8dfd85764c1 |     
    arm      |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/3ce4428e757a4d163736560e304f8ef4ec072ea0 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/eb3afbd9b8aac36feffafaca25c03537a133a411 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5254d5fa9a305a3a6f2ab44c8c0bd18008b4b16c |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b592a0e5c964a5d5bf80d85ec2bd3e0087bb8997 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/74a2f55b9ca5ee987baafa9dfdcf2b602c9c7eba |     
    or1k     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/88c7b4de89d78b7db8eed7885d9f9771ccf86930 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/57774d0acdc48688ab7fa2e90f3f0bfeb4cf3360 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/7cbbab526c652d4ea2234e90037b47f187cc73c1 | ORPH
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/2e2e52f7037cfd160398286202b0264d0e083b25 |     
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/75042fdf6287dc59b33957af293972c752274681 |     
    mips     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/8e8a628ced7a34e3f052dbeef8fa00d4acc1b27f |     
    arm      |         libcurl-7.71.0         | NOK | http://autobuild.buildroot.net/results/19de1111318aea863118c9b0b44dc282f011918f |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/41acdb92894b6d1be79c40b432529323eb659aee |     
  riscv32    |         mesa3d-20.1.2          | NOK | http://autobuild.buildroot.net/results/2b5627c1a8b62d91ee8a7bd2fc0b0eccd9006ffb |     
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/5d3ec3f3a7634ff9fc406277f2c5ee3643d1cda1 |     
  riscv64    |          mpd-0.21.24           | NOK | http://autobuild.buildroot.net/results/00e9ca7ff78a65ac7d5c8fe25e18913c0636fdf2 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b511fc8af285b61308e9ff655ebf0bfd312ad6d2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/76b43cf0c47575c33a2b48bae6b27904fc19d1d1 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/03f0152cca29bc2245dd66e8468ba4a03c8389f8 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/5e553ce59377035f305d7450d73186f4c28cee57 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/6bc39c56b2f4f1d7e5a0c12100afe657a8a69dcc | ORPH
  riscv64    |        protobuf-3.12.2         | NOK | http://autobuild.buildroot.net/results/6a0fb6e918171105e75443a69d03621c058b8bd6 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f3361f7603539391b8e4e2c41f22fc94594e7b05 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/a002b7991ce698a4eb3e82047483109db45dd5aa |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/b78cc3b8017a45aa6ff39e33c4855eec563a4f82 |     
    i586     |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/8260a7448563fd17184fe349aa2199f119a8dc94 | ORPH
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/64946ae2e841b66e53bfe060d59eaac03aca9aa4 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b8df17e6555924bd28227f2c68e518960975e258 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fad8de2303d0bc2c777fbbb8c8912a5a73b38ceb |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/d73b21b15c0a2299dec9682a50552325d102a155 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/60b39b23aa2b42c8ecc32807dd77e38ccf08f7d0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/94d475113e430834fcea013082bb7f0c50a58379 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8534a0099d39c542d1eb0cf367115a13f8da4023 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/ff1d09c684eef0f03ff161482f7c0782492b4b8b |     
  aarch64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/ffd4a6ab92d4217cb3af53691e8b403c72ae63c1 |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/73563adb43a8aa1063cac18a8d04d20bb7c1ffab |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                       unknown | 4 
               acpica-20191018 | 1 
                 binutils-2.32 | 1 
                 mesa3d-19.3.4 | 1 
                   mimic-1.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/04b82e8293b61c2e469d456fd40e40345d4b3869 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/218e3ad28f5da7926e2c6abdb3f74fadcf20e5af |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/82e35a4eb72405b41c0d2b3db35446ae4028f720 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/575c1fb20a0218d6df70da5e0c41a5932529e32d |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/46ac4546218c0e084160548ed742dbcf02eb15a0 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e3cb614f1f69d746ef6ffa81202aaee1887b958e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/599419e77d9b427b3d94b535c9915bdc122cda2a |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0761b3124a7b671110132b32b91d4859aa1c827c |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.13 | 1 
                suricata-4.1.8 | 1 
                thermald-1.9.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/6bcbef80cfc9ed4a950afb04348f05e9c24ae484 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/7815cf48ff5c564495b7de1ca109d5ed147ac3aa |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/d42890ee7374c5eca6174aa8b66dcfe4b82542f8 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8.7_SP3      |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.37.2       |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.1.2        | 4.3.1        |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r39   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.7.9        | 1.8.0        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.850.1      | 9.900.1      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.10.0      | 17.5.1       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.2       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2020-01-22   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.2        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2020.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.1       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.3.1        | 4.5.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.3.1        | 4.5.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.3.1        | 4.5.0-alpha  |     
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.19      | 9.17.2       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.2        | 3.6.4        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.20.0       |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.0.0-alpha1 |     
                  bridge-utils |  DISTRO  | https://release-monitoring.org/project/00217 | 1.6          | 1.7          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.6          | 5.6.1        | ORPH
                       busybox |  DISTRO  | https://release-monitoring.org/project/00230 | 1.31.1       | 1.32.0       |     
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20190110     | 20200601     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.7.0        | 0.8.0        |     
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.45.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.45.0       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.31       | 1.4.33       | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-alpha  |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.14.0       | 0.15.0       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.0          | 20200619     |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/08547 | 3.0.0        | 3.0.1        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 10.0.0       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.17.3       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.6.0        | 0.7.1        |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.3.1        | 2.3.3        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.26.0       | 1.27.5       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.9.0        | 2.11.0       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                           daq |  DISTRO  | https://release-monitoring.org/project/13264 | 2.0.6        | 2.0.7        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.18      | 1.13.16      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.11         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 9.1.2        |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.11     | 19.03.12     |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.13       | 1.4.0-beta.0 |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.11     | 19.03.12     |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2020.1       | 2020.2       |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.9        | 0.5.10       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.12.0       | 9.13.1       |     
                      dropbear |  DISTRO  | https://release-monitoring.org/project/00466 | 2020.79      | 2020.80      |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.0.6        | 3.0.7        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.24.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.03        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.180        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.3       |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.8        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.24.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.15       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.0.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.4        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.6        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.23       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.8        |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.5        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.34       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.20       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.33       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.6        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.19       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.41       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.7        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.25       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.5        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.7        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.3.0      | 2.6.1.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.5.1        | 2.5.2        |     
                          exim |  DISTRO  | https://release-monitoring.org/project/00768 | 4.93.0.4     | 4.94         |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.2       | 0.27.3-RC2   |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.4          | 3.4.1        |     
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.39         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.19         | 3.20         |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.1        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.13.1       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.1.1        | 2.1.2        |     
         freeswitch-mod-bcg729 |  DISTRO  | https://release-monitoring.org/project/21862 | 1.0.4        | 1.0.5        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.1.0        | 1.1.1        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.06.01     |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.36.0       | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.0.3        | 2.0.5        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.4.0        | 1.5.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.20.2       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.50         | 9.52         |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.26.2       | 2.27.0       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.65.3       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.12       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.5        | 6.2.7        | ORPH
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.2.8        | 5.4.rc2      |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.12      | 1.14.4       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.19         | 3.20         |     
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.14       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.30.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 3.37.1       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.2.2        | 1.2.3        |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.16.2       | 1.17.1       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.0       | 0.13.1       |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.16.2       | 1.17.1       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.16.2       | 1.17.1       |     
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.16.2       | 1.17.1       |     
   gst1-plugins-bayer2rgb-neon |  DISTRO  | https://release-monitoring.org/project/21851 | 0.3          | 0.4          |     
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.16.2       | 1.17.1       |     
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.16.2       | 1.17.1       |     
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.16.2       | 1.17.1       |     
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.16.2       | 1.17.1       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.16.2       | 1.17.1       |     
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.16.2       | 1.17.1       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.6.1        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 3.0.4        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.2.2        | 1.2.3        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.45.2       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.1.4        | 2.1.7        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.6.4        | 2.6.8        | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.6       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.335        | 0.336        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.2.0        |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1628         |     
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.10+nmu1    | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.10-21    | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.1        |     
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.2.2       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.1.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.3.pre1    |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.489        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.6        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.4        | 1.8.5        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                       jansson |  DISTRO  | https://release-monitoring.org/project/01417 | 2.12         | 2.13.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.10.1       | 0.10.2       |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.4        | 2.0.5        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.2       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.2       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.1.2        | 2.1.3        |     
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-04-R3   | ORPH
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.3-Leia   | 2.1.3-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.2-Leia   | 2.3.0-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.2-Leia   | 2.1.3-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.2-Leia   | 2.1.3-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.2-Leia   | 2.1.3-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.5-Leia   | 2.3.0-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.5-Leia   | 2.1.2-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.6-Leia   | 2.1.1-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.4-Leia   | 2.1.1-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.4-Leia   | 2.1.1-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.3-Leia   | 2.1.1-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.5-Leia   | 2.6.0-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.9-Leia   | 3.1.1-Matrix |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.6-Leia   | 6.0.1-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 7.0.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 6.0.1-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.6-Leia   | 5.0.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 6.0.0-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.21-Leia  | 7.0.1-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 6.2.1-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 6.0.0-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.16-Leia | 7.0.2-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.20-Leia  | 6.0.1-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 6.0.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.7-Leia   | 5.0.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 6.0.0-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 7.0.0-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.4-Leia   | 6.0.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 6.1.0-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.6-Leia   | 5.0.1-Matrix |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 18.1.19-Leia | 19.4.1-Ma... |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.2-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.4-Leia   | 3.1.2-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.3.2-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.4-Leia   | 3.2.0-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.2-Leia   | 2.3.1-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.3-Leia   | 2.4.2-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.2-Leia   | 2.2.2-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.1.2-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.4-Leia   | 2.2.3-Matrix |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 2.3.1-Leia   | 3.4.0-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.6-Leia   | 1.3.0-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.1.0-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.2.1-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.1.1-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 2.0.2-Leia   | 2.2.0-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.2.0-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/09815 | 2.10         | 2.11         |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 551          | 562          | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.36         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                      libdvbsi |  DISTRO  | https://release-monitoring.org/project/21571 | 0.3.8        | 0.3.9        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.1        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.7        | 1.0.9        |     
                      libftdi1 |  DISTRO  | https://release-monitoring.org/project/14622 | 1.4          | 1.5rc1       |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.2        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.5        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.36.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.64.3       | 2.65.0       |     
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.37         | 1.38         | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.25       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5.1        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.0        | 1.8.1        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20200225     | 20200521     |     
                 libhttpserver |  DISTRO  | https://release-monitoring.org/project/21934 | 0.18.0       | 0.18.1       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.19         | 0.21         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.1        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.2.0        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.18.1       | 1.18.2       |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.3.5        | 1.4.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.40         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.22.0       | 1.24.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
            libnetfilter_queue |  DISTRO  | https://release-monitoring.org/project/01679 | 1.0.3        | 1.0.5        |     
                        libnfc |  DISTRO  | https://release-monitoring.org/project/01680 | 1.7.1        | 1.8.0        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.6        | 1.1.7        |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/07953 | 4.25         | 4.26         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.53.1       | 3.54         |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.1.4        | 3.1.5        |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.1.0        | 2.1.1        |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200311  |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.1.0        | 2.2.0        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.1.2        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.14      | 1.26.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.1.2        | 3.1.3        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.49.2       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.3        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.1       | 0.20.3       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20200619     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.0          | 20200619     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.0          | 20200619     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.3        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.70.0       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.20.2       |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.12.1       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.7        | 1.12.1       |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.11.1       | 0.12.1       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 1.0.18       |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.7.1        | 2.8.0        |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.9.2        |     
                  libvncserver |  DISTRO  | https://release-monitoring.org/project/01756 | 0.9.12       | 0.9.13       | ORPH
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 3.2.2        | 4.0.19       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                       libyaml |  DISTRO  | https://release-monitoring.org/project/01800 | 0.2.2        | 0.2.5        | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.3.1        | 4.5.0-alpha  | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2020.06.25   | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lshw |  DISTRO  | https://release-monitoring.org/project/06701 | 02.18        | 02.19.2      | ORPH
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.0.19       | 1.0.20       |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.11.0       | 2.12.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.1       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.11.0       | 2.12.1       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.2.1        | 4.0.2        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.23      | 10.5.4       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 168          | 170          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.3.1        | 4.5.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.6.6        | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                        mender |  DISTRO  | https://release-monitoring.org/project/20629 | 2.2.0        | 2.3.0b1      |     
               mender-artifact |  DISTRO  | https://release-monitoring.org/project/20630 | 3.3.0        | 3.4.0b1      |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.54.2       | 0.54.3       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.37.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.9.2        | 2.10.0       |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 57           | 59b          | ORPH
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2020.05      | 2020.06      |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.10      | 1.14.0       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.2.4       | 4.5.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.10.0.104   |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.1        |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.23      | 0.21.24      |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.13      | 1.26.1       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0          |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.14.4       | 1.14.5       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.9.2        | 4.9.3        | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.14.2       | 1.15.1       |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.37         | 0.38         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200613 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.0       | 1.23.0       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre2   | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.5.1        | 3.6          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.25.2-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.4        | 0.9.6        |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.9       | 1.19.0       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                        ngircd |  DISTRO  | https://release-monitoring.org/project/02083 | 25           | 26           | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.18.0      | 14.4.0       |     
                           ntp |  DISTRO  | https://release-monitoring.org/project/09025 | 4.2.8p14     | 4.2.8p15     | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.138      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.12         |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.7       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.5        | 6.9.5_rev1   |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.10       | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.29       |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.2.1        | 6.3.1        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.4        | ORPH
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.1.0       |     
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.2        | 0.4.3        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.7.0        | 3.9.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.7.0        | 3.9.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.7.0        | 3.9.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.7.0        | 3.9.0        |     
                      opusfile |  DISTRO  | https://release-monitoring.org/project/10353 | 0.11         | 0.12         | ORPH
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.20       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.3.1        | 4.5.0-alpha  | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.20      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.45.3       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.2       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.11         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.6        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202005       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.34        | 10.35        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 2.4          | 2.5-rc1      |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.3       | 5.32.0       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
                perl-file-util |  DISTRO  | https://release-monitoring.org/project/21731 | 4.161950     | 4.201720     |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.44         | 6.46         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.58         | 1.20200513.1 |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.40         | 8.56         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.24         | 1.25         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.010001     | 1.010002     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0205       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.0.4        | 2.1.0        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 76           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.6        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.7.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.9.4        | 1.10.1       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.0          | 20200619     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 0.89.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.11         | 2.13         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6c       | 1.3.7rc4     |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.12.2       | 3.12.3       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b3        |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/21244 | 0.1.16       | 0.2.1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.7       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.2.10       |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.4.3       | 20.6.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
               python-backcall |  DISTRO  | https://release-monitoring.org/project/19636 | 0.1.0        | 0.2.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.1        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.1.0        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2020.4.5.1   | 2020.6.20    |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 2.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.3.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.4.2       | 20.6.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.9          | 2.9.2        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.17      | 3.0a5        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 2.5.0        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.48.1       | 0.49.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.7        | 3.1b1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 1.16.0       | 2.0.0rc1     |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.2.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.5.1        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 3.13.0       |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 1.0.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.4.3        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.5        |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/06870 | 0.4.15       | 0.4.16       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0.1        | 1.1          |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.2       | 0.18.1       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 2.4.0        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.0        |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/11475 | 0.14.0       | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.16.1       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.0a1      |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.1        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.17.0       | 0.17.1       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.2       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 21.2.1       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.2.0        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.8          |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.2.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.3.0rc1     |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a4      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.2.0        | 8.4.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.44.0       |     
               python-mwclient |  DISTRO  | https://release-monitoring.org/project/09693 | 0.10.0       | 0.10.1       |     
                python-netaddr |  DISTRO  | https://release-monitoring.org/project/05586 | 0.7.19       | 0.7.20       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.19.0       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.3.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.5        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 20.2b1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.5        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.12.2       | 3.12.3       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.8.1        | 1.9.0        |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.5.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev10  |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.6.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.5          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
                 python-pynacl |  DISTRO  | https://release-monitoring.org/project/12703 | 1.3.0        | 1.4.0        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.7        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.6       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.0       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.12       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.2.1        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.30.0       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.54.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2020.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.6.8     |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.3.10    |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.23.0       | 2.24.0       |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.2.3        | 4.2.4        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.10.1       | 2.10.2       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.14.4       | 0.15.1       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 47.3.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.5.0        | 4.1.2        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.12.14      | 1.13.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.2        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                    python-six |  DISTRO  | https://release-monitoring.org/project/04027 | 1.14.0       | 1.15.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.4        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.6.0        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.1.0        | 2.2.2        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0.1        |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/21612 | 3.4          | 3.5          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.18       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.1        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.3.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 3.0.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.10.0       | 0.10.1       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.46.1       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 20.4.1       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 20.3.1       | 20.4.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.1.1        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.6.0        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 3.0.0        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.9       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.3       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.51         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.9        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.27.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.1.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.3        | 3.9.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
            python3-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.6.8     |     
              python3-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.23.0       | 2.24.0       |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 47.3.1       |     
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.3.2        | 8.0.0        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.31.0       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/15197 | 0.8.1        | 0.9.1        |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.8.5        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 6.0.4        | 6.0.5        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190609   | 2.20200229   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.0          | 20200619     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.9        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.6.4        | 6.10.2       |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.12         | 3.14         | ORPH
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.15.1       | 4.16.0-beta3 |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.1.3        | 3.2.1        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2004.0     | 8.2006.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.7.1        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc10   | 1.0.0-rc90   |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.44.1       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.44.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.2.0      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.2      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.2.4      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.1.2      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.9       | 4.12.3       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.30       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20200619     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20200619     |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.0          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.0        | 0.7.1        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.7          |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.3.11a      | 3.4.1        |     
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.15.1     | 2.9.16       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.3.0        | 4.4.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.11         | 5.0.3        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.1       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.1.2        | 6.2.1        |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.4        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.13.0       | 1.14.0       | ORPH
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.8.31       | 1.9.1        | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.8        | 5.0.3        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/04919 | 4.0.1        | 4.0.2        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2019.11      | 2020.04      |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.7       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.27.1       | 3.28.1       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.2.1       | 12.3.3       | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.6.0        | 1.7.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.2          |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.2          |     
                           tor |  DISTRO  | https://release-monitoring.org/project/04991 | 0.4.2.7      | 0.4.3.5      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.0        | 2.3.2        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.1        | 4.2.1        | ORPH
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.3        | 2.4.2-rc1    | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 2.94         | 3.00         |     
                          ttyd |  DISTRO  | https://release-monitoring.org/project/13890 | 1.6.0        | 1.6.1        |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                       uhubctl |  DISTRO  | https://release-monitoring.org/project/17364 | 2.1.0        | 2.2.0        |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.2        | 5.9.3        | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.35.2       | 2.36-rc1     | ORPH
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.48.6       | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.16.0       | 3.16.1       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.2          | 0.3          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.1065     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.60.3       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.18.0       | 1.20         |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.28.2       | 2.29.2       |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 5.0          | 5.0.1        |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.15       | 1.4.16       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.2        | 3.2.3        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.6.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.43         | 5.44         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.7          | 3.9          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 356          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.11       | 0.3.0        |     
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.2        | 0.7.4        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.2.5        | ORPH
                          zbar |  DISTRO  | https://release-monitoring.org/project/13689 | 0.23         | 0.23.1       |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                          zlog |  DISTRO  | https://release-monitoring.org/project/21624 | 1.2.14       | 1.2.15       |     
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.5        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2020.1       |     
Packages having CVEs
====================

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                          bash | CVE-2019-18276   | https://security-tracker.debian.org/tracker/CVE-2019-18276  
                      binutils | CVE-2019-12972   | https://security-tracker.debian.org/tracker/CVE-2019-12972  
                      binutils | CVE-2019-14250   | https://security-tracker.debian.org/tracker/CVE-2019-14250  
                      binutils | CVE-2019-14444   | https://security-tracker.debian.org/tracker/CVE-2019-14444  
                      binutils | CVE-2019-17450   | https://security-tracker.debian.org/tracker/CVE-2019-17450  
                      binutils | CVE-2019-17451   | https://security-tracker.debian.org/tracker/CVE-2019-17451  
                      binutils | CVE-2019-9070    | https://security-tracker.debian.org/tracker/CVE-2019-9070   
                      binutils | CVE-2019-9071    | https://security-tracker.debian.org/tracker/CVE-2019-9071   
                      binutils | CVE-2019-9072    | https://security-tracker.debian.org/tracker/CVE-2019-9072   
                      binutils | CVE-2019-9073    | https://security-tracker.debian.org/tracker/CVE-2019-9073   
                      binutils | CVE-2019-9074    | https://security-tracker.debian.org/tracker/CVE-2019-9074   
                      binutils | CVE-2019-9075    | https://security-tracker.debian.org/tracker/CVE-2019-9075   
                      binutils | CVE-2019-9076    | https://security-tracker.debian.org/tracker/CVE-2019-9076   
                      binutils | CVE-2019-9077    | https://security-tracker.debian.org/tracker/CVE-2019-9077   
                           boa | CVE-2009-4496    | https://security-tracker.debian.org/tracker/CVE-2009-4496   
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        cereal | CVE-2020-11105   | https://security-tracker.debian.org/tracker/CVE-2020-11105  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                            ed | CVE-2015-2987    | https://security-tracker.debian.org/tracker/CVE-2015-2987   
                          exim | CVE-2020-8015    | https://security-tracker.debian.org/tracker/CVE-2020-8015   
                        ffmpeg | CVE-2020-14212   | https://security-tracker.debian.org/tracker/CVE-2020-14212  
                          flex | CVE-2015-1773    | https://security-tracker.debian.org/tracker/CVE-2015-1773   
                          flex | CVE-2019-6293    | https://security-tracker.debian.org/tracker/CVE-2019-6293   
                           git | CVE-2018-1000110 | https://security-tracker.debian.org/tracker/CVE-2018-1000110
                           git | CVE-2018-1000182 | https://security-tracker.debian.org/tracker/CVE-2018-1000182
                           git | CVE-2019-1003010 | https://security-tracker.debian.org/tracker/CVE-2019-1003010
                           git | CVE-2020-2136    | https://security-tracker.debian.org/tracker/CVE-2020-2136   
                         glibc | CVE-2020-6096    | https://security-tracker.debian.org/tracker/CVE-2020-6096   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         iperf | CVE-2016-4303    | https://security-tracker.debian.org/tracker/CVE-2016-4303   
                      ipmitool | CVE-2020-5208    | https://security-tracker.debian.org/tracker/CVE-2020-5208   
                        jasper | CVE-2017-14232   | https://security-tracker.debian.org/tracker/CVE-2017-14232  
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2015-9251    | https://security-tracker.debian.org/tracker/CVE-2015-9251   
                        jquery | CVE-2019-11358   | https://security-tracker.debian.org/tracker/CVE-2019-11358  
                        jquery | CVE-2020-11022   | https://security-tracker.debian.org/tracker/CVE-2020-11022  
                        jquery | CVE-2020-11023   | https://security-tracker.debian.org/tracker/CVE-2020-11023  
                        json-c | CVE-2020-12762   | https://security-tracker.debian.org/tracker/CVE-2020-12762  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libcroco | CVE-2020-12825   | https://security-tracker.debian.org/tracker/CVE-2020-12825  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                       libnids | CVE-2010-0751    | https://security-tracker.debian.org/tracker/CVE-2010-0751   
                       librsvg | CVE-2018-1000041 | https://security-tracker.debian.org/tracker/CVE-2018-1000041
                       librsvg | CVE-2019-20446   | https://security-tracker.debian.org/tracker/CVE-2019-20446  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libupnp | CVE-2020-13848   | https://security-tracker.debian.org/tracker/CVE-2020-13848  
                  libvncserver | CVE-2018-21247   | https://security-tracker.debian.org/tracker/CVE-2018-21247  
                  libvncserver | CVE-2019-20839   | https://security-tracker.debian.org/tracker/CVE-2019-20839  
                  libvncserver | CVE-2019-20840   | https://security-tracker.debian.org/tracker/CVE-2019-20840  
                  libvncserver | CVE-2020-14396   | https://security-tracker.debian.org/tracker/CVE-2020-14396  
                  libvncserver | CVE-2020-14397   | https://security-tracker.debian.org/tracker/CVE-2020-14397  
                  libvncserver | CVE-2020-14398   | https://security-tracker.debian.org/tracker/CVE-2020-14398  
                  libvncserver | CVE-2020-14399   | https://security-tracker.debian.org/tracker/CVE-2020-14399  
                  libvncserver | CVE-2020-14400   | https://security-tracker.debian.org/tracker/CVE-2020-14400  
                  libvncserver | CVE-2020-14401   | https://security-tracker.debian.org/tracker/CVE-2020-14401  
                  libvncserver | CVE-2020-14402   | https://security-tracker.debian.org/tracker/CVE-2020-14402  
                  libvncserver | CVE-2020-14403   | https://security-tracker.debian.org/tracker/CVE-2020-14403  
                  libvncserver | CVE-2020-14404   | https://security-tracker.debian.org/tracker/CVE-2020-14404  
                  libvncserver | CVE-2020-14405   | https://security-tracker.debian.org/tracker/CVE-2020-14405  
                         links | CVE-2008-3319    | https://security-tracker.debian.org/tracker/CVE-2008-3319   
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                         matio | CVE-2019-20019   | https://security-tracker.debian.org/tracker/CVE-2019-20019  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
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
                        ngircd | CVE-2020-14148   | https://security-tracker.debian.org/tracker/CVE-2020-14148  
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
                       openvpn | CVE-2020-7224    | https://security-tracker.debian.org/tracker/CVE-2020-7224   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                       privoxy | CVE-2019-3699    | https://security-tracker.debian.org/tracker/CVE-2019-3699   
                        python | CVE-2013-1753    | https://security-tracker.debian.org/tracker/CVE-2013-1753   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                          qemu | CVE-2020-10717   | https://security-tracker.debian.org/tracker/CVE-2020-10717  
                          qemu | CVE-2020-10761   | https://security-tracker.debian.org/tracker/CVE-2020-10761  
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                    subversion | CVE-2017-1000085 | https://security-tracker.debian.org/tracker/CVE-2017-1000085
                    subversion | CVE-2018-1000111 | https://security-tracker.debian.org/tracker/CVE-2018-1000111
                    subversion | CVE-2020-2111    | https://security-tracker.debian.org/tracker/CVE-2020-2111   
                         tftpd | CVE-2008-1403    | https://security-tracker.debian.org/tracker/CVE-2008-1403   
                     tinyhttpd | CVE-2002-1819    | https://security-tracker.debian.org/tracker/CVE-2002-1819   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           tor | CVE-2020-10592   | https://security-tracker.debian.org/tracker/CVE-2020-10592  
                           tor | CVE-2020-10593   | https://security-tracker.debian.org/tracker/CVE-2020-10593  
                  vorbis-tools | CVE-2017-11331   | https://security-tracker.debian.org/tracker/CVE-2017-11331  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

-- 
http://autobuild.buildroot.net
