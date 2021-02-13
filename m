From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 08:18:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-12
Message-ID: <20210213081852.95C9C6F5E1@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 17  |  3  |  1  | 21  |
  2020.11.x  | 16  |  3  |  2  | 21  |
    master   | 135 | 88  |  4  | 227 |
     next    | 47  | 22  |  1  | 70  |

Classification of failures by reason for master
-----------------------------------------------

                    mpd-0.22.3 | 9 
                libselinux-3.1 | 7 
                  perl-gd-2.73 | 7 
             libopenssl-1.1.1i | 5 
                  dhcpcd-9.4.0 | 4 
                  bustle-0.8.0 | 3 
        host-sentry-cli-1.57.0 | 3 
                 mesa3d-20.3.4 | 3 
                  monkey-1.6.9 | 3 
                  zeromq-4.3.4 | 3 
                    brltty-6.3 | 2 
  gobject-introspection-1.64.1 | 2 
                     host-mono | 2 
             kismet-2020-12-R3 | 2 
             libgpg-error-1.41 | 2 
          libmicrohttpd-0.9.72 | 2 
                 openal-1.20.1 | 2 
                 openmpi-4.0.0 | 2 
                 pixman-0.40.0 | 2 
                    qemu-5.2.0 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
                        bustle | 1 
                 dc3dd-7.2.641 | 1 
                   delve-1.5.0 | 1 
             gdk-pixbuf-2.42.2 | 1 
                 gerbera-1.6.4 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-cairo-1.16.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                    lcms2-2.11 | 1 
                libshout-2.4.5 | 1 
                mono-6.12.0.90 | 1 
              netopeer2-1.1.53 | 1 
                    orc-0.4.32 | 1 
                   perl-5.32.1 | 1 
                     ply-2.1.1 | 1 
                 python3-3.9.1 | 1 
            quickjs-2020-11-08 | 1 
                 ripgrep-0.8.1 | 1 
                 rt-tests-1.10 | 1 
toolchain-external-linaro-a... | 1 
              wpewebkit-2.30.4 | 1 
                   xlib_libICE | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/17e5bc3ae59d40dd30c5902e1d2e7af027eb2916 |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/4ab6b00a5ddec61219425553003d4106a2a7b82d |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/fff74daeffe455e62715ca990f7f2ff4cee18bf8 |     
  riscv64    |             bustle             | TIM | http://autobuild.buildroot.net/results/ef70d9666d701efd5f862db5054f8eb63f3df81f |     
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/8ec86ba4e7a53b158a69a23cd52e288b4000550b | ORPH
    i686     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/cdd8601b481367989e9feb8f4a5dc7e2243e7c45 | ORPH
   mipsel    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/999b00731729db21823a88980728e9cf557129c7 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c3c3d570763a87c9ea8ddaebf9d3688bda321b67 | ORPH
   x86_64    |          delve-1.5.0           | NOK | http://autobuild.buildroot.net/results/3fb9744eca1d240602e27f64b588746b79742bf9 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/8a6f997b4bc6255cfc39667b2ba476e6e7ee0104 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/3a3228611b42db41533e55d9544d09b283560f40 |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/e38261283284b21cb5c6d312ca3feb96288d32bf |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/5d4b84d3e4f86f3b80c556377712ef04074c945e |     
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/a432d5cd8683926e34d21cff37a6dbc65c7ca2e3 | ORPH
    m68k     |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/2c07b346a74dbacfea2b5abc2e66b203d294650c |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/154bf54ab9777bc04527fd94803a67d7b20c14d3 | ORPH
    mips     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/4436cc5a610bba1d1cfdd1fe4194840349532bcb | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/bf3d47c4c7faec23ec71425a1a9cdeb461d58a42 | ORPH
  riscv64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/7dfa6e368d1474debed362a91e563209b67b34d1 |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/97268ab0d9ae75bb84bdf16feb773cf3b7033c2b |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/db7bb26314a1d000879aebe98b73b7177b79f733 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1adb1bda97dd6e4f9562d0754316d442d39c0759 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/631c02f4264f999a7375559f73fbe45f7ff90568 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ef0f7d9ed6e644e48d6566fd1eb3839ad9554432 |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/b7232dc774b31478ae3c6a56ce30a3fb5c7fba2f | ORPH
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/c2f603abc7e859e5c325e244959d1a7cdec5cb58 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a025c5aa71c34f733c2ed442640c08e9721b8662 |     
   xtensa    |           lcms2-2.11           | NOK | http://autobuild.buildroot.net/results/07c5ca780bcdbfcd7cad6502345f1553ce17bdc3 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/6a218afeb4c43d3a0c7e37ff58477975a5780b8a | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/46e00666e22138d216bbe71b3c37e692c37a2f55 | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/e589c531666b3e48476693997997e70ef67183f8 |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/b4fe78ce02af842712577b06238c80a472b63b7e |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/b2c0b175dbac46a36c0bfec2298417628c75ef25 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/ed448d4d5abccef7e6e3640baadc9d66a0c9d069 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/581f0edd1291737f4f0bc8802f7bdfe250dcce3c |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/5ffa2e617ddda314bc4d486f80648e9d7782512d |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/84bf8fd5339ab304e409bde64fd54408b26db246 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/d9ed7e3c4e5c65a8fa48465301d93b37963ff301 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/940193fd2c622f935b07ee1ec3383ec5fd209b75 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/eaf19fd6540efc89bb0255f64c81a4c93f61e285 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/cede0ce0c42dff65c639da8aa71f96cd5e35cebb |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/def6e7797900ed067050c6e52f7867fdf975aedf |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/d0cd4d55d536941cb8d543a04b80de141e886130 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/479c3bb4e1a0f2b7fac36266acf2754dee6064e3 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/67884e85b44b48131aab3ae69bae86ce84d36d2a | ORPH
    mips     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/74fca6094e6a524d126dba44c8c1c05fd7f4d63d |     
  mips64el   |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/eece1706b2584fd6f6052eb59e2b85e47a00a3ba |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/2386e072c79d088c72590900d2141eb802ac4bc3 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/9aa3a601b7df538945a4baa862cdf5158d422918 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/b442ed54fd459e57779c89ba18d48789eed2231a | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/5dacf7311d37e83d33b2062773be4152b3cb362d | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f7d6366ba5acd978e2113991b48a99cde11127b5 |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/a0652f20fcca2571b2a54f4327dc859171805301 |     
