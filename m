From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Jun 2021 05:47:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-26
Message-ID: <20210627054758.4CE5C40269@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 20  |  3  |  0  | 23  |
  2021.05.x  | 11  |  3  |  0  | 14  |
    master   | 28  | 62  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.2 | 17
                libselinux-3.2 | 5 
              libostree-2021.1 | 4 
             safeclib-08112019 | 4 
cegui-00b4e1fe174da53b7ed72... | 3 
                       unknown | 3 
                harfbuzz-2.8.1 | 2 
               host-qemu-6.0.0 | 2 
               memcached-1.6.9 | 2 
                 pixman-0.40.0 | 2 
                qt5base-5.15.2 | 2 
                   seatd-0.5.0 | 2 
                    daq3-3.0.3 | 1 
                   duma-2.5.15 | 1 
            erlang-jiffy-1.0.6 | 1 
                  exiv2-0.27.4 | 1 
                   gssdp-1.2.3 | 1 
           host-mono-6.12.0.90 | 1 
          host-rust-bin-1.52.0 | 1 
               libgtk2-2.24.33 | 1 
                   libqb-2.0.2 | 1 
                librsvg-2.50.5 | 1 
             libsndfile-1.0.31 | 1 
           python-pybind-2.6.1 | 1 
          sane-backends-1.0.32 | 1 
                   tor-0.4.6.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d35d5b9635a770bc66bcad212f6fab2f0036cb0b |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/07e1c74fa11387cbccf0ba9541a2bfdeb3a9c3a9 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c9ca360fb42256ff8f60559bc0ccf070514a0fcb |     
    arm      |           daq3-3.0.3           | NOK | http://autobuild.buildroot.net/results/6b6c484e62231e00d58c0eb24888ff692e150893 |     
    arm      |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/2e580abf331f83d0ea20c1c4ab5e5fcdb1c56225 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6ee1896a7bafc67b328614390cd4d8008399b1d3 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d73d9712da125e9336615744810a44038bf88957 |     
    mips     |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/0141ca3fe5d3413308c2783880fd74a79eb3d4ce |     
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/39ef5ddce7c13c1cd4abcea7f6e6c8b2e368e1fe | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/04f187470fae6e82fc2b12ac76212b6d9893251a | ORPH
   x86_64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/378c329a61f81e34a03eda57364549a375962b5e |     
 powerpc64   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/2a42e894334a38a15ff710d6acb342a8f04aac97 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/b2f3a766cb2ebdaa4af76ab3749c9b2767d72c87 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/3ae1dcbe60589b60b56ab9e69a6291f9195f1a0f |     
    m68k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/97e2a3be63cf5ba9760610d4916cfdf12f654458 |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/0a8d6846e3581ebf155a74281de374d7daff74d3 |     
 powerpc64   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/2369bd2b675bbd1efa90f5a0c68bb72ae697597c |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/15cb97673fdc58e6b577d9b0da7c08aa758d0c0e |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/98db37fbdf5339a815d32e0beed27a9cef44238d |     
 aarch64_be  |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/a316f4a605d1bd047fcac0b1cae1e95fd1975c14 |     
 powerpc64   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/7351d8a9c7e6e7513026f5c4ea9fe936ea70155e |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/2c65de736d7b27cfa1d591dc25a33b552a227ef4 |     
  powerpc    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/f4593ede452658b74c61cdc8c81e0313a58fa4ca |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/8593a9078a7bd85df2f2a761886385d94877596b |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/6ff8fed0c579f683ae52ba29c9f7335e1516715e |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/f1292705dc879b76f59002008037652235ac7ba6 |     
  riscv32    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/a2e8cb7f7959ea58aaeb170d048a74a82709fa54 |     
    i586     |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/54550ad39056dec946701476a03efa2de261e773 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/214968e6bd01970ca249020030014be0940b8e07 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c58633b269d36d24194a0e0e8831195fa9c9e2ae |     
    arm      |      host-rust-bin-1.52.0      | NOK | http://autobuild.buildroot.net/results/dd5140723f7d62e2e415c29d1cdb8a97af0d4273 |     
powerpc64le  |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/bf30fad2f6e18117fbb7f3e9192393f4c13887d3 |     
  riscv64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/9a8322a923675235d9724e5c446449a34989fb10 |     
   x86_64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/6ec71c8ecabff20cc7ab65cd12aafcdd62e4d1b9 |     
   nios2     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/91f908aba96cf3eb48ec9d9124d2b53a08eb5e7c |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/a3cb6cfec2445c812117ab3c130620efa1ac0584 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/92fdbde50ec6e3bfbde80b092049f1dd20f61655 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f356266150f8b90fd675c2eca7020c0425e29ac7 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/d554de68fb1e5ba6bd3eb1bcaed72effb5cf3eee |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/847bdca1ac32d471057f11578e82a51f91a68758 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/280023a3d454321865264c1bb03a310643c8b416 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/b7dd88f67dc0ab3f3be7f2334032f3ea93dab969 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/06165014d2ae4397011179839b2378b47e0b07c2 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/b7dfed7ab6482248200db0e202f2ce24b55c4512 |     
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/3344815504589c7637afafe1272969dd90b6f874 | ORPH
   xtensa    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e3d5ff15e133470975d4ac0ef666d572efa03f24 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/776cd54ee71958a072c9ed16239c8759fd3070f9 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/79f0a7b68e2cee5b71ecf46989e29f8d7153fe20 |     
powerpc64le  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/26af6ee906c6e70aa51879bee7baf9c6a082a8f7 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/9e055b67e4abf783ceb9fa085b911c3f17428f0e |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/408b03a04826cc862492113f57335d8fc866ec8e |     
  powerpc    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/3c08f045b65f101403e6caa1e215142410515da6 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/a576e49f808b9c7b22ebfee2f53506cf419d879d |     
   mipsel    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/5ff44fa803b83337da63a26849d525e01654b9f2 |     
    i686     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/745bd31dccd727fae2d30847bdbc2ac18665dc3e |     
  sparc64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/4f2dc1d2629448465df1b15409afa481661b59e8 |     
   nios2     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/cd5de4b07c06a487bb3755ccbfab0961810c3d03 |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/327555f58c7b62087e246cf7752345ccb3426777 |     
  nds32le    |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/5869c94aa10f5b9c9b21d2ec719c5a2aa928f469 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/6ec39e2b79971d6c5bd579bdd3710ad050656822 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c2a5d2e8388d5e46a9427497ffca6a2b6f6f3b22 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/66c3ebf80570e53ec6d8894636a50bd768bead04 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                host-odb-2.4.0 | 1 
                 mesa3d-20.3.5 | 1 
                mono-6.12.0.90 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/fcb93c67bba6c184fe3312a2db3c42a7cba32363 | ORPH
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/ccce59ef8040d803c0794647b9fc418dd424e728 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7cedb29024d1225600c65804f727841eaf512c0d |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/762af73ccc50f6f9f9b21bed012c6c91ce1d5915 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/5766ea0cd3d4b5e6e056733fc29e48ff5884b543 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f7874997fe62467eebebb7a00faf2042c5d7040a |     


Gitlab CI results for 2021-06-26
================================


-- 
http://autobuild.buildroot.net
