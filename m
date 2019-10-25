From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 06:17:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-24
Message-ID: <20191025061750.1CDB387FC3@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-24
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 24  |  1  |  0  | 25  |
  2019.08.x  | 26  |  6  |  0  | 32  |
    master   | 134 | 181 |  0  | 315 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 52
        host-dbus-python-1.2.8 | 23
mobile-broadband-provider-i... | 13
                    brltty-6.0 | 10
   jitterentropy-library-2.1.2 | 10
                    bird-2.0.7 | 8 
                       kmod-26 | 7 
           host-libselinux-2.9 | 6 
                host-lld-8.0.0 | 6 
             libopenh264-2.0.0 | 5 
             dbus-python-1.2.8 | 3 
           libwebsockets-3.2.0 | 3 
              host-grpc-1.23.0 | 2 
                      icu-64-2 | 2 
                libdrm-2.4.100 | 2 
                libgdiplus-5.6 | 2 
                   libnss-3.47 | 2 
               libupnpp-0.17.1 | 2 
                qt5base-5.12.5 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                  gmpc-11.8.16 | 1 
                gnuchess-6.2.5 | 1 
                   gvfs-1.31.4 | 1 
                 host-icu-64-2 | 1 
              iputils-20190709 | 1 
              libgeotiff-1.5.1 | 1 
               libgtk3-3.22.30 | 1 
               libyang-v1.0-r3 | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.12 | 1 
        python-docutils-0.15.2 | 1 
python-libconfig-b271c3d9da... | 1 
          python-uvloop-0.13.0 | 1 
                 ripgrep-0.8.1 | 1 
                 rng-tools-6.7 | 1 
             safeclib-03032018 | 1 
                snort-2.9.14.1 | 1 
                    strace-5.3 | 1 
                suricata-4.1.5 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/5950bbcab1e41b9ac505b00e6b8edbfcf0c738d8 |     
    i686     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/f28807ddcbfba3d5e4d7496624a441caf61568ea |     
  mips64el   |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/12a14890f39a63f2cbce4a4ca0436e3f64671506 |     
microblazeel |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/f4311f3d3d0297cb4b03a7f105a2505c1eff17d4 |     
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/805e5a019e7e8003e22daa99c8580e30090cb50f |     
  riscv64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/beb4fc67e139ebc2250623ee0f636e9b14f9d681 |     
   x86_64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/a01268590f42c81e708cdcaf3ccab745b8123252 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/61f13a80051c2081dd103a08c03e8daecbda88b0 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3c25e3438ad00970ba568916134fee8c3faaf645 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/695623a8d0ffafcb39425fd2ffc9e7060038952e |     
    i586     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5a2ce0aae1f9fdc30bc8bb3a9a7694bbf1ab3e70 |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d5c86280d69e78a902dcc1fd1ba2d33bae8216cf |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/29a09935c98b54e106aa14c7f7bd71be7edc8867 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e1130dd9cae8708e318ec49221c9cf344894235b |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/629d76a2f23ef97ef1d248bbe88d7904e3bdf392 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d2412c1e6498fd94875d2f914b0a1aa45dda8e36 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5db876290e1d8c6d00a1d99bd4df2893cde01bb9 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ceb6418f40014f68f3ea929f2b116a23b22ec4df |     
   x86_64    |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/44cf186c20efedd2f06096fb5d5e3a44b7802ba2 | ORPH
  mips64el   |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/3ec99b2f8aff54f296af328d462f79f1b3ac7cc3 | ORPH
   xtensa    |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/841c4d0f89247fa46f7a10bb5529218c9f87d623 | ORPH
  riscv64    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c99da94417cdc616147845ffa0df7fba8cb1c4a5 |     
  sparc64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/e52f46d5ef8cf65a9ea5a71530013615bd4c7667 | ORPH
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/d8e8c658476c4d51b9fd13021b293b1890292620 | ORPH
  powerpc    |          gvfs-1.31.4           | NOK | http://autobuild.buildroot.net/results/166a2917c542ea85e10797698fb00d32390196a3 | ORPH
  powerpc    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/6608f65d8ffa5a657db860284c7d26712da04446 | ORPH
  powerpc    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/d4f200bdd384dbb110dc9a805934192124064673 | ORPH
   xtensa    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/f4c62a753324c97b1ac5cc0e6e2ef51fb500557b | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/8ee25ca54af6176ff9f96fe7a0f7bc41ff1caae0 | ORPH
   nios2     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/78ddb3894cbfcab7e677b957ed9bfe56e5f20d67 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/3ee39a412e4d7dc7dfb627943c88e33c3ba0596b | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/e311baa45214f0200ec72a762f24f7e9682e0cb2 | ORPH
  riscv64    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/32f4888a73a2beea9b145fe2047514c171160223 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/cfd733a41ae6e41049a57a952baa85b3ac7de2cb | ORPH
    m68k     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/f94e0922a53a042bfbf2e6d37cf47eb9e5d732f3 | ORPH
