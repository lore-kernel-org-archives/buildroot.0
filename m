From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Feb 2021 08:14:21 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-17
Message-ID: <20210218081428.4454D86F8F@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  4  |  1  | 15  |
  2020.11.x  | 13  |  2  |  0  | 15  |
    master   | 123 | 60  |  1  | 184 |
     next    | 28  | 17  |  0  | 45  |

Classification of failures by reason for master
-----------------------------------------------

host-perl-extutils-pkgconfi... | 9 
                  dhcpcd-9.4.0 | 6 
        host-sentry-cli-1.57.0 | 5 
             libopenssl-1.1.1i | 4 
                  monkey-1.6.9 | 3 
                 python3-3.9.1 | 3 
                  bustle-0.8.0 | 2 
                    mpd-0.22.3 | 2 
                openblas-0.3.9 | 2 
             tpm2-pkcs11-1.5.0 | 2 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
                  boost-1.75.0 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                     efivar-37 | 1 
            erlang-jiffy-1.0.6 | 1 
          gstreamer1-mm-1.10.0 | 1 
           heirloom-mailx-12.5 | 1 
             kismet-2020-12-R3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
             libopenssl-1.1.1j | 1 
                libshout-2.4.5 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.20.1 | 1 
                    qemu-5.2.0 | 1 
                 ripgrep-0.8.1 | 1 
                      tio-1.32 | 1 
             util-linux-2.36.1 | 1 
                    xen-4.14.1 | 1 
                   xlib_libICE | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/261e5951b8ea77091179f874644280a22fe41de9 |     
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/6204d39bdd2ee738bd86e1ee720faf01cd9daca2 | ORPH
  riscv64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/acc75f6b5b731b3b5fefcb0c0876900a935b0f8c | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e165b677df7d0aacccb693a2a29c1c4451f73597 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2500660167382da7e0bfbd5d929720ba8eaacb85 | ORPH
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/d1d82054193e334e864ae4beca0392a7b719ba79 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/802cc0177960a9e61ab1e6a1c41552f80d79aadc |     
   sparc     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/c515e5eb3561a7c3803d01cfa93c351a496636b7 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/5847367f44aaec02c854a11b1e64a192591e5e2c |     
    or1k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/862f2f06007559670df28f964f200ece07d2a2cc |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/a4067f99587d6aede4382ca33167ba589a0596de |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/24870cc87f2a2625c6076813e64b509238b063d1 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c67228e002932f48672019c53e8399d8c2e54d59 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d5a54546dbe92994dbb753f1bba8337dd2eac9dd | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/f69c3ba1c153e4a7a47b1958c611571e638d44a8 |     
    arc      | host-perl-extutils-pkgconfi... | NOK | http://autobuild.buildroot.net/results/57c1d349910ba739855b461c115e51bc58ca65f5 |     
    arm      | host-perl-extutils-pkgconfi... | NOK | http://autobuild.buildroot.net/results/951dfcc341459f5570bfefc822af8aca4de1d5cc |     
  riscv64    | host-perl-extutils-pkgconfi... | NOK | http://autobuild.buildroot.net/results/5fe0865814e0596f79eaa2b97e9149251530ed5d |     
