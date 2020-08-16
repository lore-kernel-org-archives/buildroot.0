From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 07:53:05 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-15
Message-ID: <20200816075311.1D3AC860AD@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 23  |  4  |  0  | 27  |
  2020.05.x  | 14  |  2  |  0  | 16  |
    master   | 123 | 69  |  0  | 192 |
     next    | 32  | 24  |  0  | 56  |

Classification of failures by reason for master
-----------------------------------------------

dvb-apps-3d43b280298c39a67d... | 10
              keepalived-2.1.4 | 10
                qt5base-5.15.0 | 5 
                     avahi-0.8 | 3 
                      tio-1.32 | 3 
                       unknown | 3 
               apcupsd-3.14.14 | 2 
             drbd-utils-9.12.0 | 2 
  gobject-introspection-1.64.1 | 2 
              host-grpc-1.30.2 | 2 
               libglib2-2.64.4 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                  assimp-5.0.1 | 1 
               belle-sip-4.3.1 | 1 
                    bird-2.0.7 | 1 
              bluez-alsa-2.1.0 | 1 
               collectd-5.11.0 | 1 
                coreutils-8.32 | 1 
               domoticz-2020.1 | 1 
                   eigen-3.3.7 | 1 
   gdb-arc-2020.03-release-gdb | 1 
                 gerbera-1.4.0 | 1 
              gr-osmosdr-0.2.0 | 1 
             host-pango-1.44.6 | 1 
             kismet-2016-07-R1 | 1 
                   libnss-3.55 | 1 
           libxkbcommon-0.10.0 | 1 
                  luajit-2.1.2 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.20.1 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
               pulseview-0.4.1 | 1 
                rocksdb-6.10.1 | 1 
       shadowsocks-libev-3.3.3 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/a01b0fd21f427c7eef5d705b597da76c79b65c56 | ORPH
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4c008faf9e8f3c90bc6995b6263d53e5328be9dc |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f9a87bf96f2640806fb7e60e593c4cb9c26d6ed6 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/86abd35c2b886b9e9f8a7ce118e792099641ec2b |     
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d2a5e17c7267ff375e9d3935c02d18d24eb6fad7 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/79a8fc9336208a5a664edb37a95d1343b02878dc | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/44ed083c18fd41bc8186a9507cfaca79bdade696 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/eab2a89ca52d5718561ed9c90f5bb9b4be4ab546 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/3e01f490d76be03f21a0680eb162a0c0267fc1b9 |     
    arm      |        bluez-alsa-2.1.0        | NOK | http://autobuild.buildroot.net/results/9200bdab254e24ecacd345c00216a3d87c014dfc |     
  aarch64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/beaae79e81c9d0d0be3ba78d5caf3d178d4ff1ea |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/901aab159ea4a1d9c3504c852ed82a68c4c47170 | ORPH
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/873d7bb1803bee6d8706b25f60565aade35f1f06 |     
    arm      |       drbd-utils-9.12.0        | NOK | http://autobuild.buildroot.net/results/e444f46cd6e6d767592b17b83095737d0508a475 |     
    arm      |       drbd-utils-9.12.0        | NOK | http://autobuild.buildroot.net/results/0c702bc67ea7e0662001ad029962f57177e3b1e9 |     
    m68k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/21014fcba169ebadd878918dbd5772ecc46112a7 |     
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/33250bd20a2d3d19811c2715cfd6138abaff5558 |     
  sparc64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/7db913f982a73eca665d9eb78c588049b3adfb14 |     
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/ffee9e90c40eca17d0502487c50ce3c32e02f37f |     
   mipsel    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/18420ef82c0bced4543c609db18347697aaf188f |     
