From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 06 Aug 2020 07:46:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-05
Message-ID: <20200806074643.895212152E@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  7  |  0  | 22  |
  2020.05.x  | 18  |  6  |  0  | 24  |
    master   | 136 | 93  |  1  | 230 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        libabseil-cpp-20200225 | 12
              keepalived-2.1.4 | 11
          fuse-overlayfs-1.1.2 | 10
               libglib2-2.64.4 | 8 
    host-mender-artifact-3.4.0 | 5 
              luabitop-1.0.2-1 | 5 
            host-setools-4.3.0 | 4 
  gobject-introspection-1.64.1 | 3 
                  zeromq-4.3.2 | 3 
                  assimp-5.0.1 | 2 
                     avahi-0.8 | 2 
libcamera-96fab38e02792a109... | 2 
                 opencv3-3.4.9 | 2 
pistache-f2f5a50fbfb5b8ef6c... | 2 
                qt5base-5.15.0 | 2 
                rocksdb-6.10.1 | 2 
                       unknown | 2 
                  boost-1.73.0 | 1 
               domoticz-2020.1 | 1 
   gdb-arc-2020.03-release-gdb | 1 
              ibm-sw-tpm2-1563 | 1 
             iprutils-2.4.18.1 | 1 
             kismet-2016-07-R1 | 1 
                libsigc-2.10.0 | 1 
            live555-2020.06.25 | 1 
                     lxc-4.0.3 | 1 
                  monkey-1.6.9 | 1 
              netopeer2-1.1.34 | 1 
                        nodejs | 1 
               opencv-2.4.13.7 | 1 
package/feh/feh.mk:47: feh-... | 1 
               protobuf-3.12.4 | 1 
               qt5webkit-5.9.1 | 1 
       shadowsocks-libev-3.3.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5cc3b1a4db254bbf7426c3159bc2b5e98918c691 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/45073c6c44c5a7305b95308f8bc5219546c05987 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/0226775b4f0d7cde5ea5a84ed843cf741a20ab1b | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2d048ad0f24a4dc9d9a532ccced9a7a13a269b36 | ORPH
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/c3ed09436e29105528c0148e18346a1fbfb31d76 |     
powerpc64le  |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/f45a5b7359f20cccafa5496058ab3898483bc12a |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/54f66c0d23e8956e5dbc04ebb31136bb10abe943 |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/bf890ef5be62169588a5a68787e8964b4f2a992b |     
    arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/5dc10eb290b787def8da94df272e42186a87a94a |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/78ec9fe57362a82a0d6668209f43a7096803a65b |     
    m68k     |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/60cee92be70475f014c21ee2ba0c1a0a2f6b2182 |     
   mipsel    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/c2dcaf21bd171da4d176fab0b7d0794de33103cc |     
  powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/ad04d08260134d67ade27b989ad320cbe7494841 |     
   x86_64    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/08925cd2150a1d9bea8d37256f47ecb3aecba2a9 |     
   x86_64    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/be01e5e248a5c8712cbe73f0141936a76fa8e3dd |     
microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/3d8fee62b0b07c79df66b96062c83438c8c24cc9 |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/a7230c72abea8b04e2dda88151ac72d31f72b4c0 | ORPH
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f19b074b82132bf36dec0c02413778f758999f49 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/bdafb84261b3c0aa653b718d6ffc25dc80ac0e37 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a4bd50abff6f07969fe716422eaf67ef8243a930 |     
  aarch64    |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/37a829b494cd98376fbbe272d666e3319caa52e8 |     
    i586     |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/fb4d9728933ee86cf5bb8c2fe4a49da9642954b8 |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/1717ec62a1314e866529f083e687abc686b95700 |     
