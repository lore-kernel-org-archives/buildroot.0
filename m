From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Dec 2019 07:16:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-26
Message-ID: <20191227071649.AC6F985567@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 23  |  4  |  0  | 27  |
  2019.11.x  | 19  |  6  |  0  | 25  |
    master   | 121 | 96  |  0  | 217 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.72.0 | 25
                bitcoin-0.16.3 | 10
                    libffi-3.3 | 8 
    libtorrent-rasterbar-1.2.2 | 8 
toolchain-external-codesour... | 4 
                apr-util-1.6.1 | 3 
       alsamixergui-0.9.0rc2-1 | 2 
              host-grpc-1.25.0 | 2 
         host-ti-cgt-pru-2.2.1 | 2 
               libupnpp-0.17.2 | 2 
                 mesa3d-19.2.7 | 2 
                  snort-2.9.15 | 2 
              spandsp-20180108 | 2 
                       unknown | 2 
                 xvisor-0.2.11 | 2 
                  apitrace-9.0 | 1 
                 dmalloc-5.5.2 | 1 
                   dvblast-3.4 | 1 
                  gmpc-11.8.16 | 1 
           libwebsockets-3.2.0 | 1 
                   mimic-1.1.0 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                    mpv-0.29.1 | 1 
           oracle-mysql-5.1.73 | 1 
                    owfs-3.2p2 | 1 
        python-alsaaudio-0.8.4 | 1 
            python-cffi-1.13.1 | 1 
              qt5charts-5.12.5 | 1 
             qt5wayland-5.12.5 | 1 
                    quota-4.05 | 1 
                    strace-5.3 | 1 
           uboot-tools-2019.10 | 1 
               wireshark-3.0.5 | 1 
                    xen-4.12.1 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/edb642756ea6a848d42bf94860bb92690ac74369 | ORPH
   nios2     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/7c35188ce0386c28e973aeaca5ff73962237314e | ORPH
microblazeel |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/a46626cc50f07f41d831614306f556d346d31429 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/9d3fd1106719d5edc1911e96c96cadcd04af0196 |     
   nios2     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/f7119ec4969348fb1b75d07daf26a8f1f8feaba7 |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/842ad18a05b88edf5f132f4a9daae01027996d2f |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/6acdc758c1259cf01559a0115c939043e0e9fdbe |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/bc1c087120d0af97dabdcd3f41ce1763b39aa8ba |     
