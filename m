From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Jun 2021 05:48:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-17
Message-ID: <20210618054847.45AB660633@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 25  | 10  |  0  | 35  |
  2021.05.x  | 27  |  7  |  1  | 35  |
    master   | 62  | 157 |  0  | 219 |

Classification of failures by reason for master
-----------------------------------------------

filemq-8940f34e0f1c8f25c1c6... | 15
                      pdbg-3.2 | 14
           host-libselinux-3.2 | 13
               memcached-1.6.9 | 11
               host-qemu-6.0.0 | 10
                libselinux-3.2 | 9 
cegui-00b4e1fe174da53b7ed72... | 8 
casync-4ad9bcb94bc83ff36cfc... | 7 
                       unknown | 7 
                    ffmpeg-4.4 | 4 
                libsoup-2.72.0 | 4 
             safeclib-08112019 | 4 
          sane-backends-1.0.32 | 4 
                   seatd-0.5.0 | 4 
                   tor-0.4.5.8 | 4 
                  zeromq-4.3.4 | 4 
              libostree-2021.1 | 3 
             libsndfile-1.0.31 | 3 
make: *** wait: No child pr... | 3 
                openswan-3.0.0 | 3 
               pipewire-0.3.27 | 3 
                qt5base-5.15.2 | 3 
               apcupsd-3.14.14 | 2 
                 libpsl-0.21.1 | 2 
                   libqb-2.0.2 | 2 
                 pixman-0.40.0 | 2 
                apparmor-3.0.1 | 1 
                haproxy-2.2.14 | 1 
                host-odb-2.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                openocd-0.11.0 | 1 
                    qpdf-9.1.1 | 1 
                suricata-6.0.2 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d3ed4d7740efa77ea27819f64de96b0672e1d367 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/14652bf4b715e2554e523a6a2df4b1937a6b7b78 |     
    i686     |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/9c3563f6caed80b90035017b4e5602d787a2b623 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/1021f08b0964dd93514120a17e1af88a4b269055 |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5e3898d8c868ff79a9a4a7d4ae7fe753f7bebda7 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/acce583303a7581fae0933fb2d627121e5dec43f |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/a4729254b45680862cc0271b32d125414d3719be |     
    mips     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4c94747eb432933398dc8d02b957846c982646e6 |     
  riscv32    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/7445bb31887bf45a37d63601a43851aa08eb8535 |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/cf40839231cbafb1ed1eacf962c263b08613b2ce |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/381fbc98a0b0dfdf6d0a8708e4496b7f5a35846b |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1efa3cf996da91f1df80512416a895f2f635557c |     
    i586     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/056c008c44c0e38c802e4f2a47c5dc44d791888c |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/aef32a856ded8df67fd10a93cd4558526cbc4b05 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/06535c7f17472fb8dabe9283b6e046577817389c |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5e3d8463731cc6610192df8c0793440cc7fee9fb |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c8f346e88e33a68e4f6fc1b56d2d8f9ffa9b3e15 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6ef5b9736ce214189f013868d5873cdc721e5c4f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e19f3437dca7ba5e4fba94a2bf414107687ca5a8 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/18fca0bfbb9754d51d7ec53757d724d06a8213e0 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/68ec9a97b3662c18cdd4c2e3bad5722271ca424b |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9e1820317ab759ad7cea8c0f9a8a06b8a00b4b8e |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/e981817f44eb98d60564319e698e591df73d2f86 |     
   nios2     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/789d51a96af078326d49b8a79a901e5ae07e8978 |     
 powerpc64   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/50a44ddd60aeb290f6491d2dba80206d91b5d6cc |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/7cc8063e082a07e991b01ac9d6221c8551b68dbc |     
