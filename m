From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Jul 2021 05:45:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-10
Message-ID: <20210711054522.BFD114039C@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 20  |  8  |  0  | 28  |
  2021.05.x  | 22  |  9  |  0  | 31  |
    master   | 63  | 73  |  0  | 136 |

Classification of failures by reason for master
-----------------------------------------------

             libsndfile-1.0.31 | 7 
                  exiv2-0.27.4 | 6 
                    qemu-6.0.0 | 6 
cegui-00b4e1fe174da53b7ed72... | 4 
                   seatd-0.5.0 | 4 
               host-qemu-6.0.0 | 3 
                   gssdp-1.2.3 | 2 
         host-gcc-final-10.3.0 | 2 
        host-sentry-cli-1.57.0 | 2 
                librsvg-2.50.5 | 2 
                libsoup-2.72.0 | 2 
                    mpd-0.22.6 | 2 
                qt5base-5.15.2 | 2 
              syslog-ng-3.32.1 | 2 
                       unknown | 2 
              containerd-1.4.4 | 1 
                    efl-1.25.1 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                       gdb-9.2 | 1 
         host-gcc-final-11.1.0 | 1 
                host-odb-2.4.0 | 1 
          host-rust-bin-1.52.0 | 1 
              keepalived-2.1.4 | 1 
               libfuse3-3.10.4 | 1 
                libnice-0.1.16 | 1 
                   libqb-2.0.2 | 1 
              libuhttpd-3.12.1 | 1 
                 mesa3d-21.1.1 | 1 
                    mpv-0.33.1 | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 
            qpid-proton-0.33.0 | 1 
                 ripgrep-0.8.1 | 1 
                   sdl2-2.0.14 | 1 
                usbguard-1.0.0 | 1 
                    vlc-3.0.16 | 1 
                 x11vnc-0.9.16 | 1 
         xlib_libxshmfence-1.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/06b4b87b5c1ce16803b4efe225630f1fb23b34c7 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5350c593818e8c953ff7b1ce02a0ec6260bb3ac1 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7a63234540041c260cd5d5bf04e8f2f2f0942613 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e382a4687698bdcd578ed641b814f2b3ec17201e |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/047508cb9109d659ad24373b93f25872424d430b |     
  powerpc    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/fa111306b95316eed54771550474dae804fa261e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9b5e0d34461f7720b44437dd9e2dc2027220f841 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/beadee1bd19cbc2a417f432b4aa52b382e3770e8 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/181f69e6f8ce6492b75dc38b4274bc523dce70ce |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/60788b83e9858d9f83946c65e179177217b15d35 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3e913991b2a8391e04e3f72ac378238e6ab1aa0c |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aff3be8db6082f2b02333b9ecde5615a110e5663 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0c7803870cf4c782a795a8692a8566f6ecea6c5a |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5424b495232923c706e3528515aa956148fa7215 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/a51df5745d6b3a016953d9de75ef6a8ccfde17d6 | ORPH
  aarch64    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/c4a7f85985b15e32a7b4dda4daa18a36cda12acf |     
  aarch64    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/4ab848606a401f89340655f58756135590490d22 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/eb33187dd1a2123604366cd9d1299219b29f07e7 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fd2aa789e575046b07f555413030ba10a9c5650f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/1a9239f783221c54de3d569e0a96ff9e3ab2d6d6 |     
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/74d8e6fd28c2eb11f30a396390c9e54c0ff5eadd | ORPH
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/08de260a0f0aaa7d44755a449fa2a3fd8bdd8bfb |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/04c39f3a85bd979ecd8811f8659bc2b868624a66 |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/ee4b2bbc08c58dc972d285eafa43b7ad6586f270 |     
    arm      |      host-rust-bin-1.52.0      | NOK | http://autobuild.buildroot.net/results/a2ff32d2dd0aec94e612664b2711fd821556ac81 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7238476769f85e75744752f3299451873854cb21 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f4a9df08c32d12642abaef6dc2c3da4d178c24a6 |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/6547797df09283a86deb3098252df047c9497c6c |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/a6e86b56377d16c73b12bb888d324d02677d5075 |     
   mipsel    |         libnice-0.1.16         | NOK | http://autobuild.buildroot.net/results/5351c27ebd2530f9a6749066fd77805bf33068a1 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/a70b0ed65d092fefa3ea3bb35b76edf1b5590f5c |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/d90e44144aed44f19366ed398375fd8cd0e7d986 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f3f725c7cc9a0af022556a917c1da0c642abdc75 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/7dd0b988378fc8cee8549e7962c8d64a09577ce5 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/b6f375806e36934d291e3e14771916714121ff6d |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/cdf035565801cb1bbff2db867395f6cca85400a5 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/c908b48a09d3956ce805bf0b231cb621732c00ce |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/21639fb4ca8848c2530f695801c39c4d543c4fc0 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/9653bd32f1fef5159ba41e1fc202305338001178 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/242887a18ddaf42c0cff3056f841de4368792a2c |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/03e883743dce1b80526d0ddebfead305d6e3938d |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/bea393c8725e2c052f5da519ee79bee3db4b85ce |     
    m68k     |        libuhttpd-3.12.1        | NOK | http://autobuild.buildroot.net/results/79e3fa697537f2e33863e490b74ec881993eae73 |     
    arm      |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/b7f462176075ffc230eba36b053e8e987e7f82fd |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/4c9c15430b816c1db1733ca685048ffbe94e74e5 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/cc389fcac2e793aa6a4f5e6d7f02c0ce0898b083 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/2e75b37ebed6978b34936369a7252a41e4c2e783 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/298bdebf3775319db6d5742b7b318028cc4836de | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3c738cd6dd1a9d98da8e13380bf13d48d1d1483f |     
    mips     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/3e7473fd7e6c213ff6d4e08810dab53dd532d057 |     
  aarch64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/4379d2d80546b9ae39601eac968481aa4e7af5fe |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/71762d5cc7309178086ebcf44d9f7bbf67a5bf08 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/234229ba83fbfffd4c58e257dd6e786c9896bb67 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/4d466b4ad838d1b0ceec6bdec378098b909819c3 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a861ade3e67e4aaa577fa0390dad88e0d8bee30e |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/2836bb21bdfd68dff6444a3cefcb5afb7f62e034 |     
   mipsel    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7b6000723f8530fc60121de66e615d1dadfbc5f3 |     
  aarch64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/29d38c91c6f5f9de57fc832c7a5b6534d07c25b4 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d84749b9cf263ce91802fe7fa1d60239a3a93ac0 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/93567398371ece999b30aa47420d3a29e642872d |     
   nios2     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/cd9937f2b2ad0c2d63b0bfda11649435aa4d5692 |     
  riscv64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/8933ac24f94a34fd103e45b22279b7b162e35bc5 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/2490ccafc4fccf070ab7f502876bc89f7b234265 |     
  sparc64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/460afb39fcc8b485ea2a6871832f7b5fb546eb0d |     
  riscv64    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/3c3d7460b788758b9d357537643976edd52f77fb |     
    arc      |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/9c710dd773e2468fab09b1a0d4eb566352a49fc4 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/49b75ffbaca573fdc5c9a5241b1ae1de409522d5 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/95f8b232db1d31224ebde7bc1418d93d4c7f1721 |     
    arm      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/026ac54c00039540a654217a69b5ed0bc1aa2468 |     
   nios2     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/d677c9ab7552a3fc1e11bd6216312a6bf29d25f9 |     
    mips     |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/8d14895df2bf04cf6cd8cfc7a68c4e1169a024d8 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/572a31191a65cb00762a4b4115141b01676dd667 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/264c8c9b3fcaaeb5f8d59ba3a3c3f6cffa0b8d6a |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
                  gensio-2.2.3 | 1 
  gobject-introspection-1.64.1 | 1 
                 mesa3d-20.3.5 | 1 
                mono-6.12.0.90 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/01a64843675688486c1e1af8a9bc12e80808316b |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/30d0a87deb171f5bbd6d55f12ca3221b6baa1334 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7506464367e8afa861ead2d3abb451ab9d25bdea | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/17ccd6792f64d52bd0798a9f7eb701e0d4a36148 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f33879248b372877e18aadbcdd580ca298fbbba6 |     
  mips64el   |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/43fd7cbe15bf29e0282c1c030a9dad9f69d0d82f |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4e0bd8d79389506ff377107226a5b94ac95f9d76 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d68a56bf76ab958e9b67bf2499d7f278faf712d2 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 3 
        host-sentry-cli-1.57.0 | 2 
              openjdk-16.0.1+9 | 1 
               pipewire-0.3.26 | 1 
                       unknown | 1 
         xlib_libxshmfence-1.3 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/367ac07c347c83ca788ca27df5a5319f0e9a7f99 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/69784a6f6cb915edf551ea2d52196e2ec94c5857 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/30237a10be0145bd792d302c50e427d4d176b30a |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f5affde07cfcc02dfccb7694eb09f57fac33327f |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/42d34f81d5fb08343d6f83e483555001b191027f |     
    arm      |        openjdk-16.0.1+9        | NOK | http://autobuild.buildroot.net/results/8bc36d4ae515dee89cf2707367451ed080550b24 |     
    i586     |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/6d554e168cc8bf61fcbaa13116deee8f13bb30d0 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/85b02d524d1595c2e130467a44093c2ff67dfc1b |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/72ae186a4f9503bd41eedefa73d3d7ec255a95cc |     



-- 
http://autobuild.buildroot.net
