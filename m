From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 06:25:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-23
Message-ID: <20200424062532.94CFD88710@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 31  | 11  |  0  | 42  |
    master   | 197 | 165 |  0  | 362 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             paho-mqtt-c-1.3.2 | 31
              ibm-sw-tpm2-1563 | 18
               apparmor-2.13.3 | 17
               apcupsd-3.14.14 | 9 
                    brltty-6.1 | 7 
    python-dataproperty-0.48.1 | 6 
                       unknown | 5 
              gr-osmosdr-0.2.0 | 4 
              host-grpc-1.25.0 | 4 
               libtasn1-4.16.0 | 4 
                qt5base-5.14.2 | 4 
                     avahi-0.8 | 3 
              bitcoin-0.19.0.1 | 3 
                coreutils-8.32 | 3 
           host-nodejs-12.16.1 | 3 
                       iwd-1.6 | 3 
                  rygel-0.38.3 | 3 
                  assimp-5.0.1 | 2 
              gnuradio-3.8.1.0 | 2 
             host-pango-1.44.6 | 2 
                 mesa3d-20.0.4 | 2 
                    mpv-0.29.1 | 2 
                 openal-1.19.1 | 2 
                 opencv3-3.4.9 | 2 
     python-argon2-cffi-19.2.0 | 2 
                      tio-1.32 | 2 
                  apitrace-9.0 | 1 
              ejabberd-19.09.1 | 1 
                      fio-3.19 | 1 
                    gcr-3.34.0 | 1 
       gst1-plugins-bad-1.16.2 | 1 
      gst1-plugins-ugly-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-go-1.13.8 | 1 
                 jbig2dec-0.16 | 1 
             kismet-2016-07-R1 | 1 
               libuhttpd-3.1.4 | 1 
make: *** wait: No child pr... | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
openfpgaloader-849e5751e06d... | 1 
       python-matplotlib-3.0.3 | 1 
     python-mbstrdecoder-1.0.0 | 1 
                 ripgrep-0.8.1 | 1 
           spidermonkey-60.5.2 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/90b700de125add5888d03693eb166d5aa8763473 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/da912cde7699b427b6f3a99be4a62cd13c4a5f13 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c10d0c0e82a80799c4b5ccfed80af8cd2eeb20b9 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/29be1605500d0a89cc5490ef7df40e1ee6ec5508 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5e94c5f569510a3346b7d3da048e7b5c16bea3c6 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8af2a2883cd8b7f690ed002b862ad5d64a1b3614 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2507b1b21bd13730cabb6556e73482d61e26f0c6 |     
  powerpc    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f2b4a231326bfe08bd0f4563c6fd5f241b54e755 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/45d19c5302d3616dde76b0381e8db684364ce6c9 |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/3451c0dc7fbb013e1f0642fa4a4894ca4961ba1c |     
