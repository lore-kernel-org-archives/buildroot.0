From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Apr 2021 04:46:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-14
Message-ID: <20210415044648.806B440F69@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 36  |  3  |  0  | 39  |
    master   | 132 | 81  |  0  | 213 |

Classification of failures by reason for master
-----------------------------------------------

         s6-linux-init-1.0.3.1 | 24
              skalibs-2.10.0.2 | 6 
        host-sentry-cli-1.57.0 | 5 
                    ffmpeg-4.4 | 4 
                rocksdb-6.13.3 | 4 
               capnproto-0.8.0 | 3 
  gobject-introspection-1.64.1 | 3 
                  monkey-1.6.9 | 3 
                       unknown | 3 
                  zeromq-4.3.4 | 3 
                  boost-1.75.0 | 2 
                mono-6.12.0.90 | 2 
            quickjs-2021-03-27 | 2 
               apcupsd-3.14.14 | 1 
                 dc3dd-7.2.641 | 1 
                   eigen-3.3.7 | 1 
                 gerbera-1.6.4 | 1 
                   gvfs-1.44.1 | 1 
             host-cairo-1.16.0 | 1 
                  host-kmod-28 | 1 
                   httping-2.5 | 1 
             kismet-2020-12-R3 | 1 
 Makefile:753: target-finalize | 1 
                 mesa3d-21.0.2 | 1 
              netopeer2-1.1.70 | 1 
                pipewire-0.2.7 | 1 
            qt5location-5.15.2 | 1 
                    ruby-3.0.0 | 1 
          sane-backends-1.0.32 | 1 
sdl_mixer-d1725fcb7c4e987ae... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cf0fab6ee10340867cc57d69c5e7a42e7d5ce627 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/9eab0450b31153a54c0c0704e88f0001a3ab1cf5 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/9eb45afca601b9a4e2a3edd7f19411609512ad3f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9bd2262c83d634c64415da4f6fcae2886cd49da4 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9be8980962866028d52cdfd4275d6ca8ac52a18b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6e2c081f625b80e758ec04b492043e1d53a475f2 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1e888a4d63dc581f336465364ab16e4fafe324bd | ORPH
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/20f0ccdb639033606921f0ff73982b6fa3013cf0 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5af370f8ffa89b3f270906d4ad8c8af6f2a67434 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9b4403f691d913d1190beca10e53274e77bd4ccd |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/74a97c8aa64b9d3ea2f63a7a4456b64d17208c78 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0d817f458eaeb6f864a460b9a1e426d0a615ff99 |     
   xtensa    |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/73bbdc33a75ee3851bade7e182a40951edfcb9e5 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2a7d7f58f540299742fdb75643506474df084fc8 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2137cbc7943d5df8dcba226dd23107aa714b4280 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/aed7f6cf10b37cfb74c335046b7951f1e6cf1922 | ORPH
    mips     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/c6f2d1dc5bd1ac45acb8fbdf84017f53dafbdc62 | ORPH
    m68k     |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/2ca65b57fbf11716dc0dff4a34b4cd6798fc7ef8 |     
  riscv64    |          host-kmod-28          | NOK | http://autobuild.buildroot.net/results/56392a539b1953d1373b7bcac2ab1c9138615446 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6184718e035992eac31ecd6b7b571faa15d11a00 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bdb4ea281cd0632818379cf46dc4bb9ee0d3ff56 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8e474f6437ebd06738948822fc698f40f86766ca |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2ee5af540afa7e91c1d1be8c7a5cbfe111fc0bea |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/68ea870e9ab3609aeb73171b71a2e3f06bf30395 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/c8e34b22eaff39bcad75183896c3c5cdae3bb24f |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/42a1d8303f77b28ac58e72c896477a11fe8bce96 | ORPH
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/55e3be5df02e9dc7817801b2a265585418e6b3fb |     
    arm      |         mesa3d-21.0.2          | NOK | http://autobuild.buildroot.net/results/75f352ae6cf7f051576766483d9deb42496ffe7d |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/1f94f13c3bfca89eea531016a5893c7568e58f97 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/24e1dd39fb3d75d7e0ec34b85db20e1e047c7f44 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d82139109ea26aabcfbd1f7be3131133784c1749 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/042050c8c88932905cdd4fa1bdc98724229f4602 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f268e2038ee6d33cfad93443554b53988f4ca941 |     
  riscv32    |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/6db014ae99f1f719e86c06d0d7501be1d217fd23 |     
  riscv64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/ab2edff9ae6b67d17bee2a11098b046ad754eee1 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/2d7126d517b0392cfceadb0a406b270425c3d5a7 |     
   nios2     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f2c3ef7e3bbe30ac24710288336adabebd8b83a6 |     
   nios2     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0dd6661c0fe6308a7cfde8b0796e94eb363eb25a |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9b3bffc22f667cafc28faa4230633c83c6af5f98 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/e2243a050818b7d1c670b97acc7adbfd99ee8e27 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/db1651e9cb2161cee272fcd94f144b2445e7f86f |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/2089b2f6de936864550b8c8f2d377745fc2f1f02 |     
   sparc     |           ruby-3.0.0           | NOK | http://autobuild.buildroot.net/results/db6f4c5e080f89626e653e0c0cc78880d2e7bf61 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/7569e5f6541e8ecdecf0da682659d1b347861aae |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/240340d040f9720381ebb2768be035fa458cd0cb |     
  mips64el   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/6c3a36520fb8a63835b19c23b4eaca170df9af6f |     
   sparc     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/436ff66de6b5d3b62dc02d9e5d124aa2dde8c65b |     
 aarch64_be  |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/b72209a143d0e6a76d6f9aa38ccffffe8059bb11 |     
  sparc64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/2f4ae8566ddb65fe37b4ec85dda13df28a7dbdbe |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/dec41d09de2781daffa6bd2eacd1f78d943fd702 |     
