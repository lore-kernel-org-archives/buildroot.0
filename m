From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 09 Jul 2021 05:53:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-08
Message-ID: <20210709055311.738A3606BE@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 14  |  5  |  0  | 19  |
  2021.05.x  | 16  | 10  |  0  | 26  |
    master   | 62  | 85  |  0  | 147 |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 11
                   seatd-0.5.0 | 7 
host-python3-setuptools-44.0.0 | 6 
                qt5base-5.15.2 | 5 
                   libqb-2.0.2 | 4 
                       unknown | 4 
        host-sentry-cli-1.57.0 | 3 
              keepalived-2.1.4 | 3 
                    qemu-6.0.0 | 3 
                   bullet-3.09 | 2 
  gobject-introspection-1.68.0 | 2 
                   gssdp-1.2.3 | 2 
         host-gcc-final-10.3.0 | 2 
             libsndfile-1.0.31 | 2 
                 pixman-0.40.0 | 2 
              tpm2-tools-4.3.2 | 2 
                  apitrace-9.0 | 1 
docker-proxy-55685ba49593e6... | 1 
                  exiv2-0.27.4 | 1 
                    ffmpeg-4.4 | 1 
                   gconf-3.2.6 | 1 
 glslsandbox-player-2019.08.23 | 1 
                   guile-3.0.4 | 1 
                harfbuzz-2.8.1 | 1 
         host-gcc-final-11.1.0 | 1 
                host-go-1.16.5 | 1 
                host-odb-2.4.0 | 1 
 host-python-setuptools-44.0.0 | 1 
                    libbpf-0.2 | 1 
                libsoup-2.72.0 | 1 
make: *** wait: No child pr... | 1 
                mono-6.12.0.90 | 1 
                  mupdf-1.16.0 | 1 
                     php-8.0.7 | 1 
                   sdl2-2.0.14 | 1 
                suricata-6.0.2 | 1 
              syslog-ng-3.32.1 | 1 
               target-finalize | 1 
                usbguard-1.0.0 | 1 
xdriver_xf86-video-nouveau-... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/c1586529b799510eeaff1c7d29ecf9d88d199c9e |     
   x86_64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/b492e436af101ddeb9f5a2f3446d88ab3b00c22c |     
  riscv64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/4fec5603ed5d1d881da0da2ecf3f908ec865c4a1 |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/052745557b102c48c66aec85baf73f5d69a56591 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/aa436b48598de5e579c15f2dd00005a95c5d5bc1 |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/518fe077097b7c5944aff99f60434a3e945a8fc6 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/43240270db0417fb04307d45124f1c7e343796a9 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5a94ac335b885febb7a8d68778f22c9703cf5f74 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/03fc036fefc8174eb0637c0e5a7bdf9939822305 |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ebc232d15e21f8057e57a0b70e85e27319ff0e6a |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/869a08cdf04195c29add09f5516f5b928abfd282 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e8403ccd2595a4a36991583802fa8c9c509cf21e |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/47e8540a8ab78d5cac8474ee85177e7a9aab1692 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2f6a31d9a02795881597d769ac14eb715823744e |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/9f0d0a889c39f09dda1ceb7f5e1b806ccfabeac9 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/095924d30c548da26107fc6f13591093688cc36c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c8088931f6ca2ca8e6ee61f67773d35c474fc143 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/eac0132300741e624e66dcd06d510b86590056d6 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/ea2c693b46b90bc7abc93e1b208d4d05107b15fd |     
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d4b22818ce1cd9ce8d0e071f94ea445ece32d928 | ORPH
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/0d9a64f1a4a55d8436462de1a91a7950703f72da | ORPH
  aarch64    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/a5e22f73207c062960b3ddcc0fce22f237fa18e9 |     
    mips     |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/3b2804825d4643b8f8e3fa647cdac0c4cbbf12ab |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/5273d06a93c3bd683bed7f050e4f6c8a41e4fb3a | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/a87e8a9617ade944a1c4617c9af216485c66539d | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2362bc120d135e1cb6ecbded9a9a2950c9a467be |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/19c16f48e2d22bb757f7b49ba14413f4e9423891 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/1c270581f5d6516bb399a45e4e341194b8d5a30f |     
  mips64el   |         host-go-1.16.5         | NOK | http://autobuild.buildroot.net/results/e79ed78844a8f5252115988bb07b98b0be0f27e8 |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8f5dd11f93eee095318c3c5506fab0252317f09b | ORPH
    arm      | host-python-setuptools-44.0.0  | NOK | http://autobuild.buildroot.net/results/85e30c72af93efe6ee2d13ac6ab8c678c5bb3aaa |     
    arm      | host-python3-setuptools-44.0.0 | NOK | http://autobuild.buildroot.net/results/9beb99873c3439c9e51ec1a31895b78521ef4bcd |     
    arc      | host-python3-setuptools-44.0.0 | NOK | http://autobuild.buildroot.net/results/b0a674c6f85910ec97e100c701e41a410e3a28e5 |     
    mips     | host-python3-setuptools-44.0.0 | NOK | http://autobuild.buildroot.net/results/841d72e74ef1c19d78f29803795684a65c4a1cf9 |     
  aarch64    | host-python3-setuptools-44.0.0 | NOK | http://autobuild.buildroot.net/results/6c55b2c2d7f445c1676a5656ce51e3ad778273a9 |     
    or1k     | host-python3-setuptools-44.0.0 | NOK | http://autobuild.buildroot.net/results/46187c7381e2ffb8eff0a978b6e56d8a8424074a |     
    i586     | host-python3-setuptools-44.0.0 | NOK | http://autobuild.buildroot.net/results/59f2faaa89e15175cb51575d62e5eaeea37bbcb0 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c64f3db4fc7b582ebab712cfdaa231785277a7ac |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fb3a96469338d50d63ee41d3af5b7798e9dbc9e8 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b5df72d416a246b9e7f1365d26202e110afc494a |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/876f0e1b4214634de78615085e9e18ac46b657ce |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/b8f3a37acfd4ac9adee9908e198c62cadab5d2d0 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/df5b4b4e040566ac3a5b761f1cb8d5677dddbf81 |     
    arm      |           libbpf-0.2           | NOK | http://autobuild.buildroot.net/results/08201bd51dc37f320cfdf962fdfdd367bf2617e9 |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/3cd1834a9edeefbc1663543a992753c00324e775 |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/f0bf2ed3af29eb8b2cff2c836f3d2b76b0fae818 |     
    m68k     |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/cf1af378c3f52c3bce50b9875964f3468356343f |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/846978ef768fdd033d51b8082f8430de5f395c2c |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/fdab283c7e2942de8f38d49515dd0a79ee85d264 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/d5380f15f7637b740f1b893d07606a6016fcc678 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/2887d0c4eeaf1eb5a067081402b6e4ef32f8874a |     
    sh4      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/629dba6a1fc30685147dbd6fcddc7b1bc3978336 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/d581d203efbdfb8e18f54d559bbef132f6fcf294 |     
  mips64el   |          mupdf-1.16.0          | NOK | http://autobuild.buildroot.net/results/c3eb554cb29b09c79b007feb51cc37e50b303234 |     
    arm      |           php-8.0.7            | NOK | http://autobuild.buildroot.net/results/ff7be4754acec064f36c80ef8ac05ca6121076b0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/53b4df8eee711e81bfc7a931a8f7863a3ac796a0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b77cfadefef2e7029a1dde7734b29a0139de1f24 |     
  aarch64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/0eb58470dce517a66f10a1c4ba8e05fdf2cd6d14 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/bef03616657ede543d137ae593946663615ccb8f |     
  aarch64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a8916a478ed93f553acb67a23f59089dc0d7e9b5 |     
