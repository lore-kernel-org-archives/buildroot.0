From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 03 Sep 2020 07:06:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-02
Message-ID: <20200903070658.35E958734F@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 17  |  4  |  0  | 21  |
  2020.05.x  | 30  |  6  |  0  | 36  |
    master   | 171 | 52  |  0  | 223 |
     next    |  0  |  1  |  0  |  1  |

Classification of failures by reason for master
-----------------------------------------------

              host-grpc-1.31.0 | 9 
                       unknown | 4 
              host-grpc-1.30.2 | 3 
                   libcap-2.42 | 3 
            live555-2020.06.25 | 3 
                  luajit-2.1.2 | 3 
                  ndisc6-1.0.4 | 3 
             kismet-2016-07-R1 | 2 
                rocksdb-6.10.1 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
                  zeromq-4.3.2 | 2 
                coreutils-8.32 | 1 
                   dav1d-0.7.1 | 1 
                   eigen-3.3.7 | 1 
                   guile-3.0.4 | 1 
                   gvfs-1.44.1 | 1 
                     kbd-2.0.4 | 1 
libcamera-96fab38e02792a109... | 1 
              micropython-1.12 | 1 
                    mpv-0.29.1 | 1 
              netopeer2-1.1.39 | 1 
                   ogre-1.12.0 | 1 
                    qemu-5.0.0 | 1 
             stress-ng-0.11.17 | 1 
                      tio-1.32 | 1 
          wolfssl-4.5.0-stable | 1 
                    xen-4.14.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/3ff03a90bd89c762acb3954e1e6601a0bab679e2 | ORPH
    i586     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/3f7fec007c70b1e5a6d5957803ab500f46adc8a5 |     
    or1k     |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/6aab3e31f6540a734d662d6ea8b1a3f84856671f |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/ee926010d8d27de7bc4c991a6df5cec04c07c03d | ORPH
  sparc64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/f64690219e51f419193c25fca12c5fc76a80fa9e | ORPH
  mips64el   |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/bf682d01a93e10edf69516c121167f70ea3232cd |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/b75f8fe8f07b4c38f75c9ddc1ab78e259c3e51a2 |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/fcc47871e62d856437bd0978bb6f89a33af74a79 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/491774de3d2941f3736e9e0cc02efba99a9bedcf |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/e352f43ffb3aa7ffe1282f85506928ca971e1538 |     
  mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/91cb9e70a32ece0621e85f273b1f8cdf11f3471b |     
   mipsel    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/fec712fa42a31b5945426916c18ce0a5b1521712 |     
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/8f16686004a9c0ac5b97cca7938c9ddc5039b6c8 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/5aa0d4111b26551a8ddaa8ddb791de8261f9b170 |     
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/5a817dac9395cac4baeaf854c7e0901b6091a598 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/8155e0cf2dc3f22da06bb06a5ee31235f14fc88c |     
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/66fda43cb861bcefbddea46168176434dad1b561 |     
    arm      |           kbd-2.0.4            | NOK | http://autobuild.buildroot.net/results/a097abdcda3832ef795d33116bb682942ef1f901 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/e759c5d8e30a0c03084457743df5324079b56341 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/1e726bc49bfb73468eeef8cf97ec07d9fca9b177 | ORPH
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/8d91436841c72484c1d27c0b1a979be8a54ef99e |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/4a0345e96519d7a01d48d9ec13914cf2007556ed |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/e7f93b09f7f166fe07aaa97ed143e95dc7b176be |     
  riscv64    |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/f4befe01f0a31393fe5442d0ef52026b0e2b50a2 |     
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/eac1d0d75e7b605701a6c505ea7ea9814e4aefb4 | ORPH
    sh4      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/42c47be4ee1a45d3ef138626ebe9f82e37a6dc4e | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/26c003148e5f722e50db79e8163927cf5bc5dc38 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/8d61499b96cf1916d3f3d3a85bb009ae52693cac |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/b04a6d6a83e7842535074c436d00df532b5972cf |     
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/e30673f6930d833d24ef325647fe68203073213c |     
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/0e06e85577bdd1e6a57d65168968a05cf8a02dc4 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b7cee1079a6b82d410be8c7d5081f6c4afdc3faf |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4f780e025452bc12ed414e872e6a6bca32c4fee6 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d754e4e62a6a80bed9d7e49628fa256623846d0c | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9107c3a4c361df2b8cf6a2507545d859fc8f8f66 | ORPH
   nios2     |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/ec58bc318e0e2fd46c16814a4011a4847090e696 |     
   x86_64    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/bb9bfa58633fc5c3ca28d873bceaf23238aa6297 |     
    arm      |           qemu-5.0.0           | NOK | http://autobuild.buildroot.net/results/80a324963e7f97175c02d7020a31b6ff103e0251 | ORPH
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/84cd3647cfc5c80ec4d26277bfac5fed02e6a080 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/9e220ca951702a616b8846020fd02da3bcdbfb7b |     
    arc      |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/3a254cc017eb7bca58cc19a93f2ec1255418a4b5 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/e7cbb80b0747d31876f94f0e5f7786c2fe645edc |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/3741e47ec8bfc594aa37ac33b7927e5b73183daf |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/457d6580c8493142fa70b5c9e133848097ebe437 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0a2cdac7a3e4f783dc6dfd6f135b90f36686eb8d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f6bb5e7532c6c6fb00a843126718e90b4fad9082 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/28714f73a35e96dbcc3a38a3506bfc855ef78f78 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/242ef7ce33f604ae60f8910bdb88f5a4ceaee3aa |     
  aarch64    |      wolfssl-4.5.0-stable      | NOK | http://autobuild.buildroot.net/results/d5b6f97f7510874fe28c675e599be08cb8a78c7b |     
  aarch64    |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/7eac8f66f13dfa0a64d5a984c802b9b71d038a9c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/9817387b7e2f19bc7566fc75651d96901008eb3a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/27bc730256f69bd0cec21e57ca006ba47c631e94 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
             libopenssl-1.1.1g | 1 
                    mpv-0.29.1 | 1 
                qt5base-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/350e8f653870a4112b45dd18b720297ec0d91748 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/89e43a4c9a62c7789448ab7461dfb8e7a6c7bb0c |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a7d68036518c86034a133e6bfd23f7deb889cb35 |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/4f09c075b53dd62950001123f61728132961893b |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
                 openal-1.19.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
        qt5imageformats-5.14.2 | 1 
       shadowsocks-libev-3.3.4 | 1 
              xapp_xload-1.1.3 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b17828cd6ac135ada927686db62fccdbfaee8f3b |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/852a1430cc061e57037e0636fdb2db46f62c2b56 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d6643ccd6c46332bcba900b8008c301b43ecd347 |     
microblazeel |     qt5imageformats-5.14.2     | NOK | http://autobuild.buildroot.net/results/4b14ce1547c56b08ea6daa97b5e9bcd0919987bf |     
   mipsel    |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/8d16e0116f227c2512a1ebd005fdbbb32129c8dd |     
    arm      |        xapp_xload-1.1.3        | NOK | http://autobuild.buildroot.net/results/03b1c8cc83947d3603f45063dd8fb2c2c5943047 |     


Classification of failures by reason for next
---------------------------------------------

               host-efl-1.24.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        host-efl-1.24.3         | NOK | http://autobuild.buildroot.net/results/a0bff54099edb58f9c778956b453e399de67ae09 |     


Gitlab CI results for 2020-09-02
================================


-- 
http://autobuild.buildroot.net
