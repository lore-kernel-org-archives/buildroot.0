From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Jun 2021 05:49:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-16
Message-ID: <20210617054939.BAA1B404F5@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 24  |  6  |  0  | 30  |
  2021.05.x  | 26  |  7  |  0  | 33  |
    master   | 72  | 146 |  0  | 218 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-6.0.0 | 15
               memcached-1.6.9 | 15
                      pdbg-3.2 | 14
filemq-8940f34e0f1c8f25c1c6... | 12
cegui-00b4e1fe174da53b7ed72... | 10
                libsoup-2.72.0 | 9 
           host-libselinux-3.2 | 8 
                libselinux-3.2 | 8 
               pipewire-0.3.27 | 7 
casync-4ad9bcb94bc83ff36cfc... | 6 
             safeclib-08112019 | 6 
                qt5base-5.15.2 | 5 
        host-sentry-cli-1.57.0 | 4 
                openswan-3.0.0 | 4 
                    ffmpeg-4.4 | 3 
              libostree-2021.1 | 2 
                 libpsl-0.21.1 | 2 
             libsndfile-1.0.31 | 2 
                   seatd-0.5.0 | 2 
               apcupsd-3.14.14 | 1 
                apparmor-3.0.1 | 1 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                harfbuzz-2.8.1 | 1 
             host-cairo-1.16.0 | 1 
              netopeer2-1.1.70 | 1 
                 pixman-0.40.0 | 1 
                    qemu-6.0.0 | 1 
          sane-backends-1.0.32 | 1 
                   tor-0.4.5.8 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a280933b6ebadf9e284870eb29cea1efad65f031 |     
   xtensa    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/9f45edb807950382da5ffa5044dfe54f58f3d267 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/aaa7c1bee19c6bf3914c5ffe7ad50834122d1c01 |     
    mips     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/d07870fcfc3b6b203df9f1a5742358ddc9660838 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/515b6ae0b3788bf28ad6f4a5797b8c44b6f3440a |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/7086a9fa439a17939e1dfa9b65c7fe3dbe7390aa |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/e034bac122fc4f0854605f310ea1d9d93698f6fc |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/27fc338960077cc46f4eb97f3fecd406360cac0f |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/611fca19c20b943364709a674be18e83c68a4597 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e4ec0d97fc03344a832afccff899c49fe2c09674 |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/082aada0ff6216302b6208457a75c8922074f470 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2bb39e56cf3004c710e7a31f93ada812e5dc71bb |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/573c8ac98491e7992c84dcb1bda6f5b0e19de5c6 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1efd5e98c82344b1dc95ef7cface62869a7e7991 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/49f46d1ad676403f2602964b3c557cc0210e36c9 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d74f028a74dff0dbf90e44367dc8afb21c1ffaa6 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/81c8c8a9eda49ecd84701255e5edb858380be4e3 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d586c74daa2ce14ebdcf47ff893de7082d6a4158 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/95625bfbeeeb4f6b4cdecb777e325cae10f3fc6a | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1ba84fc92a6c67a7770ad402d00783406050ccfb |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1449a02dc3227dbec510a17faee0e3420deaecc2 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/be6d453e06d61a26929439b5049144343d8b9448 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/cf171073e77e70200c01a7ff1bd7884c21cd7e2c |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/c235540e26c16f30f7a57c7fc07c2616909181e4 |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/ef295bb1746a2d97457fc937b23a4a7df7171394 |     
  riscv64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/e48d910b94c36ba1dd11b2f140fd667970ced64c |     
   x86_64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/8f455209766b0c80f0000cb510113b7780da9f17 |     
   xtensa    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/eb4c0a76dde3d3ad0f4f7e76c2075544c553ff5d |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/e902e86a4df36edd8fc5d3537b773548d984020f |     
   mipsel    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/a756d61a1f8a9a1324c5fc4f8724a17aec002139 |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/b0b85a85a1d5ba1b9c303673bf824f2409f42e1b |     
  mips64el   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/e63e8eadea5293fb608615b4b7bf09960be8549f |     
  riscv64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/516996996720ebd9ecbb2316fadd2688293d71f3 |     
   sparc     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/5360230229497ebb8c9ef01c804ac7aa0b88c5ec |     
    m68k     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/d8ed49666c0f19eb62af30a075ffd8df9ba5175b |     
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/2f9b2dded7d8603f601957f7814ac157196b29e7 | ORPH
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/5fa274ee66d34dc051a6662cd9dbdaee98f6bdba |     
    sh4      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/c45cee0af55adf5cdabee8e92e62f27b1662859f |     
   sparc     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/02737a83124aceb9d9b9e01ba1e73d67d918e20f |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/f71c39a0cbe2bc385a149204246ea6774b0d0656 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/a826dfa43bffa1e178e3f185643b188e792765f7 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/28fb1f164d69d33329529981ca10739c4356925a |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/1944499148db40fa86bbb2a2c0f14593b977ab84 |     
  powerpc    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/6d78e994a73c14eb5f743c30878dbb8868e20b7d |     
   x86_64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/8b58847fccdb097351e0b39db406ce0cc73612be |     
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/a839db30865408f0c7ca63b0ff75451490316f1c |     
   xtensa    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/f2622f820fd85105d0e0812556b883ed2d030057 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/48f5fb024a83e89287170c67dd700f9694cd230c |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/63a7bc87f3d2633719b78e6e234fdf6593bd8aed |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/1c13d1b23caad556489c020ee4bcd14fb789b25f |     
   nios2     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/1678fac3237ce83bbbdacdb8952d28ca6e4c9dc6 |     
