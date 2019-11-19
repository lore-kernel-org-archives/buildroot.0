From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Nov 2019 07:17:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-18
Message-ID: <20191119071804.4F62022643@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  1  |  0  | 13  |
  2019.08.x  |  9  |  3  |  0  | 12  |
    master   | 99  | 42  |  0  | 141 |
     next    | 14  |  6  |  0  | 20  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 4 
am33x-cm3-11107db2f1e9e58ee... | 3 
              host-grpc-1.23.0 | 3 
        ltp-testsuite-20190930 | 3 
                snort-2.9.14.1 | 3 
                libdrm-2.4.100 | 2 
linux-serial-test-5d11b31d9... | 2 
                     lxc-3.2.1 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
   openvmtools-10.3.5-10430147 | 2 
                  cmocka-1.1.5 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  flashrom-1.1 | 1 
             gnuradio-3.7.13.5 | 1 
          imagemagick-7.0.8-59 | 1 
                libselinux-2.9 | 1 
        matchbox-desktop-0.9.1 | 1 
                   ogre-1.12.0 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                qt5base-5.12.5 | 1 
                ramspeed-2.6.0 | 1 
                    strace-5.3 | 1 
                supertux-0.6.0 | 1 
                    xen-4.12.1 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/4df711c7e1acf10e59ae665774931e4085f5c2e2 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/3ceff5f2635746f50c47f95ead8dd7a98f904ada | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/96d22f06307eeb89b266b8e759ebde8f5513c375 | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/f0ef34cc0e034b14fa1ca3c83b0a0baabf6f7aad |     
  mips64el   | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/a73406eb780a454369ea997654b6b4c6b3757a41 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/c37d07852a4a98d008d6ea07c2ef4bf6e24a5168 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/0dc7318ff69a6cbb043d931b881dd30025d1eff7 |     
   nios2     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/6fda33a7d6b48c1a471eca614ac0127d2bad2b3a |     
powerpc64le  |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/cabd82ad7099c69b8c127be1c573d869c0b59c9d |     
 powerpc64   |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/8cfe92af0a0b7e05de32de9a328a9267177d8236 |     
    arm      |       gnuradio-3.7.13.5        | NOK | http://autobuild.buildroot.net/results/e54323dd8051645041ead67a6255e2e666f74294 |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/5fc62bb58ede7a9b4568fc9c763624fa258f5be5 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/3053a67a6fa28df8635a50eede34d819c53a588e |     
  riscv32    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/f228a5ae4e138aee2c10f4605114dac702ccd681 |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/86319f758703ce722597b382434e8adadfd3ee76 | ORPH
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/4e22b0e31053f63250dc9dd22fa9e147a64d6d63 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/f0efc431b3fae7267c6d4354fb4dc78300e0f7e9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/71486e083f72d02f8f34f639fd559c596605b784 |     
  sparc64    | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/d739bd7e19746c0fc3d634d263ef871936c71517 |     
  sparc64    | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/e9273194d369d275821f4f3b4f62748e10759a54 |     
   x86_64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/a38a5d8deaa365f73db427911df68dd10c6930a6 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/dfa173caea08876ab69dd959da146b75750cdd28 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/1e602f1574e9134a44d5d66838e7851b38e8069a |     
    i586     |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/5f3367daf4be7669202dfac0abdcecb2ce3a2452 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/ae5a4d40017c874d7de04e077409e639a6a78691 |     
    mips     |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/f6389bc0ab776f69917c0c845b037fc0cd4f8223 |     
  riscv32    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/8e57fb3fd7c61bed958fdb889ba99d22e7e9866d |     
powerpc64le  | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/f6ec3eb8f7a2022ac0d3d3d0df388c80e9c0eead |     
  aarch64    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/048a091b10c8e250d50931ee65f9bbf4fba00369 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c3fdcd0049dd9d84e6527a6abdc8e0fd7b1c4276 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/41f6b15e24b88d0dfdc8f9cd65c2ef1755bffbf4 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/4e5681333d10ec967174bd8f751bbe25f0bf79da |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/b3ad76486c3fcdd64cf4556dd702bbe4a772de91 | ORPH
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/47dfbf5abe13c943acc3145c818086a070c9d985 |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/cf2452e592e0126acce2ec1dff357ee557e2bdec | ORPH
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/5bc70e529a5467db4e02096af08aa54988b41f30 |     
    i586     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/d1c9523ee3ad819acdd71587cba0f2d66f860f9d |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/628f29f4f397bdbd171b8584407490444071f85d |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/ef27ea6fccb6f396515a56ec785d561d9b60345b |     
   mipsel    |         supertux-0.6.0         | NOK | http://autobuild.buildroot.net/results/c23e3d9bf6239a74243a81c9df7293064cfd279e |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/d9437d5ca6ca3b004fe96ac155dd95f18bcc2172 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/9f3f81d60308233e55e3d979e5015f4b60a88331 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/51769571efe95add29a05c4ddde4b30c4f488bd2 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

host-google-breakpad-7515ab... | 1 
               libupnpp-0.17.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/124dff531ad0fc316a3e48adc14eeb36c8c8b34f |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/cdfb00f6b677f02ff8c906c3f0c9e04abf214e22 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a612cb7a85927d8cfe55c95c34d2901e7694fab0 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 rng-tools-6.8 | 3 
              host-grpc-1.23.0 | 1 
                       kmod-26 | 1 
               log4cplus-2.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/73d9263eeb5906e44a1b56f30fa7923b78ead7c9 |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/d1692cb20bc5795d881bece79ef53f7145fb14c2 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/fe7bfd774293637bf0a18c086ed073c6af5bb88f |     
   x86_64    |         rng-tools-6.8          | NOK | http://autobuild.buildroot.net/results/c7234ba41a8e29cb2beafde30060cf8efc6eb944 |     
   x86_64    |         rng-tools-6.8          | NOK | http://autobuild.buildroot.net/results/2787fbd3453ce3db9954a075abc0bee0ba385c11 |     
  powerpc    |         rng-tools-6.8          | NOK | http://autobuild.buildroot.net/results/c2033f89436218397227368272f9141a3b0da923 |     



-- 
http://autobuild.buildroot.net
