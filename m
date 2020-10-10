From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Oct 2020 09:52:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-09
Message-ID: <20201010095300.744488781E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  6  |  0  | 20  |
  2020.05.x  | 26  |  4  |  0  | 30  |
  2020.08.x  | 15  |  5  |  0  | 20  |
    master   | 121 | 62  |  0  | 183 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 8 
             kismet-2016-07-R1 | 5 
                   libcap-2.43 | 4 
                rocksdb-6.10.1 | 3 
                samba4-4.11.13 | 3 
              bitcoin-0.19.0.1 | 2 
                  boost-1.74.0 | 2 
                clamav-0.103.0 | 2 
                 dc3dd-7.2.641 | 2 
              host-guile-3.0.4 | 2 
        host-sentry-cli-1.57.0 | 2 
        python-m2crypto-0.36.0 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.3.1 | 1 
               capnproto-0.8.0 | 1 
         conntrack-tools-1.4.6 | 1 
                coreutils-8.32 | 1 
              cryptsetup-2.3.3 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
glmark2-c493520253fbfe3676c... | 1 
  gobject-introspection-1.64.1 | 1 
      gst1-plugins-good-1.18.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   guile-3.0.4 | 1 
                       kmod-27 | 1 
              libostree-2020.6 | 1 
                minidlna-1.2.1 | 1 
                 opencv3-3.4.9 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
       python-matplotlib-3.0.3 | 1 
             qt5wayland-5.15.1 | 1 
             stress-ng-0.11.17 | 1 
               target-finalize | 1 
                    wampcc-1.6 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/61f11818b2e1f924db7a60f20e65d502a6f0b702 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/e151c53f9168559a37c43cf6cfa3ef6cb85f4775 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f44ca4d468ad8c3b47cd5d6fa234f961d0ad8d13 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/0633efe4cc6f46484c746e244992b8f12675b57d |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/627196fb2edd0f060bce5157e7795f712bf54949 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/fb141ce614579ff577de42822f08cbd9f105f719 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/c2e111a676b44c7d1bf8d833f943563ab4d6e768 |     
 aarch64_be  |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/426032385f1f8172baffe3a69208d12a940237e7 |     
 powerpc64   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/ebed8a224391377055c5fc2eea63fb17da17e8af |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/d5567ee999401202787a47c39131ce8c1b57f8d9 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/857c8bd76db62c07f56a53d12ba9944d78b4de95 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/177bfb70cf27de0093b8d275bb7f0f64b618673c |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/b3298b8acc830894645ec164e8e6aedb2f4cb501 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/78c2e8bac4df6e935e6d48cc68dc5b1d3bfd2788 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c1437e103b4c9df66576b4f3fe77271731e2f6d2 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/a15c779c264be26313c41e19fe24e5c2c92e2534 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/ae2cf8a2de2b5e9f24a6c525f850840f235a33be |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/4adbd37908d77abe95ef0381aa0900d25530398b | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/530d1c893be65882a418f9a5afb766fc2228bf13 | ORPH
 powerpc64   |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/1e765aaea1f58ec983359f779df5873de2255555 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a562981ff9785820b3f4ca301e3fedbcb9aef75d | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b5461df083aa1f054683d1a84482f153f14da460 | ORPH
   s390x     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/48c1c98972c454db18331e71adccf075f47ef5f7 |     
  aarch64    | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/89783507585dd9acc8c8cfd342e0d0b7454923e5 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/34f55b98ff8dcd200a262f001cc5442ea3f7e8b5 |     
    i586     |    gst1-plugins-good-1.18.0    | NOK | http://autobuild.buildroot.net/results/6aeb470f09034bf92d06e921a6d4c669c4e2707c |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/dc3fdc655cd2d0f9d7d529483af231944572fdda |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/9d69796f0915afc0b2506b2e1f09975ad601166a | ORPH
  mips64el   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/3137e363c7c23ca2fb4dd24a85ea231a5f1a7ad8 | ORPH
  mips64el   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/be1080b07a49d8501991ec0c241b58c09fad8303 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fc4861442aeb5357fc07425e13ec0f8ad9e4efc5 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dd176aa82c61bcffb336cf570c3bfcbd35275da4 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/8812d2e84ee17a7419ba15462b6faf3efd193797 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ff6bd0096301b25bb7ca94e861c68161010a6748 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b7ade6311623cfd58a0afefd52cad9957b96a28a | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/6e905fdecf3549d3407ab84be9fdca9aa3d204aa | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/025e93c42e9dd9f6dec77d832b3174da56ed5dce | ORPH
  riscv64    |            kmod-27             | NOK | http://autobuild.buildroot.net/results/8929f75af98d413a8b5206d5a51efaeec95d70d5 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/f0ffc09fbd29e068ce8afac50ef16b1f0b8e0f8a |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/2589be4a8cf9f4569f57b3467722a8514fc7ed6a |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/dd040cb009cfb6a3a035e9a17658ef36c5cc6125 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/ac0571df12d2d90d031640a884961917a2389224 |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/4ba528821efd24e736f99d67b4483de9e39c2e2f |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/b285e89e62c318b4bf32a315b7d58f5625f90458 |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/f91359f55d095e8c1894e62775fa7be2795e1688 |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/930a62a9e65db97d9b8657fbc20940dc9fdc8b74 |     
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/e7681e2f0da479b6f0365bc8d38ec9d4648c8c14 |     
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/995305bd9779671ed512a02bdc6064d43a10ced9 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/f77be580f31b5ceba6e27430007ec90571279ef8 |     
  riscv64    |       qt5wayland-5.15.1        | NOK | http://autobuild.buildroot.net/results/40b249f80ea7bad97abf6ad2b2c8ad0619309cf4 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/b59171bd244b79f1cfde038966b118c09e3bbda0 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/9373f69e6a95d8cc964dfe730d49ecab3d4f4f78 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/eed28cc61b845e891236fc0e92640f0357c29a04 |     
  riscv64    |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/f41128b8e0eeda4a89702fce70b5136341485d1d |     
    arc      |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/bd4c7512728cffc78ae92d32bf202f2bb8f2df3d |     
  riscv64    |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/1b6ad31729efb38e0f9805b04431b84477101bef |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/6cd3af1d76c16b875cda060a973e9bbcbc650738 |     
   xtensa    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/21d047db66359e2521d314e015def047e3e30d2a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e298e55f40eeb6f585a15ae86ebc184712b8a344 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f2d3a129ee05b67c91ab7bceedc164660eef656b |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/ae86e3a1ba057bc4cb9b8fa672bfc54442ded5c3 | ORPH
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/03ad8418bb4475ab1aa1511aaa0c2331513d451a |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                qt5base-5.12.8 | 2 
              host-grpc-1.25.0 | 1 
               libupnpp-0.17.2 | 1 
 Makefile:753: target-finalize | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0990f0371dee33d61ae5f9c8472a66c754514288 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/7a3392e046d2ac352041368b8d312161045ac004 |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/8293529a72ac4c8e93919b8bc0ea758fbb4bc444 |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/fcac388e776e198588fc72dcf4790aaae4bfdacd |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/4f95bad24a8e518b767609de913d66964cd29ca9 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e2e1778bb0672a50af44c04bd9f7b822f3ad4385 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               target-finalize | 2 
                  ndisc6-1.0.4 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/58aa7d5ee7fdbf04891015c95148f9a8e3c83538 | ORPH
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/9a6b0577cde5db45d456e88e0db8bd0f2c0fbe61 |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/36d418f233f2e6dae7a6f2a2290e3d2c62db78de |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/e73f09036337728852f2e4b4f800a163ecd6a6ae |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

 glslsandbox-player-2019.08.23 | 1 
             kismet-2016-07-R1 | 1 
                samba4-4.11.13 | 1 
                       unknown | 1 
xdriver_xf86-video-mach64-6... | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/0111d94f29a11ad79930b6768ef0dfe5c79603b9 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/68ef862b404918c42e8143345b03673f9e7dc084 | ORPH
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/c64dc1a32aa9cdfa46116d8c0ceb99f3beeb862f |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/1dfc7641834911b9eec2b13dbc7c334d111fbfa2 |     
  mips64el   | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/deb7bd978eb0c6e24c105ff8ba24ab046c8575d0 |     



-- 
http://autobuild.buildroot.net