microblazeel |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/6b4d9877aa416b788b94fe44b2673149aae4af43 |     
   x86_64    |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/ae50c2ca96e7833b0706e3828e6b30018e77d480 |     
  riscv64    |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/459070339ff00f12a9437bc9a1cc9c9ca9fa4520 |     
  mips64el   |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/afd0bb3b7c6bb8b8f4e6b00a165db015dd515a17 |     
   x86_64    |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/47d22364c3f43582e1496b3ca812b994a56d7716 |     
    arm      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/a46636097b006d788ff6f95423d226e0ef9dddab |     
  aarch64    |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/05d800ed2f13a067bb0f2df69d08f2f7789fd180 |     
  sparc64    |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/6e96a2625a6a29c4df48146b70c873b46b205650 |     
   x86_64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/f3c5613e258dd4ed8cf0bff9e70d42ee72416697 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/fe36e748bdb4f510d286ebe9dd6ba668b4b061b7 |     
    arc      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/ec121cd6c3504c45d0dc943b25ed7a3849ac91bb |     
    or1k     |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/e58eca0db141b72bc1bba0b6b98a26680a08cc75 |     
   x86_64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/e1f5f6246afbf51b7fa6ea5f3ee5e0e19e83bd19 |     
    i586     |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/019432673735d714f677a5f9120ccfeaf94851f9 |     
  riscv64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/4e16c3a203dbd423c9bacc2a82a386dbaf0fe42d |     
  aarch64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/99f4534bd4cc343882212d509cedc4cc5b7bec1e |     
    arc      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/65b865cdf257d528debe83f5e7f84a659b944b6c |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/8082953e4038dc08aad429bd53253ae5cf04d811 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/5e4aff78c98897c4549da8b3dbdc0ff9feafeae9 |     
   nios2     |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/0232989e9f372c8e2a636a2c6fb8b5a9137dfd65 |     
 aarch64_be  |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/734cd58451ca41df35858162f66e49c3254e37c8 |     
    or1k     |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/6074b378d5e076d15e15104802cdd10782f6af1c |     
  aarch64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/6653c8ad8a6ad5ee9f33da52bb1ce6b4b81aeb0b |     
   x86_64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/4dd56bdac97afa4a3e2e1e3aad6d24e6e718fce6 |     
  aarch64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/7b02f5fb9fc4fb1397ed3d15c9a6490a9a992023 |     
  riscv64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/4e46bdf28dce92335856116c53d2c8f18b439bc3 |     
   mipsel    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/ea38db24cda2f58194e578c1db1fe965da0b403c |     
   x86_64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/d38f00f62126dda3ab9c086525c94f62afcc6989 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/75cea76c868a56f999b3bdbf3750e57a40488e11 |     
    m68k     |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/c4c104e5b2ab784b553729f9bc3f88277f4e1a60 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/2b0ca8ce4df7496dcc7d078fae2114d75bd0a455 |     
    m68k     |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/954ac7645f78067912ba0f4d32cd8f42b1400545 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/01f0fa93efea710f9360b0aadb47165212c35b52 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/0dbbb2ef2b913fe74aafb5b5cb5bed668c1a996d | ORPH
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/9f66b20217d525bdac0981653b726afc2f5653f5 |     
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/2813d7aad11df9c11ffff80233d9dffc681cd7d6 | ORPH
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ab987eff81f42fb4333582df0850c4a4a7d2672a |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1416a414c4c8e1df5bf020c62463d9a77458f554 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/7e90447a7580ea61294eed699ec3e9b088c9dc26 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/572f4a0f602b54b2c3322956760295de91ca04f5 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/59db4b98289ea83685e552222744f7773a86b12b |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/aa0b8627af15c03026dd3b698817eeb8b85ef304 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/cb69d82ad1d41f6ea13d289ec2226d9bd5b67984 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/05818f5350a41cb03fea14cf180086f757b54b81 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/04b261049aac36ba6cfc4314cf9be288c9c52172 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ab55faca372b3dac8769a3c0e350147b51e769d2 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/3a14e79c61f0c4c4c2afff5c094b135a8acdc2c0 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/60acfe98aeee12e84c99c0b043691af66ad55560 |     
  powerpc    |   libtorrent-rasterbar-1.2.2   | NOK | http://autobuild.buildroot.net/results/aeae7536b75317cf256184712c1b413e0dd12a38 |     
  aarch64    |   libtorrent-rasterbar-1.2.2   | NOK | http://autobuild.buildroot.net/results/6466580c3b08639e15b556ef8aa0466e29d2dc0c |     
   mipsel    |   libtorrent-rasterbar-1.2.2   | NOK | http://autobuild.buildroot.net/results/30d56e50838c014d84d9f1cbeee1ea9036f1b259 |     
    m68k     |   libtorrent-rasterbar-1.2.2   | NOK | http://autobuild.buildroot.net/results/3e97b58f124ee051227de511279e313a49386f71 |     
  mips64el   |   libtorrent-rasterbar-1.2.2   | NOK | http://autobuild.buildroot.net/results/7d494bff409bbf39ea59df7a2d1cfb3018b4d9a6 |     
    arc      |   libtorrent-rasterbar-1.2.2   | NOK | http://autobuild.buildroot.net/results/a3e29537ca9771439d6cd15c2ec2c9ad22e6d9b8 |     
  powerpc    |   libtorrent-rasterbar-1.2.2   | NOK | http://autobuild.buildroot.net/results/ccf6439985d9eec97b06242ea270c2c96ff4b41b |     
    arm      |   libtorrent-rasterbar-1.2.2   | NOK | http://autobuild.buildroot.net/results/d3b3dc807887796fabbc9c1f9ae91fb2e6c80138 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/1a1d23681fa475bc301d0bebe4518d25bc6d3b78 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/626d0f4429fe924bd95f267620bc82ebceab200b |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/abd863e1838998f2b30224d5b7d385e5f622ce8d |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/07ec493c37634c9a021b6639d82e686a2eafdc36 |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/703499d2dffbaae5a0fc42da6c80eefeafc27874 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/2144f98887049b1bcc084dc1627022e7b2d5642e |     
    arm      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/fce556eef67300441cd874d32b81b2362dab8bba |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/176f5deaa32beda413c2635da6eee4f160394357 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/92f8fb7b03e035b1154a2dd450685cde7bd84a91 | ORPH
  mips64el   |           owfs-3.2p2           | NOK | http://autobuild.buildroot.net/results/1700066273205075a33bbe712b7458210f48f866 |     
  aarch64    |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/b46153f22630bc23e9776880916d3f2518501abf |     
  aarch64    |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/3de63106cb15834d3b7ae00d7a00602c73756cc2 |     
    arm      |        qt5charts-5.12.5        | NOK | http://autobuild.buildroot.net/results/66a13487b4e4c9707b8b7da5c30cd88a111f545c |     
  aarch64    |       qt5wayland-5.12.5        | NOK | http://autobuild.buildroot.net/results/78f520595e14003221d9c57355381f92108bd8ed |     
  mips64el   |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/a86ed7fcd4f73877ac201dcf6d8b096bcfb6a8c4 |     
    arc      |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/d9706d2b0755d9f9940a739ba397f5356acea0b3 |     
    arc      |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/7c5846b4818c67805c901580541a2047baef2bc0 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/e585f7bb95348edd636baafa322d1991cadd0669 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/1885e26c971341aeae558144a69f4b38f92720c1 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/28b12157d10481b77fbca6b835a5c3db5835aa1b |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/dc9220b0ba7e9a8e3f5f14ebaf99b25b7bef5ed1 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/60c727c27a9e0338556f98e4dfe2b33712832871 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3857bcdd3f6fed4800fb0f8a2247447034694fe1 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/990318779cd7629db56be2cae75959b8d025a6e0 | ORPH
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/ad8d74e775c4240468b7c582a5e5ece7a8e6f870 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/73249d02f06d604a3fde5bb92342fa81190a20b9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e7d615c7a6d5db69fab13686018936060a67b035 |     
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/689a2f33bceae4157e1f4b3aafdc7a50d0c4d7fa | ORPH
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/71261c27f31814d475c9a32866d1049da9afb566 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/f710008f163514b93f7f89a07eae3825b8346dcb |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/e160348818ef5cdc175b4f898f682bee199279ef |     
    or1k     | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/e6d8903291daa7c4f004301c31382b83150ba4a0 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

            safeclib-v03032018 | 2 
                gnuchess-6.2.5 | 1 
                   mutt-1.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/df1f0fe940ebb645ef397f552dc743ce5cf06e0b | ORPH
    arm      |          mutt-1.11.2           | NOK | http://autobuild.buildroot.net/results/4397a10cb45b933186bd1748a28055da35729fb1 |     
   x86_64    |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/b0193cd524117d049a0f328cfdd43ded44601c3f |     
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/e3a15e35ae08e9c949855034062bd53d2690db09 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

google-breakpad-7515ab13768... | 1 
                     gzip-1.10 | 1 
host-google-breakpad-7515ab... | 1 
         host-ti-cgt-pru-2.2.1 | 1 
          imagemagick-7.0.8-59 | 1 
               libsigsegv-2.12 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/21257e5a87f41487c6bf4db4e15ce49f1af1ac1e |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/41330ce9ddbf9691a9e36a601e46e993c14b9763 | ORPH
   x86_64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/bc2ae827b830d23094c8b70e5b34911d060295a3 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/fa01941a8b0e0aaf52a799fa10fb06f7ff2c89fc |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/2cb2fc0cbe85d6ef88407677a43d752fcc90a5c8 | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/b175a14d8b28572764e5b224f623bb25d677dcf1 |     



-- 
http://autobuild.buildroot.net