powerpc64le  | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/0125afd454fb0d811574cc1d155c672b8fbf8fd0 |     
    m68k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/f0cfaed7ef13b28b9f1b6e4b8aa9bee68478ce51 |     
 powerpc64   | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/8db22b026c0de5e4c77b57054396311f982637d6 |     
    m68k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/01d638168f60b085bc9ee0af71fbcacca4c5d592 |     
   sparc     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/319e8eb57330bacb0ee96d5cf3db596bd0b07f45 |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/fa5c605f81f828fde3cb5b562ee7986280c5f26d |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/79bcd2c97988abb39269f1db1ba5cb76fcc70a08 | ORPH
   xtensa    |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/be59f325d62e5a0e55ae0e75f5e404734dff1683 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f1c2cd108532c09f0a354efeabfd0e7c1c917b5b |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9c87c941b7d285fdf1b8333b30c40dcd0b46cbf3 |     
   sparc     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/a744a717369708eb6cd5f7c902e84d16a7909f55 |     
  mips64el   |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/e6b385faa235055bb8d8d3e7b0497884b8853ecc |     
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/5ad61301ab566c43edb29cff3b5391d718925f45 |     
    arc      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/afe44a259b1bd04c1c4836ef72f25624f9ad2cbe | ORPH
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/a3a7cbaddef6179e697312c47574b002cd778925 |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/0a249609d6019434b4a59a8f45a2e9567d61f524 |     
   nios2     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/e9a81eb91b695368237b2dd067918624c2b08180 |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/1f54a01220b090e167eee0479442195fb61a5a70 |     
  riscv64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/64ccf39dfbaf35cacf0abf15d6b15e0e87cdf37e |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/f9bbbfeab5910caffa2aa348130d26460f070de9 |     
   sparc     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/0f6b1ec712056f2fd84920fadc4fa0d24fc91680 |     
 powerpc64   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/3f3f52f7373975db76ab8aa3ab4527320a81bf5d |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/1aa0aba21b32b1729e60fc9b5161bafc43f4b612 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/85aaff4f113850e2756246c5d6537fd3c2eca43f |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/74c6ac9451f63da9531d645ddc3bc966bf82b5ee | ORPH
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/cc53ee3222b7b8f4567180a69b4de3629d115f0c |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/ec1185ad1fd8863a3990143a0af2ace987761a27 |     
powerpc64le  |          libnss-3.55           | NOK | http://autobuild.buildroot.net/results/1f912794576bfeb6382bb682ef2aa5d3b8cfcec1 |     
   x86_64    |      libxkbcommon-0.10.0       | NOK | http://autobuild.buildroot.net/results/6ca7a6c95224b2d1d669249610c0dcad50019e42 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/16ba06eb3326697f4ec865efd145aa5fff743a2c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/fd0ac6f629abb1153967803669ee6fe77cc2b8b8 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/12f4580429427b6b546184366f74da16f83d692c |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c9ba905d510497305ddd93e4d436d37b1954cd3f |     
  riscv32    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/17f05238a3479f5b0c9ef8f9bb42210f6fc14fff | ORPH
   mipsel    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/6688dce547184f840bd952b105087743b8a2b649 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ec0e044d94c41e0bd38d3c8b835b51a3b0e0f6f0 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/69b4d40a8c5bced55cbb8d1523f50a01bd73ed93 |     
   mipsel    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/43dcf99e0cf218a86185e1b02f525573cd8a85ce |     
   sparc     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/1a274be4c6004467087c36dc36435e91d025932e |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/af41e6d41d75d72efd32562b3ae7794ec54b90fc |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/fd402930f04d60e66b3bfdfe0bc0a1db9a390515 |     
    arc      |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/9ecbf251971da3708d6794483d09157747c9565a |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/5e8dbedf29ab7a91480e516a577a4b26eefad384 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/bcb97b6fbda3294bb7525fe9a56ed0da3c66d0d9 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/e9d87ba0caed42ee4d3c3365a537e11a4c38284f |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/320e23fffb453f0f2083a6713b86e1b74d383446 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/7d371d56ed20f8dc994b4564bed882fbc07fb204 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/373db0117d4f382da052fed28661e993e65b6c36 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a6923145de4342d320a5448172dcb9b26296ad03 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 2 
                    vlc-3.0.11 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/b1accf3ccd6c60420f90f266c8d127511ee5a362 |     
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/90bfb91effba6ef094bc70eb5c3bfaca000f74d8 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/07531a85c1b258b83c2d5d06547b5dca27e7b3d7 |     
    arm      |        xmlstarlet-1.6.1        | NOK | http://autobuild.buildroot.net/results/af399b67a6fb8069e794e7457b23bc6716ae5fde | ORPH


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
                  monkey-1.6.9 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b6f7604516fde28b00fc6ea1298cca4ef173d124 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/ca57e0293a7c6bc736a6c0218583f7c6af4086e8 | ORPH