microblazeel |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/87bb01616db0b2198c52688f383608ab0a6a0c04 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/e4ce6dc8892e7aa9cb30cd004d733170c51ebaba |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f449d83adf58071c3d5829a063484f4be1de3c21 |     
    mips     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/1f6fe7f3bef20577917a0dc66b09479c02d8e637 |     
powerpc64le  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/bf0da63081b5db448d4823c07e80bddccb632f13 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/84005f7fe9a32ffe091644eed54cde90f26cf833 |     
   mipsel    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/5f9f5fb3039809cba9f562b791e5b7cf7085223f |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/a462d238d19010103952b9d4d374c135f4cfeb81 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/0b27b6e08cf677ee7accd602e6b6b85d7e3f08c9 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/d41c3ee99b8865672c1e8724b2d1013ccb51a191 |     
 powerpc64   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/d3e2d63e0683dd0b7d3d86590217001b649843a5 |     
   sparc     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/bf5006e72177c1e7661bb575522dcf8dfde3bf0a |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/553ea913290a0758713c3c73047950ed435981c1 |     
  mips64el   |         suricata-6.0.2         | NOK | http://autobuild.buildroot.net/results/cda181727ffb5b93b4ead8350b3248fd3cfed018 |     
  sparc64    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/94ee03fd0851b2904444d51ee8fe9b04a89b9771 |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2d4e7e3f07c584b20377752dcc828a574037be83 |     
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/7e12e9d9f49c39bca86a7049a106454c2d0f1fff | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/1720a8db93b8b7cad7cdc520fdbcf1bee9b6f8a7 | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/86f63699ae1751675de772b0665c9c0986903920 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5710beaf07c8f1448701b81362c3c47acb32bb4a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/35459b480348faa6814cc68a7c46526f05ae7465 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7e3dc37493e4f5bf1e0ae19daf5bae43a67d797e |     
    arm      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/36716e54583fae7e77fbf49357109cbf683bb55f |     
    arm      | xdriver_xf86-video-nouveau-... | NOK | http://autobuild.buildroot.net/results/946036d9a04fbcd83588e105f4a304428fe3cd59 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a0a4938549f00b659cfdb200b75b931342d853f3 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 2 
          gstreamer1-mm-1.10.0 | 1 
                suricata-6.0.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7f28b7c32531ca4ca4b36c52bd235be2ffe738eb |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4f4175e89dfb956c516524f11a2c737194a33c3a |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/606d413b8db7546d65dcd3a579c421067a53f9db | ORPH
   x86_64    |         suricata-6.0.2         | NOK | http://autobuild.buildroot.net/results/7951d989fc0c8764da062a6c7116ebf5edf81cd0 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/acddc936b074863474f7eebe479b8bed6f384f4c |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
                       gdb-9.2 | 1 
  gobject-introspection-1.64.1 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 openal-1.20.1 | 1 
                 pixman-0.40.0 | 1 
                qt5base-5.15.2 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dfd9fc927d2970d6499135f56969a268dd055270 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/cd8214db5c7b331e25ecded385b7b404456157df | ORPH
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0ad8e120e12f13df60d645e334271b95dab10b9f | ORPH
  riscv32    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/dafe3b062fc55f6c1a8bec7274d2b448f5d720a2 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3d8c776ae43a8df37d1e9de53783a05f70385593 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c96f2600f227d6c76114b9fbc41f74a57e40415a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/527278637312f2d0db7907424d2dba836278b927 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6fb0048a7d0f5fbd54d717a067dbedfeb6742265 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/5c532739e17e459899fae4869792d142fee8cb8b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0d4af9da483cd01f41fb1a4a61170e4713406e16 |     



-- 
http://autobuild.buildroot.net