powerpc64le  | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/f2075491ebdd5632f84726d6a86ca6aac8ed64c6 |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/45af19b9c2eae44284a07039c27030a47053f875 |     
    i586     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/89310e046a51719b10ac5d0d64e3742658638f36 |     
   xtensa    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/d6301ba706429cc16c5615a48fcf34f21722d9a9 |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/d489ac5ffd60265d299cb47fb983453f35d91731 |     
 powerpc64   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/fe1a7ac2b053ec580d60f2d4e14fcf7554b5e0cd |     
 powerpc64   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/fd4e61384dc22449fee85f72637c453c4ba77c58 |     
  riscv64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/347c9530171e43bed4fb3e34501103e1ed854742 |     
  mips64el   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/88e3d0131419d2641acc178703e638efb9fe1eb3 |     
    mips     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/0857a5dc56d61e76f430938d38ba2b0ca54da87e |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/e65a58d000d7616e71c4450aa0e6fc476f423d99 |     
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/03c970f7649e6f0c8293ea15ea7f14df643a805f |     
   s390x     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/12edad8c4cdfb3ba9ec7406a66b07f54a34fdfe5 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/44873d75452ba2778b6f04f4a2d306b24b3e05d3 |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/8ce2cb57dc1439917a79e62c5ace6013e7eb31ac |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/1587a733e6addf20b392096fb367f03ad65fbf9b |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/271b9ce4de24b4a30978e0dc3cf71c91c599dd82 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/15bb622a0a6be729b9580c72eead8db27a102542 |     
    i686     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/f2b7d7ea63119803b278e993e85e81f2fa094958 |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/db49b4dc044ee5b5919feb1304eb0efd6e524f8d |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/cc195f0c1357c54769542adb806346d44cca6805 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/b93d68d1c6ca3ae11ca7a7edc5ba513032f6c17d |     
 aarch64_be  |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/ac3a28c345d849ed915fe1d03d3460d0944cc62d |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/d8580217eae9b4c5cb12db89dcd97f1001829157 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/e534fdc74ef1de0269397bf22c9e4213dd4511d3 |     
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1bfd910c79b70a0585e059723e27e23c70d6fd7b | ORPH
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/17a516824519eff752a1df626f67160b20863911 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/299a6ebfcc2f800a7fb90056a733d51f2a2dae00 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/0510dcd3979221245a9292c0f91de163954774c8 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/38bcf677d354d49152f3277c49e11cfc2e7e9c82 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/14b1bb265ce371af344faf66eb340c089bd35cfc |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c21ef10f15bf43726906caa5701bca66e459477b |     
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/3b9b9749e137530ba6e04efb3d36f8f0f5573eda |     
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/09ad92336cc0108c043182b21ce05a9da9ab078d |     
  mips64el   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/2e8b26abfcf50aa1af82f40db1457486ded7843c |     
    sh4      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/78e0d19e0456490a6e4166a9baf2fae30840632d |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6a4bcde632bc4d5090b418fa7ef1187856446d84 |     
  riscv64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/2e4bb6b45d184fe84cac8507ff895987dba3cd23 |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/b2a882b3dc61c28620856c57f566e32bf6eac8a9 |     
   x86_64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/697933221e09e116cdaa6fd58bc4334715b967d2 |     
microblazeel |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/2d981726125c607e2e842385d0ffe524e351655f |     
  powerpc    |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/b33de66894634de7ca12a0c49d3ca7efd76bf159 |     