microblazeel |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/366f464a8cefa5fe93f18bd12dafad2badf92731 | ORPH
    sh4      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/1ae4851498d5e952cbd5be7bd73a9cd47609d030 | ORPH
microblazeel |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/f55e2a43bc068b354082e749272422a74e01d292 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/d9e435345d2c8b9ae0dcc7c2884006191bf5779a | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/75819abdd64fa590c9bdfb317fc21e2abe7b4c19 | ORPH
microblazeel |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/7caa504f7513e7853d7b3c9b2a1d3ee87a818e3a | ORPH
    m68k     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/618b650de13e1d7a06eb54a3bcb761d8bdf5c383 | ORPH
  riscv64    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/0c68f79de1b1e258e95d0965517d17dd25ed7029 | ORPH
microblazeel |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/3cc6cea0ef04ec944a4c90ec2638f294160bf77a | ORPH
  aarch64    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/1631785ab8badfd5829fa6dc72ae7353f4c94a6a | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/5cb2008c703fcd36c3140f43ab5934950e9aa674 | ORPH
    or1k     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/96ffacbdada9eb0bf04803ebad6070635d220ff4 | ORPH
 aarch64_be  |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/2ffe375e7849f40369ab6e971ed91fe622f6ef08 | ORPH
    or1k     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/267365d97a44c2b7345d8bd0185bbe52606458a4 |     
microblazeel |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/9962accbc4f1e67f991052f4d57cfedbaa340cab |     
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/01162ac0f73eeb051d6c9570961d1966d3d0b548 | ORPH
    sh4      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/608f9150570342f604ef977b7240f162cb33e12d |     
   sparc     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/13ba68c05e9033262b02caf5f4acbc1e2aab13a3 |     
    arc      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/a9772ff604ec47b5fc5f3e08555ad79040a07f7a |     
   xtensa    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/04a524cefa14fc9d29c8003750a6c6ee4e2a8f2a |     
  riscv32    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/12cd860ed3f03edf6414d2c5740b937f8ad20ca7 |     
    sh4      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/019b0ec1a94913ecbad78614b7360008334e966b |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/df29bd68a2fa8bf0d80ab2d84dc9f14e4ec16697 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/933a6daedff555b6c4034a72baecb42a837b007c |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/9a0534c4206b40963d32494ff9675543e78125d1 |     
   x86_64    |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/0e3613c08b3ccaaa902b40199fd59c6b35992d9d |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/bc7d4e3ac455332b10d0268055bbdfa096a032cc |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/8123bb08c880dbc47f8c59cf8b200578636149db |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f47b333c64468a2a6a2c879e72fd911807989dd5 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/216b22d94328c263b1bd841632258a46333b69e2 | ORPH
    i686     |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/db1740b4777f436324218c52bc7b08e5c21b667d |     
