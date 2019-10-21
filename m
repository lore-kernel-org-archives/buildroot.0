From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 06:17:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-20
Message-ID: <20191021061801.A549185E99@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 29  |  3  |  0  | 32  |
  2019.08.x  | 24  |  3  |  0  | 27  |
    master   | 135 | 171 |  0  | 306 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 52
        host-dbus-python-1.2.8 | 12
               util-linux-2.34 | 12
                    brltty-6.0 | 11
                    bird-2.0.7 | 9 
             subversion-1.9.12 | 9 
           host-libselinux-2.9 | 7 
          host-util-linux-2.34 | 7 
                host-lld-8.0.0 | 5 
              libgeotiff-1.5.1 | 5 
                  boost-1.71.0 | 4 
                  libuv-1.33.0 | 4 
                      icu-64-2 | 3 
             dbus-python-1.2.8 | 2 
                   gqrx-2.11.4 | 2 
                   gvfs-1.31.4 | 2 
                 host-icu-64-2 | 2 
                       kmod-26 | 2 
                libcurl-7.66.0 | 2 
               libupnpp-0.17.1 | 2 
                  ffmpeg-4.2.1 | 1 
              host-grpc-1.23.0 | 1 
                libdrm-2.4.100 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
                  libssh-0.9.0 | 1 
           libwebsockets-3.2.0 | 1 
                mono-6.0.0.313 | 1 
   openvmtools-10.3.5-10430147 | 1 
python-libconfig-b271c3d9da... | 1 
          python-uvloop-0.13.0 | 1 
                qt5base-5.12.5 | 1 
                 ripgrep-0.8.1 | 1 
                rtorrent-0.9.8 | 1 
              sigrok-cli-0.7.0 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/02c7f4def68701f2d014f7f667337a50528f9aa7 |     
   xtensa    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/a4339dc2cd34ede0fffcfc1ed7b019d277144b55 |     
   x86_64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/daad98931b40fec1f3b2e7818b307dd50a9b6227 |     
powerpc64le  |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/cfa0e886c7b14970e9a25cf1b9e4ccf0d209ad4a |     
  powerpc    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/f8a5bff89e69f8ca902cebcb651f126420df3782 |     
  aarch64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/1bfd69cdc0d0ac71a3275506d4b1c4a2b47017e0 |     
microblazeel |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/51895c06d7655b5b8f14541c1b717a8ec83db52d |     
  aarch64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/536e69a974922fd19506e69bfb6d55eddb7d4f7f |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/6e7ff2c96b2ccce8713052277ca6b0ba9a5bf21e |     
  riscv32    |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/81489f92ceb6287a4d6c52b2bb16a80e8c5c430a |     