microblazeel |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/82446663ac3e5d9388ebef0784d21ce1f89e4c41 |     
microblazeel |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/d3c5dd0e8fa366827ff82654893a6a4bbf5e0e60 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/6fa778fee121abd4b2b10ed3a6111ba17f7cdbd4 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/30875bc7863c641b9f3f4106465acee69bdf2a16 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/c6c6afb082f87df74922111f77bff542a8639b62 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/d3d973236335918d90ed87d2cb07c5035f710f57 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/932f67261d09f0d484c616f59ae99e5dfc149554 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/9d78c71c0544d8bfd6613ee7b6f843de7ec853f1 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/a341e97fa9248f55b33c3a1e85ae00d7d853e8c5 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/5974cc846c4176c113a1c5b0676886f904abacae |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/6c56143bfbdbcc513eb2b4d78ebb99dfdb61f364 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/0ec16352f5fbee573c4231b4d963d7c79a741f49 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/781e0f5c8aa6e92808b514904a0a8a033bfb7e62 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/ad016daf149fb5cca300d22f41a4733cf50074e9 |     
  mips64el   |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/25dfa1d40fa78443661586d7095b9be43b9ff1b7 |     
   mipsel    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/d871d0ba8d7cb6e07a1f527678c9e731b1352a2c |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/3c4fa8c35a929605e16c4a984a21a463f967b580 |     
  powerpc    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/f8c7aff200245e11d2d8b33f5a21b94ad34d73e7 |     
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/61b6cf269a1a46e26f0ee20a92d8812fe7086402 |     
    m68k     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/fa10b58c38a340d75ec3eff6dd3348cda21d4e0c |     
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/7b96ee8964cd70ad1cd03fd31674c23b31185b8c |     
   sparc     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/eaa8fc279e17a5bfbb2a54d5ee2ea088a59e043e | ORPH
    arc      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/9286a406f68e3018e4734ebecadb15e9b3f10ef7 | ORPH
    arc      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/646ea2762647e4cf743bc796e5263fa165c66073 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/3ed97be0e2afb63865c72724fdb3b848cc907cc9 | ORPH
   x86_64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/a7a71c87e9ea13e1e3e9bb1f321c4668040be385 | ORPH
   xtensa    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/288e18e34cdcdbcbb19b793bc9489296f9fdbbb4 | ORPH
   nios2     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/d7009cd5fb22ed0ea1bb4f863a1e742abe110136 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e464585d94f77206644cb325dfaa7eb487c829d8 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/1ce77db6b453b467561794ef0b5ccc284d957fdc | ORPH
   xtensa    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/3cda8fb5f943e0b373d5b588765319aacf4af8e8 | ORPH
   nios2     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e7316860e629da87e6ee50c6187a94f04f596efb | ORPH
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/6c22680b134af696b90ec5213cc9f888eda7467d | ORPH
  riscv64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/4f27516a3e1cb8007a5c7a8dd080cb85a4803711 | ORPH
   x86_64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/27365a9324fece4501a0f3be67c521dbee6fc300 | ORPH
    arc      |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/c39082c8f698aca512ec68cc5977f74658c3b520 | ORPH
powerpc64le  |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/2e941fa6004e34e8bc066eead4b1d4fb6251787a |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/76a76fa3a267ebad58e4c6d713c1e5dc742fcee9 |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/8028dda756a8e7525b1f7e850629cba697501312 |     
   nios2     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/1f9fb19d8352eab8aecd887d99c2a9044f2d6b8c |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/97412cb31c78fa6e30a10d561399524e80262a6f |     
microblazeel |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/ae67e41caf4bf13a96edcea0c0c6ad940d07bce8 |     
microblazeel |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/acc9bdcce3fcdbeac15899af6052362e09550846 |     
  aarch64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/346dccbd2645aa1babe3eea10607d76e5bc9309b |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/dbffec9960ac705243b28c2fcfc938596a045f2c |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/2b5d03ef084c671dc6be3f164b0c3a3dcd966d1f |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/972fbe11d2011b780f971fb407c912da7fa031d6 |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/fa3898a9355bf48abb3c2215abb28c8a34f9c217 |     
  riscv64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/d23fea5c61800c30abbed641895203393dfe66b5 |     
    m68k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/4bcd0e205132aa4bfa93503ad7f190c892da5c96 |     
  powerpc    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/39a5cb96ab19c040104e4b79ec9cef8b4d14a09e |     
    arc      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/524ab38361e10ad0f6cd632c6071e6b1e5e5fc1f |     
microblazeel |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/7bce7ab89f48be397b5084907d5c66e14fcc30f1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ed0849989ae1042b74d943c2712d1c8e0a4a7770 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a3763d22beb651af4795b222bcbf0e7810a7b288 |     
    arm      |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/6cb85adf751f06c254b79fd67cc6acd3df8fd477 |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6303ce05dfbe2c633704b733f209ebc9cc115cf3 |     
