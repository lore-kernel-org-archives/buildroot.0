From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Aug 2020 07:49:09 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-06
Message-ID: <20200807074916.979BD885DC@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  5  |  0  | 19  |
  2020.05.x  | 20  |  7  |  0  | 27  |
    master   | 83  | 86  |  0  | 169 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        libabseil-cpp-20200225 | 12
librtlsdr-d794155ba65796a76... | 9 
dump1090-bff92c4ad772a0a8d4... | 7 
              keepalived-2.1.4 | 6 
            host-setools-4.3.0 | 4 
                     avahi-0.8 | 3 
          fuse-overlayfs-1.1.2 | 3 
   gdb-arc-2020.03-release-gdb | 3 
              ibm-sw-tpm2-1563 | 3 
             kismet-2016-07-R1 | 3 
               libglib2-2.64.4 | 3 
               opencv-2.4.13.7 | 3 
               pulseview-0.4.1 | 3 
                       unknown | 3 
                  assimp-5.0.1 | 2 
    host-mender-artifact-3.4.0 | 2 
                 openal-1.19.1 | 2 
               collectd-5.11.0 | 1 
               domoticz-2020.1 | 1 
                    efl-1.24.3 | 1 
  gobject-introspection-1.64.1 | 1 
               host-go-1.13.14 | 1 
libcamera-96fab38e02792a109... | 1 
                   libnss-3.55 | 1 
            live555-2020.06.25 | 1 
                minizip-2.10.0 | 1 
                openblas-0.3.9 | 1 
                 opencv3-3.4.9 | 1 
            qt5location-5.15.0 | 1 
                 ripgrep-0.8.1 | 1 
                rocksdb-6.10.1 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b7559c6bf7381086757d50298d7ae150e5e02a61 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/47d28f297db98ae42d07b6793fbf1606600d9068 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6a8afc8565e4b882e041e3883af9f018f529b530 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d5f040050195cf768b98013cf8fb9fa7adacb463 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/23089e4a7b087120cd048983c06ad610da860f84 | ORPH
  riscv64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/322ebfd3d666939669dda4e8e76d2399f30225b6 |     
 aarch64_be  |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/110a5126b7f925a1497d5503a4f227caa70a83d3 |     
    arc      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/22a93e954bc4eb99791343ea8ddc5b0518636687 |     
 powerpc64   | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/24ed829d12322eed6f244a52a42bdea1d73ca072 |     
   sparc     | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/016a18fbc03ca52682ad0e4b884607cbb4361c4b |     
   mipsel    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/d072cdafc55901fe83fe88679f39d37cc9ec23c5 |     
    mips     | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/3a91f44af483da5b2c0236ff608f3fde304edb45 |     
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/211a6ce370b9a0b9fdb7b3d2b572bffd4418d8e4 |     
    i686     | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/4c7f0ca5e370d595757acea4cc0f8ff893bfab4f |     
  powerpc    |           efl-1.24.3           | NOK | http://autobuild.buildroot.net/results/dd2586be32c25d93eebfaa743c1f7d36915bb0d7 |     
microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/c636e0974ab55ba2ee3928c17a9ae1065097df72 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/5b8a0556aed2d43c6f60f8b754819b57a7cfb422 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/9ab454385032f25d898f457ff501dda2efdfa66f |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/f0b7a4c423898d442f707ae9a7dc1c2df1e002a3 | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/cf23a1660caf5a7d85d58cfc316253c0890f58ba | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/4d6ee4d20f4a336028e4c6029f82689bf5e1c17f | ORPH
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a6eae94e9e20d7125534c3034797962cda179d78 |     
  mips64el   |        host-go-1.13.14         | NOK | http://autobuild.buildroot.net/results/1fedfed3417c0fec242cd4ae3dc5b36931d0fead |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/98e699d77ae99852d853551ce61a4af289aaa465 |     
  mips64el   |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/abd042754ab35eef43d07c26514a706d07063254 |     
  mips64el   |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/2400765a4f1abb14ba8c5254ed6ada021b2f7150 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/98565bc8888fe9ce5312a795e6e7074066301500 |     
    m68k     |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/ae8644405d646ff02c50f7eb0c52e8e51fe80316 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/3fcdef63fdca4d44ca852c932d3a5de29543fd4f |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2d79657d7f8299a68793602c5f6b6f1a94108bd8 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/4b8c532a16d83f368bbbd959003317ac8c5399f6 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ce1a9e27a6a76dee7e47df24d95b04264d9fdd1a |     
    m68k     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/599f62c38d117ba3f8d1703edb340eeef12f66ed |     
   mipsel    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/7bd365d263767e6dc333b0a1df323d8f82dbfa18 |     
  sparc64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/01fc88048cc5c6ab8ae3bf7bbad4feac3e6affcf |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/25742d8fa78893383f70316e9c5d63e7b6c4c08e |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/63a7e23f1d75218ce4bec1c8f45dfdb51129e86c |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/bdc534b70e86865738863f22461a54af6a0ac585 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/0e3c93beeec6cd4e001b74cb5c03c5bcd33dddac | ORPH
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/179de0d5e83c7a560b26640d84f9d0dc33324a7c | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/fbb37fe513834b73c47e1ef8e66dbe4b781428e1 | ORPH
   xtensa    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/ed101f574ee50d1dcc4c0912ff84113636060777 |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/8616555fa7d8c089931e0967220ca2709d2694a4 |     
  powerpc    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/8346ab844b05e330dacaeb3a8600f562cc3a4da2 |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/e320bba41cfcfa1a6a6a1c57947c9bb2585bd909 |     
    m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/6baa4d040a8a6bb958b06d82a4db921a5b7f0069 |     
  powerpc    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/40668439e0dd87858ad638471a2dc659115ddf7d |     
    m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/958572f0bd352d338ef3db4f61f80ecfb1aed124 |     
    arm      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/e8fe6dd1b94ca18d296da03761cce71650ca84fb |     
    m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/c9be40949e8c05352a68678545196fc7a508392a |     