microblazeel |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/3ea1031baa1e90c974ff65b09c9b67871f234317 |     
microblazeel |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/9d7702bdba1009da50c5a6b2182b43cbc60789fe |     
   mipsel    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/29eb3f32c4aef5e4e27a7a57aca190b3ca8bcdfc |     
   x86_64    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/2ca22400894830b2ee725401e2932941a5206359 |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/050fa2a4bfe47b761a42703369dda5cdddd3cca5 |     
  riscv64    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/08a9dc2ace7ed5fbe43328db0ddbcab67cdaf608 |     
    mips     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/ceab2c50fefdedf93bb0394752fcc560625b5323 |     
    or1k     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/64443d59da144874315b3917be29bfa02544ce09 |     
    m68k     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/27b19c964c4457dca69639e1913ce44f010853ac |     
    mips     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/646afe80b7e613ffde32deca15c49e9ba5490d33 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/14213e551ddf81b2581c3f7477367e3a07d439c3 |     
    mips     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/538cbe05854178ae3b7f01c7f3558193fcfd45e0 |     
    or1k     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/adf537125825252fef8489f50c294d56a8e49a0a |     
   mipsel    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/e11473c8ee8ab40f13aec989b19d8b3b194e39d4 |     
   sparc     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/293d4284c6f8d6ba078097564fff2809bf913d5f |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/f24c9eff226fcf76cbfe200e7181413197e25359 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/b0bc544d88a355c692d1fb1f4806aa883c873488 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/1c9fa3de162831ff5c5bb3fabe1c916745db8834 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/3c27802e2e4eabf66c0bec80cb79d058a84933bc |     
    i686     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/f64d128d574cf2ba0d1db36f529e550c17e18bfd |     
 powerpc64   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/a53393b5f5e11ca5c69a3373e24e6202fc74dbb2 |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/38abc8229f58dde68a7b141a04a1895b2741394a |     
    arm      |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/59a228c17252b45fcd2eb220e47536559de6f67e |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/a352d2a7ef36ad014d2ab8067363fd6d0b8efca9 |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/1bca1ffc02b830b87663a376fd7b63911e9d240e |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/6f962be763065d60465ec7ec754d11bf17bf62b7 |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/b18c2e7a843241dd42bf93d4c25811fffcfd006d |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/37255b09c6a11488650a535d5b5916d6e415654a |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/9110e72799cb6c5c3f2699e1aedcbed8163397f5 |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/80fcca7a49a9ebfcec4c4e8ba0a2bc7e1638e538 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c70e2c24995dfe0c7ed24d97edda28e031d14069 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e4e3f95ce852ccfd3315ad522679d6cfea826049 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b360366faf4a7162279b01e4073949eb270991eb |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6c48a1aeb7f9799e15db115570cb55bf5713299c |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2491c961028c52ee315543e88c2e6b5b49c881cb |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/467c3246ff77a0d0cbf35506f9debd80f51dadcf |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f7a2a411b08a80e7db5d5933c56224b87d7abdbc |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/624a3fca82c3fba721f87682735a691569602e4d |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3a58bfe857b68bf5c4ebebcdf43f6629f7e8093f |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9164d91fab06e1b70cd4bc7ca0221fb71313f653 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d9ad05cb3d5c6304479044da3a0128b55fd69472 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7a28457940e681cb9f5953b8c675db9fcd982a0b |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dd9e9a8c59958454f2a26baadb5b1f052c1f1ccf |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a6a239585536aadf926f0daa549081d1e9eeeee7 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3c05d4dfe49e36328582b6566cbdad840e7f532b |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a86f66b576c0e1eb4a48f353f046195e2877922b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6aa603e5ba8f88a7b473384a053c2e3be601fbed |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3d1119ba42eddfc0269e261bd64b53cdf58a86fb |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/56b2bd9ebc4c0120194e971db5140353022465e8 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/92e436ad0ad9660ac34863566a3af92f27d46b48 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/62c7712ea038bcfe7a68e26c26625e90da2a3bd3 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0ae79ae8fb137b5757812ee8f8b94b5444ae6b0e |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f8c6917e3dc9462fa64e1425af349fee7c15da94 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/12fec856c6a3f8cff2d67614fc2f55f8a93e01c2 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1d88db04982708c90fc7de91c88b6ae78ce6440c |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/37e9f1c6b1428c8ab676bbb96a53522d15f69f4b |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/67c3d67851890a06fc3b0c253200a881a9200281 |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2c22664bea98d28541811ed15b9ec4df42fb17e6 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/249c0928efbeac97db4f4030905cd827332ba82c |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7523594cd2358c8378c2be21525599adcf8e3b66 |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/24b1691616f51bc4143a784e643e06ee1305eb20 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1611135435fd1bb241f5bc9826386a8b5178d9de |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7e5c0826df74e5f35a49062079f3a71af4f5c64d |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/29689371c2425acf8e42404d4261a8de3ee134e0 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ea1ebb87a5aeb6a0f2604e5f9d419392c4ff3ba4 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7334e0dab0b45137f2d5ddc024dbb6662e4dbf62 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/74a93b80116634510b29db4a10dab678bd52fc15 |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a25333a15c7650362ea43e94b5aab392cd1ae22a |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b5ce2c7d766f7349f625f9b7074ab1c01b1316a1 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a4efaf1ee9bb51e92c8c24e981e9c2311fe986ac |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9147357fdb0f4be8020803fc3e9ab493fbbcb8fb |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/79b5930c7abe4c59834716cb51d1e7589571912a |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/48c1d6fd5a8ff8dc04673eca9abe58b5de7c7298 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f577f301216b8286433c4a9cdaea42f2d4433ded |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b837507c7ad4a9306907486fad30cdb1a42a8726 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/37039bb2c7d45e3831c1e45804789a5b80fcad85 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cae52b1d9616401d339a79ea5908f2865b1ea475 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/20b35c0847f6c9079936cb7f654fb1ef0019e70a |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1d2db474263a4b80ea8e12dbffd3658f72fef89c |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/49bd926e8daa9a5e72745cf9897af18c5202e455 |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/08a2ea49fcbb98273e72b7f57acdf500c837bd8a |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e78493537a690e003a62d3051180c70db3300e69 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/1932908e0a492f2825af4bc0935faf6fcb76ae70 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/587a1ac46d34e650f4ea1cb424780b576e490d15 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/63c7ffa5643796220ba724914d4878a9ece74035 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/9ce09a12eb9c740da8ff07f8ce662cc89b3d0196 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/cc3b47e0a6e1a06ca389709ad14ace70682a45c8 |     
    arm      |        libyang-v1.0-r3         | NOK | http://autobuild.buildroot.net/results/c61d1f7bf664550a70942a147ad4e0b0e67a1b81 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8fa2416a146b45c901c9eb35e2ce1186ca3dd081 |     