powerpc64le  |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/00fc45b732742788dc6ec382419ab2b2c000199a |     
  mips64el   |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/df25fe4fb09e544f961c8219cb17ddfcea5e0e74 |     
   mipsel    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/dcfe66a929941f535d67c844a3b47d94f92d960d |     
   mipsel    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/71970e610b73ab3070600bd77b8daf4e98e14db0 |     
 aarch64_be  |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/b18c6a9ce67065dcb7968c6f473b3b403d2925d2 |     
  powerpc    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/cc1ead226b584ab4cf563dbef2197afb55faa05d |     
    m68k     |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/8528221eac87f38d5f8c1e0f67fda0c739f7f34a |     
    arm      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/3ac789f6c4a8ca8b7fe751bc52f1843ac2fc2b3b |     
   mipsel    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/1ca708ceb7b9a727d2cf501b5d4bb88c45e1e8dc |     
   mipsel    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/17f7259f5a406ce6d1114e7c6566f1ec3130ee66 |     
  aarch64    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/5a804a49a38cb6f83ec4b4a12f3545f5c4634cdf |     
    arc      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/f1b6288686bf789bdd37e53c4f4edb3eb6540384 |     
  sparc64    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/cd53f8109a5e19a928038d216f3d2a7b14faaedf |     
 aarch64_be  |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/8ebb6a74834193736da35cfb0e56a1c8e1111370 |     
 aarch64_be  |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/83a036173ae91a17ad55a2f8c06bd6f37c702d29 |     
 powerpc64   |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/4fdf11b7b3c9c538972a6dd78cdc12fc74d088c8 |     
    arm      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/cc57af8f50c58ef70547c27fe480cfe1c5b240af |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/ca26ac8d7dcbe8fafd68a7ad77ef9ff969b11996 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/465162054422dfd87d8782cd5033de615ceb009d |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c9ab68e972609d91b276ebdf7e1b3bc9e0a470c3 | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/472a9520bc5c70c110479a84a4dd2a38e1a1d1c1 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9165af67976b2faf4b680989a23fba4f9a7944c5 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f56126bc7675c41e272ba01ea876c76fc1ae5e56 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/54d888211993be408628bdc6108d28209b926e4f |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/dd3bf7ab85186eed5d43eff5d8fc0a88f859fb8f |     
   mipsel    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/b538e66d31e6fe612784ec2b5efa2ca3e277902b |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/34808b736acd21be9b170685f68fb5b813d6c7d7 |     
   x86_64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/d5d48425aade2442b93ae63b52adbc228d24ef86 |     
  mips64el   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/2007c76899d0f102e5f7518e5fa9a9858c773876 |     
  nds32le    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/31685a31952631c796dfa3d0ee68041c8d037928 |     
    i686     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/2c2e60356ecb36d847ff6652f8af2b1a13e6eab0 |     
  riscv64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/d96e6605eb077d31e46ce74405c8ea3abce4f463 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/556bbb5241c9bc25d27f2adbbdaa282082387ace | ORPH
   sparc     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/62702ca0f0186f2ed7d02f47cfb5aa3bc0bbf13e | ORPH
    arc      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/89058d692fdd1c723450feea62d81b8bd7e76438 | ORPH
    arm      |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/10ca4acb4089dad8da40b5d0d81668d02ea96631 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/3cfb5cee81873426e5b29986c1c840734637b22b |     
  aarch64    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/1b265c9774972374a7db9305d610676a7c34c0f7 | ORPH
    arc      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/d73ab5ccdfd4514dc97e812f366017094be4ba36 |     
  powerpc    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/db7631ad2e5779a0639b74f6e525156e26c2fd2b |     
  powerpc    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/1e4947e5a1ce020fb2b482c6fe582d35973ba86e |     
   sparc     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/f5dfbd411c892caa88029292c187846ca4fe6e5f |     
  riscv64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/aefe3387e15574c12787bcdc91459bc2edaaedc4 |     
   mipsel    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/fe74b83cda6fa059ce38cf0a6944d0234acbe889 |     
  mips64el   |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/51fa61021c17084ecbb32fdab9b6115d1966e0d0 |     
    arm      |    gst1-plugins-ugly-1.16.2    | NOK | http://autobuild.buildroot.net/results/36f86db3225a0825534e2fe51b3721a9563afda2 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/80ec47d446c6ceac1e2e4ff41612e970feabfae4 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/4c8e47e2150da41b90b1e53cbd16bab26cfc9dcf |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1caa4e20a87b1cd6004e32948878dc4483e6caeb |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8623c2daaf28c1dfb9ee188f7839e11d7a5b4cb8 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3c8e42039a8aaa6d50e2f4c43f02381a8f089aeb |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/94efca08db8fe34dd648775b7d089651c2f64c9c |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/90fb0a0954597d4fdb48bed6c5beffa57f1372bb |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/c2cef2067c5678a24fad43f751dc82f78e0759bd |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/9348848bc40bf55e95125d376ff2d66f9a84e9c5 |     
   nios2     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/2b657e8b4a484d0bb8492ef868f492b7ada860be | ORPH
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/fb2bd0e7befc7317545245773bc572f9c62e868a | ORPH
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/09646b1ae584f0fc62ceca16636a72a10828397b |     
  riscv32    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/18e7dc963b685b17979ed703a537e29e4ac6290b |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5f7be1201b905a42026684eb5c104c1a6f107b2f |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d5ea9c59295bc152892305a20e51c4c2289f85c2 |     
  sparc64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/82d99a0515899ec49335bd0a148c3f4d828a29c6 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d5297b9d0ad0bedef58ffcfce7cb8144471197ca |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d7884f90ea043296f5851d8dfcc82e070c31b1d5 |     
    m68k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3e367ba287ae57a002136d9f3bea7a43615b7ca8 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ae33778b339aae608297be7d815c217bdb83910b |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0d029b93ad41d6b271a826c7764f5f97135a3911 |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1aa9fb0f8d92d65320642e59d0319c25b2d94490 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9363cb6d13c0e83aefbdd135b3d35fea8d41125b |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2c10d02c2331704d05cb09f7a13675551e48e0c4 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fc2747fc0b349c23457d4103e3dd38847fe0ab71 |     
   nios2     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f58760ba507a973642c2fbcd46e08a7d5398d538 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c37eda00db1bfebbbc6b699ff2d5ad5839880dc6 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1413d74c0274423136edde143b6df445c807c3a9 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5343df396a11a7d6cb301b9e72553f9e4b666f9d |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/61f8038ed7eabb07c1cd4cf2d25392b38efa73eb |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/5ad9d72c72a6c83d6cf2746564e35f948cf02e58 |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/ec2f70a85e2987b6179105a75e77d11dc1718457 |     
    arm      |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/6658ee847a03d12b714ac3be95116072c4cb761a |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/edfd1784a374a409b4c293a3da3921b5a064e887 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/4fa5bdff2c736d91fde8e799cf4c20571d3e8d2f | ORPH
    arc      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/61bad5006d422925a27b9168f6b5ff5d4e9f0979 | ORPH
   nios2     |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/9d69f617a011167fe446b292b928ffe9119f7006 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/23254d8488ef7ad465f1b3379a68242215e82507 | ORPH
