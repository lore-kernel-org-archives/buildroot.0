From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 06 Feb 2021 08:16:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-05
Message-ID: <20210206081651.795A020360@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 36  |  4  |  0  | 40  |
  2020.11.x  | 25  |  1  |  0  | 26  |
    master   | 158 | 132 |  2  | 292 |

Classification of failures by reason for master
-----------------------------------------------

              netopeer2-1.1.53 | 15
                  dhcpcd-9.4.0 | 13
             libopenssl-1.1.1i | 10
                    mpd-0.22.3 | 8 
                  perl-gd-2.73 | 8 
                 pixman-0.40.0 | 6 
                       unknown | 6 
                libselinux-3.1 | 5 
  gobject-introspection-1.64.1 | 4 
                  monkey-1.6.9 | 4 
        host-sentry-cli-1.57.0 | 3 
              iputils-20210202 | 3 
             kismet-2020-12-R3 | 3 
          libmicrohttpd-0.9.72 | 3 
             libopenh264-2.1.1 | 3 
                    brltty-6.3 | 2 
               capnproto-0.8.0 | 2 
                elfutils-0.181 | 2 
          gstreamer1-mm-1.10.0 | 2 
                 mesa3d-20.3.4 | 2 
              micropython-1.13 | 2 
                mono-6.12.0.90 | 2 
                openblas-0.3.9 | 2 
                rocksdb-6.13.3 | 2 
                  zeromq-4.3.4 | 2 
                apparmor-3.0.0 | 1 
             babeltrace2-2.0.3 | 1 
                 dc3dd-7.2.641 | 1 
                directfb-1.7.7 | 1 
       docker-containerd-1.4.3 | 1 
               domoticz-2020.1 | 1 
                     efivar-37 | 1 
              fstrcmp-0.7.D001 | 1 
                   guile-3.0.4 | 1 
             host-cairo-1.16.0 | 1 
                     host-mono | 1 
                 libgeos-3.9.0 | 1 
make: *** wait: No child pr... | 1 
            makedumpfile-1.6.8 | 1 
                  ndisc6-1.0.4 | 1 
                    ne10-1.2.1 | 1 
                   python-lxml | 1 
                    qemu-5.2.0 | 1 
            quickjs-2020-11-08 | 1 
             util-linux-2.36.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/66cb04e8d89e5fba2bdc58df6dd888c74ae7d7e5 |     
   sparc     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/1dc96300346e7e7e83eda666925f5f47f807cf81 |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/0d4f7dd7befc162af50b0ac7612c4ada85a63379 |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/a099a1bc11658d42416794c10815ba3aad6213ac |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/03c26f1d583d4aab6b79a7d05d965706980ca06a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6c73a7e43c62ea01b11e0352469ec7c3e778095e |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2ac2fda1b5a439089723e0da79410823f8835dba | ORPH
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/b6e109eb2713ed4c4e2af63b406c999a79a0df8a |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/db3a3889d588e2e702579d380d7d8bb99acf6361 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/98b8dce4076bba5bbefea71b52271cb831d26faa |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/ae8087f30063f89861e3099f57f5c0acb09d2f96 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/05051d968c28d55eda7e93ee165daab04a1f0cf5 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/2353ca02bdedab598389e4d2987127e7eff29aa0 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/e7591665ece1987b4ce6d15b7bc30bf12c44182b |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/d511018a7f118e2cd756c0a6a4c2d23863200ca3 |     
    or1k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/a53319bea8972e09f703317b6b02c0c648849f58 |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/da7f7a4ec58222cd32b768140ab821852afa9f57 |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/59f0f94490e22108ada7b589d003b4e23c37090d |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/25f41b2c96f1f978a930e168594296c6900081f9 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/7cf8d6217c2fb764d7ceed00ff16271b40d4bdf9 |     
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/a389f658b7531f88441b75df93be40e0349cbf3b | ORPH
    i586     |    docker-containerd-1.4.3     | NOK | http://autobuild.buildroot.net/results/3671d9ea0ac33f044086cae598acefbec4dad17f |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/bd5c3202b8ef18be8060be975966d97683b3016b |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/6bd267be68614a1f70d1593ff6357d9223dcc737 |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/202f170232389afcfb576fecf488867bf35b0941 | ORPH
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/61e36b22a12f902ea2849baa6bb6366233bfa1d0 | ORPH
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/04c513bb55d04fc037afcc6a158b947b7c454f09 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/222ec96a4b2a58b07d6141a714f6d25948f43033 | ORPH
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/e840dcd30b8fa2d0b4ae71acd3bf8ab1f555afc1 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9d55d0af6dc3c0e7a1881e1e1ab65956c23bf901 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/503e6ee1933b6196ce7fdefdd5da21ee88710838 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1749bc0029449d7a4878c677d0906e55ad660666 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/3a176a82157d69acd02c7177a8d08dbb2f34c4e0 | ORPH
   sparc     |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/b944ab39d20b3b6e6f5136e142f9d5c8ebc3c883 | ORPH
    i586     |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/2a83e34bd7a01060d39dbc77d33164358f0e6655 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/87e7c91ba54f7c0eb7be652e92ad83414be31a93 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1bd202f4a912b9a6f049b17027594943ef960058 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/732ad415abcd01235bfa836bcb10806a177f7387 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7f3f677d99f86d19abcd66be84307586b4e706e6 |     
    i686     |        iputils-20210202        | NOK | http://autobuild.buildroot.net/results/3d142a705f07d496b1342e04094cd03ce7d92994 |     
   xtensa    |        iputils-20210202        | NOK | http://autobuild.buildroot.net/results/dae643b2d23d74b5f91225d00e85c350861a0e8a |     
  mips64el   |        iputils-20210202        | NOK | http://autobuild.buildroot.net/results/dcfcb082bc188e7f990e280c3fd5d971f32cc048 |     
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/f35c33b089c55233e192b9a231b388a594d4ecb1 | ORPH
    arm      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/ba82b5eb7d514b49fa97612636adf2830b4755cf | ORPH
    i586     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/016c4ab67b3a14d3ef68643a5730bb49d26eee7f | ORPH
