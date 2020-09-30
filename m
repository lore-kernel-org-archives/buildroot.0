From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 07:07:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-29
Message-ID: <20200930070716.D170A86054@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  | 12  |  0  | 32  |
  2020.05.x  | 25  | 10  |  0  | 35  |
  2020.08.x  | 22  |  8  |  0  | 30  |
    master   | 144 | 106 |  0  | 250 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 16
              asterisk-16.13.0 | 11
               target-finalize | 8 
                       unknown | 6 
                  boost-1.74.0 | 4 
 Makefile:753: target-finalize | 4 
               apparmor-2.13.4 | 3 
              bitcoin-0.19.0.1 | 3 
             kismet-2016-07-R1 | 3 
                   libcap-2.43 | 3 
               libupnpp-0.19.4 | 3 
             babeltrace2-2.0.3 | 2 
                 fwts-19.09.00 | 2 
                log4cxx-0.11.0 | 2 
                  ndisc6-1.0.4 | 2 
                  pango-1.46.1 | 2 
       shadowsocks-libev-3.3.4 | 2 
                  uhd-3.15.0.0 | 2 
                  autofs-5.1.6 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-4.3.1 | 1 
glmark2-c493520253fbfe3676c... | 1 
  gobject-introspection-1.64.1 | 1 
       gst1-plugins-bad-1.18.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   guile-3.0.4 | 1 
                harfbuzz-2.7.2 | 1 
             host-cairo-1.16.0 | 1 
            live555-2020.08.19 | 1 
                lmbench-3.0-a9 | 1 
               log4cplus-2.0.5 | 1 
              micropython-1.13 | 1 
                minidlna-1.2.1 | 1 
                    mpv-0.32.0 | 1 
        python-m2crypto-0.36.0 | 1 
                qt5base-5.15.1 | 1 
             qt5wayland-5.15.1 | 1 
                 ripgrep-0.8.1 | 1 
                rocksdb-6.10.1 | 1 
                 rsh-redone-85 | 1 
           uboot-tools-2020.04 | 1 
                 uclibc-1.0.35 | 1 
                    vnstat-2.6 | 1 
               wireshark-3.2.6 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/1d0eb128e583eb6c1c5da45cd51cd62d5f9918dc |     
   nios2     |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/2bf4844c7e8294722d62939200804bcadf5de3ec |     
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/ca7ef878fe4a27e5c82d4ba7158cb770d1eb9be4 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/03f2f5fa4436e3002dfbc87c483dabe4a18dd5fc |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/c304d1de521eb3523b1c5c5d0cbd9b3648abaeca |     
 aarch64_be  |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/2b44cea89123b4998d53413f1e40e5d54d3d4d3b |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7cd359036e60d98a86b7ea54ab1eb4e3bf5fccef |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d2b78796559b37342017d0e7cfab43bbfe0cfb68 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/83bba4985b9c91c0b893b81b71e1460094b01c46 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/4f2796bfbbc8aacea7b83a2df17f59d37770be54 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f6234b48b5d09d2204bda89ea10f2fcac5068235 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/615ddf79c1a3dacfcc3e0a9c9db726857044a391 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/a84dc8e79694180b196e619de656ed0e150ac465 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/08ff1b406b70936bc040658b3c96a523af8f936e |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/23ecb04cb0cc14e0a0494b135191b379cd011af6 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/3b6251a2c81eafe97b72e4fa8417d4cb21459fab |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/925142fa9f0bfdb5e23418cc2af35be24d5fc821 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/db2822697c1aaa300e4848dcc59cdec62703b22c |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/748857c7fa6e858e57f76671d7db07c8f57dfde9 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/bd56e75c70d17eedbb9805befcc300c99c55f1dd |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6d467762b5f9ccb1293dcdb45aac39a394dd6850 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/27c39913c96ebd27873ddffd89bae2fdcb2b9497 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/9d4d967e4b9717102c874819b87b911c0a3f993a |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/cea8f2ce88458c065952755faa3f46b2ae3b7107 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b93a1392a7ca25c463d3c53f47e92b1f9c44ca55 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f462b82ab7a2e405e73a46c5f5940159aca9c599 | ORPH
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/59a203a80927f6e4e7833778ca2d77039bad9d85 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/85d406b38f94806fdb1d14d46167718526fbd7c9 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/59947e7cad56db4e121609a565ba049aa9982ae9 |     
  mips64el   | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/2d0bd1f015e428fabcee24e73552264f0d5a33ca |     
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/164b33549ad8e1c564eb3d95e90ad5e71f2c36e4 |     
    arm      |    gst1-plugins-bad-1.18.0     | NOK | http://autobuild.buildroot.net/results/87d4cc5d3fda8c168d81509c149a13808c952d6b |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/225f636bda650bdf928d6b729b7750300921b325 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/3acf032122d65e1c19eed4b2a290e4c3ec0a29c4 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/a931222f334e8f2c6393d390d002398c8151a362 | ORPH
   xtensa    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/a0a59459be053d49eb0d6a14bb2c2e46479849d1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e4629d6a06fa7e86933ebffc2c899a7fea6f34ea |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d69c8d3ca380c3f46f73de71c3bbedc67c5ba428 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3cdb8becfc0dc5358b95f822b37784139d1c5cb7 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fbf86156d3cb6f9cd71b58c6de7e876024c06f81 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bb58b91ec8e2d545db011736f63f781addcdbd78 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2e7952496e5cf3e98dcc91c89e05a737fe051c5f |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0ec31d9bd47299bbf31b70258cd2d321df68b1d3 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d3e3b1abbd31bc6875ea19622cdc44e2599b6003 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/87824ed162c3ef310abc163cb5bd65ad74b613b4 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e7c4ce89a36d254543c7b010440c24b1fe6c07de |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/13f68bdda8aa1ddaa4c1624cf49645375ce688db |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6e0b4dee90bd97a1e171db07616475ea156d564b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/116f9198762c99a71c063f660bef4ec21be8f88e |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4956753dcafa132ec022a1ec33601557294ec439 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8f3a0e1a91f6a2be39a14fae9c632a9d8bd063bf |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f8650ee4ae5faa3c61efe0a7de93ed7ff760693c |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/26859b1c4fb676246858433391ea079853f69f8c | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/6049b1fe874a7618ea3e8850c960b7a9d04fd5a9 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/405199455a4e2133a27413260847c63facee04d8 | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/50809e1d93657ecdff5813be88a9ac4ac43bce40 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/cdd400a13925f3411970008bba1c495270604a41 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/da4602fd5b2b5911dbc730213ec6d3c850256812 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/95172463b7818cb3a2f3d4b72816721dd0a37848 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/c7511d8fe5b1746685aef4a1e455fa2dad238979 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/6741048e5900a6381804ee103952f5776a1bfae4 |     
    arc      |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/62467af4d9e5c82337955bf6417275a1f822a7e6 | ORPH
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/f57699b1c59a5310d114a3807a3093289078f84a | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/a17027d90f7fcb0190c1bf4c1c873711f6af7ab7 |     
  powerpc    |         log4cxx-0.11.0         | NOK | http://autobuild.buildroot.net/results/32f0b1d9959192e429b58cb4208c36eeee41b470 |     
  powerpc    |         log4cxx-0.11.0         | NOK | http://autobuild.buildroot.net/results/dd2b3e280bd9693da2d6c62b54024569c51c6f5e |     
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/7c538ea4efed6aab2f55688c99e92d632e4be905 |     
    i586     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/3e9e37d7842b60ef19664039d4df8a45446d905b |     
  riscv64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/494d7ac56e44c34e50b3810a004a670009dd7a31 |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/c2a3eb3faa0710710c5171a98cfc2ca97ab7bb48 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/d2f5452d99dcb9e18b344ce4d8821b9f30552939 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/4350aec38ad1270dfe4579f0285215bee2b888c3 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/c78bdcb585b0e457a6b754679844c593311549d3 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2e66c15fe06315af52bd7166521d583749c85255 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/23a552c197f940a90a72e511b1770999b289f6ad | ORPH
  aarch64    |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/93d6865a695bbffaa2931c8bd249734fc298b079 | ORPH
  aarch64    |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/46e99c81e44c8aa625ac39a6fe14c95228d7b6c7 | ORPH
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/b2b20e3d1d5f1525e4dd810f76f3da77f158f754 |     
  riscv64    |         qt5base-5.15.1         | NOK | http://autobuild.buildroot.net/results/41101b9da56dd917d5d681d5b1449bb4025c2b91 |     
    mips     |       qt5wayland-5.15.1        | NOK | http://autobuild.buildroot.net/results/a92e29f39b9aff34f17eb8367dc294409ed993ea |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/3af43d9dfcd600641df4ed4c2389fed55589ad3b |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/821dc9028d36999aa5badfd52b64958be2f12359 |     
    i586     |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/35f7762917723c074acfb2fca85091866847ffd8 | ORPH
  powerpc    |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/0ebef4521ddc2e6c43a853cc323d7ed0952c978a |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/9f31fe2b7b1349e63e0394c9467f64cfbb5aa8fc |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/590b306f9989859f7bfe3177000b8603588b01a6 |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/9ae58dae363a405f4d09253b4a49f5ba51503aa0 |     
 aarch64_be  |        target-finalize         | NOK | http://autobuild.buildroot.net/results/6548830205b3da3837f053008e169782ebc0e45d |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/21de013ec7cfb33e28ef8f0583dcbf67c6ce4b61 |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/fe470ef8c53aed854a8eb932d3719a1d13cbaf8a |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/dbe5b9386136c244b025c99a754a618f98b36fd1 |     
   mipsel    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/4add3e0b136eb1ef1c5678c4782633a68d7447e5 |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/a9d7d3e83fccf9e719fa3500af8ce0a03074bb1f |     
    arm      |      uboot-tools-2020.04       | NOK | http://autobuild.buildroot.net/results/ab9e7061dc11a16487988dd37bb31994abb11c8a |     
   xtensa    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/d2d72c8ee55ee92479007a93889ae6f1afa31b52 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/02f0e4fa35b22a8ac2c4c9b064960e47efc42dbc |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/dc3e35bd26989456782ed79f3c3088586ef786ce |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a0e3990ec423d2d5b4988449923cc48cb6a3cd60 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7109a9d9185f98426552647101f388998a02c362 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a64803830d1e034cffc353c1a99fb1fb15366775 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/0ba95f979fdc50bce01ef9bde0ae8e9b3f52136a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/5d81e2b783be31c2e37843f82295c7c3ab0e6f69 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/3360c7754003e9fd7b0e7dbe211f0b3d3e32b607 |     
    arc      |           vnstat-2.6           | NOK | http://autobuild.buildroot.net/results/c24e172d750f4a0c97fdda436d629100a674e140 |     
  powerpc    |        wireshark-3.2.6         | NOK | http://autobuild.buildroot.net/results/4e28759d6720fd680f840a9f1e65a4c770ea2002 | ORPH
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/db308329d9b0a08b00d3e33c50513be69dd842f7 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               protobuf-3.11.0 | 2 
               target-finalize | 2 
          host-acpica-20191018 | 1 
              host-grpc-1.25.0 | 1 
         libcpprestsdk-2.10.14 | 1 
             libopenssl-1.1.1g | 1 
                  luajit-2.1.2 | 1 
 Makefile:753: target-finalize | 1 
               mongodb-r4.0.19 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/7d28d33daf8f13628290c86bb74efadbfe1527f7 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f0f7649cf5b58357b93c38886867866bd47b5a01 |     
  aarch64    |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/7d6a8becae8191aa245560a8238ef80203a6a769 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/4caa97c4c8ee7b27d89cb4b703b9dd3fe4ce893e |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/3aa9ed4e0df0c00c474963545ee5d82d1857ef3a |     
   x86_64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/3df734e774acaee3acd753ebf0a5fcab3e06f92d |     
   x86_64    |        mongodb-r4.0.19         | NOK | http://autobuild.buildroot.net/results/944a33a14ee4b41cfe81f799f207bb41420b324d |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/2af2ab1d569296c2a0be6d01dca8a2c7571198cb |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/eb4d62158052e1a1ebe84f45235084e48db032db |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/08e921ef6af1684c63f3a13802d5c1572fcfd336 |     
   mipsel    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/ede438a4500af9cec0e3a5f84e2bb5b56408e8f9 |     
   mipsel    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/428b4c775ac0e317ae97b537e273eff453f12270 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               apparmor-2.13.4 | 2 
              host-grpc-1.25.0 | 2 
               apcupsd-3.14.14 | 1 
              bitcoin-0.19.0.1 | 1 
                  dnsmasq-2.81 | 1 
              luabitop-1.0.2-1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 rsh-redone-85 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/43ba8b7758e7a8211af6321211c624108f30678c |     
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/174fd52f85ac46891b6f85cc9eb9baf84272ca65 |     
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/6a3b0dddfc5eaa67625e51c0c31d8b8f01cf7226 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/d067e47b638b5aeb8bd92a3ce260a9676925ab2e |     
    i586     |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/e646bad1a225061220c401ff238c9f4cd276885d |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a7e54b6a212de49e8a0df596352e3b113cb50c40 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/13f7dbba16c2ce3c9cefb0123542a0a0336a43a5 |     
microblazeel |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/bc7eaa6683adb76a3cdc30a88b260b10f4a8cfb0 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0d39a88260983081c614232b91083730ae287037 |     
  riscv64    |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/827f510bfa3d8402c90841b770eb5470948c5272 | ORPH


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 3 
         libcpprestsdk-2.10.16 | 1 
                   mimic-1.1.0 | 1 
               target-finalize | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/15c1c9badc9f9b99d9ea28463e09092f283f47bc | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/a2a8c0cc29cea8ae3274213f37dae40b7905755a | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/de2326ea7129ece202aabbe0bb23e5f2e3b8fa37 | ORPH
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/24ac4cdb5c6915ee38eaa4a3f30c8affae334d76 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f6812744fbf98d348b4a072b01037e042b625774 |     
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/49f9e4305405ff889437b1ed20c31e40fbd694c7 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a906d5c238129d588c3e667eae6bf8c21a6d9e3f |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/c60f2e714061bf669c64f181eacbb865c49908f5 |     



-- 
http://autobuild.buildroot.net