microblazeel |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/88c7f9b54005ccfa449c4b625289edb0e97bc15a |     
   xtensa    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/274c8f133b72509459d9bd7877f5659c7fde5c7d |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/34743607ff97f47f2ed7e05de889968b743644df |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/10a467fdd5f6bd17112e535efd6b179353d685d3 |     
powerpc64le  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/b0474b5866d340fa80acf30763dc5ab00047a429 |     
 powerpc64   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/0a40a06570fa412f18912aadc6acec0481bcf533 |     
   sparc     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/a3ada4cba56de5b448063f773caa5e74cef495f2 |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4a20903f6c34750a15f97d35a26a70f130ba0d8a |     
  riscv64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/67a72dd9bbb5aebba355588200b779d6ea49f2da |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/4a2376dec4362b4252a2dcd22bc8f5450eb2c49f |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/b0894382b673654016277fc6b6a7c7a2b795023b |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/8c522f15a231cc3c8d617a9801040e6a8fa69c8a | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/a927a7e602502f3bd41a397725937cf197418de3 | ORPH
powerpc64le  |           orc-0.4.32           | NOK | http://autobuild.buildroot.net/results/98aae569db5985db9c024349e7a44d5ba9e064c4 | ORPH
  powerpc    |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/ecf59ffa8899c766a15da15b75745d43387d8431 |     
   mipsel    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/7539d6c24c0e91e1a4595d095be6a7d04056f704 |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/2dc9670bd6088bc76a3c48666580162de73f02f7 |     
   x86_64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/5ac2accca2ea13e3ff5d174e8bc0c7139ec3d4ca |     
   mipsel    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/e2e5450a1a08095aaa49fa6abc79706155f1adaf |     
microblazeel |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/6feafaf6550362915a240c489db0f33097b5e5ee |     
    mips     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/b9f283cdfbd6edcc9f31883f567efa58c3d3eb0c |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/2ebb54681eff179853f90178070b6e412ba5353e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4c8ab2416c2117d8010bff55ac78e5c46eed2dd6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/671e6e859ddf39cbda7a05ae3f0972464645ec72 |     
  powerpc    |           ply-2.1.1            | NOK | http://autobuild.buildroot.net/results/3a586241d37614b644ff6c4674ae28df2b22fdf8 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/fd26b25aec78307dfcc91d686691a1af6b4df21a |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/918c4b38a25d9eb8ef91cc64bbd9b4afebe45195 |     
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/01b234d4040bb02d89d7bc66bea1179c731f7f6f |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/16edc123b8a7e63210eaf00c4a7bc2f0fb26e400 |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/cd7ff44126ff2f28a586425468dedf8a0737211b |     
  aarch64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/77d4f2da99c0d599fc97d75cbb95b7b2105004d5 |     
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/c92572bc2da99d700c22dbdfd90d4224f1444c03 | ORPH
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4b61cab69854fda7acf2102fc62f4a4a84509551 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/4fefa7e489f3ab96f4a386c15229f384fbc6fa13 |     
    arm      |        wpewebkit-2.30.4        | NOK | http://autobuild.buildroot.net/results/43b9a8600a96bc858a87ec1d674ec9cbaf617572 |     
   nios2     |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/bc481fad2b971ff4c8dc48f17b494de35d08c6b8 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fc28686b61d61d3c2ba8b1078337f4f038ef3699 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/da799821cd1e7a94124cd9cfac464615363560a6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/686238bd95cb9e2f3464ea3c813de559664d7e51 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

