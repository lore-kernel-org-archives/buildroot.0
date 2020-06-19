From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Jun 2020 06:51:09 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-18
Message-ID: <20200619065116.3112286EDC@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  |  4  |  0  | 26  |
  2020.05.x  | 23  |  9  |  0  | 32  |
    master   | 103 | 163 |  0  | 266 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 66
                iproute2-5.7.0 | 16
              gnuradio-3.8.1.0 | 12
                 host-icu-67-1 | 10
                  boost-1.73.0 | 8 
                qt5base-5.15.0 | 5 
                 gnutls-3.6.13 | 3 
                  zeromq-4.3.2 | 3 
               belle-sip-4.3.1 | 2 
              bitcoin-0.19.0.1 | 2 
  gobject-introspection-1.64.1 | 2 
          gstreamer1-mm-1.10.0 | 2 
              ibm-sw-tpm2-1563 | 2 
                libselinux-3.0 | 2 
                    mpv-0.29.1 | 2 
                    mraa-2.1.0 | 2 
                  rygel-0.38.3 | 2 
                  umtprd-1.3.6 | 2 
                wayland-1.18.0 | 2 
               apcupsd-3.14.14 | 1 
                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
                 dmalloc-5.5.2 | 1 
                  dnsmasq-2.81 | 1 
             freeswitch-1.10.3 | 1 
                hiawatha-10.10 | 1 
              host-grpc-1.25.0 | 1 
             kismet-2016-07-R1 | 1 
               libupnpp-0.17.2 | 1 
                pipewire-0.2.7 | 1 
               pulseview-0.4.1 | 1 
          python-web2py-2.20.4 | 1 
                     qwt-6.1.4 | 1 
                 rocksdb-6.6.4 | 1 
                 samba4-4.11.9 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/49bfe4555fb46cf973e3b90a18dc4abc0a454166 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/cc87720aac8ec461f69b95e29f7ef6c87a812225 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/aa736ce98b3877bb0822bab4d8ae17b65443e78b | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/82b40c39d5c1fd0be925fe71e96be1fe0224f41b |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/3d3f92f9f19194d7ebe557912fa32570926b2f4c |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/3e018d8674fcdcea55b094de173555ac3446cf61 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/e8e4b5790a77087aeddec9abb16cf8a444df13af |     
  aarch64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/59578945bc7c622d1763f565b90fc4aad7bbe568 |     
powerpc64le  |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/24f5dc5c055d9dec1c05e500e814b42e9130443b |     
    arc      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/08a6d7d40a8831e86d5b9c72b07964bc4e4d4291 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/77abb6044bb1970ad3dc070c331e54b0d354d129 |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/ffd923d5fe6ed98bc3ed6b612cf8a21c2d510a75 |     
  sparc64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/5436fcd69be8427ce11857256808274341d6b6dd |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/014e06144372a6e9e522088e0bda80430dee812b |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/0c4dca9d305d21cb5628fccd0c80917ccd1eb127 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/3bb1ac9d9073e4e840c269064c9be01883fff128 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/6b40d73cc04b00b7078e29764860a0ba52683260 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/9e2024d0639115f04a77f9fcc17872b74eced5d4 |     
   mipsel    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/a026b0a33e19d02f15ac5cd33aa59a989f64c731 |     
   xtensa    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/17b5afee21a6954427d111caa0aaa7a666fe4aa3 |     
   nios2     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/28bfa0480525e5bd661682dfb1307679b7e5beb9 |     
  aarch64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/c8a64b2575a68f3d03a6435de23444cee7ee3343 |     
   nios2     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/307bbd816e1bdaca4c54ade2d1ddd5e111581475 |     
  sparc64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/f1589c11104a15eeb509bffcb41a5d3bb4662ab4 |     
  mips64el   |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/011ececa3605c4df5ab563d3d41ff739ed153b19 |     
 aarch64_be  |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/1e1be93bbde42347591273bbb9d4ad1fe9eb4d19 |     
  sparc64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/d80a1c7d453f3dca2f68336f4bf1f12915a03084 |     
   sparc     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/056a540ba2447ee2fc68bea1e03c27ad4997c10f |     
    arm      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/3d1b271deaf2b78f7dc53368506a8e8e84766c21 |     
   nios2     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/8e96e3633408e583d4391b0d5e7c68edebcb5e56 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/714e5b9381aa60284391f28b26f9d5d3e113373c |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/d12bef12108d5535d7cdb94c7d687c04ff44c67d |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/5bc4d89339a2b3f16eb354fac9f87f77cfe535c1 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/3e26473793566a69e9bca1e90f562a90a5f10cd0 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ab6ff82a0ae8b05f3a1928b81f3fd1af11c7ceb8 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/890078dbbf5c31f63fb58b0f19c2146b531eef0f |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/64d7c908f92d001df91c2b425df148014bd121ba |     
   x86_64    |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/8fbcd7a37ab588fc3b03e62d2f952016a086b7a8 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8c8ef67113844fd46f43c2fefb75f5ac7be3a6e4 |     
  aarch64    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/d2ca4e5126ac3284dbfa52aea6ad74232001e0fe | ORPH
  mips64el   |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/5cb7f6d41d7d91ae1715682ba797bdf2f720a679 | ORPH
   nios2     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/117e13fb92f66fca3ac4107cca59297a99e4decf | ORPH
    m68k     |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/ee7cf59fc65961dabb1a03a07340c58e8cb68568 | ORPH
  powerpc    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/4d2c4c15e096f7f8686af88ceb92d5314be2b82e | ORPH
   mipsel    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/bf896736c9baf56df2768ac06ab42c460b34b1b5 | ORPH
  riscv32    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/b5878a024f562982e960f695c2ce22d3a67512fe | ORPH
