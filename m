From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Jun 2021 05:46:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-19
Message-ID: <20210620054616.775F540138@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 15  |  3  |  0  | 18  |
  2021.05.x  | 21  |  5  |  0  | 26  |
    master   | 37  | 91  |  0  | 128 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.2 | 15
               host-qemu-6.0.0 | 8 
cegui-00b4e1fe174da53b7ed72... | 7 
filemq-8940f34e0f1c8f25c1c6... | 6 
casync-4ad9bcb94bc83ff36cfc... | 5 
                libselinux-3.2 | 5 
               memcached-1.6.9 | 5 
                libsoup-2.72.0 | 4 
                      pdbg-3.2 | 4 
                       unknown | 4 
                    ffmpeg-4.4 | 3 
              libostree-2021.1 | 3 
               pipewire-0.3.27 | 3 
             libsndfile-1.0.31 | 2 
             safeclib-08112019 | 2 
                  zeromq-4.3.4 | 2 
               capnproto-0.8.0 | 1 
                    daq3-3.0.3 | 1 
            erlang-jiffy-1.0.6 | 1 
                openswan-3.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
                      poke-1.2 | 1 
                    qemu-6.0.0 | 1 
                qt5base-5.15.2 | 1 
          sane-backends-1.0.32 | 1 
                   tor-0.4.5.8 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                    xen-4.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bfb9a1e0241a77bc9c5b5a8f2be882d6055dd3f8 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/58c7b086edfe759e0b217bf936d4b4a08a3fbf0f |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4bd2863592f62a6da64f434911299ecfc6c024f5 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/6ffa2e0f8b410279d2ca654999288b36a644b54a |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/f1963b48860d25a0cfa2266f3cb1ec1aa3335001 |     
  riscv64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b50b87410f2ba990122bb1238e2a6d77a433b854 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/201030d82e68637d9dc750b8f16bac846b1b0748 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0743dc12dfe992793e7ed7086486c93509ca1544 |     
    i586     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8e771dadecb54d7ffbbd9caadde3f22198cd1ee9 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1aa4f9aa02bc74d3a51bc85dbdcdac36df82c8a8 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5a118d245e4845fa3faf697ae6ce5ddc83f4ee1f |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/dc42e96f584d37d1f15ee369cb3a93a824eeee3e |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/af86bb473cb3614fc654aabd5d80b8a5dac3fb65 |     
    arm      |           daq3-3.0.3           | NOK | http://autobuild.buildroot.net/results/b618bcca1a83704f7f15e76cd1e7f1117cbbd464 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/cab8715230822258688057a85416548b598ef47b |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c6499c45642852f1d15b8f0c06f538b2009fffb5 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/fc005dc4510002673320be0651098873e3b0f541 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0c4128a9c9ca5dcd63295c6cfd80ddaecc87adb0 |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/3acde6b743f59b2e0f5b9a7d115d29a266085df3 |     
  mips64el   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/a2a15961adcfbbca7ef113e43cf4920650500fe5 |     
 aarch64_be  | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/449e877eadd6e1845f70c333792ab39a18208b37 |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/d8c799622be46fe36f910633e5f1c9898a4bfd72 |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/697ae7c45eecd2b5b67e01dd5e979617e98f8a91 |     
    arc      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/546a34ed9f454d4e019fa2194373d1651a493c8d |     
    m68k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/b653026a59296ae6ea33b3b98cb3706bd94378fd |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/ef759f71d32de8f9be33191549529f9801329833 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/19ec3c47aeb5b4d71ea232d03c1ceeb2a85f206d |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/7ae1998a040c85804aea18e79d7cffa5382b1c80 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/c323f4f9799f57b136de122afc5c0533e833595b |     
   x86_64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/6112cc55cfc7afbad2db5fe86ff34d327aa3e09e |     
  powerpc    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/4207518a07d9eb440ede6d4af430d2892a3cacdd |     
   nios2     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/e1179958e3d61adb387cbc6e7b1cd1aa1de884b2 |     
    m68k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/221d6bf74313ad1d28fe56aa7ead3c705892301b |     
  powerpc    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/0f6d764517d693038ee106aee3503c60a214c3c4 |     
   nios2     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/f1ae92834dbd8cea34ee6eb9bd97775c158b3379 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/63a77fb4971ac284e7fa93171c6cd0e6537e75e0 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/5cc7dbfd4efe434e71d7f844035e9d5d8cb62cc5 |     
   nios2     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/76742cedf16766a7f608ba6ea16b57552ad2ab2c |     
  riscv32    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/8f567452a8a05bbd10413b20a36f6c51c1b0f197 |     
  riscv32    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/ba5f871d8c4393fc5673550c45ecf4825cfd34e4 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c04957dfa0389d3967d71eab2132dc847bbdac1e |     
  sparc64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/143dcb5ea1980eac71008c84ae4bad014fbb7811 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/7c5abb766fb61b18e623638c166411335be4b1e4 |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/b5aaeac8a2ac3009a9cffa10fd4edba278d56fa1 |     
  powerpc    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/8443d3cb9209373935af29d5d26054530408fd19 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/abae0a2807f9bbae323fed827cda1dd03542b34b |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/096fa40f8aa1164b27c0c8b89b23954e70dce872 |     
  riscv64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/380140dbed645b8ff78f5764168f50c82924f92e |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/abdef982157d1a3f29e8131b675fee0302b14699 |     
  riscv32    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/fea81e3329697764420886013035a40652bc5c5c |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/925174804a392d187ebdd0f320a7387b0b301899 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/5b80e1805bc4435c54554c7009a27c5b4fedbbdd |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/dcea235b94b87d44c832ba76c8999241e3a71fad |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/ced812a9125463c6337b8a6cd0bc5ca18cfedd7d |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/386e41f538f0558e47aaf30eb176f8c5b3912062 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/a93bd9b9420b9b9655d30b6e64834eace8c70a17 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/2da5da1a8c2c2bdcd5f263a658c7edf5723cafd1 |     
    sh4      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/2613059c3cd0cb1b4da0588315c849defcdef273 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/0705a599d5df5f3a70bae9ef467c991a2c26f0c8 |     
   xtensa    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/94bfe4f2b3cd30f3262c893897faf82c1be132c7 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/c22d8d39be94e427b8875ff9fc88299bcb8114cf |     
  powerpc    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/f65effcca9051ddd691499e741061de308c41f87 | ORPH
 powerpc64   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/033f2f46c656f39c165f1a4026e0cc59d09fb2b7 | ORPH
    m68k     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/6a49a915df800b4a874b299969a7c9afa78f5346 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/3bd78b42c0588ebde0c0b1fbb77977b04fac760a | ORPH
   x86_64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/c1dbb494bbf3ba24840c4b8ca73b768add070aa8 | ORPH
  riscv64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/4459669fd81a255d6d1f9f2454442f7ba0649d98 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/27bb15236ac212149e86841ed932500b861b7611 |     
  aarch64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/6c900bf79e9e0ac19884ed0bb8250e0d9bf0d1ad |     
    i586     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/9e7f8820eb66e00d1426ce83d2a0f41ecffb25a1 |     
  aarch64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/e4351959366cf1ca48989ce7e35de3e0ebe170f4 |     
 aarch64_be  |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/199bccb325491f42577cd13aa1f69fcc81e83e66 |     
    m68k     |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/584b637e95fd691659f0891a9f7ecd8c2ddbd794 |     
    arc      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/44714728e63d07e50dcf9d2877d28dc62667e577 |     
   sparc     |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/e341af94371439441079d078d31becb0306d94c2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7f02c1d212f914f4b5a6374b7d0d9c2420b3ae65 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/d78eaa1646d09d51aebd0ea8ca39b869c17b6395 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/c30943dfa97fa1e55cd16642cc10891f8dce5983 |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/59941cc051602e310c74484d50e740efd83900d7 |     
  mips64el   |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/5e219133a07bb2a4e9f119e0b13973450f9b05c4 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/19f2844f29945c81dfc76798d023296091a5916b |     
   x86_64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/4b57146270964825b55c2c9bcbf1b2b7321ddae9 |     
   xtensa    |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/af1c7624439d8a4b1d82dc2181a122113966a552 |     
  nds32le    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/b22469d96ce64b277e942046845284e6729b42af |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/779a9212775d4f17aed8c9d45e8b5c240c559c52 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b05ce39e23c65636a37f9ef80db0ad6dfe7bdcd7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/27deeb25e50916c0f702d28490cded1eed5b7fe9 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/bb1bdb442331c42ec614b8ba5290ded45af29518 |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/d0ab99098b9fda708bb4984a4beec61943fb18d5 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/24a0aaff8f46953d015218a60da2c9856152eea3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/302b4ddf52f8be9eab5bfe780e3de7dc1276c3a1 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 openal-1.20.1 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/6225f3f14169c0f5e3decce8f6a9a3fc2856e6b3 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/3294a7921c7c6ba31660aafd2143cc3bf6ad48a5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c81dde2b315bb421cb92a357775dda2a9c121010 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                    ffmpeg-4.4 | 1 
  gobject-introspection-1.64.1 | 1 
               pipewire-0.3.26 | 1 
                 pixman-0.40.0 | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9a5f94cb2e7801e9d76d974513168f2517cfdc7d |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/54e79406222ea7916a475948b214d55edfe08ce3 | ORPH
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/a789fa847fd65fd7800efa304ea7d6f9b45c6e9f |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/94fc080aa9302a6ecbcbf42d818839e3deea69c7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cd13dc0a7f17e2eb690b379d52f7b63c991c75b4 |     



-- 
http://autobuild.buildroot.net
