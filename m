From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Oct 2019 06:16:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-23
Message-ID: <20191024061659.D48C2877F4@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 28  |  3  |  0  | 31  |
  2019.08.x  | 29  |  6  |  0  | 35  |
    master   | 154 | 193 |  0  | 347 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 60
        host-dbus-python-1.2.8 | 15
   jitterentropy-library-2.1.2 | 15
                    brltty-6.0 | 14
                      iwd-0.22 | 13
                    bird-2.0.7 | 10
           host-libselinux-2.9 | 10
             dbus-python-1.2.8 | 6 
                       kmod-26 | 5 
                host-lld-8.0.0 | 3 
                  hwloc-1.11.7 | 3 
python-libconfig-b271c3d9da... | 3 
                  flashrom-1.1 | 2 
                libdrm-2.4.100 | 2 
             libopenh264-2.0.0 | 2 
              openlayers-6.0.1 | 2 
                qt5base-5.12.5 | 2 
                       unknown | 2 
                  cmocka-1.1.5 | 1 
                   grpc-1.23.0 | 1 
                   gvfs-1.31.4 | 1 
                     gzip-1.10 | 1 
                 haproxy-2.0.5 | 1 
              host-grpc-1.23.0 | 1 
           host-harfbuzz-2.5.3 | 1 
             host-qemu-3.1.1.1 | 1 
                      icu-64-2 | 1 
                libgdiplus-5.6 | 1 
              libgeotiff-1.5.1 | 1 
             libopenssl-1.1.1d | 1 
               libupnpp-0.17.1 | 1 
               libyang-v1.0-r3 | 1 
                 mesa3d-19.2.1 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                  pango-1.44.6 | 1 
    python-pymodbus-legal-info | 1 
            qt5location-5.12.5 | 1 
                 ripgrep-0.8.1 | 1 
                snort-2.9.14.1 | 1 
toolchain-external-linaro-a... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/62449341f3c1bea495e8925938cd32bf75657e5c |     
  powerpc    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/03abcf1f215e5ca4b6ae7d2c47eda818e962e7c0 |     
 powerpc64   |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/62565e6b3e4056c4e3697fba3d840fecd26d387b |     
   x86_64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/b5bd5a25c260a6c1ed196b27156a87490acc0efd |     
    sh4      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/deab67a64c3f444dfd8d9f6bfd130df2dac73ef7 |     
   x86_64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/cc237ab3fd5683a2778039d17369a06a55caf312 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/67818d3aaaccfb5772ca44cfa9e6e0b78c6807ca |     
  riscv64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/be56f5bc8409af9a342607606c352581a205a751 |     
  aarch64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/1c7435c9f63563970e6dec32c6c63d52901e8dc7 |     
   x86_64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/f5de26f33ab90f52bbadf2ebd95deac1deb5ab7c |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ed64c219e1088034c2d308a09488de2b6e98dd67 |     
    i586     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0b392eb6bd3f0dd16aeeca812f7937b01785294e |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5e3783ae2fedae7dd2a1783d354b2f9727540a13 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ec2ce371c92bb702d31323ad780c88bcdfd9d19f |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4d7f7ae54574e60b328c855fa528582e3c605a0e |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/99b90124b777128d688c5dfefc27d2654d407fac |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a06a647bc7ea46d6ee2a66d7164bcc10ac92cb92 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c46a08afc2d4162cd54d30548b7aaa4eaa67ae74 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e375ffa4dd696ced7698f302dce2cd03954be551 |     