microblazeel |        libuhttpd-3.1.4         | NOK | http://autobuild.buildroot.net/results/c5fa8f2a1a6e717f1498a2fc8b8a88039ee16604 |     
powerpc64le  | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/3c4c0efbf41ea7cebe80547bee529d2b93fd8b5e |     
  powerpc    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/2f9d727613f4b2f088c6c7002c8e3990a95c2a6c |     
  powerpc    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/5be7275d131c006c0ace9ee90ffc8d3d4e3a36e0 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e7dd8ecafd17fe21314c8e361ebb02513cabb6cb |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/69b3195ae9c1b04c9858435721beabf65079e294 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/203034845b9e1c75ea40e1317c1a0849176dd3a4 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/747ebb4f9af737cd58ee73bd7fcb78b6dcf1a7a7 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/7c1db9f52535bc203eb3542dc32e108bdad8a3a6 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/c40796da3cdd6765940f7f729a03b2577306df99 | ORPH
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/58dfb6563a76e557da13e2e4f65541e570c86803 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/be6d5a7cdd31483fe336e76c57d187aacdd3842d |     
    arm      | openfpgaloader-849e5751e06d... | NOK | http://autobuild.buildroot.net/results/67e13b84da7b8ae711a34429bbf17f5a23ee6666 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d54c2130133e95fbf8c80ac37d45601cb212a9a7 |     
    arc      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/722f4a26a9d19b87fd524af715882969f1e67bec |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/b7189003ead086cf3ea85eae93cceb47159882e0 |     
 aarch64_be  |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/7e7bb58a0d20bb4590864fb5f43ee11bfd3624f4 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/dbf86af1f0d1927b812330d10cf8a84c19d53e2a |     
  mips64el   |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/62f1eaeba4674df398560e2e653ed2a7143e3747 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d11ae53767d528c5de3b7102eb6dd533c0c412d1 |     
  aarch64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/3f3938c910fe39e4783a9eb2b8088db7d809efc2 |     
   nios2     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/886815615523ea2f31c95ed8c8893938d9be3329 |     
 powerpc64   |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/9fbfa75749dc26c2dbc026fa98f7e3bbf13d1e39 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/209fa7aa1578716e150bd768e800ea59797d5008 |     
    mips     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d5e9fd73a57012bf187f1a168c084c975a8554e8 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/de166f404dc180fa4d11847cfba1a00d5f32bdac |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/43998a1fc03f9ad24fbcff579e69b414eb52cf74 |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/4345b9c19855ef8240c4add83390db8fb0d74ffd |     
    i686     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/0cf485c3553a6cc592df7cebfe8a28bc21b0f4fc |     
   nios2     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e4d68eb67b81dd91c26571e949f9c3f4496e061b |     
microblazeel |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d5366f9b7310c54b4fb2f773588915228c787bf2 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/178d2c97b9a0822bea4614e0c92fc4d6acdb4136 |     
   nios2     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/0eaf693b9be9731c9c9479fab353429e561373d7 |     