sox-7524160b29a476f7e87bc14... | 3 
                        bustle | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |             bustle             | TIM | http://autobuild.buildroot.net/results/dcc0650771f41b117c9bd02b0e97e1c33b942468 |     
  riscv64    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/c2b3ededaa576c403a276821ba58c0590d637722 | ORPH
   mipsel    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/fa420a7010ab50a1790190a7215e6be442e705e2 | ORPH
    arm      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/efd8b64c80f48cb429e11e85679d24275c45381d | ORPH


Classification of failures by reason for 2020.11.x
--------------------------------------------------

sox-7524160b29a476f7e87bc14... | 2 
                        c-icap | 1 
        host-sentry-cli-1.57.0 | 1 
                       unknown | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |             c-icap             | TIM | http://autobuild.buildroot.net/results/32eefb428efe624b7f34c241ff024dea423aa62e |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/77bc1385ba88115b39ea77e054ef34a17fd80691 |     
    arm      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/bb3e93961d9c904d747e8de78739b9396be153e4 | ORPH
  mips64el   | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/edef0e5538549fe56aa045585644dedda1c3d3b3 | ORPH
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/4bcdcd11b4e44e0de5b8ed2bfc36e1c6c9d79051 |     


Classification of failures by reason for next
---------------------------------------------

              netopeer2-1.1.53 | 6 
                    mpd-0.22.3 | 4 
             libgpg-error-1.41 | 2 
                openblas-0.3.9 | 2 
                  boost-1.75.0 | 1 
                clamav-0.103.1 | 1 
         host-shared-mime-info | 1 
             libopenssl-1.1.1i | 1 
                  perl-gd-2.73 | 1 
                 python3-3.9.1 | 1 
                      tio-1.32 | 1 
             tpm2-pkcs11-1.5.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/368b859586fda25880b6b9a1389a149241185b40 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/902c598905f65b92350a1819313b41b668fba161 |     
   nios2     |     host-shared-mime-info      | TIM | http://autobuild.buildroot.net/results/866ec1765f01caafce069ed3c315df767f43d419 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/c1b802c2f3b79cd90032d5c431a06c5a161a028b | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/1b8eafb9141f1aed9968282c49e00bc5922fb6ec | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/29746e51bf624e386dcbf2984ece964a1297f9aa |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/6ffa6c174e3ff70eb660ba39d37f88bae621e0e7 |     
   xtensa    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/f3e1394839669cabe8ebad4b7186f72a2f03a731 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d4b92fae5e3b6f4010b6ac6f6149fb2f9d8ae027 |     
    i586     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4f19f2f5e98839e9b2f18326d6209fdb6a064b50 |     
   xtensa    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/5cfc2fa33e5253e45a71426bcdb3d7d68b18b920 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/a2691bfaed2bab65257d4554af517c196da4eedf |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/2260770c8c6da099e78842292e665e3b7e6727ca |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/dc5a06e98f2b7b97a6602a14155153785a5c9199 |     
  sparc64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/8e4a1ff546f3e77e064577fd1fea6a8af9d93c45 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/b8a1f5846e8b9b6761af12ba64f57355ad46500f |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/7126e971b06812815cc273f55390cd8e80e42600 | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/5ea9b5eb42bf5878b7195d3dc7e126c535e7194a | ORPH
    mips     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/a6c48e4274c72f01abb950af47d5ea584ea9929c |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/b673eca4f57ee58c4fad9f83c1eec10f11cb2351 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/516005468af765d2308ce4865b0adc9d2d966ae6 |     
    arm      |       tpm2-pkcs11-1.5.0        | NOK | http://autobuild.buildroot.net/results/902dfa499a10db572ad89ef4b3f20dc0d88f166b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5011bb5f7327d56c70e8a9d0221b031cc6b417fe |     


Gitlab CI results for 2021-02-12
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1022937103  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1023446723  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1023447067  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1023448804  |      



-- 
http://autobuild.buildroot.net
