From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Jun 2021 05:47:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-29
Message-ID: <20210630054757.0095B40619@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 16  |  8  |  0  | 24  |
  2021.05.x  | 19  |  1  |  0  | 20  |
    master   | 34  | 61  |  0  | 95  |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.2 | 6 
             safeclib-08112019 | 6 
cegui-00b4e1fe174da53b7ed72... | 5 
               memcached-1.6.9 | 4 
casync-4ad9bcb94bc83ff36cfc... | 3 
  gobject-introspection-1.68.0 | 3 
                qt5base-5.15.2 | 3 
                   tor-0.4.6.5 | 3 
                  exiv2-0.27.4 | 2 
              libostree-2021.1 | 2 
                libselinux-3.2 | 2 
                openocd-0.11.0 | 2 
                    qemu-6.0.0 | 2 
android-tools-4.2.2+git2013... | 1 
                   eigen-3.3.7 | 1 
                 granite-5.4.0 | 1 
         host-gcc-final-10.3.0 | 1 
         host-gcc-final-11.1.0 | 1 
                host-odb-2.4.0 | 1 
               host-qemu-6.0.0 | 1 
        host-sentry-cli-1.57.0 | 1 
               libfuse3-3.10.4 | 1 
                   libqb-2.0.2 | 1 
             libsndfile-1.0.31 | 1 
                  mupdf-1.16.0 | 1 
                  pango-1.48.4 | 1 
          sane-backends-1.0.32 | 1 
                   seatd-0.5.0 | 1 
                       unknown | 1 
                 x11vnc-0.9.16 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6703b703b726875d16d449d3f04e65beb28dc493 |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/d6d936764ac210bc43b0063f6eb5628336a9923c |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/a490df04dec6f626ac7c5dd20abe7a544a767788 |     
  riscv32    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5be8a7d62003f15bb91f1cf6ab14b9d4fea02378 |     
  riscv32    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f779e8de9deb5d382a94fa3cbd469bd480fea977 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2ca3a3c7dbfe85cde7536719d90c22ae7d9d3ba8 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/34e2820b48fe2ef7fc0ae6c896f351d070de1a61 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0bdead227e3d8e645452592e2ac7f3bcbdbf664f |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/fc0a7b32da32cc3cac2ff3d7fa9e78e923f78301 |     
    arc      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/f6e576bb6570d096fa84b2099a7073fbc3b92bfc |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/880ca074ec6a04460cf637bfa8704c272b785dfc |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/462976f361d3f34a807abf65471e6eca29dd184e |     
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/eca4570096868da0b58945141aac3caef11e38cd | ORPH
  riscv32    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/5298685afca24a22b2037d3ecfb260a77860c814 | ORPH
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/08d047dde33216f7487638e55b112cecc6cacb88 | ORPH
  powerpc    |         granite-5.4.0          | NOK | http://autobuild.buildroot.net/results/8db0c8305ee7d9959b3d8a5b34e88203925c1d9f | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/647146d0c0910c183aafb12fc9c2583b92c6dadd |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/99edfcda8ede136ec1245b4cef7b9b50dab36cc9 |     
 aarch64_be  |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/8638d8d437ccfa39e4b764c733ff3505f6c30579 |     
    mips     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/19c4aa38bba4627f660b609be86fb1422c6342c9 |     
    i686     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/e3bd54245d8d3c11dc73aae335dfcb6ffbc6bb53 |     
    m68k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/5a0ec1dd0558248fab3b47be25c3c93c1b89e9fd |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/61548d41a3dd6cdca028ddf7f422fb85a0feccd9 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/abdbd31d1123c1189e22e9806f0f12a042b7144e |     
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c99398479dd5d5a0fa70c53830990a0d19304a76 | ORPH
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/9703f86c6e1f441f69dd29948eeb1b8524627c92 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/204750c8c0693dcfb7ba6878f56d49162dcb8586 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/0de8919aff8b08ab6282f57dba0a94d31c07d02f |     
  powerpc    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/6f59f56da487f304e7df869bbbe645ee801d1105 |     
   x86_64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/7b92e09bff3f99e0d8d59d65c825bcf2217bf350 |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/43d43477b2fcfbc90ce672dd9d25ea0334ac87cc |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/3413a00bb37956b07c0b3396bc0e0412d8d68d7e |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/df73cca84f2969200ee5cbda7e6d6dbb9ecf2abf |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/5a1cc7c4cffd4e9a73576673cdc75b49e2c2be42 |     
   nios2     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/414e6b34b0bb9160f73acdbb7e21bd2f5fb46a21 | ORPH
   x86_64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/ba554b67ba5eb1c53e4269e4781fd15119feb80a | ORPH
  nds32le    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/6cff1bbfcd51ec6e85e0dc12af405605d0b99f87 | ORPH
