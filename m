From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Feb 2020 07:18:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-11
Message-ID: <20200212071847.80F9385D5C@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  0  |  0  | 15  |
  2019.11.x  | 14  |  4  |  0  | 18  |
    master   | 89  | 83  |  0  | 172 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

host-sdbusplus-4212292bcf13... | 14
               libglib2-2.62.4 | 7 
                   erlang-22.2 | 6 
                apr-util-1.6.1 | 5 
                 mesa3d-19.3.3 | 5 
                    brltty-6.0 | 3 
              host-grpc-1.25.0 | 3 
        host-gutenprint-5.2.14 | 3 
                libgdiplus-5.6 | 3 
                    parted-3.3 | 3 
                 rocksdb-6.6.4 | 3 
                      bash-5.0 | 2 
                   mimic-1.1.0 | 2 
                 opencv3-3.4.9 | 2 
               acpica-20191018 | 1 
                  cairo-1.16.0 | 1 
              gnuradio-3.8.0.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
           host-doxygen-1.8.17 | 1 
           host-nodejs-12.14.1 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
            ibrdtn-tools-1.0.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libcdio-2.1.0 | 1 
                   libnss-3.50 | 1 
                     lxc-3.2.1 | 1 
               mongodb-r4.0.12 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.11.0 | 1 
                  ramsmp-3.5.0 | 1 
                 ripgrep-0.8.1 | 1 
                   sdl2-2.0.10 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/28f70ebfebd7f12c2e91f586be992a9c763fdfd6 |     
 powerpc64   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/3f9cf3a0a9fc99cb867809009dcc574ed2cf71d1 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/cec1e99748a4c8cdbd5652aae567863ed8d624da |     
   sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/0ef3d870df44f9f37bb917e46e9767485368e25c |     
microblazeel |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/ba15497a1028e18282ba6ada626be43894efa183 |     
  riscv64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/5d24e62521c43439c903e503f5209bcf2dbee671 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/87b6887b41e2d771680e38bc1d3ad39e82a10b5a | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/a83038fca85e96b67cb361aa91213a24a88feda8 | ORPH
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d9d34346919ef4963baabd946be967edc6dad268 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/26f32bdd010c9d0167af9a8b2a2d173582deac78 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c454aed3a38bace8c2111de0b55a0d9d97f24a0f |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/0f604462ea19687c042197d21c67cf6ff1e3873e |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/59aa02d0aebd55fa88f7c2469ec4ebf7379283ec |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/1d19bcc6acca56de9a859a898bca5692416f859d |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/c933eeafd691e488cf7e3999e4ac37a349b49d5e |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/e92a313b7c6ab26bcc36dbf75df3266e2e0ed723 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/5cedcb694568610798e5b02041aef5a1228bf1fd |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/af50a6541ce6c590c2388b7ffb940d811500b1a7 |     
   x86_64    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/2720e23dbc6ed270c5c688db6dbab35c77140173 |     
  aarch64    |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/7e37a641041fd9ddf3ce89444421da46cc39909b |     
  riscv64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/3ac78c5d4728287bafdfeb3a54f50eb193934b63 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c0d89b5e90761d008507e7460cc661cc788b18d1 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/40a8c997197c7c37fbc1b8ab4aaab0d6fb20e969 |     
    i586     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/76d41f9435d0bc610831c83aa1c4f97b86321895 |     
   mipsel    |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/e825654edd95fb7f5390ee49bde429e13a7849af | ORPH
    or1k     |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/2a20fb9804d9326bd236cb4cba6e77786603aa11 | ORPH
    arm      |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/8ee90b69d51b8bd915efad2a7481aacf6af6e36b | ORPH
  aarch64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/7be7346072a0ddfb6ba66eee737a429e60227b4a |     
   mipsel    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/120e44f440bbe1e8e52c7ec6060ac7b5cb166cdc |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/60e37622e5bdd05d391e1831d649c79c3d9f476e |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/aeaa5c6e7c613ff19b5212febe3ad587d78532ea |     
microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/42b0bb2cf3787dce4503d4de79fd8dbb3678ca6a |     
   x86_64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/7c75fa9df1b15a4ce5412bb8c1f34b9de88c0448 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/e39ee25af74b16ed62374c0213f8f4f7792789f0 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/f91e690e4060f4c6fce13ebb9683650d570426ad |     
    sh4      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/ef5179bdf8000a69ff778ea843a19104b4980559 |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/b357bb035596589c95031cd1abf1e523d5106155 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/1f6ed86669848f0a9f7d134cca3fb5c0cdf26e6d |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/e472693aa8f6f459787b312a1780eb6ecd18ab83 |     
  nds32le    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/f16da1f8d76146d3b94f3ca5c8402963646ba20d |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/097d6b51802e8317a190bb6348ec70688adedce9 |     
  riscv32    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/0dd3dc623cd0a30d455b554f68655d0cfbd99245 |     
powerpc64le  |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/622966d194b7620f9fb386a904591a1ac63cfbdc |     
    m68k     |       ibrdtn-tools-1.0.1       | NOK | http://autobuild.buildroot.net/results/4c066eacef7658c7b9310b680d2cdf854cfe1250 | ORPH
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/05dd1cdacfb882c80b1ee836f487c2afc4c5810d |     
   xtensa    |         libcdio-2.1.0          | NOK | http://autobuild.buildroot.net/results/fe6c8a07c1dacc011cfda27a6cb72d806a008ac9 |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/6ddc48d9364ab866be14d6a7639ca34694e07f40 |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/d50a545c7b29bdbe0d011b4bafb6f7f7aa011a71 |     
 powerpc64   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/181f3c18bf348a697b7b8e9438d5f54864682b81 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/072b14ae0960671ac9a880147ba35fcca28ef7f3 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/3d69941ef0bc4744eba355b7acfa9487f13dd349 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/c327857ca13317b5d0b46aa455576a8e386b8531 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/cfa435ea4f7b1feeba42f2c952d4967a57aeedb5 |     
   xtensa    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/6b73b2f5791fffaf02a6d324b3dd1a1850767d0d |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/cd89815551033c6a0660689ff9eff70a5c0fe145 |     
    i686     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/388f45be51a8b19d68baa7afd0f307deaefe827f |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/f71ff9192fe478492c37d6bd863cb931b9bd299b |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/9777dd1af83928612ccc81634c9feffc9e0abb4a |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/d1e72d30b55d6955764b0397c00aa3be3255d412 |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/ead4ea40b1ebba9059bd342ebbc696f93b4b24da |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/1749a7614d05a639c88310b451b863ec1a8cb446 |     
   nios2     |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/3a2504a5e7e21fcff434eb69e95cdb985cabd9da |     
 aarch64_be  |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/37591a70de6b173a3a86d0922fe4f59ee693770a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c1ba735e46bad840b83171ec9968e022e41c8e32 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/08bb7d42a29e1dc10ecaa07016e87fb8a0b8a2e7 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/c78f38f8354ce0f23f6f7d901b35b1721ef0e2d2 |     
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/9162b29725f8d9b891eb74fcb8078f211140a841 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/823a791bcd27fa7e9d3f946bfbb89d89ed6b2672 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e3b77240c1b251a2e88a3bfb05cf7a19ce5c5819 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/23c4e22b122e04e336147006e248ca982b8bcbdf |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/1b9242c052769e270b34da36db74a523ca57e701 |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/abcece63e72aef69016b86c775e76167756fa877 |     
microblazeel |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/4b2439fc3fb19b9f41a67fab145346130aa42c34 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/8ebe15aa02330c675ebcde5c8a7e7ba4541c0604 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/d54daa5f7ea8531e90d42807dc07d402257f5410 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/2bcf08ec5067b33941c14b681b4c9ccc0957eb4f |     
microblazeel |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/65f0274d6a5f75119451f9a779220872e1d45883 |     
   nios2     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/64624d7806f0a034d568a955e6cce6efafd4bae0 |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/41845dc5d359a38aae0eda8298be427e6d9939e1 |     
    arm      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/4f746dd80d9d194c924a94ceab176763518cac7a |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3bf97961b27b1bab9530369a30ef3d2d5bad6c59 | ORPH
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/7ce7cbc35c6488643706e634c42c846438595737 |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/db9a40a60e55790d6e6623bb20ad6adbe705dcbd |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 2 
                  gmpc-11.8.16 | 1 
                qt5base-5.12.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/ec584ef52c783fb0533694e3208858edbcc323e7 | ORPH
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/3716b508213ef999c2eeef9068689d8c17f02579 |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/a185aaa1bc802ac9b799c632082c78fa6d66100d |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/a8e16f4d7a68f52a07ab466857d13d1024ab920e |     



-- 
http://autobuild.buildroot.net
