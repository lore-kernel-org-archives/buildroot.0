From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Jun 2021 05:53:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-23
Message-ID: <20210624055337.7A44F83B66@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 15  |  4  |  0  | 19  |
  2021.05.x  | 13  |  2  |  0  | 15  |
    master   | 35  | 80  |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.2 | 19
casync-4ad9bcb94bc83ff36cfc... | 8 
cegui-00b4e1fe174da53b7ed72... | 6 
             safeclib-08112019 | 5 
               libfuse3-3.10.4 | 4 
                qt5base-5.15.2 | 4 
          host-rust-bin-1.52.0 | 3 
              libostree-2021.1 | 3 
                libselinux-3.2 | 3 
                   seatd-0.5.0 | 3 
                       unknown | 3 
               host-qemu-6.0.0 | 2 
               memcached-1.6.9 | 2 
          sane-backends-1.0.32 | 2 
                   tor-0.4.5.8 | 2 
                apparmor-3.0.1 | 1 
               capnproto-0.8.0 | 1 
            erlang-jiffy-1.0.6 | 1 
  gobject-introspection-1.68.0 | 1 
                harfbuzz-2.8.1 | 1 
             libmediaart-1.9.4 | 1 
                   libqb-2.0.2 | 1 
             libsndfile-1.0.31 | 1 
                 mesa3d-21.1.1 | 1 
            resiprocate-1.12.0 | 1 
                usbguard-1.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/3f09e084bf3a59737b208694a594da43694e6935 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6a959914ddec8fe39c0bd05de721f558c1122779 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b51aec8f0ae94370d0472a042bbca881c893d1b2 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/faa9ea267d25d9043ec36e26d0f20bdf5361bc53 |     
powerpc64le  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/d4c23639747dafcded4e28602ccbe48d102c385b |     
    mips     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/419125a4e50de91e5575fbcfc7671e2eda7153ac |     
powerpc64le  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/0ea0e93af882f128b105a24696f92f95db8958fe |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/435f05cca79874d72ece27a2293ed785ef38d51d |     
   mipsel    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5bc21448e6da4fcd22c6b05c59e7ecaf4c25fc4e |     
  riscv32    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/76eda48672f321749157518959bc69aad0e0158a |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7c3650e2a54ac7b77e910c075426306648538e87 |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/76c0a83292508c556b96c81cc955569b3b7b618f |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0f1f6b5cefbcd5839c7442965a7a86d5c1b8b50c |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f2f5fafb026ec31381011a59abdb81d38d93d0b7 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6f546b1d1a75caeab11496f49927e17668fc3548 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/665d42c97fb03851a87170b13d3426ecaaa72441 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7841d7381c131115ac58c593cf7ca89ccaa16a89 |     
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/6c3456df42b6861f373a62d6250e88da0b937a50 | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/2ca484cf59177e0b4d1897f06c1aa22346a507b7 | ORPH
   s390x     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/fee305831275c712d6d1bfe90c5431ca3c5628cc |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/3b6fcb81c3d36f77cd7c91830a66dc2fb2805418 |     
 powerpc64   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/e4e8b220d3f5ce546bf86b1ee5a1ba25319b077a |     
   xtensa    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/821789248002c72d3b5bc12cb864714dc3af4722 |     
 aarch64_be  |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/5d3c6167800b235dc27073dca75c7b94333e94b0 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/a095d15faa21b167184f384a3a7c7d8a0601e296 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/b122720fe6c8b28ae57817e6958d01feaf1a83a0 |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/b20c9c658e47bb9169b5a0f2b7d5bbaeb6131b31 |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/d7b726012e430c580752a8a8266725cf3f360b05 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/d19cf92f1d537f7bcccdf17f05417eb7bbecd994 |     
 powerpc64   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/e46f00d00fa2bdc09687460e17193e2c1b167b3b |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/ebc88f889554e80cc909fc42e9ba93073631ddb5 |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/eb8757de57e11640f13c47a9788b4a31872d154c |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/40457785bc6fc83b4784eda77d7c558cbae8cb23 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/627999f344e846f9c8df91d9e27e8199e6343b92 |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/424c25d726f09f035c26f98f101e96250f311f31 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/e3d023d48032299ec4a2487c1d6bcd4fbb82d0fd |     
    or1k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/03e13f1bd976536fbf86252055472495d83ca2da |     
 powerpc64   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/a5495da06996a5b13641d4ecace7556c7ec94c33 |     
 powerpc64   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/3d6d869c45a1341dfcebb174c1546ae10acb37f2 |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/3fb3e2ff6a9ca2fec02bb0c684dcbdb833b54571 |     
    arm      |      host-rust-bin-1.52.0      | NOK | http://autobuild.buildroot.net/results/b52251527ad52067529b7deac3c6013eba1f0d70 |     
    arm      |      host-rust-bin-1.52.0      | NOK | http://autobuild.buildroot.net/results/a539aa96d899dfecbe4a01115b9be63ef9f81589 |     
    arm      |      host-rust-bin-1.52.0      | NOK | http://autobuild.buildroot.net/results/d397f02ec27c885e3c8fab377d6b893a0958c511 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/587190898a322e1d07312236c3f8572577cdfa28 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/cae5f244b715d7ef6593ab0f299c68b4840810fc |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/ab7d85c51c30ce5a9bbf2fe60b49219712a43326 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/60dbda9003bc50816a96eaa6ce94f335448206e3 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/aead81523e6759b603abefccf3abdec376137f0e |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/1887d36446e491067573f08840e79cd1970191b7 |     
   nios2     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/1dc0707aa9de4314abccdcffe6203c627f1115bf |     
   x86_64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/309935eae7a6a4526fbf4df42ac2dc3c195b4fc2 |     
    m68k     |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/cf1e2b073e07b2a7feffdc5f59bf6e865b380399 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/2845831a66aef1501f5e30c5f04b6b9b799f2055 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/d8c731e6d3f08ea7d4858b8d90c1f53c688a82ee |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/02a3c0661b66576684438a8cc9ac327dd4a42bd1 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/e96319428f4948a490ed2fec0a051267db6ae2c0 |     
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/346ec0e60df2e12d63674d40e58cebb6c4e75ae0 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/1ee99cc37252d77431baf415fc030674c28c52eb | ORPH
    m68k     |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/26434c33994ad923443fa9197ad2b369cb0efac5 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/15aeb87a4a35a7bc80b27ee37f33d3709a5400a7 |     
  sparc64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a671e154b06dd5a0e07663ca5dc3af0435129887 |     
    sh4      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/2b9c8b2dcc239f96ffe08d0f8fc3d68ca51bcb76 |     
   sparc     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/fd27d03e97aae9c89bae6271094cff9f0b945f7d |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/f7def0d5706f9e6ab97accc4eaa5f512a11bcb4c |     