microblazeel |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/36126bf81e332b58bd71adaa9fc0da158aa304e2 |     
 powerpc64   |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/945907e0ec620ae7350f5da39811d251fe8dc004 |     
    arc      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/9e708a0733d65d43c67bd451b3186c059584d541 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/58d3765c2448d444d6dfcaa44c243b7564cbfdde |     
   mipsel    |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/b86666d1df6dde97ccdb7640780efad02b1bff09 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/cac6df95525cad45e3b50064505d2a087d7ddac9 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/adda83309ea2629e70d957d54ccd289dbc7f9397 |     
    arm      |       iprutils-2.4.18.1        | NOK | http://autobuild.buildroot.net/results/965c198a5141b3985e13ab1f303883f2170eef23 | ORPH
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/3a6242cc1e411a27bbd73acba1bc5f02d71b7601 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/f8c8a1ca0d734168c0e3130abeb808a63300f308 |     
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/80c7d766318b1bdca5d1b7e4fb76fd4fd5aad4f7 |     
   mipsel    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/5c4decd8be5a1db741be34a9c20cd70b7c584553 |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/76cdbb6bbe46f337fb1d59bd598c525d303f14cd |     
powerpc64le  |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d733c80eebca6722dc97548a6938761c6707b0b7 |     
 aarch64_be  |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/0c04eb69875d82b5f724dd6f7db03cdd6d3817ad |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/ef3655306b3fd75d5f89ce3a21394ba7d86f0ae9 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/11884b89518eac7c4580303e2635e3f6bc47a96c |     
   x86_64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/4c9a3d30d7362d95e546b38e92bbad51074d8f4f |     
