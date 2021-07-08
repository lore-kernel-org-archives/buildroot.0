From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 08 Jul 2021 05:53:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-07
Message-ID: <20210708055315.32469401E5@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 23  |  4  |  0  | 27  |
  2021.05.x  | 23  |  7  |  0  | 30  |
    master   | 59  | 81  |  0  | 140 |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 14
                   seatd-0.5.0 | 6 
                qt5base-5.15.2 | 5 
             libsndfile-1.0.31 | 4 
                       unknown | 4 
                  exiv2-0.27.4 | 3 
                   gssdp-1.2.3 | 3 
               host-qemu-6.0.0 | 3 
                 mesa3d-21.1.1 | 3 
                    qemu-6.0.0 | 3 
              tpm2-tools-4.3.2 | 3 
         host-gcc-final-10.3.0 | 2 
host-python3-setuptools-44.0.0 | 2 
        host-sentry-cli-1.57.0 | 2 
              keepalived-2.1.4 | 2 
                libsoup-2.72.0 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                    gcr-3.34.0 | 1 
  gobject-introspection-1.68.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                harfbuzz-2.8.1 | 1 
              host-scons-3.1.2 | 1 
                libnice-0.1.16 | 1 
                   libqb-2.0.2 | 1 
                  mupdf-1.16.0 | 1 
                 openmpi-4.0.0 | 1 
                      poke-1.2 | 1 
                   sdl2-2.0.14 | 1 
              syslog-ng-3.32.1 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                 x11vnc-0.9.16 | 1 
                  zeromq-4.3.4 | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/72b81db2f49a4fb5bd3a4cdb49228c3c456a0d52 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a0f51e8987ef50c8c8e0573a12c5a2b1815b363a |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e48df5edf5326979dc50ce7f654ec422f19f9d68 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ac679bd4991abb9aa1c36019964599ff62651280 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/26b7aa4eabe8eb5afdcfa6d9305eecf533ac0643 |     
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/44578b06717394038a7e253f60a56f5137f5891d |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8c9d0491a80e672fe079815c2f4cf4b1378579ee |     
  riscv32    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2e6e9744c845f195fd96c7affd9bd49d8c349559 |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/02f8ecfd87184cd09df7219a4ff88291cd24e7c8 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/991f461113afaa3272f6ca1ddf6f47b9258a07f8 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d0add30b030d7a355cda325d5999df25b1bc3e88 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d05d198a26fdd28b8f06a4667045648fc76910da |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0b13067ce55c1a07722d41b2e15dce4480496241 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d63526098eac256d940072350dae04bc7615d6d2 |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4e294bf4b98a66dc1668c32b0842349c1ba93713 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/fae2c11ce8c2bce305c048958f18c6709add0104 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/479a1ebc766ed1146cd6dc517e3fe2fe29f01742 | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5ecbfd4604aa93dc8c7e983dd771b17ccdc42559 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5b070f37499ebc5d3989f341bf5d082702ef8259 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/03299aecb2308219428825b75f7e1694f660655f |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c8cbf0ccf0521540f85bbc794fc92ea2d0706a60 |     
 powerpc64   |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/32bd3103693ac2a4c67a483c326e9f6c11e4ab4a | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/6a9f8b0b7c89715d10518e392d6497e339317907 | ORPH
  aarch64    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/3d06ac22a03c73e6fed4648d4f23536f7494f67f |     
  riscv32    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/0245f6334dd028542b02e2e2a1da458fe9ed4fa3 |     
  aarch64    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/7d4cd1f64e288eccda50e654936ebd5bfb11b554 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6ce110a340fe3ece0367c729f203124d6c1a8a07 | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/b622d4a01258ac8be938efdf3e82b184a6817faa | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b62a7918e0387fb8d3987e539b85818e93063165 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/272d3d45e5fa9ee739f65dbcc9fb793257897032 |     
    arm      | host-python3-setuptools-44.0.0 | NOK | http://autobuild.buildroot.net/results/860a188bd270c59b1fee2f56f31e73689f0e4979 |     
  riscv32    | host-python3-setuptools-44.0.0 | NOK | http://autobuild.buildroot.net/results/21984defe62ece73a925ebb8bf1db62aec39c834 |     
  riscv32    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/23f5d24fac777d9d17779fb551b31e5789a3c7ff |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/9609957a9dec6ed8eb00fe32ebb51ca34c069085 |     
    i586     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/b0d8746d40698fdbe38dcdc4cda75dc1f2860c1f |     
    arm      |        host-scons-3.1.2        | NOK | http://autobuild.buildroot.net/results/8e8ae17432753d81a3daeece66781e6b8b38859f |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/40c8c924ca30f5f14dbb314584611db81e9dd3ef |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1ec4b20ab1976ee996aa97aa878e9ff13f5fdf28 |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/fa10123a13ad95d7309127357871f888dc8c9b25 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/6e6edd7cd84dae3255c4f786bf098910bbd2c711 |     
   nios2     |         libnice-0.1.16         | NOK | http://autobuild.buildroot.net/results/1cba7aa233e19472a69ffc2d8f7324d363a22deb |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/8ae8e3f4a59b0f44820161fdbaaaa989f8d6f771 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/54662aa3b88a4394ca09e600d1a7288c2093f85f |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/e5fe1bec69d190b2d033936fe16ad30df3c6149b |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/11796ef1ec8b47e027358967d778ec3eaf0a3d41 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/227b4edbfcc9162d64bec92bd7bc1f8e6a59d052 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/937f545583a96062b291a78c6c5bc3281e20dc27 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/44ac4ee02108c57ba3f0db4937ff72843e7c93b1 |     
    mips     |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/98556eb579fc6ed21caaeb968b78fe20d57bd3b2 |     
    arm      |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/8193db3885f9085fef632e98c5cca872c7974615 |     
    sh4      |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/fd76670dcbd8b8af26e43ead7315edc491b1c8de |     
   xtensa    |          mupdf-1.16.0          | NOK | http://autobuild.buildroot.net/results/17523c90fb1b8212156248d690b2be64701e602a |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/18b18f70c4d914a96df2a764e99941d196a0e82c | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/021f4ef0a4fecf4a1af6f1c26804d0de0f8dc92c |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/16e5f4cf6d9c1e381242b4483d88231ce27b1959 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/acf9706400352a38a90facec6b574b900ded0c15 |     
    mips     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/7a8f5efa9b50d48958bb9c42e7e0baef318cda21 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/2c28bcd3204444a40a3549415237756e1f7f5668 |     
    mips     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/41c5389f0304acb00772de8e22a456c986484b70 |     