microblazeel |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f4e522823db1c1a36b1e09bdf106aaa4a40bd193 |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/e71f0dc05dd0d9a49d130add32a4ecf8725abb89 |     
   x86_64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/fd8bf777cea89b0e6d920c37bcf72468c253bc68 |     
    or1k     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/eb41eb4172a384e3e73f8b23b36b86686e2b346d |     
   s390x     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/dc72e0c4aa01189a92b5f5abefbc7b3e4ab847aa |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/82ac6f9f30718f3d84ab432a12c91519be2764e9 |     
  sparc64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/fd91e8c8c202b6fdd6fa316dd33861d8293f446d |     
    sh4      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/e13a5ad539f72c086d528dcf581b5aba6c72f820 |     
  riscv64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/954566e9e624de428d31fe5f6c1c93e9fc7c8786 |     
   x86_64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/88f4ea971875b1a5eb88662326d9343341eaaea2 |     
   x86_64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/710451c97b5f7d5620c879ab73bbd69685ec61eb |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1f91fe9c20bca59dbcce34cf496a03830380b797 |     
  riscv64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/b757153356e187d389c0505442af9273b746b837 |     
microblazeel |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/c13d6910363b5546c83a3d65fa0b068478a49d86 |     
  mips64el   |         suricata-6.0.2         | NOK | http://autobuild.buildroot.net/results/0cfbd564c98a5cff8e90dcbc6389543510674d3c |     
    arc      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/bdfe5180a3c9fdaf692d3b8261d11fe56e2ad7a5 |     
   x86_64    |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/243b7178bf9f75090084c785793103ab0f446a82 |     
    or1k     |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/aabc7fd3093b1a7f08de8d06a1875eb5d231be4c |     
  riscv32    |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/0034aa7c8e44ee64dbb762764e0ec017fe193fa5 |     
  nds32le    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/45e8b8bc6e517852db70745962a04dbe1a9b52cd |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5ca30cb7def3189da2b43b83c00dc88771718e25 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/0a54c93a6788856ae3be6316fec932a36657588a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ed0465339f555035e716e30b1769e7b6086e4555 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e655883d939f151293de916c807e051c275b470e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6304963194f40f23fa5b5bd69045145a2c931493 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/e79c135b0c9216568bf74fbbf2045139a1622d25 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d874e7e0da56f7af4c356eca5609e0adb68b528a |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1a09cc7d6a9b00ffa437d275852231ea376908d9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/37a99dfdd7e5c7313286655f2d4b87487fa1adb2 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7b0ec3823f09efbdeb7f21206f5e1f35dd92fc58 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/955f549fd4f82df3b23ff4bb660d6e3481ebdc92 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/839b987f2e8767429939485283a6bdbd2e65fb0d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                apparmor-3.0.1 | 1 
  gobject-introspection-1.64.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
monkey-f54856ce250c4e257354... | 1 
                    mpd-0.22.6 | 1 
                 openal-1.20.1 | 1 
             openjdk-14.0.2+12 | 1 
   openvmtools-10.3.5-10430147 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/61b836780d96752065364d416e9cc639cc409e2b |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/00c6f416762e53b7ed672af6b729d0bea2a180b2 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d5c84aa1f533568a165bf6aa94532e60b3ab0f88 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6aacbc87f8f8dd32e66de119f8e4855edfd0efd3 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/93bdaf95d84bf0aad1eeebfe52688829fc074ee0 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/5839eb08a0dd743b503f3cd08b009022e40f31bc |     
   x86_64    |       openjdk-14.0.2+12        | NOK | http://autobuild.buildroot.net/results/b8cb2e0754e5226c3d01537eb91b1fdfd246517f |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d5b09284c31b64c50ba369e35f0620a3486a1640 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f813ac13228436dd07a6c8fdf85ee665f3150099 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/fa69c66384bde55a1a59e5f31b05ab985ef990e0 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                apparmor-3.0.1 | 1 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-21.0.3 | 1 
                       mongodb | 1 
                mono-6.12.0.90 | 1 
                 pixman-0.40.0 | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/a24829c0a9428404ca8a8466236414f58709c93b |     
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/791f17c309bb533204ea8142cd82303159ff23d1 | ORPH
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/00d2de10867887e8eadeacda8019fb1fc863d388 |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/c90f41d74f16f1b9ab705812934c6c1b8d304e7c |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/65ec2cc04d3396975f5cb51de34661b38a047b48 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/edf6ac88c53581fc66bbb72cbfd70a7c442007b6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c4bed22a9332a489756456ccd186287e829d8ca3 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/0253b9d731e62ba039fb3fc935117775d534db79 |     



-- 
http://autobuild.buildroot.net