Classification of failures by reason for next
---------------------------------------------

dvb-apps-3d43b280298c39a67d... | 2 
               opencv-2.4.13.7 | 2 
                qt5base-5.15.0 | 2 
               apcupsd-3.14.14 | 1 
                 gnuplot-5.4.0 | 1 
                   guile-3.0.4 | 1 
              host-grpc-1.30.2 | 1 
              host-guile-3.0.4 | 1 
             host-pango-1.44.6 | 1 
              ibm-sw-tpm2-1563 | 1 
              keepalived-2.1.4 | 1 
             kismet-2016-07-R1 | 1 
            live555-2020.06.25 | 1 
                  luajit-2.1.2 | 1 
                openblas-0.3.9 | 1 
                 opencv3-3.4.9 | 1 
               pulseview-0.4.1 | 1 
        qt5imageformats-5.15.0 | 1 
                  ramsmp-3.5.0 | 1 
                      tio-1.32 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/071a6a6ae9fc9b9beac9143baac90dc861c9536b |     
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/fa485baa2140dd371f975de29675d61768f73648 |     
 powerpc64   | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/abd6357b26f70646ff400402d0ffe48626971325 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/6c8f3067e9f9b9cc09ab6251210d99d93521a2c6 |     
   sparc     |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/3b909ea07b9ec38485666c4d8206c3c229a5ad22 | ORPH
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/7ddad420c0788bffabd1de5ea68c18728b6ce090 |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/5df096f056ec4d916275f0ebd506a1d67cd320db | ORPH
microblazeel |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/0bc2be33d3479681007a82f569e632665b2921b5 | ORPH
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/96e10588a856c9124a83d4178974f87a56c93049 |     
  sparc64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/9ef88e66c40b12f56ba296c7ddf63f8942ae25f4 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/7d84ed121a1b17eb435e76e0be978bf238b86ea2 | ORPH
    arc      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/01ac3fefd24844d2623d31f40635543362ca7b91 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/206ac3442ac7cc9492703256b4a7209d2b5ae68a |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/a2255abde410b9ae4bb6696fe4dfa51b4c6e9fac | ORPH
    arm      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/8eaa0300bc78d482e589e6eeac7dc3c9cbab88c1 |     
  aarch64    |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/007e064a42d408f762452a9d0e98c782daea51bb |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/11ecfa32f89df70121f2ef712ea88347282f6be6 |     
  aarch64    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/420471383978668e547c93f132f4b8e6db41935e |     
microblazeel |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/a63dc398244106bf310b433311b12ba2d94a5e65 |     
   sparc     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c07745772c82393696a4deed5b605352bacec3ed |     
  sparc64    |     qt5imageformats-5.15.0     | NOK | http://autobuild.buildroot.net/results/598f065a20a180647c0a3f77450c24e23630532f |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/38d910186038c49c5fc259024e562a8e3e54dabf |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/5e98ca30127ea9c422a084400fff722000c55a58 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/3968a5f6e8b369cdad0ca33819fa27a35a325bc6 |     



-- 
http://autobuild.buildroot.net