microblazeel |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/da0a81001e1b03099993acf0572b914b7b18001d |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/7d9f2c205094b8018cf4c7ce619e1cc1ebe45d1a |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/cd0774c66886f1a6e6f2f3f37e58bc1e8c6cfd37 |     
    mips     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/d871506df28b56fbbb6d62bf0e67ba6b3abb159b |     
  mips64el   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/fa77469423747691c1fd3274e41985af4b0f694e |     
  sparc64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/bee8618b5e8a22396b9e64b41ab1ae576574a5dc |     
   x86_64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/b44d7238fb169dbb1e0f6044d712c1dbfbc93c27 |     
powerpc64le  |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/d81872e0077b3cc3997fb36d74e560b48d289e91 |     
microblazeel |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/b7ff6d84ea6c7e6f0b59eb79e94cdd2c33ddc4f9 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/88dbb369f75a6de9868653b87c32ccd4e7b0f423 |     
 aarch64_be  |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/6df59cf120c3b77d1a9e58b16bac8d54b0b0d953 |     
microblazeel |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/6f4e75f172617e283eb127efc78698188b6a13db |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/22108ff0fd720b0506712df81da903218142fbab |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/50cb505df848dbc024471d4b49bedb814a3915bd |     
    mips     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/cd4ed6f729b3632d032c8450ea27ace5b51ba758 |     
  sparc64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/c3c413ea5cff56239a1e8c3a7b2b10ae0c36be47 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/7f4c578f3a5a5c7bf4e94092a8dc007088a44b8c |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/0c7fc1f48f0a0c6882d9b84c857e90008735a687 |     
    arm      | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/a4725b110c2ac633af531413d4b0c04b6b87cf1d | ORPH
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/b650d2603ee1a72e2167ae05a3d760aa314cd411 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/7eb64501dec6b2083fafb3b8311bc96fb9502acc |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/5fc25d96ba08823a7384e8ec4a78a4bd5ccff31f |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/194748430c20e67daf9c7fa4a2a5d6cb1981e282 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/13e0303cfe788bfe782014b0f0e5da967c724f67 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/5ef815fb4d76638f4c2b33aa8624d51b70195af7 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/45cbb63f747566834c41eb9eadd4982b4d7f86e3 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8e1cf0cd5256820dea30006ba61cc95ff5ca4fb1 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/73fd9b789235f9bbf00c2f41fce0e81c0df99613 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fa90d26f1d2b2b10d087717f956064a0b17c82b3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b3a82d6441e157f11b76ee9db408d5a02da79083 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/077224f41b37bcd1d9a095e02c7672695498de4c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  boost-1.75.0 | 1 
            erlang-jiffy-1.0.6 | 1 
            qt5location-5.15.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/d1830341be72c0086f368d2b48bdb8b54b089a0c |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7d94244e1c8301f62ec56b52e5c643f357f64c5e |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/a75a29e9949b7da79b4e9a4a7263ac473622d20b |     



-- 
http://autobuild.buildroot.net