powerpc64le  |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/de03d68b43fd020e8a06dac9408281ced0b9fa5c | ORPH
 powerpc64   |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/5bafdd38e0a8c81ea09aae4e17bf2667b8e71009 | ORPH
    arm      |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/8513d1afb8716b455189966d8ca84054c3984fbc | ORPH
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0ac03e932143419fa0f1e59e76b7c2a157ca0de9 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/880365a03792a96cbc0b19e3cfc24afffc1e27fe |     
   xtensa    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/64d05f4d0dbad0e347dca5c957ba2452a820f5fd |     
    arc      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/377d09bb7417ee6f708221bf81c4d865c13e123c |     
    or1k     |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/a08e8c3a48a7395152362864983593b8ec9a5cab |     
  mips64el   |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/eec58014a52fb088514a13feae36021e3bcd2b84 |     
microblazeel |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/2391507d7e269312e36d601de48e934790ea484c |     
    arm      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/775786fcf5a35039a1ff870adf8c53a12e2a5f61 |     
  powerpc    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/c52fd816aedfccc708fbf89d7ded51c87e84ed2d |     
  riscv64    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/841c7ce6673a0f461da119c7b749bd15114b8810 |     
   xtensa    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/82d40a0fa2f54be9772e3bcbf2e247315a0a81da |     
   x86_64    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/08024dd20b174f2e22e641d200f6abd8bd2a9552 |     
   xtensa    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/f59cfd008445ab6f17acd062b9b95bf21a339165 |     
    arm      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/fb12b31dc9b8ae7005ff9cadc0123891da6870a1 |     
    arm      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/0bc92a8a91912308d953c72e916665f0f133caa9 |     
   xtensa    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/67144f7f1fb3dc20f11410eec423d0ebab42ea91 |     
   xtensa    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/08bf3cf0ed481fad6bdfe6678d730a591b2e5b10 |     
    i686     |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/ee1f39180ce74afaf1182de12e9eb7acbf292d20 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/6041d34fa0529ca3a69890e516167f69ecccd6b8 | ORPH
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/e2aa0f16de1ea312da63a2f7e3b2eab0430df24a |     
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/1a0ce83c2803f11384a8719b2bd4cb2187213b20 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/8488720367e058785af9680412d7b05206e4bb8f |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/80c3b7dd4ddb688f487c869eed18bfea79069ec5 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9d9a2639152a5ae6a6eda3c53288bb4dc82bde1c |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/8f30be8b16ef2400e9323020ed8a8d90b46a299e |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/cc0b09736dc4461fb19f1a3ca60ab72d65fd8eb0 |     
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/52f0d44f3364e52a741daabdfbf707d9197e4547 |     
 powerpc64   |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/3f08ab5795d71dde388b0eb5c22d6e66047e8b97 |     
   x86_64    |      python-web2py-2.20.4      | NOK | http://autobuild.buildroot.net/results/b0b35c49535ed5ad24ad4f5402f758e7d210577a |     
  sparc64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/bd5eb58ca2fbce148a0e12978ae6a95ad4b1ed73 |     
