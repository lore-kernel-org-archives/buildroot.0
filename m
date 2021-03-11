From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Mar 2021 08:15:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-10
Message-ID: <20210311081552.61F0383DA0@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  6  |  1  |  0  |  7  |
  2020.11.x  | 10  |  0  |  0  | 10  |
    master   | 112 | 43  |  1  | 156 |

Classification of failures by reason for master
-----------------------------------------------

                 avrdude-r1450 | 4 
        host-sentry-cli-1.57.0 | 4 
                     mc-4.8.26 | 4 
                rocksdb-6.13.3 | 4 
          fuse-overlayfs-1.4.0 | 2 
                   sdl2-2.0.14 | 2 
                      tio-1.32 | 2 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
              asterisk-16.14.1 | 1 
                  boost-1.75.0 | 1 
                clamav-0.103.1 | 1 
                coreutils-8.32 | 1 
                 glibmm-2.62.0 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                  janet-1.15.0 | 1 
              libostree-2020.8 | 1 
              micropython-1.14 | 1 
                mono-6.12.0.90 | 1 
          perl-dbd-mysql-4.046 | 1 
                 pixman-0.40.0 | 1 
               protobuf-3.15.3 | 1 
                 python-uvloop | 1 
         s6-linux-init-1.0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/64875a1566257e1d5133a892b47c39d12df67a06 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/796043909eb37aead2a1380539f1efda76f2adee |     
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/7e322a1ecc11a6fd235324bb3afbf72dcb3da259 |     
   x86_64    |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/48e78e84b425e79cdb98c16ab40247a0fa7e9676 |     
   xtensa    |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/71530142d5313296689fc624b9b1446735352e59 |     
    arc      |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/712167620d46ed0175da89dfe77a8db2534b925d |     
   xtensa    |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/e3b0508047f32008ebfa83c5255ec5994b6af120 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/dbe45e22b4d680b470934767e0c682c1c3364790 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/e52176d82d54ea21e8cd574cdf11bf041a656d4c |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/8d0a4f3c8c4bef83a6b6fd3276385e0e4d9742e1 | ORPH
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/b11ca709ea13bf6a9735c5a95d1d637c7fb9b6dd |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/f55e0e68d9616d4cd2fc6aeb2ad53f6d46145ad3 |     
    i586     |         glibmm-2.62.0          | NOK | http://autobuild.buildroot.net/results/46bea2c3d2525c935f015ec6264a91d409cf070c |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/5b73385b5242d2509c1945b830b72b0c5f5de644 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/85d5d0f51d21d218f1d442008914638a194511cd | ORPH
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/be9e29ea2431a226aa3715359dc652ae3ae9dc90 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c8f7d05918342886b8be0c2c4bc5e0731625f7df |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/56721f310a5a972b2a25734756adb77992c0f7e6 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/17b61340adf7c4a2df41a8810e0cfed625a29ffc |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/2da25920cc4521a78e4d5417fcda2ce67db8a44e |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/b297a1652f5d3d552ddfb1854bbd101be9c6447e |     
    arm      |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/446eb0a15a728e2fe7a58312bb7329983b2df647 |     
   xtensa    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/c2ae96ec0949a28cba8ffa86bb7f73c1f805dffe |     
  riscv64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/ca604b1cb9a3b421849696d7ab9faa62033c200b |     
    i586     |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/b63840a232c4fc5d90fb6a6c2bd3f7c94f79266b |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/801313e1d8bac8eea005b878f21c8b5f39f2e86c |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/5cb4625265a5210da5c6ff1ae28465eac46841f4 |     
    i686     |      perl-dbd-mysql-4.046      | NOK | http://autobuild.buildroot.net/results/418bc2f2cf49893667334d1e6ddac8c2bad79242 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/084cda7f842f93ed3c4d68ac11e5bcff04bd3928 |     
    or1k     |        protobuf-3.15.3         | NOK | http://autobuild.buildroot.net/results/dcba68eddc9c5c922b083c447e8472b57a354846 |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/ee1c9a0272bb1b387bbd106a1aa66d31463af777 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/19228dd23518b36ba700b7d209fec4632e55197f |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/7ddf5a624da82c408b0a909c5896eb754931c66c |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/170e103ab9a6c19b4fb0fb78d0b47d50f27b3e1d |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/6ad9db600170c419f3d8a8fc51bbf48db7e9cf7a |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/288ac4fcd3732994394b45c1a6e101833738e498 |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/7f8de6a72ebd09c0164fae1822ce09b2f6be5adc |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/78d691c5de4ac5412e4b5bedf7d5db1d438aeee2 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/ad840a698815fc1117408f9807ebfcca419c9434 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/704fcd32161c7963c3f57a3b09006e696588587b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/369c308e5f7f2b5c00c85db9571c08aade60f56b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8b273f48bc793e09768b49dcda4a966936437c64 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/660a91cdf5b067f7ad541756b89840d42bd1a510 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7657ec27d27c82974528f42ef863c2f5a0ea6c13 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

sox-7524160b29a476f7e87bc14... | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/6c77e789e3933e11830f607544de85e25758646a | ORPH



-- 
http://autobuild.buildroot.net