powerpc64le  |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/9db0bc5217e3d801f8dccce8c0c4f1f99feb53cb |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/9fb3c0d568ab010f4681a44963d6c9d467efdf98 |     
  riscv32    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/71eeccc6a440117fdbc13725b97113fa760cc83c |     
  sparc64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/e2f9a8c49bdb5770f6f9ea069d17c2f2088afdd9 |     
    m68k     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/85de89de60f28ce927526af586f678c28b955098 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/a9bc4e5c10d04c5be51a9531fdbb1e22075b1b82 |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/2d1a12904bc8e117ff21a5c24663b466422b91f3 |     
  sparc64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/fc92025cdb4599d285c7f5da10cb85790fd8f177 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/4f37a5ea51dd50fd9628a764dc76cd705f495104 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/79575240f73ffee3ed63c05da1b908c0a4731526 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/43541a10aa62d0d8b2f839123c6f7e1b898ea26e |     
  riscv32    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/33e090b3d04cb53e2f32eb2162f4bca2861964b3 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7d64c7aecde5aceb9c59066dd34838e751a35338 |     
  sparc64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/04572e56ba120f5a12bbd6d0d4c00415769f35ef |     
    sh4      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/c47346d46f9d348859cfd703d54a7877fde4bf93 |     
  powerpc    |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/22758a964b075238a5d09f235bc9b3f3ba11046a |     
    arm      |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/105226d1341a64cad50a8cd7ae58514a00e4dc73 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/4c2395c9c01363cbfc2375a9a697e03ff5b4e7ed |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/a558ad85d0416020f3f244bed2de4e93b2a4b540 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/be87b8ed5684b821a3e5e33fc239ce1cba122517 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/d7cd5fb26653a7e62db2588e379eab0739c49e91 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/e66cc2745334414ea4782203f70c845e7866fa60 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/c2b23472f905aa2d289e9f44fc2a825cf827146a |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/fdde8462ec5d6cde02eb1032e2832d609f70ef5d |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/7855eb464bed5562a13db27d0587fc00c6aea162 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/df46ada9d2e70cf76f834168eb732fbbad38d706 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/eefcce58292ca80d2169ea0b969a972cbaac888c |     
   xtensa    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/d0b793bc8524a1d00da635c6b7439a0c6ad5099c |     
  mips64el   |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/797f9fa885b72d68d67042f5f0766f07ed22e04b |     
  aarch64    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/469dd79c23d59f519f10c0f9acabf44fdf40460f |     
    arc      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/d0fc0c5266fcb83d28b4a2a8c89f2a209e20b2bb |     
   mipsel    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/37b80c296328572e392427a9aa208a9ae82ec8b4 |     
   x86_64    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/7834220635ccac7119a6858051a7dcbb3adcb561 |     
  riscv64    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/5888391e7a5a468d956df3a5181f3503614046f3 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/a69d03defa566ff8980d9f904fecf77f3395be3b |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/471b6dbab0cbe7480d393cade58fc1a6ecab7f33 |     
   xtensa    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/79379282f6d36cb5966009a583e85196f5f26a23 | ORPH
  riscv64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/967dfa901d2d4042d108f756801e8d2c9f4cb271 | ORPH
  aarch64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/d226ae8fda81226dae4b770fd7d1846bad60ec48 | ORPH
microblazeel |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/15b423bd8cfd1d7f42de85a9aa439e4c41ecca3b | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/cb8ae5686cd30223e210a114ab2481497742125c | ORPH
    arc      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/1665f53a8788151ab90e9a55e4244a9abbca08c7 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/684c5b0cc42d72eee035d3ba64aea2d74e24cbf7 | ORPH
   nios2     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/19429353dc6987fec887991c8680a8db9edd0766 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e11f1d55df12d1f92c80c2c3aa09f7fb298edc44 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/186bd2baa02e9b90b5a84597a591ce720a22c708 | ORPH
  nds32le    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/ce4d4105182360d459dea1c05ab0cec5825beadf | ORPH
  aarch64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/1e8ed3ef120564386a4640ddba2079223b058a45 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/a20c90deb266bbd4b823ea75376dc83c9aff833a | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/0a45d5e4f5ddf47e068ff30866c86bb9e201a827 | ORPH
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/25394d705f68cc8a996707d6b18b64fc4671e3bf | ORPH
    arm      |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/e74bfad5967a5285f8aad48af5c43be6c6bb3dfa |     
  aarch64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/a4ff8a21de889f35c73591ead3461bff0f541b81 | ORPH
  aarch64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/348b93f5ca16e4e6fc918e8f0486c2564c36a835 | ORPH
    arm      |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/7be6942d1f31f0885a18fbb8963052097ce435ad | ORPH
   nios2     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/0e0f036bc652feae0439579f11941cde0ba64586 | ORPH