powerpc64le  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/a7c0831a919db79c9c94493eadb4044e455d4970 |     
 powerpc64   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/e8598f07b74cadc8fa0bf3b20c29455d566e2059 |     
microblazeel |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c412e2ef74cf4a623f40117b0c8c2d5a6e85fd83 |     
   mipsel    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b70015cb1e374b71d144256c65d329a7490acd35 |     
   mipsel    |           qwt-6.1.4            | NOK | http://autobuild.buildroot.net/results/fdc3b6dd1f6498e9531d42bd0e075cb842038287 | ORPH
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/38180194b7b4d530baaa4d435f0722acceeb3563 |     
    m68k     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/ae675478262f41d4aae51f0d748f1f364a6eddb6 |     
   x86_64    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/8bce11fbd73ab38198b94573db1b39830d960b3e |     
  mips64el   |         samba4-4.11.9          | NOK | http://autobuild.buildroot.net/results/588b939749139cd5b01539664ef8cb246f2ac627 |     
    arm      |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/ce9406fadb4bbe282cb079cdc426ba4ee47df30e |     
  riscv64    |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/23eb2e3eee5391b6be94931fe9adebe4cda19283 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/1c66896d1d25b506b96c56c524f0a51673de8090 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a3c28c5f06832a8255fb14c015ba090151f03443 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/b4334fb5d537dabce392bf61d7df842fbeac5bee |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4d4fef710e1acb828be9f6fd775a74f779b22d83 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5de0085122c634c420bb024f4ad0d254ae0addbe |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/7b5609ae1f13b578fbd172466b38368312362236 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/b8e38288e52587cc950ecea5c5526748589ffd8c |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/deece3689b261e3603526aa37fb4fd13568b20d3 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/35e2a9b6031584900b18530baddf592cf9f6dbd3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3fc46eed02526a345fe70e5d22d0ae8123cbcae5 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/abd061e888aa7f8bbbcd7534019315429e4077dd |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0afc45a8007f880247d11ad651f552296ab436bd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e4019594bc84411b7105ba2188cfdf6a3d90dd90 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e284e562023aad445427867d1bddf327d299e30e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4fe58f7961c02f63fec0658d48b3587429182fd5 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/c225d56c74f0a0e37eac3cb9965ff246313c9b11 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c29c08d0bbd359636ff9149f27bf106867b9becf |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/327825aa34fd3c8351fbed0acc0cb266ade9dff4 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/33ce2b9152cf82256107b2337f799989e3596eff |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/1f2d8aad38e9f921da7c773b381ac34adf9ae1a6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f89aa2031ebdb2483acab064b57bad84bbce0858 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/3138ff14a1b57a3604a4dc846017ef8d9a2dd39d |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/4486bcf732a119b817c0142cbce5193fb0ab3d01 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/04e608d1b0d806cac9b402fa915e06724fbb340a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/14fa2214aa0b5515b31576414c52a177b0e083a4 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/146102cf81d596f62de0be6711d4c25b99d45c35 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/64edc81545ae553bca7a63d4ccccee7aa68727d1 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/68682c140629a441af18659e30b427d4bc3cfa69 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0505bce4794daac24fced8379739166032958bd5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d2140a150ef627c350ff573c32ddbb370b5766b4 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/53b995648157c1547ec07bbcc0cfdafeb231c2d9 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/542ed728d7bf47c75626fccee9c67f4ff3bfd2c3 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/49cada8325df9725372b400ceab2dd320584f2ec |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/9ed76b693902a8f81e111d3a4f290fd36bd6a52f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9a1027392b74093cff40d4ad40272f51a77e3c4c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/94a1fed150ca6743847dfe1c7a33d2d48110653e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/aac98d71f78a28ab303c80d49f7d7cb523f5009f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/1bb595fce114d620adba83ec43f3a93bf28eb454 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3c7911eb41a95f2111b8e36abf9cf9fec53cfb7f |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4dedca32499f2ad0e849fd7e22481259f99be6c9 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/185cc50b9bff37df7d5dc43cf196daf07a2496fc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/306038cbcb52e9e2e94663b45d8da1f9b023b1ee |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/e0823fee0079ced2d96bd281aeaeed9d145c4618 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/eaa5234836d70169a163acec005565c12bba5828 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5529ecea2f339716655c00f5a41cd17dbc614bd7 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/0c0558907aa55f6e6ccef8000d2917ada5b12816 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a6514fe6d31207c2ff0dcedf39990fe4574c06a4 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/be69ab62d5e36ccc1ea3d856d53e8416692101ca |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/9516dd2a72efcafe603e5263dbb62806ceb6d35c |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/4bca507c68b49a4d8fe58fa4aea4be71c59a4d30 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3e1a2427e4ba64593b85f348fc8d36ef7d2461f6 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/889b364ad395814a044c512b76771a0e2fab5e90 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/fe59c2120d22ff85a2704e36b21a67905a51e275 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fc16a13232e19718fe7ef36c4bc40ec0586c514e |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/7aefbfc4e6e97252def58fc0142ad941c3e387c2 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/5d736a81c6a62eae5f890e5f7ed1ce7e5b0618d5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bd6a1bca03b126830314204c7bfb00b94938984d |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/cec5d0e1d62bdbdc9bd25f4caa67496245f637c9 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/42b4b5093a271f796527f1f8323bfa1ad98cc513 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e83c3027c29a59cc158f866801dc29cd5255d2a2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/14e4286a27a30fdd9f845b4401e24e4471665715 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/dc34eeb80fbe150191fa6c1b8b5d19dffb762341 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/44105a53f254c47c9d50196456a19d1a9b6d37b2 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f1334df70871c78c0505c5662d86eb436724e2eb |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/dff5d33d1aa0851af6a34b02c94a3a5d517f98bb |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b51b9e172125e31d170973bacb1053c732849213 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/72f2785dcf337bb3880f3e825ea05fa20b09744c | ORPH
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/41d074784346cd946a82283e5c2a107a0f8dfe38 |     
microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/2585d9750ffb522c55c73a0488db86d65e3fd649 |     
  powerpc    |        wireshark-3.2.4         | NOK | http://autobuild.buildroot.net/results/7efaaee123e2c733573e811427d13bf006ab2cee | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7f8cbd9e359214d58dfdb48d2330b4f3bcaf4cc6 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/837e079784c31252b035f19553a30bc5e5cc680b |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f200cf0507a149918adaa780cc02c5feffe27a15 |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              bitcoin-0.19.0.1 | 1 
             libopenssl-1.1.1g | 1 
                libxslt-1.1.34 | 1 
               log4cplus-2.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f732213f2fc610d9e4df746a868bb7091635c9e5 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/7ab480f877c0dd654a3b69c04ebf74e75c230837 |     
    arm      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/4d41a1d85c0e358bffead106713d54de28d7bd51 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/cd015c8eedd1926c9b2ec925d2dee6198d1620de |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.14.2 | 2 
              bitcoin-0.19.0.1 | 1 
                coreutils-8.32 | 1 
      gst1-plugins-ugly-1.16.2 | 1 
              host-grpc-1.25.0 | 1 
              ibm-sw-tpm2-1563 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/237f36b0e8b562a16eaacec74f9869c3acd355ac |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/11edbef221eb580d31b43e3ec9d00ecaf35dd532 | ORPH
  powerpc    |    gst1-plugins-ugly-1.16.2    | NOK | http://autobuild.buildroot.net/results/00959119239ca37ba18d4789ca14b4df1fc3083b |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/54f3b40240dad370bcc9c36bd30f3f98e549f395 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1ae9e22427809b46a05bd15bb436384b17f93e7a |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/896d9107b66c8f071caca801608c27bb382d2153 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a0519d39f5dd82bbfc7bc3e7ab785e8a22090a5a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c0bc7f8c04c6a8202286cf1cc1bd51fd7b0ac44a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/52aa31a1865cff3fd9f64babb952245f332e8eaf |     



-- 
http://autobuild.buildroot.net