powerpc64le  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/52e0b3186420badaaf54b28381d0b2f17336de30 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e52f315f722ab4af1a782a7a6680043e9a2fb792 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fff2ffe19e50b077d637276e8bc2d747a3c42efd |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/868523114082a52af61685b8275f15a8332765ca |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9cc38af1be68c6120a26a09f5feba0d69815b400 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/eda23ae393cf78361af19a41607dec03f6e47982 |     
    or1k     |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/1b22906ea346c98fe155dafcbe43cda2bc2feb8d | ORPH
  powerpc    |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/c267b13bfa69f6624159026e1f357facb5ee6d26 | ORPH
  sparc64    |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/8a719bd74269d500f4702b32fdc93b84c6928c16 | ORPH
   nios2     |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/019d0403ad6f9a395ae2608d70a7f5c3ab3f4d5d | ORPH
   mipsel    |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/9f9cf98a9dfa36fbd24003995bd42d1702877eba | ORPH
microblazeel |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/b308eeb5c5d95ab9f1dbfc19f9183f2ba3ba0ce3 | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/a41eb62bd4dd3ff8499afcece7d045f353a657ee |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/645cdc2542ce2cc8e31cac8491180a37f3c8a0a7 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/59f48d957a51e00d6b250e1e61dabc724fd96c27 |     
    arm      |          gvfs-1.31.4           | NOK | http://autobuild.buildroot.net/results/a438fd2cf2e3f783e2992e45abe083dff637df33 | ORPH
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/055d55c1140b25d313f86a26ad83b40a8909fe35 | ORPH
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/3ef393c3c3a36a73f8aae1bb2c4c045aa9f2e61f |     
    mips     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/d428546712f8032952da704a63d32d5bd89f21bc | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/b69e83c0ae11ac68fb18c62539feed356a5929ca | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/aa080db2a5516d8b0aa4b0b85f9ab73aee7594bb | ORPH
    i686     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/d784a2d94dc8e1947d7d6aa8681984a4b8150473 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/923e65936df276507cebffd0ff6191f7da1692e7 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/fb23213d91bbe406832426f77b700fd894053280 | ORPH
  nds32le    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/90de2ee294b61060143328a5bd58983e06a64e4b | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/0dd9203f859b97ee5a3b6358644c26f8ab784ed8 | ORPH
 powerpc64   |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/25d5af28bac891a192c0eaf8d0c21d3f4abcba39 | ORPH
  powerpc    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/2219f4ffd8fc0d8b8fd571d76c8c7d25c05b015a | ORPH
    i586     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/aba1d05f13cae7041fddc6630bc15dd64b41909d | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/ef54d7614346cffa9b0c5c6dc1ea3d1efda2807c | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/4fa1efc8f150c982e29d45bb22f3b67ebd536540 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/9adf20c6d0065083408366f51cbaf0ae647d487b | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/3a841125c9f31a8209e108d0e0b80c1f534cf50b | ORPH
   mipsel    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/d3d51e1fbf83d00bcb5890e2566cc318b5ecbf89 |     
    m68k     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/d8131723452459be8a8a7ae991db768f4ded3c9b | ORPH
    mips     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/44deef3ef8a67cd890fb82d629d25c67b256a2f4 |     
  riscv64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/ad698e8ebc724a500716144c048846b12781b00b |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/4e271f9dc6b3462041489e242d6ff34bca76420b |     
   sparc     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/1560a89a690250bdd0cd23a025c22f88d75fd925 |     
    arc      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/9d9489b33a6b15d5d757777aac5fa4a0b05eb339 |     
    m68k     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/6558b2abcc9dc43fab7e5bd5d94916fe0cd04620 |     
    arc      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/cc70c4dde197ac07e2fc42fd5f51b79001ae5ec3 |     
    sh4      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/f7a5c63d8e6dca1d4c461caa418b5e129f23b662 |     
 powerpc64   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/bde59c60b5c873426804dd237a23ffab013d522a |     
  riscv64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/4621a73a3b8c7417b399bbf740c67767de32434a |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/39cd23d1fbab5be698964560683f5553db7848ae |     
   x86_64    |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/479f0bb7c620b25ccc6467e4b7b5a90a36e92170 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/6577040d871eda871fe1c0bb4d9734197f09b384 |     
  powerpc    |       host-qemu-3.1.1.1        | NOK | http://autobuild.buildroot.net/results/ac4bed4802933247bf3a68019cb579429273eb97 | ORPH
    arm      |          hwloc-1.11.7          | NOK | http://autobuild.buildroot.net/results/c853a356cf9df6ec431496f46650a2eacdf6275d |     
    arm      |          hwloc-1.11.7          | NOK | http://autobuild.buildroot.net/results/06871b94ca70be957d632bf117c3d9f2c884e4b4 |     
    m68k     |          hwloc-1.11.7          | NOK | http://autobuild.buildroot.net/results/e3576b185b305c407a16e945b21c7968b81b693b |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ac26c5c77cea49f253aed88440930a076e85a9ae | ORPH
    arc      |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/aadf4bf7d643f2c8cf2324e20d35f34a062605f9 |     
   xtensa    |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/0cb265c496a58ecef3cc98231d1f605b96ff9ac1 |     
  sparc64    |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/dd42d6c2ae82bfdd774be247df9e6ce79be7b520 |     
  sparc64    |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/e5c17fb2b4ab95973c6732bd083da2b212cdd4e0 |     
    i586     |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/7bb225584a7f2cf11afcfec3454b2db2ea5bf8f8 |     
    arc      |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/c2aea4c28ebfe242c50e5eec8b0c37a9dab37c1c |     
   nios2     |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/cf4b69452c658ab37dffc9dfb55b412dd84ebd7d |     
  riscv64    |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/322bc58653892312783f2b0f1688822958ca4839 |     
    arc      |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/1404df5f3c9293db3ad1e452fd092bd0a89af287 |     
  mips64el   |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/c6d36ec636ae204eaa600746eea6e8cea76ce314 |     
  mips64el   |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/3f68bad231b18485871f24175001e1525501f35d |     
 powerpc64   |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/dddf15a50186a23917e7332413ec7165fa4c7c56 |     
    m68k     |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/be511f0ce68c30185c0572c7ce9403e390936f77 |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/a36f7927013eec71d43eb1a85c6d60ddda5c119a |     
  riscv32    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/60b99486fda0a3b617b757074756ae9cc20233d3 |     
    m68k     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/ed6e1eb76712ee911274c0d01823bbda73d7fdcf |     
   x86_64    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/7384edf56f5beca755512b496761b29b111eb88d |     