powerpc64le  |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/6d88d93a976f81a23db6cb546020d3c52aaf4637 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/7f54b7f5360f507b30d7516393f813d4076d7117 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/112c4c924dde052524193c386154316ba83f69c3 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/1c073e61f47ecb3501c564f67ecc0132d7600c2f |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/dcde4e9a32462e3a74ffbad377c374c6d7779855 |     
    m68k     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/4b1c7a93c5fb2297fa129c2c8e0dc33b9067af8c |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/dc8fa55372a044a0a7ec2331b32a51ee8e59b12d |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e7c7ecb95cc82bac6f2803be5e2572a686b6dd29 |     
   nios2     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/6f635b0a1d2159e3917e6fdf8a5663d78358845b |     
  mips64el   |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/6e9e58e10f740d3174ebd8375b87f537e3127936 |     
    arc      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e713fbb5d049318853ca5580240be87288b9988d |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/f4646590c13c009b0a717e0eb7a411bf48932773 |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/1ce389c2f7a6c13943015084945b29dc422da9ac |     
  riscv32    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/2349114363274b2614d7ba11de1df72527f561ab |     
    i686     |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/c39c0dddef296c9245ff9a6e35911ade8444bdc2 |     
    sh4      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/c88b1955cf642241d5c011b9d44d38372d4a3cdb |     
   nios2     |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/e80e0bf3edcd391c05436070411255937a7ff07c |     
  mips64el   |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/a1af3f1806137eb484162aba7bdbaf5aa3be756c |     
microblazeel |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/b99ff6818e0e5cb01db0ae1d3eefd68b411d5f33 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/2aaeb42c57aea44cdd0363dd57bc35b60f49ab5b |     
  powerpc    |   python-mbstrdecoder-1.0.0    | NOK | http://autobuild.buildroot.net/results/0bf96c70409c0f0be50ed11baa7c93c48c7dcb4b |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/133276ba110f40d986fa7585ad08df043a2091e7 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/d37680dbd0d4e9b7cc2e65a18817d60d52e58d12 |     
    mips     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/559d2ab5875429da8c703ec9d5ad7405770eeab6 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c3fad3ae166872afb2d0b5e1cd32217bb9afa194 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/db2c103bda70e22af9235edb7fab8b025550604d |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/e01db53341c27c6db8a7e537a9935a0aa60e05a6 |     
    arc      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/0e69c2a607a3487847b57c07af23e8f02f0321d9 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/1864f3eef3aa84d9e70083c0280ed08b61db869e |     
   x86_64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/3fa86310ea1ddb5731952e241c3b59fd121b94af |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/741ce2050035ec37b9e9cf245d4bf285c2e24514 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/3b563b0785e253e1cafe30c014fe5a8330ab6896 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/945ca486282a7c361a4a6d428e68465d4aa49517 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/c9c6877313af6818ba1bda983087b361818e11f9 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f8659089e5f760bdb7bfe791ba92bc3feacc2f09 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/1c0f576636fe32f617a769fec816d84e6277be98 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a23f3ef23cabe092589129f66b2cac8e9aa2df2f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d48de88fb55de0409d911747b98d751a4c983d29 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 3 
            flatbuffers-1.11.0 | 1 
             fontconfig-2.13.1 | 1 
              gnuradio-3.8.0.0 | 1 
                 gnutls-3.6.13 | 1 
               log4cplus-2.0.5 | 1 
                    mpv-0.29.1 | 1 
piglit-ef761094be04d14e258a... | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       flatbuffers-1.11.0       | NOK | http://autobuild.buildroot.net/results/f5829a287b8c35ef7a222644ea194b2815d6031f |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0a4a4a8225baeb0f7e0ec31b1053166582a04cfd | ORPH
   mipsel    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/7c15b63137e93b31020712f9850ef4e93d918601 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/30b8f24e9169269b722ce50017b046aad559c95a |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bf49ff2969210b67ab4f88344dd3915f9c81bbda |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bcbbaaa893e8a3b917eae053c7772603170da5cc |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/35be710b33897a1e6d6f5d3a386fc0e50d91f3b8 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/5a92333943ce283212bc96ede1a8a84667020727 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b7aecc7ca96bc3db2331cc32ef1ff0b0cbf3f1cd |     
    arm      | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/5d6d95863595559912b620bd642fd8919a2c3661 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7a9963c5d7d0bd60c9d4e94bae45a4541b61f4b9 |     



-- 
http://autobuild.buildroot.net