powerpc64le  |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/b2e95da1881653ee52001c792754bf15e61193f5 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/39f65fca59ddcd823ae371a058acad61db80b631 |     
   sparc     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/0e55f2a5d6b515dee947aec7d320d4447a0534ad |     
   nios2     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/7db0ee6488c4892e8c85c7c4d354f6078ed272bb |     
   s390x     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/f3dda6c83a1492723be40c665b973e471a82c1d7 |     
  riscv64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/b44ffec86b3beacee6dcb31ff6caa9aa93f464f7 |     
microblazeel |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/4be8bd936ef689aec39c3ef328b1167c40797b18 |     
    m68k     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/4b12b5f73619dd9df678652804ba5140c9c249e4 |     
    arc      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/97aeeee0bc2808151231af46d41d98f8442a607b |     
  powerpc    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/c0f38b8919387672e9ff06729866d23e89605da2 |     
    arm      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/ee6e4fef00d508baa4ed335ebe3d6b8809a15da0 |     
   x86_64    |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/ddf06048657d572f96eeb66ff8072f79d2684241 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b676059e27569ad3550e02cd530d9b40c80c76dc |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/8bd03175fa724bceada3bb2f24ea9a5e7cb75a59 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/9ff65be424952c90447684522401ac0bf33d5635 |     
  sparc64    |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/4c19e50a2a5308cb31a62f1b4b538a30353022bb |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                  gensio-2.2.3 | 1 
   openvmtools-10.3.5-10430147 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/538eadbbe367894a936435f64813e2dacbad3ee1 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/18982ce1bd3ad8d73134cab6ff81a1301df09d3b |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/332050c1a0051458468076921c2503e83900a465 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d521c5453d0c495982e9e9d423e1ec9af66541f7 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/4a02fa86c6cce5e07bf5212d9bbed2b28c0c435f | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4274bf2cace5df40bfb14e7189f4ba1dd494878e |     



-- 
http://autobuild.buildroot.net