microblazeel |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/5059207ec9ab0b502717626cc84956dafd0c3c32 |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/3b246b6facf055d42291a119a76d7a6f769b1c25 |     
    mips     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/70f381c8f5c94814f7954717f7097322af787a77 |     
  riscv64    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/13e2576f4cbc945d02a44006ec1ab5873b318f05 |     
  riscv32    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/12900873ea139164e465e721d4af240aeeee8f1a |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/5f67d5421ee922ed5a3824fe248edf1b1e509fff |     
   x86_64    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/759e2046a13fc89f7256caaf93e957f00ed7ac20 |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/8faec1c4760946eccb954bccca7b1435a6d4fe19 |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/b9c4f1321c2f4a654b921296b0f875115eaf463e |     
    or1k     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/dac2b0106dd8d0d02b2336d66edf6073ded5e2a7 |     
    m68k     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/4f549c31425933deb83cc46311e62e9d6b955539 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/192c322715919ae0923d6fe0639825b5ed4ee28d |     
  riscv32    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/22de495e660c396cdb986e28ead3001936fe80af |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/64079750d0cad13752322a7676915f87e7c333ff |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/15855890db34d5ecd425122290a2b32bd16dd323 |     
 powerpc64   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/79a5a0398723e8cfea0d0aa3dec5f7649aee4c63 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/470e7611a3197a0e7bfb07680d892d9eab25e698 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/21af69d4d59a12ff4d57f1095b6ea7ad9fe1f6c8 |     
    or1k     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/46f8187d8a67b05f57eb04c9c1d71b3839bdcb09 |     
    m68k     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/f820bab9007485af8849ced3cc7fe85085c0a21b |     
    mips     |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/e28fdbcc97591268563c7741be95df21c41e9f1c |     
   mipsel    |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/621537eb5ab278bf9a00f44329ece0d6dd15bd0d |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/0316f105e1689aeeebb26d78adf72bf4480acc8a |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/14724a33f3f3c73e7192f1e535397b50e7ff0cfa |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0112eb56284201017d6b1a70027a5fecbbe0ceda |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/699c3cc427d1ad4096b7382f8806998a7451139d |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b6e4f73f96d1d2936eebe88996a18d43593e8425 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/289846939a722f41966c7821fe8fb9679a62ce2d |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/55a1bf610137c7add21c4d68d99c1b5225a42b1a |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8730f3d087a464b2abba699139c457fa6563cca1 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7b973942b212125467a683d236fe221696ddeb0c |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/569906e89af0c2c6fe185397274319f6233491e8 |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1b5061dc2d2dd3f57725fcec8c2683b9d2a78aef |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/df1ef2fc9c6b7268c54ca9f9aee58668ed604085 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5e5f00d0bd79f0176bd8142df4afeb4d536046c2 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bc37ae158207778569c792d4797fc1211ffa3df2 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/79d4750965caf855ab4e090e3e29795876528098 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bf8a10ae0789540314859bbe10411883e4ed2dc2 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6742500f08e0cc608298023155522c98ebd83aae |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c7f87cc828d8b1abad7e174993cf8ce252d659a1 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/202a5014ae44439784910fa4d9d3fe7bce53062d |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8cacce3be687965219beaae7e39e52a1bfc01235 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/278f47e1a60146963c00712001da042f517a7e96 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ff480227e4278fcbc00e7825b95fb67d00cb6b26 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3f6fb218db0edfb9c933877f1428b814debeb293 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/93ea35d4f25bc54e0f87fb1ac52235a8dba65f84 |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4a6840171b2b893d7af342b733393e2488fb8bb8 |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/734500ce28406e4cfee210eb79a0a1acf66643f9 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/52cf9246aca68066e3addc734ec787ec787612b8 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/db5bcddec91f988317709a5bb3c74432ff4056d0 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/22b8300abe5a7fc1b40897bd7c8132a490a804e7 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b4178005e139363d6f78e88179c74724f05449fa |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0a5f1d084ef473108420776f4963b60d094a924b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/690af6483e9ed0f2936ac8cda6ac9aae802ad12d |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9f50cecbccff286c72151daee098aebdc8411490 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b26c84a0c546641611b94929c5634da4b345027f |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/08c81bc67636dad109f8802fe1b33117fde256bb |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6e6fa12a5b88269e16d391f60e1fcdca362b31bc |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/046d8458150c1de52d0fbd79631520ec09eef963 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2f5ab79d9c908b14a261b4e6366f6ea5eac9f14b |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7b5d5b7bc4812eac84d17649da9bb5f528d53c5b |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/aca088642965bdf8d07df1e46ddd2140d85eacc2 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d1d49dcfd8d1ee586721fc42f21cd51f9f3c976d |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2edfb9b4f98d07d89c7d41a4ac525964e2ff6510 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2a2e59c1c6fcb44873549c32d319748f6d7cf027 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d42d96b05716df5d7f4f511f6ffb215692276885 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3367af9f6f1bd6013099b796cc46f8311f7671e3 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fb4d42c0104d882241f519859ef0eaa7cb3fca85 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/867bf20598022b3c3c0c098e511cc58ef1ae7eb4 |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dd41089f9dbd57ef2065863341817dd21819cab3 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6142009ec375e36e26746f0bf0226ac5c7391a8f |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/90dc43633863c91c3aba4982489c265cec7634fe |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a1992134fcd799237831609a915bcdae43ab8586 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d168cfa8caf467517ed5ebdd60b88bb41fe737bf |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fad75b2bc96324d2e47ba0e88263bbc42d073340 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3d792193c17a39c9ee318324044077bcba9828f1 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2608923e6325e04b971869ce701b6ef4cc74a991 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1c647595dc6b6f6bdb1122a1e8ea78812ea85a12 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ce01ee4f49803170ac6cfe95c4f82c697fce4283 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/84f6072dcd92415e66a90abd098d4ac10c187c99 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5590ed16c4b4ebc894ee88a70ee279026abafafa |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1b15427072bdc8bf6b4334ce20dceb06e566550e |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a7d83fe9202ca882b59f256561eae6db044f0de1 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/c05ef7d83af2fec0c39cbc0559959596f9fd013a |     
    arm      |        libyang-v1.0-r3         | NOK | http://autobuild.buildroot.net/results/1d84ff4aab67a98113d967b65467109e80bb5917 |     
  aarch64    |         mesa3d-19.2.1          | NOK | http://autobuild.buildroot.net/results/ab13e1e9bf268aa092c6872294700df342af547c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d566eb3a58fabc78495ca24f7a37b1ed38c8a615 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/df8e4416d9cf061b2ac96f8c70bf7a6e337d6a13 |     
    sh4      |        openlayers-6.0.1        | NOK | http://autobuild.buildroot.net/results/3336755cba0d4f2543270acff4de454f71029089 |     