microblazeel |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/26fda3802b20ec9c8bf944e008d93d3912c6dd6b |     
   xtensa    |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/9c63ae3430f1d6cbc93be34d12ce0422f1aceb59 |     
    or1k     |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/3890d6f44fb041e8b535462211ab26376a4f67c1 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fb41b2267bd718f8a53aab19e6e47f8efc1f32c4 |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/da4ee0f12a1c03b8764e1ab5a6c1c005728b1216 |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c38884ff582705b74de7e71d5eeb11ff4e7854d1 |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/26e4ed23cbdf7f9fd4bcda58a2564cbc328b8f62 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e3257a60ecc5740ae0fefddaa991ba9c214b7e31 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5f2833f7128f61220e79effc9ecd210ffdab9f68 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c4c2998c3af3435a86f1847c03c2fa1ff4936918 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/13f18dbdcdb558d98f874109e075fa53e104aff9 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6f4a0d12178901763e644a393d98415777385f10 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fac27aea2c56dafbfc8237cc614f38a402908e99 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/644084b5906801d543859d5be97083e484a4627b |     
    arc      |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/5a97ec36bd67c31b5fa6a607dbace6320559b544 | ORPH
    arc      |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/8f714322844b75bb181371a14edb2dda3872d34e | ORPH
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/686e4432d0a2ebeb8c87389725e52f2b4f04de24 |     
    arm      |          gqrx-2.11.4           | NOK | http://autobuild.buildroot.net/results/dc41f49c308d8575c13c3f9121fe9617cd965c42 |     
    arm      |          gqrx-2.11.4           | NOK | http://autobuild.buildroot.net/results/8ea9a3d0f0b3eb9479ba8d926b4e368b0f42bf93 |     
    i686     |          gvfs-1.31.4           | NOK | http://autobuild.buildroot.net/results/e1b9e55e458f7dbbcf123dc40998551ae8165701 | ORPH
   sparc     |          gvfs-1.31.4           | NOK | http://autobuild.buildroot.net/results/17f6ec44d12e9f99f12f071cfb367ae0281d2217 | ORPH
  powerpc    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/a1ac729e7cd9e0207cb018be7fde82eaaf089bac | ORPH
    arc      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/ff4cb5c62fb4ffcf7bc5050ef09d9b0119186cd3 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/7fedb0d670b7b421dea7ce162475bd866d4ac931 | ORPH
  aarch64    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/0555991003b215b8dd7d57b1303876c21949bd3f | ORPH
   sparc     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/2e3b763936dded3440fca1e2a5e9539d5da259a3 | ORPH
  nds32le    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/9e42d8a2881e47eee9d604b7bbad3f0ecc6fa538 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/6a05484f1d7e71ed2c3b15d08ae7d58c79163350 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/ea215eb281d8034f2683a0c3a6cd40a78fa40bd9 | ORPH
   mipsel    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/fb77b59521711a4f532240cc7c1028a03a4d7a9b | ORPH
    m68k     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/7a013464cac6027bc0b62dd43e6186915aace2cd | ORPH
    i586     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/9ab96ca7073ad343b7cbdf03efeb603e30385959 | ORPH
    arc      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/10eac2b8879060d1be010eacec2961704542f818 | ORPH
   x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/6798288d4fd2e30815ad39feb6d4164e123f747d |     
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/ce45e0cbc843362cd2775186f6c316d2b4e205cb | ORPH
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/d8726733fc97973bb69ced35561df346b8d6103c | ORPH
  mips64el   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/6d77d2bc3d077b2e6557629d158bb9963086472a |     
    arc      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/87850845818efadf2d0944480631593afe10f653 |     
 powerpc64   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/2a855dce88801c3eddd37178960500ca6486d022 |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/bbf68057f133a7f3c1ad54ba37af27d52b3476ca |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/50c28e0119fb77f09be319a8acefaa73b53b479f |     
   mipsel    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/b90de3c8e459cf035d6ddaf05d64a9b3ec723fdc |     
   xtensa    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/33e70c7ea56b52aed7686e0a03002c4f4c623a0f |     
  aarch64    |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/b08e1d207e8566ec7fcedb4c3efdd8741ed842cd |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/3efe7fa79f26751c89b0507f5f65bd699236faf1 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/5c8e88a3ce7588d0cfe76a4d530251b709da60f4 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/4ba5f91da4fd0cfd7f2a9949a24bca68e5a636d5 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/a4c634f995360dd07c8452dfdde6a1c7a0c28d6e |     
    arc      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/2816ea82616d44a2ec441dec25c36e88ad4acfc3 |     
    arm      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/1843aeb7dc4dcaa44d60725e4c9a3469b84454c4 |     
  aarch64    |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/0ebc6f385b0a83d82f1f02a89ffe9c10a35ad4d8 |     
    i686     |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/62e9c6065c51707a28e7f748fa2bdc6ac61ceda7 |     
    sh4      |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/2b6eae089e5b92105019d7624d3ee13ba4987b99 |     
   mipsel    |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/0b59fddd4135c7619a54399dd8453e747030eb14 |     
  aarch64    |      host-util-linux-2.34      | NOK | http://autobuild.buildroot.net/results/67e4275474a1dd092c31e43177f1f68db1110081 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0009a8f01a92e22adf212ef6e51a14793700fabb | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/65818748ffd324d744a5992c25be6cf9285c6733 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/c1212ea54ece751e153c7c535a682ca2f1aa7e35 | ORPH
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/15e20deaa9d6504897a49352b3d132a619a1dc88 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/d1c831619e34c762980680b29abcc45467ab1246 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/9d6665424692bbb9aafd3242c26f6678352a1430 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/6349347b6a6ba8fb35e55256f98050228e9b556e |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/6632a7b645746f20de6d00193a7379919cafbb1c |     
    i686     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/737db533c16f285a02118ab048e8427d3e35803d |     
   mipsel    |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/39ea611c5fc1fb18531ceab10195250b007d8a2b |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/d02c74c51dc9b6d63b9ab77cc73ddc26540b1f7f |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/4b312a00f1697e3aa791dd33a243ef812f8fd283 |     
  powerpc    |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/a18daf57525cf9c41a9743e8f17e136823e5bacd |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/7df0ea10b98e4f026336c9468bdf3df0d2be2680 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c2dde08e89c74d93e1160488015c347cbc484e05 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c300cbdf7dfb9ee4c12390d9d79bc5eb714e37c3 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c6c2e8c24c801de6b039321341a43c8fa2029ab3 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/52ff32351e03251c0d911b7fd95743ac32615436 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0941da2914d067768343ab1c7ccaf89e6ff2ed33 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6b1764bff7d42b3c6628a60248b83000779aea91 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2851813b9b82d6b55747603b9266890340f321e3 |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cf501d7d6f94e3a2eebc3e114ff4be66cc03623a |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0b6f94924e4f03e68263fc8b83bd7c535ae68cc0 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cc9b9cca7cd3d303ccd9d8e7956d034356edb1d7 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1d8b299fd57428a893539af8bb0aa5b92ee9a7e5 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/21cec6f6ea636697081f0e8b8b14b0bc72c4aa86 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a3419b1af543058a24b407f21861b874c4e9d8e0 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1e4bd207a130e6ce76b890c60fe3e94ae362a0f5 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a15e3b16c914e739590d851122c5f07765d73e9c |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/93180f045ec49e27ea75987c4e60647d984e9a19 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a4bb46d0161db1fc7968d6231a6dc7dfaee33c9a |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f9e103fae22eb034dd601360198b2e9c0e0f95ef |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/402b7950275bfc5de7584046d9237ecea39009ec |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/68e6699946545685ea17a276a5d5bc98ab5c7a2b |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b4f71953efb0a9619ae64294995fa69f1f7fc8a8 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/484fb609acfa85646dc445a8262ab82f208a1b15 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6b6e5679fd9723e1a159fc361a1064be9d01f3bb |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2137c37453227d8a8f7a2b7497bbad0ef495c25a |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8fb6df1cf18879ab82221e3dce1d10e2b998c41c |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a54628a2f87b3ff7d7fc1a7602ee462889373fd1 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/abfd487d0cbb90425c1d659d10c4f721cfed472f |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/888be1a385d47b3d9ea36c8b02c97b063fca0add |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/30eaac59f9e5a9733f5238b2c85a12eac0323859 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/310e94bf53e739c640fd4dbd5577f4f57b30c043 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0a99c9d2590bb9cd2df007f05359b494fae5b84b |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ea91a38c4e4ad22635e2ec870d7fd8e8a269f1ed |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9efdc594d0e94b21d475005f6b24496ee27669e0 |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7e56d47a0e2667a6eff26bff3a57bffd88e287ff |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0091a30984f45625df424c2771732ffcd03b8072 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/074886e8d3678660f8f838a869879ec929264774 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ca8f448ac3f9e8062a3adb2c640242ad4c83f8c7 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6e732fd01b54e0b52fc5e058b0fba2333d064e9d |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1fbdc2edffe37c792cd3b579ae29ffbf7651a49f |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fc91f00949e8d5f0468f96ebfcde0caddb75eb99 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/55435ba74ac959ecfde5d94c1ced2d0c115f1bdc |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/65536fcfb1c4db3d2da2cdf47cc05768f6802c57 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b5a33a2e2931d0b0a3e4ea7c21f75aa411769fea |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/85123a050875526c805e64981da76cd1eff6bd39 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fe165d3548b9fdc6224a1cd1f25f2414365191c6 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d5d566e71e1d9408a97ae9364093e2e1a96ff720 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6c2c5b5f27b1a846464849813ab0549d0e87aa76 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/02a1397af4f469c53cdd6c10f47cef2f5200d6dc |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/29623b15ebcf02a99f62ab6b81a884835cf93c94 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/79ba16f3f5298cc51e4e76edbcdd6387dd12e05e |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1bcff5021bd21a58aec4f56936c9c80dab363cb1 |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/58dd9b023c49a9843190400493338f66ca29b070 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/924a6eb916e5810d38e27f7eb9cc75618fa69f30 |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/6232336ed23c1d23812c213e97224f55d72c9b48 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/f96cadbf3f739895f6fb506b07ba6401e5478991 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/46aec61ecb5c09ae04de01c8f055039db2a96a34 |     
 aarch64_be  |          libuv-1.33.0          | NOK | http://autobuild.buildroot.net/results/9df2daaf6e9dc066609bc47699a07e25d6e7e3b8 |     
  aarch64    |          libuv-1.33.0          | NOK | http://autobuild.buildroot.net/results/85165b69974748d5ded1518b85c5cec269cb925c |     
    arc      |          libuv-1.33.0          | NOK | http://autobuild.buildroot.net/results/659f82fbdb3d44078d642955d34da9ea94c321a0 |     
   nios2     |          libuv-1.33.0          | NOK | http://autobuild.buildroot.net/results/76179bea4539215c33b4998ff0c62f29f1b07dec |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/150689f94123788c89644d3e241280881669986f |     
    arm      |         mono-6.0.0.313         | NOK | http://autobuild.buildroot.net/results/ee3538b943c4a61d4ecfd0e2a4d693b32a14b8b1 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f24dc13c8d4af658d1478185a6ecac46a0e3de97 |     
   x86_64    | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/6b1a46e62d80649c9921998b4077a8ba8fa99d88 |     
  mips64el   |      python-uvloop-0.13.0      | NOK | http://autobuild.buildroot.net/results/59831d1d5759553c169f2f70d5549459413608dd |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/0ab5ca42f2f30bbaed09b122c080235ed194fa7b |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/337281360b5883dbce23dc4cdef92477e54d694e |     
    arm      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/075598e1699c2ac20a4dfbcb5695bbb7343f9a86 | ORPH
  riscv64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/4c001c961d8701f439acc16cb0f79f2e38e514c8 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/eb83cfcbd3214608e71c01e7b3eef19fe94ed8f3 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/bddab11d340cd47e9d54d5ff2e0105b102c2d43d |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8361e0e6be00c6ed662d376ac30c48514a025853 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/da773a9803fb4a65f634493a24359881d271fd6a |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f93f637369086e67090e2649739688602494a9be |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/fe7ed6e3aaa712bce8f4908217cebc604451c82c |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b354abb5b3c23af1a6f0ba9c59de2f8fe340fa3c |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2a29dd42676b3e61fc63c51a4e8ce684460efdf7 |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6f4b0bf1177af76fbdaedb6a35b6164fbf5eff92 |     
  riscv64    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/499cfa6c8dd640f04e0c82cdaa0313e118654837 |     
    mips     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/8b4c40afeb1ba0fda8f11e273a8aeb4394b9e68e |     
  mips64el   |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/ba4a20c3e19c75f67bfcdd40c088cea6b0bdd413 |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/8dab956fb9b04266656dffb69cab041c32a79c86 |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/d237e8e2d7d0f5ab30cf8b8d2779745d44f1044b |     
   nios2     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/3f7e20274cc0599b03f34cd1e8020e648b53fac3 |     
   mipsel    |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/0468c5b61a0938eeae2ad36ed29f9c2b97ff411b |     
    mips     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/70fd5cfc652073082e31a9c83435e384ec6b77e5 |     
    or1k     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/90843a98a8acbd6efc95ad6492100cbb8a84dcaa |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/bf530c4d04a1d624605f6520f0f6ae5bb74498db |     