powerpc64le  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/75a5d8690b6a67b5eeeb3351df35d1bcd91a18b6 |     
   sparc     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/db71752b2a9289dddb9dcb01c2c6151e99df93b7 |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/502ae54b0ee1cc7edf5e2e7f3b4acff155d0d763 |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/01d389d36fabfed30c11a20115f6841b51fb9105 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/b8817d47bf963975639ec2fcea7deefb2cc6b1c1 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1d671e2a4a48b5eb2c8dbb2c1e2defdac439a4ec |     
  powerpc    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/3ebf3c7eb8d8d24050304d3be37b44a8f3a65a14 |     
  riscv64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/636b2afdd9f063b2681f96fc4ebc38a452d815ae |     
    arc      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1575e71ad85071b4c562d963aa260ee560135168 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/9ea22f97d9a9099cdf8df962f74c39cfb6aac64f |     
    arc      |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/c7a3bcdac378c41c404164c8d41793c71871a2ae |     
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/1d6e69995199e8e0a21e3d612c039309c188b760 | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/2bd45601156c45b1ee285eeb747a921968bc9259 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b9f29935a11eace6f065f048a37b1526d7d7de99 | ORPH
    arc      | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/22a7657537b2d1e3e66a586d9d715ef73f77ba00 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/1b58cada3998a5a798a9fd781847fe292fdc27bb |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/3cfeab95180d087e9082653ddc817c24a87cba7f |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/641fabe1b0cc0b13ed3500a57429ca0e0dedd886 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/27a6b241074fcbf3ef1598ecb3541073956eabd0 |     
  nds32le    |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/1872c9ce57490455946679efcc654bd111fd3d7b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d6d0fb7da75ab4648bae581c4b0dadd0e48f15c3 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/875107898a7b389767056080ac15b3b32a33b5e5 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 1 
                 granite-5.4.0 | 1 
             util-linux-2.36.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a8821004a899957d4743f8a684ba02b79410432f | ORPH
    arm      |         granite-5.4.0          | NOK | http://autobuild.buildroot.net/results/21858813f68aad3f85553cc3e5d50fd02cb31418 | ORPH
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/e609fe91ef16fa867efa458c49deab70a4a08cf8 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/26f2b3743c2932143229bd4fe783dc594ae4cdfd |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 2 
        host-sentry-cli-1.57.0 | 2 
               pipewire-0.3.26 | 1 
                 pixman-0.40.0 | 1 
             qt5wayland-5.15.2 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ae6ffdfc95f93d36d0576569ea59c03c7f6b5054 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2f48220cd1dc7232bce0d817385b89f117080f39 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4126dd113a8aad8788a64d253a74125ebcd468f7 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/59f5db6c55ce8170d3d8a682b29669d1de5af2de |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/2ad5ab77706d4e793a4390afea4cf4a925707471 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a70c86f41b215643a30d211b9ed414a3ebec8ec5 |     
  aarch64    |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/668bc68f75f74481b7cd50fbca861e757ecff894 |     



-- 
http://autobuild.buildroot.net