microblazeel |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/22bd811d4e5ab9f0e7e120b050e89acd170771e0 | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/a540c24814808973555cac31796e0ab2d6013f25 |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/19e76ff3a5ceabece21abf5ec0f2b7d89d6d9bb0 |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/a6fb890bd487cca6a5f3eee2fcd727db94e73b7a |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/4a86d68395ee1d3442fea03ce53340bcd495d968 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/745242a5948308745f6c9ce7dc193f4cec567061 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/5da455e403b955785dc04277ca781bb778f220ad |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/7bc210253569709439bfbbe0dddb89e394621422 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/6f56ca60178c36a9be1df5a449c89d369caf4bc3 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/3a9ea978597a66e4e2064b8a91f4016da7540a51 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/f08b24335c4cb46a75517a129e402b235b4b8fbd |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/8ae22a2a71e3ef570a55d8e332f245a91c966bc7 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/b6d1a6ed52af12cb7def76188c9b2cba0e920f82 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/4dc73ffd829ea6741c70c1027caaebbd345fa48c |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/7e232ab7db9f92ccb84891e397a1308924d679e3 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/9d36f8b24a406a24a10c7d96b42b838fbb08f6dc |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/9f38f01c1d09808f0923722b4759d1fbb38211f7 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/6dc6ffeb8711c8cf559e9b290a011a3382b86e57 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/986dfbf77960dbe8c37cca5d6de769187eec4bd3 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/338014769268e9ba34a859b595389df0d23002c8 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/ed34376d9079985854fc77d446d31a7f91c198d3 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/129e74033a349a34062bf3b36cd7a41ba539b927 |     
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/b18574db11d26dc51e79a924bfbb703aeb2c84ac |     
  sparc64    |       makedumpfile-1.6.8       | NOK | http://autobuild.buildroot.net/results/501112198b0a2579390ef4b9508bc3267a9076f9 |     
    m68k     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/8ceb563309beece73f4ba1f0f373866abfb66bdd |     
    mips     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/e506272508228b97890830d2dbe2bad624f97cdc |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/c21a810fce2fbaaa53c8b401bd5e9a572cfe5ff0 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/d9ce89080f5671d74dcbcc1cd4b48a7a17e785cd |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/a567bff39a784aa8f95bb6edc62905ccca6721c6 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/594ca42512e909a4cbc415c580a627bed0a9552c | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/91306b1c1be7d8f208a4f3ca0c5c0ca468ee8ff9 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/5444161598d452f8e260cb160e19e48ded135427 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/fdc125f6686cf51b5eaf652059b61fc4867b2c4d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1f2f6673cb161257bd230ac1c21fc9e6deae1273 |     
   s390x     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d70267d58fcca2e10ccd4c40f0ea3151bf608a26 |     
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/129c6d371367c4f3e4e3a48a9bcf495fb5b04844 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/09519be9b7dc3e7e0520ad35381fd04113892ff1 |     
    or1k     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/3c976a6307e547672e61b2b863223d48c13614c8 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4158544d1a1ed6bd0064b3c04395fd3a41391885 |     
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/81e48392a4faddec1d0abbe5fc224ad514e3dc64 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d03848e0a3fcbdd3d3bc2b24a26a31eae6279ff9 |     
   s390x     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d65c6428716934a674b42a2498e2254a32aaf657 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/fffde3a925d29934aa32c14193713e49d3971a3a | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/e0dfdd05a7fee6e593654bdaf7099eed2858eed3 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/6e559c4f98b7ed93d7b5af638264e907492a6532 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/d4ac78e108ea5272c5d71fd4269a2700b1043634 |     
   xtensa    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/23301d063a81e4f99f6c2007d700f5882dcb9428 |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/fed37d2778bafead0915910f772cafe1246255fb |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/8ae9c0a86175b711df28d76ea83950f936192e79 |     
   xtensa    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c8eb8f9218ee6e4421e12b2709a7cf8b7d756083 |     
   sparc     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/513a1ae586a7c2a1d52841b6b1e6491c1f9506ea |     
  riscv64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/18b61d193956b2acb56a11c7be29e09c55a8ccc1 |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/1e185a58edfd8720b44efca17853a53ce555cb3c |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/4b51d64b4466f35e4101ca8383b8c14eebb13cd1 |     
   mipsel    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/8c16f0b848be1b02396005711a0ccded0745472b |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/93ef7f9f848cf79e66b4ad00a563f76c9ffdc70a |     
    i686     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/312a32b5f8a474b1eb0ea3266972eac8ddf38de8 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/76ff3ba13fc93c0b323554e31ea1eaad50cc8a76 |     
    m68k     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/3f3c660b9dd52249dd4c435f68e3c1126c094537 |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/0d03262b3ecf3eb8d76a63ad00e90ab1bf3ffe16 | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/586ce47c3f438f61b793f69d0dcca6898832e5c7 | ORPH
  powerpc    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/90f2291d06c84ccf84cfe2a9c20ac0ea3131a085 |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/92357f344ad9c676aefc7552d7d890f05ad2c15e |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/c5d5726fed1f7cdc75a84e720fa1421325626354 |     
    mips     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/13ee97ba2244beb96d71dc7829956a6233d90e02 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/2a1f46596970edef428cfd8464d6fbfc70f49a19 |     
 powerpc64   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/8194c479c155826308e26bddf33ef65acb091c9b |     
   nios2     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/a8c63fe93972d7886218ff7c517ecaa9c662b185 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/110e50a961a6e8c23d7b8746a30cc0309d146da4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9f9e4dab728fb2c00387d0b3a1aaf387a18a3e80 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b5626e21e905f6031f66853b6a4bbd0a28774cdf |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/78f3b547f248f4491e9592731038742dd9a77ca1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e1a81c8adade51f2212c564f3a2b7ce75b14dbcf |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2edd6d165ac59b9fa48bb8cdf88af3aa29acd0d3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/25757b37bd19fdc3eca8930ccd74245be712a7de |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/d3960ee6a8d1cf8359c4bcfc2967a0d12239bec5 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/9836435c836c59bb7eabeefd265c78c5902d5db1 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/0b85f6d6c885d7a51da3f0563897efab72c4f985 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d13bf4ca154f0946e91d371444e0fb9cd1dc808b |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/1ae156ca9b84d99ff91075b75eb47e42ce04971f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cc4a76c4678817bd4607e5793d87c811a94df60b |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d80a92a1e863d6665eba930063f57ac3e9f7ac7d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ae4714a091b52b343af5f24e15ad440979aaa6c8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6ce2ca40a288a3502124da72e7bda5d27979fabd |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/48da788efd829153ad70031677d49e46c959d87d |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/b7d5dbefd4cdd6358a7738fa83a5044168b12c58 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/27f8f0e20c9a94d2b333e42b3406799116de2494 | ORPH
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a75b96dc36f23d830bcfbfcb9465aeea1af0e313 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/72c05b7840fcd5fe7a9281c0e3466cf8329b2301 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                qt5base-5.12.8 | 2 
                 augeas-1.12.0 | 1 
               protobuf-3.11.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/b2acf0c206fbb6c65911babbb0ed4131627fd3b8 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/96e19c842a829d22441a7cf09cc9703a96c68e7b |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/5b6aa5865153fda1677142ee3a73ca49f36f7f2c |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/888f7fc89af4ac4b428f316ea61caaac746c9d6a |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8fb8670abb648f6ff89031f6505693e65cebbfa8 |     


Gitlab CI results for 2021-02-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1006924805  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1006924806  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1006924823  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1006924831  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1006925166  |      



-- 
http://autobuild.buildroot.net