microblazeel |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/d5719d01acbd737210690fa3f23f1eba07a0f7e0 |     
    i686     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/8b0bd8c79130aa563b4416e4d54e5e191b0a4f80 |     
    mips     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/c0785f9956361d41591cf04cf97f5fe5f523b3d6 |     
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/8c3d85cc8a765f21b78fb51f9d447bf34bf5be75 | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
                    ruby-2.4.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/e9d5084832e9cbba37e17080fc6a846854f88d43 |     
    sh4      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/96ba800c0d09c50f65ae7be72f78d1999e0e94d2 |     
   x86_64    |           ruby-2.4.6           | NOK | http://autobuild.buildroot.net/results/b9e09b9fdc96f1c6ddfea3dabe06694f5ac22778 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 1 
               libupnpp-0.17.1 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/fb9a442fe034841d8edd97d4545c692864cd7720 | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/024fa5206f9984fe824453359a091467e128b092 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/f16c95e882e66a180f4f71061a9aafb8ea9d9698 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20190703     | 20191018     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.4        | 1.1.7        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.0       |     
                       aespipe |  DISTRO  | https://release-monitoring.org/project/21320 | 2.4e         | 2.4f         | ORPH
                       alljoyn |  DISTRO  | https://release-monitoring.org/project/21665 | 16.04.00a    | 16.10.02     |     
                   alljoyn-tcl |  DISTRO  | https://release-monitoring.org/project/21666 | 16.04.00a    | 16.10.02     |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r6    |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.800.1      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 5.0.0        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.5.1       | 16.6.1       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.34.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                        autofs |  DISTRO  | https://release-monitoring.org/project/00140 | 5.1.5        | 5.1.6        |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2019-10-07   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 0.6.0        | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.10      | 9.15.5       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.31.1       | 2.33.1       |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.1        | 3.4.2        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.19.0rc1    |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 1.4.0        | 2.0.0        |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.1.0        | 4.3.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.11.0       | 2.12.1       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.2.2        | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 1.1.3        | 2.0.1        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.111        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.39.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.39.0       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.30       | 1.4.31       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20190315     |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.9.6        | 3.15.4       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                       cppunit |  DISTRO  | https://release-monitoring.org/project/09543 | 1.13.2       | 1.14.0       | ORPH
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.1        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.8        | 1.2.12       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9          | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.1.1        |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 18.09.9      | 19.03.4      |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.20.1       | 1.25.0-rc2   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.6        | 1.3.0        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 18.09.9      | 19.03.4      |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.7.2      | 2.3.8        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.7.2      | 0.5.8        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.14       | 1.8.16       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.2.0        | 9.11.0       |     
                         dstat |  DISTRO  | https://release-monitoring.org/project/00630 | 0.7.3        | 0.7.4        | ORPH
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | v18.32       | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/16911 | 1.5.0        | 1.5.1        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.1       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.09.1      |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.20         | 0.24         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.1.3       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.8        | 1.0.12       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.4.2        | 3.8.0        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.16       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.3        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.26       | 1.0.30       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.14       | 1.0.17       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.25       | 1.0.29       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.0.25       | 1.1.2        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.13       | 1.0.16       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.34       | 1.1.37       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.2        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.21       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/14689 | 1.12.0       | 1.13.0       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | v0.5.5       | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 3.2.13       | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 5.3.0        | 6.0.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.11.2       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.3.2        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.28.1       | 3.34.0       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/08735 | 2.2.0        | 2.2.2        |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.22.0       | 2.24.0-rc0   |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.63.1       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.6      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.3.5        | 0.4.0        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.7        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.7.13.3     | 3.8.0.0      |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.9        | 3.6.10       |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.1       | 1.13.3       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.11.4       | 2.11.5       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.5        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.23.0       | 1.24.2       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
               gst-plugins-bad |  GUESS   | https://release-monitoring.org/project/21849 | 0.10.23      | 1.16.1       | ORPH
              gst-plugins-base |  GUESS   | https://release-monitoring.org/project/21850 | 0.10.36      | 1.16.1       | ORPH
              gst-plugins-good |  GUESS   | https://release-monitoring.org/project/21852 | 0.10.31      | 1.16.1       | ORPH
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.1       | ORPH
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.1       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.8.0        | 1.10.0       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.4.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.43.1       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.0.5        | 2.0.7        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.2        | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.8       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.328        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.7       | 2.1.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.24.0       | 2.28.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 64-2         | 65-1         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.8-68     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 18.4.1       | 19.3.3       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 18.4.0       | 19.3.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 18.4.0       | 19.3.0       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_487        | 3.487        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.2          | 7.3          | ORPH
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.5.0        | 1.6.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.18         | 0.21         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.18         | 0.22         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.12       | 1.9.13       |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.10         | 0.11         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.7.3        | 0.7.4        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.2        | 2.0.3        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.19       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-09-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.4-Leia    |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.3.4        | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 2.5.6-Kry... | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 3.4.5v2-K... | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 2.4.14-Kr... | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 1.4.8-Kry... | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 2.4.7-Kry... | 4.1.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 2.4.14-Kr... | 4.6.1-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 2.4.19v2-... | 4.2.0-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 2.4.13-Kr... | 4.2.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 2.4.3-Kry... | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 1.4.7-Kry... | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 2.8.6-Kry... | 4.1.1-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 3.6.10-Kr... | 5.2.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 2.4.12-Kr... | 4.9.3-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 1.4.9v2-K... | 3.2.1-Matrix |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 1.3.0        | 1.4.0        |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                       leveldb |  DISTRO  | https://release-monitoring.org/project/09338 | 1.20         | 1.22         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                        libcgi |  DISTRO  | https://release-monitoring.org/project/21164 | 1.1          | 1.3.0        | ORPH
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.0        | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20190324-3.1 |     
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.7.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.0       | 2.63.0       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.22.30      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 232          | 233          |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.6        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.14.0       | 1.14.2       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                 libmicrohttpd |  DISTRO  | https://release-monitoring.org/project/01658 | 0.9.66       | 0.9.67       |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.3        | 1.1.4        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/07953 | 4.22         | 4.23         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.46.1       | 3.47         |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 2.9.2        | 3.0.2        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.46.2       |     
                      librsync |  DISTRO  | https://release-monitoring.org/project/06309 | 2.1.0        | 2.2.1        |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.19.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20190315     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20190315     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.68.2       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.0        | 1.9.1        |     
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/15633 | 0.9.2        | 0.9.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                    libtommath |  DISTRO  | https://release-monitoring.org/project/15565 | 1.1.0        | 1.2.0-rc2    |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.8.4        |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.16.6       | 1.18.0       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.5.0        | 2.6.0.pre1   |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.5.0        | 2.6.0.pre1   |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.4.0        | 1.4.0.1      |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.4        | 0.9.1        |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/03531 | 2.44         | 2.46         |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.04      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
             linuxconsoletools |  DISTRO  | https://release-monitoring.org/project/01827 | 1.6.1        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2019.10.20   | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.10.5       | 2.11.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.10.11      | 2.11.0       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.10.8       | 2.11.0       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                        luajit |  DISTRO  | https://release-monitoring.org/project/06444 | 2.0.5        | 2.1.0-beta3  |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.30.1-0     | 1.30.1-1     |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.183     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.1.0        | 3.2.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.18      | 10.4.8       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | v153         | 164          |     
                       memtool |  DISTRO  | https://release-monitoring.org/project/21747 | 2016.10.0    | 2018.03.0    |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.34.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.8.2        | 2.9.0        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190116     | 20190618     | ORPH
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.3.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.4.0.198    |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.1        | 2.4.2        |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.1.1        | 3.2.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.4        | 1.1.5        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.4          | 4.5          | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.14         | 1.14.1       |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20191019 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.3        | 1.0.4        | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.203        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.20      | 0.52.21      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.0        | 0.9.2        |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                         ngrep |  DISTRO  | https://release-monitoring.org/project/02084 | 1_47         | 1.47         |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 10.16.3      | 12.12.0      |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                 nss-pam-ldapd |  DISTRO  | https://release-monitoring.org/project/21868 | 0.9.8        | 0.9.11       |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.12       | 2.0.13       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.129      |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          olsr |  DISTRO  | https://release-monitoring.org/project/21543 | 0.9.6.1      | 0.9.8        | ORPH
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.2.2        | 4.2.3        |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.2        | ORPH
                       openpgm |  DISTRO  | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.0       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.5.0        | 3.7.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.5.0        | 3.7.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.5.0        | 3.7.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.5.0        | 3.7.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.18       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.29       | 0.4.30       |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.18.1    | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/21376 | 1.0.1        | 1.1          |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.2          | 3.3          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.28.2       | 5.31.5       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.01         | 6.06         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.55         | 0.57         |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.22         | 8.25         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/10665 | 2.000008     | 2.001003     |     
                perl-sub-quote |  DISTRO  | https://release-monitoring.org/project/12678 | 2.006003     | 2.006006     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0201       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.4        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.4        |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20190315     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.77.0       | 0.81.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6        | 1.3.7rc2     |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.2       | 0.11.3       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | v5.1.0       | 5.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.9          | 1.10         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.5.4        | 4.0.0a1      |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.1.0        | 1.2.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.1.0        | 8.2.1        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.3.0       |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 19.10.1      |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.7          | 2.8          |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 2.2.6        | 3.0b1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 3.5.1        | 4.1.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.0.2        | 1.1.1        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.0        | 2.4.1        |     
                   python-flup |  DISTRO  | https://release-monitoring.org/project/03872 | 1.0.3.dev... | 1.0.3        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/20876 | 0.3.1        | 1.0.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.1.1        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 19.2.0       |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.1.1        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.17.3       |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev4   |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.3.1        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 1.4.0        | 2.3.0rc1     |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.2       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.13.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.77         |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.27       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.21.0       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 1.1          | 2019.9       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                python-scapy3k |  DISTRO  | https://release-monitoring.org/project/21599 | v0.18        | 0.32         |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.4.0       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/21612 | 3.2          | 3.4          |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.0        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.1        | 1.2.2        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.3.0        | 1.4.0a11     |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.4.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 3.1.1.1      | 4.1.0        | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.2.0        | 7.3.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 8.4.0        | 9.0.2        |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.13.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.13.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.1-beta.1 |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0        | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190201   | 2.20190609   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20190315     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.8        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.9.1        | 1.10.4       | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 11.0.2       |     
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 5            | 6.7          |     
                  rpi-firmware |  DISTRO  | https://release-monitoring.org/project/21744 | 1.20190819   | 1.20190925   |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.22.0       | 8.1910.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.6.5        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc8    | 1.0.0-rc9    |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.2       |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 03032018     | 30122018     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.10.9       | 4.11.1       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.0.5        | 3.1.1        |     
                        screen |  DISTRO  | https://release-monitoring.org/project/04772 | 4.6.2        | 4.7.0        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 3.5          | 4.0          |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.2.4        | 3.3.2        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.14         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.1          | 4.2          |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.14.1     | 2.9.15       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | v4.28-966... | 4.30-9700... |     
                       solarus |  DISTRO  | https://release-monitoring.org/project/21319 | 1.6.0        | 1.6.2        |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.5.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.1        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.9.12       | 1.12.2       |     
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 3.1.4        | 4.1.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.0        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2019.04      | 2019.11-rc1  |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.4       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.1.7       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 241          | 243          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.90         | 2.96         |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                           tar |  DISTRO  | https://release-monitoring.org/project/04939 | 1.29         | 1.32         | ORPH
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.12.0       | 0.13.0       | ORPH
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.0          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.0.3        | 2.2.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 3.1.4        | 4.0          |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.1.2        | 0.2.0_rc1    |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.1        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                       twolame |  DISTRO  | https://release-monitoring.org/project/12524 | 0.3.13       | 0.4.0        | ORPH
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2019.07      | 2019.10      |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.8.2        | 5.8.3        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.11      |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.46.3       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.1          | 0.2          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.1929     | 8.1.2197     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.59.0       | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.1       | 2.27.1       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 6.0.1        | 7.0.0        |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.0        | 5.5.2        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.2        | 4.18         |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.0.5        | 3.1.0        | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.1       | 2.27.1       |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191020-... |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.12       | 1.4.13       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.27         | 2.28         |     
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/05193 | 1.3.14       | 1.3.15       | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.4          | 3.5          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.9        | 0.2.11       |     
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.1        | 0.7.2        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.1       |     

-- 
http://autobuild.buildroot.net
