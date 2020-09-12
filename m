From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 07:10:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-11
Message-ID: <20200912071053.253F587641@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  |  4  |  0  | 25  |
  2020.05.x  | 17  | 14  |  0  | 31  |
  2020.08.x  | 18  |  7  |  0  | 25  |
    master   | 105 | 68  |  0  | 173 |

Classification of failures by reason for master
-----------------------------------------------

                       iwd-1.9 | 6 
              asterisk-16.10.0 | 5 
              host-grpc-1.31.0 | 4 
                   libcap-2.42 | 4 
                 fwts-19.09.00 | 3 
                   guile-3.0.4 | 3 
host-meson-tools-0a02e2d344... | 3 
                       unknown | 3 
                 gnuplot-5.4.0 | 2 
                  luajit-2.1.2 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
                    vlc-3.0.11 | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.74.0 | 1 
                   dav1d-0.7.1 | 1 
                  dnsmasq-2.81 | 1 
               domoticz-2020.1 | 1 
                    efl-1.24.3 | 1 
                      ell-0.33 | 1 
                  ffmpeg-4.3.1 | 1 
                      gd-2.2.5 | 1 
              gnuradio-3.8.1.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   gvfs-1.44.1 | 1 
                host-go-1.15.1 | 1 
              host-guile-3.0.4 | 1 
             kismet-2016-07-R1 | 1 
         libcpprestsdk-2.10.16 | 1 
               memtester-4.3.0 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.29.1 | 1 
                openblas-0.3.9 | 1 
               protobuf-3.12.4 | 1 
                re2-2020-08-01 | 1 
                samba4-4.11.10 | 1 
   sofia-sip-1.13.1-d10a3d268c | 1 
                  uhd-3.15.0.0 | 1 
             util-linux-2.35.2 | 1 
           wayland-utils-1.0.0 | 1 
                wlroots-0.11.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c6f3acada7a873473553b6a265f2cf775377e152 |     
  powerpc    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/4ee2e5b2c8f1fb22cf4f3c138985880c2ec7dc96 |     
 aarch64_be  |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/80dff0dcf9ae577fb656591dee3f8e4429f7e81d |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/346da5f48f28cea1ff8e627b7b02e129d509d4bc |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/424858cce4767b52fdb00b33d48ed23d3b7ff98f |     
   xtensa    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/2ffbfaaf451220c49e0e34a4ccab20237fd0779f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/9d7d769d12714423bc72558674ebd886d4684466 |     
    i586     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/ca63276455ee5b7da8c6ebbdddc8729158c355bb |     
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/02afcf1d8bf57a3dcc35aa3ed5e45caf93f6a0c8 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/04e418ccd9e9da159e23ab7a5ad9a1ebf470e4db |     
    arm      |           efl-1.24.3           | NOK | http://autobuild.buildroot.net/results/458ec719a7251b59796edfc865b7226baaed6d8f |     
   xtensa    |            ell-0.33            | NOK | http://autobuild.buildroot.net/results/c1f111fd520f200aa366b878954a992faa2d27fd |     
    arc      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/7cd49736c106b44efe1fa36d80e81993eff5c26a |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/771b48672e71c497f3b7c069f1d8f26d645307ed |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/e54d5e6fbb2eb7d35be45973ec532a40a42d6ff9 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/ec44fbdb095c031182a0fcddaa417782e5b910a3 |     
    arm      |            gd-2.2.5            | NOK | http://autobuild.buildroot.net/results/b0e5e5de52b0f140d453f8b13ae4a748ecc4391b | ORPH
 powerpc64   |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/a674dce584b62e115b5cfc5b0cfb5e8887e31ae4 |     
    arc      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/28560c93f42fda645b10a047c929a3655ae4abc7 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/d0bbc75e1722fbc45f24853a97e9ae7b0a202aef |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/a74b4972f148555a3df99879ef60eb7889bec1a7 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/cf14ae4b3b7ef9ce6d59d9c64e26a61a9ea1c59a |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/81d979993e2f1d684c73d76e47b5ebf06ae8013c | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/90de7265e1fa6a298f98c4bf30599d2810f33181 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/a19395182ff9ffc133320c57c6087bd3817d65b3 | ORPH
  mips64el   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/194a179a14d79a1e491969c5693c1bf5a58ed468 | ORPH
  mips64el   |         host-go-1.15.1         | NOK | http://autobuild.buildroot.net/results/f2aa23536617a4451b04a7b7b5b3c6b73daff3e9 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/1edc459ed47251dedec66221014cda4cd06de9f6 |     
  mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/90064f076586e1030816322330b3868d196e8095 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/eb113ba107e983262feec2102937184324e8c33c |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/cbf3006fdc581e8cea28024640788da729557d1b |     
   mipsel    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/8b2c25ec291ffe567a51d28899bb3f7d0e9fe0dc | ORPH
   x86_64    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/61b0d291ff658dd65961c7f2b5de0def725cd2ad |     
    arm      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/25aeadd276a16f32fc13f7e4e9314a08a1f57555 |     
  riscv64    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/92c08d7ad3e049c2f1ae0c519a5a1ae7b9c43186 |     
    arc      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/4fad52ffa1b85dbfa1c8818cb39786c872aa2480 |     
   xtensa    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/744c6c0de9ba75c4d880d37ae514797e9ff069ac |     
   mipsel    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/32a3b0163619ea494c34ea75d14fa39807b70e88 |     
   xtensa    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/d1b39371a3c0b413b91c34f7be3411c195866a18 |     
    arm      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/e046c29d302c3bf74760ad2ea65aeb1907f3d154 |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/34147a84c433c3186e62a6323d5f44e3957b48b7 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/00c5525760f050697332ee013941ab3b67468de4 | ORPH
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/7a05746e076f7eaf73bae54574cb69f9b71d371b |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/cc8e2dc06bfdb9a3529abe9653c3aa27f600ede0 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/a00253f6248efab299c18923783cf8d2f17367b2 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/e0ad36789b536ab65e724abd96cf1157d33832b8 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/dbc87e0cfd2370506f5bfd95d1401d28d35fafa3 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/69289fc7af4a7a463ba3030bef350a1b26d17776 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/f8c281c2eaad2b312951f1c7264df362c9143192 |     
    arm      |        memtester-4.3.0         | NOK | http://autobuild.buildroot.net/results/e1c276603475a952847fd53724e56101cdccbbcb |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/baac936810fb93217f3d6dfd795f95a55a5f76d8 | ORPH
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/bd6ebbd3bcc1f554c423c4c58ef409d0f089f4b6 |     
    arm      |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/33ff2b03fa96796930ecac27e3bb04c1c38d5052 | ORPH
  riscv64    |        protobuf-3.12.4         | NOK | http://autobuild.buildroot.net/results/8b1e7b567737ed79747789036d9de819df3ab47a |     
    arm      |         re2-2020-08-01         | NOK | http://autobuild.buildroot.net/results/7d7c6dcac3cb8ea6deb753178e85eb1c5c74c8e3 |     
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/4fbb8ce48e61726427a845b1ccd39dad8c50c6a5 |     
  powerpc    |  sofia-sip-1.13.1-d10a3d268c   | NOK | http://autobuild.buildroot.net/results/6d29b08806d4bc3a06f8a0a61783e74a0d0f4094 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/15343f1a6d353b6f7ea92ab45996f5932570f7ef |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/815ff65abc5d2c4136a7ecba94f97635fa1e0854 |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/527f9bf8dc550b06af50c3a17171f8eba441d803 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/33112c836f87d0a51344cdedeb42dde21d5b8ed4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d5acb84ad99cf2eae48ca70eb60a04eb19a4a26a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/319b9b99f18d3ba442af95e67a499d256f4e3f11 |     
    mips     |       util-linux-2.35.2        | NOK | http://autobuild.buildroot.net/results/fe4cdc2aa022fe3551fceb66d9370d1deb280ec0 | ORPH
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/d86bdc2e98c419007754723f48c43ff0c5621d49 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/6493cfa2c86dd3f0d366f193c8e221a59e49cf16 |     
 aarch64_be  |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/77c34ac6089adc11243cfd24efee11184c5f69f3 |     
  powerpc    |         wlroots-0.11.0         | NOK | http://autobuild.buildroot.net/results/fcb509dca853fb5704b1dca8c0b4d58090b84eb2 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libopenssl-1.1.1g | 1 
                    mpv-0.29.1 | 1 
                      tio-1.32 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/caff7cd8d709f8fa0e89d6478c0886fd9b5c4ca6 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ab8fa69e554de076d655f30a6b5ba81f4bafea3b |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/d63a50d6bebc3184546fed5223db8b0ae1c17638 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a5cf7a2bf39769b96290e0dca0d54dd82eebdc53 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 3 
              luabitop-1.0.2-1 | 2 
               apcupsd-3.14.14 | 1 
          gstreamer1-mm-1.10.0 | 1 
             kismet-2016-07-R1 | 1 
               log4cplus-2.0.5 | 1 
                  luajit-2.1.2 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
                       unknown | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2e9891f1ce64dcf746292164078edddd976deaea |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/faa9a121c59a609834a42f5292dfee1b5f2e6c46 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/769dc68bb58275aa09ef6238957c5b30e8309b46 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f7b7b1902a7b5dc80f11f4adaadf80b57269ff61 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4c5fc587fb7a63e15513015bcbed284e42ee7280 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/92edd0207c543fc68bb1572aae0fd48899d05106 | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/4c1c02d45715c7e992463ff296241fb9f553aa33 |     
  aarch64    |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/11f03e30e621124dbae8d82e667f706e6813079c |     
    mips     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/ec88750fef192053b391d8304346c99c51921745 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/5a71f38b09e626e88d952aaf752c6f98ca083e04 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/06d3ce86da0d64cb8f0305de4ea10bfca057180a | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/81a7816a98f21e93e8dfb287f9e543c76c4ad86e |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/06d27039fb992c226440ae6931d630f2aac81c42 |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/95b94529f17a561693d0484ed8d1a5e8225766f7 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 2 
                  luajit-2.1.2 | 2 
              host-grpc-1.30.2 | 1 
                  motion-4.2.2 | 1 
                       unknown | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/30e1c8f669e0f4eab236e4d7a5ca3f08ea9f278c |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/af480c277bc4300d1f3cd4c426a41116f5f6578b | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/49709a8a34b65acd3765cbb649c1979833db8707 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/e5d7b88012e5be7a100bab0468cd5d1d7acb3db5 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/9bad58014c512fb28a6edc7c332c55cbcc5c9a12 |     
    arm      |          motion-4.2.2          | NOK | http://autobuild.buildroot.net/results/99d99dad219776e88aaedcaaf38eb4530d0870ed |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b2bbdc3b4f4ea1973a0d3e52521e5cc432ae3797 |     


Gitlab CI results for 2020-09-11
================================


-- 
http://autobuild.buildroot.net
