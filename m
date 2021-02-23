From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Feb 2021 08:13:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-22
Message-ID: <20210223081350.8842185955@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  6  |  1  | 15  |
  2020.11.x  | 19  |  1  |  0  | 20  |
    master   | 135 | 59  |  2  | 196 |
     next    | 41  | 25  |  2  | 68  |

Classification of failures by reason for master
-----------------------------------------------

             libopenssl-1.1.1j | 7 
                  dhcpcd-9.4.0 | 5 
        host-sentry-cli-1.57.0 | 5 
                libshout-2.4.5 | 4 
                  monkey-1.6.9 | 4 
                       unknown | 3 
          fuse-overlayfs-1.4.0 | 2 
                    qemu-5.2.0 | 2 
               apcupsd-3.14.14 | 1 
              asterisk-16.14.1 | 1 
                  botan-2.17.3 | 1 
                        bustle | 1 
               capnproto-0.8.0 | 1 
                clamav-0.103.1 | 1 
               domoticz-2020.1 | 1 
                     efivar-37 | 1 
                 gerbera-1.6.4 | 1 
  gobject-introspection-1.64.1 | 1 
                host-go-1.15.8 | 1 
         intel-mediasdk-19.4.0 | 1 
             kismet-2020-12-R3 | 1 
          libmicrohttpd-0.9.72 | 1 
            lttng-tools-2.12.1 | 1 
              micropython-1.13 | 1 
                    mpd-0.22.3 | 1 
                  ndisc6-1.0.4 | 1 
              netopeer2-1.1.53 | 1 
                 openal-1.20.1 | 1 
                openblas-0.3.9 | 1 
                 pixman-0.40.0 | 1 
           python-pybind-2.6.1 | 1 
            qt5location-5.15.2 | 1 
            quickjs-2020-11-08 | 1 
                 rt-tests-1.10 | 1 
                   sdl2-2.0.14 | 1 
                   xlib_libICE | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3860e7e132326f293cb9ec4c6540fa4911c229c9 |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/150858715007de274e9b13a5bea166f6c24b88e6 |     
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/e9ca92f9d81db92c6a469d4bc4545d754b901be1 | ORPH
  aarch64    |             bustle             | TIM | http://autobuild.buildroot.net/results/2d69303ece42940aa89fa5e50abb70f83c3b14e3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d1178dee538b018ae72011e0d891dd42a8d98bb0 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/697bb5bc959c46a4eb31c1639a0ec08b6e5aee50 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/16d99c39af41b9bbee01a44d7747492b708cb7ab |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/981bdbbbfdc8a67991889d58511bef02a468b190 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/9f61415b2a6e3c619f80509326d96c9826001c6d |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/1c0e957a8f54eda89202e1f672964fccfed0719d |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6b55524abefe0667a8aee173c78215ab4e1c9641 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/f21cf0140add1fc499591c77bf9e739d89ac0038 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/6c73dd4eb6dcdbef5d536969cb85247ffe1cde13 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/8b7d6752df7fc695994db1f89cb50e23d3aaa784 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/24e8c1bf867647a2a5b756f920d0a0ed96dab34c |     
    or1k     |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/4dbcf90d120a3622da715ab89e7de2c1aae8c7ae |     
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7a7a013468d36cc9c707b21b4ec5227c935b4ac3 | ORPH
  mips64el   |         host-go-1.15.8         | NOK | http://autobuild.buildroot.net/results/8949d82f0580ffe3e92b4184f4e3463963f9f325 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f4a59f63af8d9be44e580d648cb9adc8ac4af854 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cbba39043b5f017947f82e38d5cc81af2df87357 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fe1101875b31a6333f7e2a1577c8eb71aed22c6a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/712cdba6d6230f61f68eb69ccec849628ed11da6 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cd120af84fe575756eb6e57fd47c97f3fa3f05b5 |     
   x86_64    |     intel-mediasdk-19.4.0      | NOK | http://autobuild.buildroot.net/results/9ee28e5dc0b2ba854766d9bc82b95c28be2722d3 |     
    arm      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/a9c0007ec931f1e4322708327b34f8aa4adde744 | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/e79800be870d0d0f9dfdc8190a46d4d4aa65d003 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/b2d2f02292ff76e6fbba07354650d50900a1fe2a |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/47280e18d055cf3881c45a464b8da4eaa0bb9bfe |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/9700eb0f4cbcc9b9e38125be0608878232cc43fa |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/ae2eaf87c3b109b7c204b031e5a999cecadbb6b8 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/53a16ebb65269e2137ca9048ecb89be1e19f76ab |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/073d681dcefce8169b7511844787b04205897dc6 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/a9ea7104c14d3d9290e98e82c89fe021573d49cb |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/71e2663b9e7a4c64f7e62c4b5c1c78771b328eb0 | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/b22422a3f0446836bb40ec983ce58aad44f4b75c | ORPH
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/b405d49a1fd9dc8f0c7387dee7cf2a7337b6d93f | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/0eeef86be740f1e7f3404130d21c705e49ebae5e | ORPH
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/4224bf09f27da76d111752646fe266026dcaa2d4 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/dd8f83993acf4dd3bedd6772659ef858789549ed |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/49492b07d98e182338071c1ba379e5adc4a5a872 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/137ae3703d38f905468e8d519fe03f83510f49b1 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f08c4a0bb2438f4fcdce22dcdcb42c3101118bd7 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/eb820a0b3e8b3f8fbe89fd73f03bfba7323c0e65 | ORPH
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d8fcb26cdc1f87cfc4acb25ac6c028a5a2d24854 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/df4b0fbcdec0f63f16a358b7d99c7f6ba27c0b80 | ORPH
   s390x     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/6cbfc1f27abdfbcb0ee565771aa79f0aff49d4cb |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/37718e4795f26f90428283354408f3598ff84c35 |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/c32849055d16be3e320d123c539b16a674d6c253 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5bc622ace2b9c4cca5bebb5fcbe672dba745229d |     
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/3065c4a240eeed2b62f7c0ba364ed215379e0776 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/a00c2c2c119755e646d62eb4d92061da48f9d0b9 |     
    i686     |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/9d7bbc3c09143fb0839b7a821005fb178c270d47 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/18dfddd14ab8bc8661b1ccb95698dc7a080215d2 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/59677dc63769204584866d4299411b9aeda174cc |     
  powerpc    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/19c298abdfe85bc9e43720d646b58bc62619e800 |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/100f72672f02a556418cf9e18c11f16001b7252f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/1c1bd386d8037405c2e5b7e79d997bddae349c63 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/15821fb38166496d08447bccf924c9f3024f98c7 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2b2b4aeef82a5c94a3e990ff09581b861f00d5d8 |     
    arm      |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/dd8e0549a4e2e5377f752f1842c5b64206872afc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/54efd7f35cadb29f44230f70ed814190ddcf5851 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                 binutils-2.32 | 1 
            igd2-for-linux-2.0 | 1 
               protobuf-3.11.0 | 1 
        qt5imageformats-5.12.8 | 1 
                   xlib_libICE | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/74e5380bc2c495d490b1e32404a9350e261a4766 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/8b3c58a3d75c79a9d4a6e2b813ebfff6c0f72be4 |     
    arm      |       igd2-for-linux-2.0       | NOK | http://autobuild.buildroot.net/results/f63d0fb2c4f5ed829dca36124593913cc015797b |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/9f6b60525db1975269709e5e68cfa2223ee2e226 |     
  mips64el   |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/8230521cf82283ce90e9e33971bfa9735fa2b011 |     
   xtensa    |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/395fb67260db71baeda00b6e295575a371d99326 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/bff9f1671d398387de6b26c687886439ed2ea2a8 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                   mimic-1.1.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e3d18ae2f63b0d91868c6240ba88e36f3e414c19 |     