microblazeel |        openlayers-6.0.1        | NOK | http://autobuild.buildroot.net/results/afc1da2ec6f7a08e7c39fd78b162cbc5e2634dc7 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/662e10bee429c6d8491d09359876345ead3a5c4f |     
  mips64el   |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/c502e2f5611ada72e811e94ec83b89205c8e6ac1 | ORPH
  riscv64    | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/225122bb62ca5a24ba9777b9c3e4f4e2530a45d1 |     
    arm      | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/b918939d9001f8d2bf36cab565dea20ef6b10dc7 |     
  sparc64    | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/314719c6d8e4ea24e8e4a26f3cd863c6418b848e |     
    mips     |   python-pymodbus-legal-info   | NOK | http://autobuild.buildroot.net/results/dd3eae22a68a55e296f39d9d4782d7af5d6e724b |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/e6be0a21e0ed9295f574c2f0127d17fc70d58c92 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/efa19236e2f7eb484636a0a08d3e74883132189f |     
microblazeel |       qt5location-5.12.5       | NOK | http://autobuild.buildroot.net/results/5b4cfc6a51750a586e5ff94bf2050cbde72eeb32 |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/731e8fb3fe04c701241ef303d2593be5a89d605f |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/efdef6214f97a2c552690bf5ccb9fd0521e05200 |     
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/f98b5b4a96e8edc673fc813f7acb7765280461a8 | ORPH
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/7fa725ea6282bd2ef595681aaab1e27b4feda00f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4645c8b3b2674de9d278dc79b020e5c8630dea49 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-qemu-3.1.1 | 2 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/f7c01db916f9a3269e649c02f3f548d9c0406adf | ORPH
   x86_64    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/054aa67533216a46ce6110be249e2b972469a280 | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/9f8bfcf8198992ac7ef5917a2f546ecaa533dfde |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
                 libdrm-2.4.99 | 1 
          qt5multimedia-5.12.4 | 1 
                suricata-4.1.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/96fa9ce2d5a8026d35fdeeaa82601ad2c6ca68ba |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/0165ff8270b32cadcc06e7ca858caa5b2f7e51bd |     
  mips64el   |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/6e8387ddcf54406ead3c5de6a6959aa71cb72c77 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/557c3555bae42255de54ebf7dfd513111d2f5e89 |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/c9fd9d93e4ca13e3780fcd43a6d9c31922269961 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/dd56e6baadc6f5648ea8df90672fd063b1e610ae |     



-- 
http://autobuild.buildroot.net
