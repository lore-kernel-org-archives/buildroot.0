From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Feb 2021 08:15:28 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-25
Message-ID: <20210226081535.145A44EF23@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  2  |  0  | 15  |
  2020.11.x  | 11  |  0  |  0  | 11  |
    master   | 119 | 38  |  1  | 158 |
     next    | 21  | 21  |  2  | 44  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
             libopenssl-1.1.1j | 3 
                  zeromq-4.3.4 | 3 
               capnproto-0.8.0 | 2 
            quickjs-2020-11-08 | 2 
                  botan-2.17.3 | 1 
                    brltty-6.3 | 1 
                 dc3dd-7.2.641 | 1 
                  dhcpcd-9.4.0 | 1 
          fuse-overlayfs-1.4.0 | 1 
  gobject-introspection-1.64.1 | 1 
                     host-mono | 1 
                 libgeos-3.9.0 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-20.3.4 | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
                openblas-0.3.9 | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 
                     ply-2.1.1 | 1 
                rocksdb-6.13.3 | 1 
                rtorrent-0.9.8 | 1 
                   sdl2-2.0.14 | 1 
                       unknown | 1 
             util-linux-2.36.1 | 1 
                  weston-9.0.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/21a66d1757f06d3d305497a1b1d69ab1ca6e9977 | ORPH
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/b2c8cf0305007d7b053850b1db478bad7ac68af7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1292312dd0f6270e091ccf257bf9921c4a207eeb |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/51169292d3dde1d8d74b8b3c9eaf3bec0f8150fd |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/94cdce3b4f7489d0f0a394b597013ae4a69dd258 | ORPH
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/8b4695962b1365ef5742ec23fda6deaa803f417f |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/f9cd64485ded311cf9f17b9780fbec68b75e6265 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/fb2ac8fde97ecad358d1aaa149352f79e540fab0 | ORPH
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/31275e2dbae6fdab5bc2b50a1a2dcf9b97aeab51 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/78616ff3e92b0798e25b57c8c6e8d7cea743d95e |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ee119927a30b0d4a7f3d6cc89c79f917c96fa884 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b92874780a087f187c708a90a0d7a5429051be72 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9db5867bcdec8fa2c0da79ba3ae2b83a41393bf4 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ffeb62fb0a641267f790e948ebbcbde6f069f3df |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/20798ef58b87e7850f4dbd94468e5a919526b964 |     
    or1k     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c | ORPH
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/ee5106757e9731b94cccf1c82b99d56b5576c3df |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/6bd182ce72add5eebedab96f647ef496adfe1c51 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/1e3f83077ec7f4af3d472995abec98aaa8f74d32 |     
  mips64el   |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/4bc016244689b843991e07ce8b5faaac5f3bbb7b |     
    m68k     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/702610d458afa04472acb03dc5c4730a66a8fdb9 |     
  riscv64    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5514b60cd66b5027b59b6cc3013fc1b96dc68870 |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/44e1138107ec83c8481cbb93daa00ffe88bafd50 | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/191f303779c4a8d4d244fc9c06e9f3334fb08de8 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/f5ac6e57a5aae29a64897e509ac95c745e1031c2 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1e590b1251be71c6c2a8249fc04c655b9cd357c9 |     
    arm      |           ply-2.1.1            | NOK | http://autobuild.buildroot.net/results/61ff1eb900239d8516b632545070cece05046b73 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/492d75b7a19a2798b28dd432e68c41430ff4e692 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/73d7986eef204a2e24d1843724df5e04ce77b919 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/5c4ffd0ffc15d221d8a43e94e641f345e4173280 |     
  riscv64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/957e4462842b2509552a6807bf31ed13b74893e7 | ORPH
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/1cb45135e6a69fd1bdec9a81684f67bcc7b994b9 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/70b083344330c601b5ce0e1e1a523c999f26bb3e |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/ca2b720eb3ba083e705833ace3150d57fee06a47 | ORPH
    arm      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/0aa7450d43fd6633c821958e9dc24a5cb52142e2 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6d8880ba91f624ff3382e532aad526cf57dd6b68 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0eaa6faad1d734cf216b907d35d40acd690e54c6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ce7c09f0988dd938304ea919f1f3e6e91cbd0f70 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/009d7915ca3f0d8dfd68ddb0da38b74cf381fddb |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

toolchain-external-linaro-a... | 1 
                upmpdcli-1.4.6 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/1f82e6bac55de621bb2adf03eb21716b478eebbc | ORPH
    arm      |         upmpdcli-1.4.6         | NOK | http://autobuild.buildroot.net/results/98bb0f15b0cdad860030097981ef26b9d68fea94 |     


Classification of failures by reason for next
---------------------------------------------

          libxcrypt-legal-info | 2 
                  monkey-1.6.9 | 2 
package/libxcrypt/libxcrypt... | 2 
                   xlib_libICE | 2 
                  dhcpcd-9.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
            libodb-mysql-2.4.0 | 1 
             libopenssl-1.1.1i | 1 
                libselinux-3.1 | 1 
                libshout-2.4.5 | 1 
                     mc-4.8.26 | 1 
                    mpd-0.22.3 | 1 
                 openmpi-4.0.0 | 1 
                  perl-gd-2.73 | 1 
                 rt-tests-1.10 | 1 
                       unknown | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/2b33839a7478f0df78d01071d8154c21aad9079a |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1461203d9b30bc3a2f9b60d9e9a5e2f17f35e78e |     
  mips64el   |       libodb-mysql-2.4.0       | NOK | http://autobuild.buildroot.net/results/78f6e8d3d7de8e021bc42533069079fbb090a9f2 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/cb10eddf53fe82e42c6a062b54d6710ff44e442e |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/55aac2271344e5ec7cc9b536006ac86d6d88ca95 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/e79ee99c1d3c475c09ebab083dd6dc04d51ffba4 | ORPH
    m68k     |      libxcrypt-legal-info      | NOK | http://autobuild.buildroot.net/results/206aac81799074ef45c0cc7b9979cbf02c3935d5 |     
    i686     |      libxcrypt-legal-info      | NOK | http://autobuild.buildroot.net/results/8db5df1286673fdedb854bad2b9e5757d5218950 |     
   mipsel    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/5f676424d3f0f61111565cef7e08ac2149f31556 |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d2f2c3102f80bc36c8d725234463bff0a470f30c | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/70e2a58ed605981baed3e68529072416381ae03b | ORPH
   xtensa    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d0c25101ce6e78f3876b90e3c12fe433360fb694 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/8f3afaa8ad8a74e254f68f3934be4eef930b3273 | ORPH
    arm      | package/libxcrypt/libxcrypt... | NOK | http://autobuild.buildroot.net/results/b9b0db773f532fd2277c41c674f66a88c199a043 |     
    arm      | package/libxcrypt/libxcrypt... | NOK | http://autobuild.buildroot.net/results/4d8bce9e9dbffccc2c7fbd7360ed278f1b92eadd |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/6e5f9cc83aec4445e08724a92ad9238671833107 |     
  mips64el   |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/ed280fb9690390c350bcce628ed814a901643fc9 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3fc1a509e3111b5715b99c5503db587212098bde |     
   nios2     | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/1c21c3674dd4fa25b0f5f93a0f82ee54b8cd5f69 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c266906292860e76559020c93935df18037e968d |     
    m68k     |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/8d5e84b758beee8a4612d914ca35b0422697fab4 |     
 aarch64_be  |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/63d13e65c19239ff96f36e7383c9a0862bfff12d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fc708254e7b0420f889aa281739514949b2e178b |     



-- 
http://autobuild.buildroot.net
