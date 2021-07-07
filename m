From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 07 Jul 2021 05:47:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-06
Message-ID: <20210707054754.28B454056B@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 20  |  5  |  0  | 25  |
  2021.05.x  | 16  |  7  |  0  | 23  |
    master   | 70  | 74  |  0  | 144 |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 11
                qt5base-5.15.2 | 7 
                  exiv2-0.27.4 | 6 
         host-gcc-final-11.1.0 | 5 
              syslog-ng-3.32.1 | 5 
                   libqb-2.0.2 | 4 
         host-gcc-final-10.3.0 | 3 
              keepalived-2.1.4 | 3 
             libsndfile-1.0.31 | 3 
                libsoup-2.72.0 | 3 
               host-qemu-6.0.0 | 2 
        host-sentry-cli-1.57.0 | 2 
                    qemu-6.0.0 | 2 
                   seatd-0.5.0 | 2 
              tpm2-tools-4.3.2 | 2 
                usbguard-1.0.0 | 2 
               capnproto-0.8.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-21.1.1 | 1 
                mono-6.12.0.90 | 1 
                     mtd-2.1.2 | 1 
                  ndisc6-1.0.4 | 1 
                 pixman-0.40.0 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                       unknown | 1 
                 x11vnc-0.9.16 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/487b490baa029da20e44aa1fbe1500f73af8b7ad |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ac612dc51e4374481a33ac5ec3718e32e7c69db5 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ed39bdfad8b5c4b1e714395b08a8704d045ec727 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/caabf84b696e6ca234fef0546235b3a96693ef8e |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0ba9d44017b87f6906b799d8720d4909377c4acf |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/49023e51bfa52120c187276ea751e95f6fcd0e6d |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2dc4f98a6a8ef77d0ba4e622113d52b7cf41e987 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/9b09d05699d70c5f760f5df5027ff9fa68cd56d8 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a5850039f031e552e3d7d3c6b2fbfdd59d15644b |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a226b0dffe672acac4d47a9f0a175f3dfb437c73 |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/3f96b734c86e37a08dc6e2ab25726c5ef3ca81b0 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e16a4fd41da248cc590e478d8225d5ba678ef066 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3863c8999a333b66974a590c2cd996aa41e581c1 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0acaeec49c2655c977f4aa6087e3bff32d6b721f |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/64cbe3335dfd111634a468aa0dfa4535953ab63e |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/152c3e9725e7d71b57e29a5ade2144d749781f61 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3998fd786d092683d84d2e53476c93ae76e6fc46 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/09de3c1e0b6185966b2cb2168b3ebce5192b3f49 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/be2c801197f5d912131e685618954c7fbbd6315b | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/59bf7be4cbcbeeb6b0549298aad59680fb76506a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8e61736db71fee47336ef8c07de2c99dae99229a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/461bb20e973c2ae66854e30ee61c5fb5f99465ea |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/b1d3c5250857b5d5559b6b269d9a77f3e901f5a6 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/918934c5e1322aad07fd5fa684c3c8b0f12bb1aa |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/91c034c098b3859417a6c71b9da93b026ee22662 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/b2bc775760dd636dd2e19f79fbcf5d70d34b7aa6 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/b6ee18d94f514bc284b113af12b657159128478f |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/b7bbaca58e22f85ad9d9caac4f8c26e069958936 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/f6e3cd1cd68b2a52622c5354161096d4f2a92d82 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7e0023a1721d17276783be41f5592b868164611e |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/07ef65e92c33430d851bdc3009b95aa774624b21 |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/babd7915d980f2be8a2a46f0f11524c94d40d6eb |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/30b8df9b28bb81151e4074b31f66bd8aeca2f96f |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/b2d5af6a7009d1fe3dd62090905f184bc0eeb15f |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/770420864932d5767a442db97a488d0f61c52b98 |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/10536ce48844838a7d776af3ad63a076688a62f6 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/2443114ca6115a417f4dbbdc53fcd92fe33b52ef |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/c41bb832add456ac850bc5c7aadb42d57d2297fc |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/4c5ba006a40cfc9e8265203924525468fbb7d5e9 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/7efaa99e8bb96e83fecb7db65cfa960edea4d3df |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/8ebe32890468368b97092badf217c8b8d3abd2ca |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/4c0b3377a5384315bbcd5a7a2938a3c00a81aff5 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/ac6065d46db52b02ff69d3d2ad1131f2235121cc |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/c820eebfd7b9c1e4581c756149e633e24ffb55fd |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/0f68ef7d425b88c8e3a7ecd46b4106d1e5f8e16a | ORPH
    m68k     |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/dadaa831c8126733892feebe348a31e839502f79 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/49a5a60f1ccedef6b6a846409f43803b4f6a3f99 |     
    arm      |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/0b71daadaef0b1c4c915f3fce2640f33194da5f0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/077971e609e2b9de22efce591d4c27aa67243840 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/01779d2a534212b1a54902e3566fb7e125259589 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/303a7b87427c0b323bf2df70606f46086fa7ca92 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/cd5857df19c06f5d04bb41e8a9e7ec34ac8f9e29 |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5597d2945289e0673bb444cb2de63d8b3b06b4be |     
  sparc64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/3313602423ef7b734b83a24b2e24810173bd1f5b |     
   mipsel    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6d62ca1a8afa149b0c7a291be5d88a19154fece5 |     
    mips     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/db58b0b48dc0517b3cb39c68f57e3e7954c6f39a |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/c48c39bfbfc30ab6bb758b2d2bdcdcf16c1174f7 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/e88035e7ed21f41b2dd329c91c030f99ab52fad7 |     
    mips     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/49daec85b5e9efd42f9dcb7d5440c55ea08939e6 |     