powerpc64le  | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/45cb4f4ff6b6097ccb17d57608d24efd720c8d9c | ORPH
 powerpc64   | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/8f740f31aec7afa0dc9a7af3e0bbbb406a108015 | ORPH
  powerpc    | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/68f74e31f483e3994d78ac1f22321cce1ee55b28 | ORPH
    m68k     | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/dbb6e28d757ad5e1326e2390add214e7091173d7 | ORPH
    arm      | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/824c5d67f12fa1a9ce31f2698eae986f14ca69ae | ORPH
  riscv32    | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/f0545833254bfb0375fb7d31085e84f9eae425db | ORPH
    arm      | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/9b5ac6e169bda64d4d3eb39c16fe33ae68f7daee | ORPH
   mipsel    | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/b42aee4e5e6727e0de1580f232992f4448057751 | ORPH
   xtensa    | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/5a5e3d9dd125b24e7385abb78349f1a189e314ad | ORPH
microblazeel | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/98eaaf34b18f3ab45ff9d22244f7707dcfecd443 | ORPH
    arm      | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/b55828c0affb3d10dbcf5ef1b763a9c52dc0f3d3 | ORPH
    arm      | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/ca496c2a2ed48f0311a1f012e87d1d4937ec5246 | ORPH
  mips64el   | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/3782995857942ff0fde18fb89e28e88d21413b52 | ORPH
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/6191260337d39ca2bc34e5f70c53e7450f76087d |     
 aarch64_be  |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/8f3c01f0e286c6b15c8c973f91dd69ee816a58b9 |     
    mips     | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/6a51a4f0628a95f38ed220aeedf0f32e7019161f |     
    arm      |      python-uvloop-0.13.0      | NOK | http://autobuild.buildroot.net/results/bffe1b2ee7b674f870e15398680ce5b5b22fd296 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/e095770bb4cc9c439f68053982a416abbd4d1806 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/a8c05221737f9e65169d882ea5edcff3090cc5f8 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/b4bada1d3342bbe93fc6b448b28fc86df07c5e91 |     
    arm      |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/fff63dd9a53eafe0234ad19f715f050527afedc8 |     
  riscv64    |       safeclib-03032018        | NOK | http://autobuild.buildroot.net/results/7618eed47b9d93ca6f9a19b70aefb99654bc6ffc |     
powerpc64le  |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/297d41ba98b0c16c77fd2a1bb93ab221012a77b0 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/af653cdad5b76495236e84b2754605eeab14be3d |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/49d40181f0678aec6036e4d6af7369ff64e4451b |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8ce5e8aa6c070218cb904163854a4130fe9da98e |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                      gzip-1.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            gzip-1.9            | NOK | http://autobuild.buildroot.net/results/81eea5bb4bd7aedfa2657f470ec26d832afc7325 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 1 
host-google-breakpad-7515ab... | 1 
                      icu-64-2 | 1 
   openvmtools-10.3.5-10430147 | 1 
                       unknown | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/9823ded5988ffdd71cadd4e1855d74b375b34a38 |     
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/95e1d3c61406a8bc84f0bd3c36cf0b705ff45c0f |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0ce61d892093597a53c7244067288dc093ff6081 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d9338a52c50d1be13e8f9bce2ea5f78d1bb01946 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2107a54b9fbf0a580ccb692fb0dc2a883543d994 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/904da1c8a21186f7d10b310f7fcf7c2f01c45f14 |     



-- 
http://autobuild.buildroot.net