microblazeel |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/77411b9b392d774027e8f2dabf94bff13c75a4b3 |     
microblazeel |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/c24d64d21cdf5745757efaa0bea8a8759cc1f916 |     
    m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/77b8453908fee9bc1685de67b6949190c02e7004 |     
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/599020bc6c1c1064b8bf84e7f249b47ea7c22ce7 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/54e8a83d201e1657074ea15c58c2d98af1070b6e |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/4afc69e44a2d229cd06cad9e449a82fbda060ac9 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/131a6a9f2463a3797b6b38d0a87957f5b510c7a3 |     
microblazeel |          libnss-3.55           | NOK | http://autobuild.buildroot.net/results/49c091505fa2c2673214d81b20f2c79e2c63e2cf |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/1ab709f815c2f4cf779b5a1a8477d742a677e199 |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/c009bc3e69666a863d97b2cda9bd7fea35989f48 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/b6bb05de11e1279b0418f1d26fec1debccb7a80f |     
   sparc     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/964170a4619f6662d58e76bcdf499fa6da83fc98 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/5e8cdcada57377017970cd3e31ec85242aab5059 |     
  riscv64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/bef5d5b7b3a460d30fbcc9359d07c386aefe7fa0 |     
  powerpc    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/7437078bdd577eef1f8acea8a2b09766670c5d4a |     
  nds32le    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/4c224d78188de303d6fd07d49ffd95f9ba90e55c |     
  powerpc    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/7dde25b6c199dc5473859638ee760c4f7bca991f |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/75ece03d06868d4b0167c4a962e8d366506f1acc | ORPH
    arm      |         minizip-2.10.0         | NOK | http://autobuild.buildroot.net/results/4f151d25ce58137d4da6ec0ba73be7c328fc10e3 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/5f7bb725950d5dd9d2304d022a528735d1c4a9a6 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/4e2a8168d311b10fa86b7f0c1eaad69b13fa5ca2 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/d4f104fbe698595844770d0492d87a2f531c17a6 | ORPH
powerpc64le  |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/3227a764c29b57392b74ebc0540d80060b69d675 |     
  mips64el   |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/ee90dda9ba49d8f2c9f0ecb7a44e70c8c9e6a02e |     
    arm      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/df07dad4b6774d1f83b6fc6da13dade07c8fa30d |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/3c3f45d0712a74676019a60bd594a26d6bc86f1c |     
    arm      |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/4ed490809f6585185eabc6c067bbeca9cdb762aa |     
   x86_64    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/dbf53114e08a4ae900d646e9dbb54d0e0ebe1edc |     
   x86_64    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/28c787ab4b8c27554c9a56698e7a87227eb8ac2f |     
    arm      |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/027d579b039e9cc2608bae36a471edcda0e6c586 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f4facbae06391057b1c3b237e3cd30e2a5f521a4 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/8fceee841bd2059b31573f8ed96741b5995cb53b |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/172acd194dac2fa2c710be628fa41bfd1206c375 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e47f3351e38a16393381da0590dc445b75b752e9 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/a1645b85e897621c796bb67baafca29d86475f8c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/72d40cfa728e9dee8e778b3d0810a87e7dc7fd2a |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  apitrace-9.0 | 1 
                 binutils-2.32 | 1 
          gstreamer1-mm-1.10.0 | 1 
               protobuf-3.11.0 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/2f0e7f90d971539a585a8f2f6139ee3c66cea194 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/06d9914e0235f6cdd1ff86ad5e0d0174b9e69472 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/64c8b489c1c32594ec2ea37c97bd2a246ace2aab |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/abdc82592e36ef0d47a039a8ab2978f1606dc59f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2a2bafec8304298cc0da3d1bb4a9984b05ee0329 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                     avahi-0.8 | 1 
      gst1-plugins-base-1.16.2 | 1 
               libtheora-1.1.1 | 1 
               libupnpp-0.17.2 | 1 
              openjdk-14.0.1+7 | 1 
                 ripgrep-0.8.1 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4665868e11992085157f1aa5ebef9ac364cb546c | ORPH
  mips64el   |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/17e289535334c5a868e04a40c7b61ee69621e455 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e8e256ce1c1d94be765baa0515f7ff7b64e27654 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/bdc145eb2f4f06946a8960812bd0cae4775a64da |     
    arm      |        openjdk-14.0.1+7        | NOK | http://autobuild.buildroot.net/results/91fb73281fdffaf3bfa8bd32a11001e6655e3be7 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/8d4efef5442ff6663a4c370af8c7e6b9e5ecbee1 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f460d2c210b5861e24bea56036e363fbf3d3d91c |     



-- 
http://autobuild.buildroot.net