microblazeel |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/cd1132598473d8ea4bab1c9bbcf9e68646662323 |     
  aarch64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/643d6b4e06696af38e5751a2860c96458e6bad78 |     
    m68k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/551b3d899d5aa7256933c30d586285bcc49f3674 |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/4a8ca1492767b5cbed257cbabe265724123b816b |     
  powerpc    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/77b0e37fc996f955155c628952feb61d08a982aa |     
  riscv64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/16e24eb3c917cd6d6e97c2dc2afaae2082126aff |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/7b170c3255b9d8035bf99d4ebe0b68adda4fc16d |     
    arc      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/9948af5f5db2e15b8bde68dd64ebd80000d7bc6a |     
   x86_64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/317b2bf08ad4075972d5b3e403bfa8edb3adfc20 |     
    or1k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/daf9783d649868c61bee46baec8827db77ef352f |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/733f27ee9f3065b3ea28c200af1496d0996bcf10 |     
    i686     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/90cce8eb7181622073b9ae8fff366ac97c33f8a5 |     
    i686     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/6ae675b582c7e8955aceb95126456e50acdabce0 |     
    arc      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/309239e8cc1a0fbf1d1e3c41e8ab6a6f3f98108c |     
   xtensa    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/8fe98203a56e4c8aef9fc9ae406324b0cd69fd5b |     
  mips64el   |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/db9cad2d76cc39771cf29aaaf3a51dbba1827de9 |     
  riscv64    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/16eb9c2f38c6cddd964be6cedadee644c194f373 |     
  aarch64    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/824efd44201a2a51f6994cb84ac3a85d839611e8 |     
    i686     |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/d246ae32d3ad55e81a268840faa0122ee4baec5c |     
powerpc64le  |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/b2b260b21af3477dc2bf2d8851cbf99efc1818e6 |     
  riscv64    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/2f18a8751fca63c6d690fd576ad1acaffa6342ff |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/72aaa7a1d471c2578bb2b2dbf60265877bab48b1 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/e3ab420da116354a9cb02b6dc73bb0913376be6d |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/596f936ede5f910d337d8f2b5282d638cd6f826e |     
   xtensa    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/93479a61d1a4337ffd12c607da0ddf1fd78734cb |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5e504ade74c50b82f8dd54619fae4b6c1ddd310f |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5328c7c9d8f01e269dd61b9393ec85770a30a59c |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/0fa2d62fa28dca7da89a5773bea0a9921eb0de36 |     
   sparc     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/2463fe6a3be58651b2f102bdd289c64de17cc647 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/f8fd8373e9bc20e453e34a91626b0af7653289ae |     
   xtensa    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/1ee98342c461fa0100225729bd97f8b4caace0ea |     
    i686     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/3c7ac8ea1804e85d092c46e01184315b722d229f |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/9f34b4318d99d6f095c01b5259410f49bf03622c |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/a9e23e5af5732b24046df26dff38e6d360dc426d |     
  sparc64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/f4ec55c7453cbb69efd82196e310f67b4e3cb49c |     
    m68k     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1f1b948d18faa9d61192da07c624a5aeae144dba |     
  nds32le    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/4cfbabb526db063fbfbac4c83cfea2db784a2467 |     
 aarch64_be  |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/311b37b829d27b824350bca312a6be2aeef1ba06 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c5f608710ff7e6bd744f032eee101663097f8072 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 2 
docker-proxy-55685ba49593e6... | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/beb318efee0f4934ccfbe45f0fa71a683b5b14f8 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0a2dff8d21ff7fd0f56f4df0c9c6fae5141340a1 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b93eae304e0cb72c83a46f270ec480e295419a21 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b8a4935d67c64408fae15224a6ae75940a7817c4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f099369d9fc83c0ce060155660248d6814fdd8d7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bb1d7a5d1e09478bcedb4168229a912820f64093 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                apparmor-3.0.1 | 1 
                    ffmpeg-4.4 | 1 
                 openmpi-4.0.0 | 1 
               pipewire-0.3.26 | 1 
                 pixman-0.40.0 | 1 
                qt5base-5.15.2 | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/4cf2e2fb40df3e9e56c68f0d42668bee2e761122 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7ef25333a161074011778e1ce41f3c4e02c10fa9 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/f78885ee6d99875f6ef1adfa43c4ce80e07d4155 | ORPH
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/5384273ecf27fb67177be38df4dbb290a43b0c77 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d8102279f25136744275418450fb5d945737e98b |     
   mipsel    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/fb9ff522c1404f5e08a6b57e8c4e2c65d872956c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5329bf788529708cb5399c54047510e847d9ce81 |     



-- 
http://autobuild.buildroot.net