powerpc64le  |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/0ee18d0ff88d255945453565061ddf29e2f2d0d3 | ORPH
  mips64el   |          mupdf-1.16.0          | NOK | http://autobuild.buildroot.net/results/3109068dad58c36835a610172c75589ce05df769 |     
  powerpc    |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/956538a0a6029137db19cce30dc340e2e30dd166 | ORPH
  powerpc    |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/ae7da2ce1389ece44a4ca65108fee02e318df7b3 | ORPH
  riscv32    |          pango-1.48.4          | NOK | http://autobuild.buildroot.net/results/aede0bd1bd6b9d32e60e992647d18c43107d811c | ORPH
    i586     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/9e7d796d0ef5118cd9f8eb91d304d232397dd254 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/480da12635602acfb5376eb580d0b1ec5358f5f2 |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/58a494a3fa12aeb2253a69dfd5085d947d1e6af4 |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/002c00adf13f280e03363575fac83b53ea74e4fe |     
   s390x     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a326cabfd4e200cd2719db41aeedc23934cdebf5 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/6a778b9a49842bd54133b59bd1b2ab9db1e97fe7 |     
  aarch64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/0e6c5b3bc067285dbd3c68e3783029e90ddb8983 |     
   s390x     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/b8ebc154a427585dec11ac421fdcc4195d72bd67 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/11007f518f269c101089e79ade629a57b9a09427 |     
  mips64el   |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/257db0544b78acbc3013d92f899ad59b0f0724ec |     
   mipsel    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/72c726d291d797d1d1f52611c4d53d29409704ce |     
   xtensa    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/d3bfb56074d08f4d40339879b05651b133986ecd |     
    m68k     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/61c7cc2ebb2e611829d836d4991b7a26139f1b3d |     
    m68k     |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/33a06a3edfa7b4a93cd4aa15d0fc5107cc4330f4 |     
  riscv32    |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/b67f579fab55f2d91215f07c926b2539fa65f3fe |     
    arc      |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/19f8954d013ab46aafaa2dccd5adbbf381a430d1 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/793a8bfac1259dfc5eb9b2d60f44af9876a4495c |     
   x86_64    |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/8a91431425dd8821ae4b44d202c4add115181017 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6274cb5fb958768893192005e891f352f3bce642 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 mesa3d-20.3.5 | 2 
                       unknown | 2 
                host-odb-2.4.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                 openal-1.20.1 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/187527741dc2dd159923eba70ccf88ffe091ef75 | ORPH
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/a5a856a21c358b17a92538dcb5feea1c55608b95 |     
    mips     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/19791df047d1b75282c614a4a6e6f0d851bec726 |     
 aarch64_be  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/8a11683188ab82f7bf7544f775dedf75721c2ad4 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/a05eb32b0a62ccb0439857600b414aa9233352fa |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e9043cd39b7d8176059fad1e7c5e24ca3f8e4682 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a1eadaceb3cb82e4e122b79f54a70b1993e909c2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/99d340685778fc6cd457a4d782fea1195fc95b54 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                host-go-1.16.5 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         host-go-1.16.5         | NOK | http://autobuild.buildroot.net/results/56042487d42e415c46982ea5684ee70ab229c933 |     


Gitlab CI results for 2021-06-29
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1381266099  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1381265484  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1381266016  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/1381266025  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1381266206  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1381266330  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1381266346  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1381266347  | ORPH 



-- 
http://autobuild.buildroot.net