Classification of failures by reason for next
---------------------------------------------

                    mpd-0.22.3 | 3 
              netopeer2-1.1.53 | 3 
             libopenssl-1.1.1i | 2 
                  monkey-1.6.9 | 2 
                mono-6.12.0.90 | 2 
                  perl-gd-2.73 | 2 
                    brltty-6.3 | 1 
                        bustle | 1 
                 dc3dd-7.2.641 | 1 
                     efivar-37 | 1 
          fuse-overlayfs-1.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                  janet-1.15.0 | 1 
             libgpg-error-1.41 | 1 
             libopenh264-2.1.1 | 1 
                libselinux-3.1 | 1 
package/libxcrypt/libxcrypt... | 1 
                     ply-2.1.1 | 1 
                   xlib_libICE | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/0e1df9bf4bdbabc4282e2ac0b92ab3fe8e349fa5 |     
    mips     |             bustle             | TIM | http://autobuild.buildroot.net/results/ff99dbb995f5258f6b21905554545e7e1ebea755 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d1e81b513d04cbdd94c6567b545f43d4df9ad600 | ORPH
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/8e3edb054bdc061fc8a297f85a7b0eed90b6405e |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/2dedccc1dda94111a915c1eafe9612e2e0d4e3f4 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/78ba2a66351c20aa276639b67bb8de0063291d88 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/9f7f5d4c3b477191e6303d4ce1fe6b86230fe946 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/b6fa769c495d0ca42abce4b38bb550ae25ccb6a7 | ORPH
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/18279b9335116a2ad3c95af86cc16a91ee06fb8d |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/c0c35caf7cfa04239c5b89123dd779269b7397f9 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/3fbbe2d2c081cbd64e56d6370d1fc095c2121d59 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/629f1193d0471b31efb065344830d69384d05e93 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/e929eabaa8323303b333be8c21f1d8c33bd2fd47 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/a1467ac2d6a4890f2b1a3b6e7bfc3c7a03c254c5 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/212c84b1519d6685afe76c41568ca100da6a3d78 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/8bc75bf7a013056ec657a81bcfd29bf5778adbcb |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4af9c25644e2e9c639f1a44e5978ce9feb7be181 |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4734d01c407df1129a3b15ff844ce5b54fa4a339 |     
    sh4      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/8bea4025b54048903205c96ea8d75aea8c6b82e1 |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/0e351ea97068503a0ecc6016c7f5398beafe5beb |     
   nios2     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/7b65e6cc0bcfc60a093627f9dff7759a1671a5da |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/582fda77697e206ef1643ef0465ef0d259d0b45b |     
   mipsel    | package/libxcrypt/libxcrypt... | NOK | http://autobuild.buildroot.net/results/fdb6219b08de5b208215bba28409059b738a004c |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/e63d48a4671c14df7f0f30a64a8e76401dc0b0bc |     
   x86_64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/b05bc945df3be0d57df43fbe30b926655d291b8f |     
    arm      |           ply-2.1.1            | NOK | http://autobuild.buildroot.net/results/7cfe75725f4746367f2870ee9545f31ba56f6ec1 |     
  riscv64    |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/d791ccacb36cd26ab8d521117ed5b4e8b98ac7a9 |     



-- 
http://autobuild.buildroot.net