microblazeel | host-perl-extutils-pkgconfi... | NOK | http://autobuild.buildroot.net/results/9ea552e29743d4c113de270c9954f6e901298b72 |     
    i686     | host-perl-extutils-pkgconfi... | NOK | http://autobuild.buildroot.net/results/628e73ecc8cf87c22462cd1d27e3a0abddd363ff |     
    arm      | host-perl-extutils-pkgconfi... | NOK | http://autobuild.buildroot.net/results/4afe9c3f976b28298b202d170d7a34925b329ab4 |     
    arm      | host-perl-extutils-pkgconfi... | NOK | http://autobuild.buildroot.net/results/2ca0546e5b3ded6e9f7f67b522c0b07c002c55bd |     
    m68k     | host-perl-extutils-pkgconfi... | NOK | http://autobuild.buildroot.net/results/d87787fbf2a8cb9bbaa3b59d1e8004ad1459536a |     
   nios2     | host-perl-extutils-pkgconfi... | NOK | http://autobuild.buildroot.net/results/4fe522b7b6cd479025028b6a8481b0c57904f129 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/df289b6ffe4cea5aaf0c918604c484a8db67c67f |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e20c1fe6ae2d263b53e18cc4bc1f0eaeca4b96bf |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/69af107f68d9367aff32c4f5d9c4b4fd77d2134f |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d886221b656ca4f249190cb8c2d78ed4408afaa6 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/703421ac2421ca31fd0ecd01679879c76a842a11 |     
    i586     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/73e16989f11a52b9be5ac82c41e3a63525dcc82d | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/8fcf5e4763c341cc556a4b23e0070f337c5d41e1 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/181b407579c60efa5d70af8a36f685d2021714ca |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/211d70599872e2aa4dbe3127cec7e1295e251a31 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/0a52a31e5e47f822b015f78ff10bb1e343498751 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/b06c60d65f426cd10a49d410597726cc4c8a0148 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/07e413b24ba8adc9558c80267ce16dda339bf032 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/f853e344c8e56827c751172289e788467b72ab9b | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/4e4105b537227733d20257ce2dce638390cdcf16 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d374bf1c007ed170c80e230770121c6649ab89e5 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/deb51cfe3943210a79391edf136d4bcd6c2f3359 | ORPH
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e544b7c5b27e5908c18a43e578dc43a147c03a5c |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4ba3d845bd30d0bf50c4f58e7b2fdf0fc9c592bb |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e3d6537b6222ff75495bdfcfaf87774ae5c1b28c | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/b893114c94e884bce6fec2f7860c2fbc8ef2f4f2 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/434f709efa5bb662b707ba102c7769d4a542e1fb | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/27e4c1ee5535008f8ed945c59983c08c8001fd2b | ORPH
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/5acb77d67ef685c216ffc658d1572b4d30dfdc2c |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/ef31739e155bc1e7e2dcf807a16930f2453474a0 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/17af7a61bff0d3de8b108b6277732803e6a8aacc |     
   x86_64    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/31c95a24777781f3914b085ce6491e8f1dd78c6c |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/2e6c4c9dfa32795f09877753f40b11ddc3713d81 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/07f0ecbde95373ac3d52478989d780333c09c188 |     
    arm      |       tpm2-pkcs11-1.5.0        | NOK | http://autobuild.buildroot.net/results/89570d02d53ea25835cf9e322b7381940287a9cc |     
    arm      |       tpm2-pkcs11-1.5.0        | NOK | http://autobuild.buildroot.net/results/0e2904dab16ed1f396895c690464a7886b8504bb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/14429b3d5931c4c937c283184c002bd9539f6c40 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cd5415d4d0b640acd9930580b1eee6e818d8468f |     
 powerpc64   |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/a379723f0c295f219a6ffe161c243732ee49e6b9 | ORPH
    arm      |           xen-4.14.1           | NOK | http://autobuild.buildroot.net/results/1cbd292ab8e6cd22bde787753ab4aaf01c8004f8 |     
   mipsel    |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/4e7e9cbf58f69197884ff1fd8b4f13bc02f57593 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/01dc0905abdab2fff1346f11e40fa25b1da8baa1 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/59b44028e733ac6fed0c3b9e15fb2351adfa81a7 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                 augeas-1.12.0 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                     host-mono | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/16564865c915a256b29c9a52b2e1f4d7833e7366 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/337037ffa76147c2e42e8f7455b3f1aaf268b4b0 |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/081f1006e80fc15a0a1b59bd3820404b48a5bcff |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/d434f9af5a11cc3586c30f0d5eeb9d4cf7335857 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/42671a3acafa0df4b8f8641ee72489cdf2900184 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                  autofs-5.1.6 | 1 
                 mesa3d-20.2.2 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/888854da7dd5ee7a6ad9e439dcf670a12e7add7c |     
    mips     |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/a6ed5918ae9a25257e60593361720b9dfa9d3508 |     


Classification of failures by reason for next
---------------------------------------------

                    mpd-0.22.3 | 3 
                  perl-gd-2.73 | 2 
                    brltty-6.3 | 1 
                clamav-0.103.1 | 1 
                elfutils-0.181 | 1 
          fuse-overlayfs-1.4.0 | 1 
                       gdb-9.2 | 1 
        host-sentry-cli-1.57.0 | 1 
             libopenssl-1.1.1i | 1 
                libshout-2.4.5 | 1 
                 mesa3d-20.3.4 | 1 
              netopeer2-1.1.53 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/04d407f0bf7d92a1299b5793317c00aa1da713aa |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/ad3875c9190f48d0b485fb73eefe20bcecba7da4 |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/f18c5bc52719085358bb237bc4e789ceb8254780 | ORPH
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/dafdf527f35296cfaacf1b6bb65d15c2ba5ca1f7 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/cc5ed0cf2ad3e59247a65fb8718f97a0fda52bae | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a44a7e6a9263c6403b93b1352ae45a691adfc416 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/4e7e891252f421e9068c3783e140c9e1015c2a2f |     
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/6a062938356602d5fb3240f9a4c759d554b7842c | ORPH
    m68k     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/ad59e58512c78a462922a3ea2def75251ecd2c4c |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/66af39b6124ae4cfd739ac6e3b7c4ce6737d8da5 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/821c923938776fedad1b6695be71b188fed4b113 |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/7c314c1eb382a0c93015f4d43b0dcc26a95a1efd |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/f57dd67796eebc5e04e7745b2a20baa50d50d5d0 |     
   nios2     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/0d40c921485e699c9138e1ffb4cd2720793ee1bf |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/cef4725d69646f986ba489c26a0acd5406540a69 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9b5f2f7dbabf69f4e7346848191cb588f8c3d1e7 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0d9d6d1bf02a443d7fa7a27ef2b3bee358d0128f |     



-- 
http://autobuild.buildroot.net