microblazeel |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/9cbb154cb086c7ee5420b4344d8b529e917452fc |     
  aarch64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/97c5a02f3d4587fe8ec32f696bdc9eceec7c1c09 |     
   nios2     |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/6813e9cf9649ec21910e4c5ec107c49870d595a9 |     
   nios2     |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/ef2dc87be3b19c9fd4e2e8012de0095e9e0a02fc |     
   xtensa    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/b080e082e7c7f6f22ed1b30b84e61c4ec0478f7c |     
microblazeel |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/6b40cbbf530131de390783825ee26f56d8061941 |     
 aarch64_be  |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/4a3454788c24fef95637732b39b48debdb5b24b8 |     
   mipsel    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/3d86c663c1a3fcad5cf61a43db9000274da55ee9 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ee32b5db281ef16d46e8e37a698e700a8084510b | ORPH
  mips64el   | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/17f7df1d67cc526e846d6fceea83a8e9202814a8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/96645d8dc4207847884a62ec152931c0152eee81 |     
    i586     |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/b059e414dc1c54a991b74291d16d0dcd117ce5a9 |     
    arm      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/80887cd26055f4df43212f6baba70a6302e0d5b5 |     
    i586     |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/69f4b10797ff224f6adfe8bd765fb798e96b1db7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ef5ce9042cc85930061fd9d19a1683fe0aa3ef05 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                 pixman-0.40.0 | 1 
                 systemd-247.3 | 1 
             util-linux-2.36.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/19863c1e262a99c34c0083e871fae1a66256944f | ORPH
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5ab92b4cd1de8ca004124c645c67a5d565c737c5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fdfc9096297b01ab14786ef961080ab3a2b09e3c |     
  riscv32    |         systemd-247.3          | NOK | http://autobuild.buildroot.net/results/6ebb79abff867d5ef087cc76cb3058dc05f45ed5 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/21d272d2d6af043335b06de659c1656de204e986 | ORPH


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                   gvfs-1.44.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 mesa3d-21.0.3 | 1 
                   sdl2-2.0.14 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/956074e290e3993ccf394c7f76683c607e82de7f | ORPH
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1ab4665811fed4671e2c94cde1347f6b5137c986 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/10b5883280447abe51dd5c06f800ef8237879c6f |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/facc51e22add8fa72bc8f256f923797180fab1d4 |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/6a6a889bdfc25511cd99690042951ae3cddc28f3 |     
   mipsel    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/03d7a1078275e601dd4fc4f7f818619dbcfc73e3 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1a399808c32c87b851f5c4a2b731298bf849fc33 |     



-- 
http://autobuild.buildroot.net