powerpc64le  |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/3a5af6c9a79d81179d07af03d6697eace916976e |     
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/09d39517255b587a1dfe0e7fc8f73a52c02bdc8e | ORPH
   xtensa    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/9f7aef064316f5e6b0a06d6fea3c115edaa39fa2 |     
  sparc64    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/e50e1748109292512c833480db4b471c50b33704 |     
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/781343031401f0e956ee4c5482e53aefcfb8867f |     
    sh4      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/1ba81e1bc8ff12bf6dca19a647f17f77eab046f0 |     
   sparc     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/c6f1f8f63ce8595290a01aafa12d60119554a3a7 |     
  riscv32    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/d3d29a4407685bcae8fb9cd02bed54fa05f8dbed |     
    m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/78c4a6a0fc8eec206ef3a3d7611633f68982ba59 |     
  powerpc    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/ac52d77dc51e8ca283ccc44764d992839d686786 |     
    m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/1f60024f1733f5d7431bc203c35aaec0647a3e6f |     
    sh4      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/e19a2b2ff64a7bb5c9cde63a6153204797861061 |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/48b2607844eacbd03e4f246a4a3c3c1f26bfc4a7 |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/9e5c7ca70b072b702ba3f67760b989c1a6a8c8ed |     
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/57ba41adb32dfd671593c8a930a7063309ac1f9b |     
    arc      | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/22e78e846ba03e9766405ba467c38ed3c4372ea3 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/d71f76a0bcfd2ede7d0b8a68c91db914a7bfba14 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/95e626636794f247d4d4d62f065629277332e0ce |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/bcd99b6f868068f58c3fd5899b55f6328008b9e3 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/dc6ff9f931f152d24e2070f396b5947643f017df |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/7bcc0ab89ac9482d180632e019fc8ac42ce8b448 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/8d93bff1ddcb8e5560a0ee76bc7603f2e326f7c6 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/01d62c78d269d79e04f5762b7fc66bc5b26844e1 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/56c066375c46bbac62833ab6f0c6cde6ab9560a3 |     
    sh4      |         libsigc-2.10.0         | NOK | http://autobuild.buildroot.net/results/5fced6dcc13d37610bc89dfc6fee42f0197d3fa3 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/f40bb47f3083b8e6023d9767def0d88294621ead | ORPH
    arm      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/fb7cf69139dcdc5c1b8b19a70ec00875fdc1f1a2 |     
    i686     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/8f79d01ebafb68628e1b96b3eadcef6cbd49ee39 |     
 aarch64_be  |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/5cc22d95febd0d9a8843dce1781877b275e91017 |     
    or1k     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/6b1f09109221e8fab3b144bc9da33f088632d75b |     
 aarch64_be  |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/549951fa7a559de32b8bf53814164e6170446bf7 |     
   nios2     |           lxc-4.0.3            | NOK | http://autobuild.buildroot.net/results/3f7a8721f440cfe6bc4c7439820fbad83e2ea4e6 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/ed2d4c37762e1338316c10969358a5fbd4805ddb | ORPH
    arm      |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/f83b267be50f055cb0518fe5377c4be46124a818 |     
    arm      |             nodejs             | TIM | http://autobuild.buildroot.net/results/72dac6b55635be5a691f8bb2fa93d1ddfad874b5 |     
   xtensa    |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/33120f6edd25fd670ec77ba43c9f62ef02f221f3 |     
 powerpc64   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/7fc59ead3f8e8c67f253c9a74784c77e8b781860 |     
 aarch64_be  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/9e3709605c5d448f9da09d3917ac0a2a4b56b857 |     
    arm      | package/feh/feh.mk:47: feh-... | NOK | http://autobuild.buildroot.net/results/01e9319f1e9f78af8e7821ff78ce51fea22cb33e |     
   mipsel    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/e995f3948a2a40c762a7900a1e3824ca6f2dad7f | ORPH
  riscv32    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/1b6fabc680399ca62bd81ae23657ad913dcba03e | ORPH
    or1k     |        protobuf-3.12.4         | NOK | http://autobuild.buildroot.net/results/f2f3b294f4f209d8afed32e8d605d59a7a0c7206 |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/cc68b258caa3b80a47f8d0432ecda19f66c5dee5 |     
    i586     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0edb9e97a06a6dd80bf5b216c1159cd481635dbb |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/82b6b9b9075fa489a66c2590630138b335047535 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/2e5063d1bc46848c3529990ddeb68ca8eef8a003 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/ad5b327ffe9c8a3e024820eff430d9c69b4d4db0 |     
    arc      |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/ad2436c18569109487c5e2d1d77db7ea27be19b5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e87e1eb977f05f5af61b9e70d8ff85dd26f52748 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cdb739db863535669eac0c1c03acefb1b75e30ad |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e4033f2df6ff6b10b2e5865be5392be95e3681b7 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/9328422f5f85081741d2f93df22056451fb50c69 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/58b2fb7bbf0758a92deab3dcc548e6d802aa900f |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-acpica-20191018 | 1 
           host-nodejs-12.18.0 | 1 
             libopenssl-1.1.1g | 1 
               mongodb-r4.0.19 | 1 
                   mpd-0.21.19 | 1 
                       unknown | 1 
               wireshark-3.2.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/b7281fc2c09d51e058a56f6fbc2f3c5bd9a6f8f1 |     
    arm      |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/b28de890eae3fda27bc75ec06529d06c0c4f5947 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/af7e691b76f91790b94b971cca8d52861a7a4ee6 |     
  aarch64    |        mongodb-r4.0.19         | NOK | http://autobuild.buildroot.net/results/ea744a0f4bb937c2e05527dae104458c6d46781b |     
    arm      |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/7288577b9594d2b221a2b13d19128772d71d167d |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/77159ce0d3b915c1332ebd19171b426ace10459c |     
  powerpc    |        wireshark-3.2.5         | NOK | http://autobuild.buildroot.net/results/4013276566d25ced85bb942ff03d2f997fd4fe92 | ORPH


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                  zeromq-4.3.2 | 2 
               collectd-5.11.0 | 1 
       python-matplotlib-3.0.3 | 1 
                 rocksdb-6.6.4 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/cfce8a14f63d6a9f990498be560416169d28a24b |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/9beeae8abb0ff20cfbc7ed7cc519ce94f8bd110d |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/b1deb4353cd118fc6429e840f455aaef6df9bca4 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/852c2a8373d6475a2cc52637caa0b0ed3780d97d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/26fba926b417b875b15e9cf194ddc50b471b29d5 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7dbc180faadcd2e55484ebf646f2878d8a5101d9 |     



-- 
http://autobuild.buildroot.net
