From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 08 Nov 2019 07:17:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-07
Message-ID: <20191108071731.04A5A85E93@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  0  |  0  | 14  |
  2019.08.x  | 13  |  6  |  0  | 19  |
    master   | 113 | 60  |  0  | 173 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

domoticz-0f411f781ae4fb4a82... | 6 
                 gerbera-1.3.2 | 5 
linux-serial-test-5d11b31d9... | 4 
                  ndisc6-1.0.4 | 4 
                libselinux-2.9 | 3 
        ltp-testsuite-20190930 | 3 
                 ripgrep-0.8.1 | 3 
host-google-breakpad-7515ab... | 2 
              host-grpc-1.23.0 | 2 
                       kmod-26 | 2 
                libcurl-7.66.0 | 2 
                    strace-5.3 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                  flashrom-1.1 | 1 
                    glog-0.4.0 | 1 
                 haproxy-2.0.5 | 1 
                host-go-1.13.3 | 1 
               host-llvm-9.0.0 | 1 
                  leveldb-1.22 | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
                   lsof-4.93.2 | 1 
                   mimic-1.1.0 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                    mpv-0.29.1 | 1 
               pulseview-0.4.1 | 1 
                qt5base-5.12.5 | 1 
               qt5webkit-5.9.1 | 1 
             safeclib-17102019 | 1 
              sigrok-cli-0.7.0 | 1 
              spandsp-20180108 | 1 
                   sudo-1.8.28 | 1 
toolchain-external-codesour... | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/0f4de8e8312f86dec11851b3fb717244891a2423 | ORPH
    or1k     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/1d0e29b0365f1192977b1fb2af6e33811dd6e113 |     
microblazeel | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/fcdf6e05757bea0555f2ba2b0c77cd754f7a1f2d |     
 aarch64_be  | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c6d1b7a11d66db240d583f8fa416692fcb4f598b |     
   nios2     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/0a71a06f9914dd8f4d29f11b82220ace9d1bf428 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/dc9b3190c204eac6bbc52812c50b4f2754e6342d |     
  powerpc    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/921fd347828ea9d11cd7bff8fe3d1b9fdf5f21d4 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/a6d1285918d06f413a9ac52f2ce8e335c35cc30f |     
   nios2     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/347cfbe498f59e57738eeee1103e5a726f0eba3f |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/fa0eb7f420158ddc74b075649e8d6465c12d0369 |     
microblazeel |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/a6d7e6dcfc3b3a1804e366ea88e6650fca80ce68 |     
    i586     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/60ae61948f8e54ffd7fadd811f18efa745b51c1d |     
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/f1a5094929c429d094e9a40cb3d5a5c53dfa374c |     
microblazeel |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/a55cc3c1b99fc27dcfdecff980e07043a061c119 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/a2c4dabefe8c06d7b479bf4e7782605cfbd7151e |     
  mips64el   |         host-go-1.13.3         | NOK | http://autobuild.buildroot.net/results/3d3665585af2b28cd2b2a22d271650ce8571fd88 |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/1dea8e07de39f3e4afdf13526265a85e110896a5 |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/574b93037285633a425ca59a1450e72db47d1182 |     
  riscv32    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e7d8a96e5acba06e960afdda56267f11917d126f |     
  powerpc    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/eab3134c2d0108d68a29be2b21d28734159300b6 |     
  riscv64    |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/5e2f6702c100450f498d9739d9c48bbd6cda0d67 |     
 aarch64_be  |            kmod-26             | NOK | http://autobuild.buildroot.net/results/b2f8e18e3524cd774d17bfc4219f2f48220e7f9c |     
    mips     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/39acff57dec4f1de1e246b6b13e3ff7c87163e46 |     
   sparc     |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/01d5a50581ac9e9b46f40e6f9665f74897db5e6f |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/29502af9fda209bafa790f1e271072624664b1e5 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/07519040fdeeda8bd4ac9a6146687e8f0d116734 |     
    mips     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/f6beafbe31fc677c56e42f7c26aba85597f2c2a1 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/56ab91b8443e4422dc14c59493b2fb8b2da6b592 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/767ac5819ac0e2d2c0710045eb2b49c3d6fa1531 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f59372d0fb0d37ec6e171fbb779f39b93b9c0f81 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/9ff189fb0dfd87c20f94b09a03d45ba50430cb5e |     
    mips     | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/17806917e375f6671136630d1a109499237d6cf2 |     
   mipsel    | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/b988ab9f8942cf2f2030e3fe17d163340d3bd2d8 |     
   mipsel    | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/47e170ef07b5176087d71be56aa77258285955a6 |     
   sparc     | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/ef77cbe220619050eb9d46c78ae79a94eea8aa8b |     
  powerpc    |          lsof-4.93.2           | NOK | http://autobuild.buildroot.net/results/65f842ffaf703d7de84c8ac69c0154fed24c812b | ORPH
   xtensa    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/f9129a6f55cf74eebe5fc0e5fd3b80a5a0fc37a6 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/855385c2cedfea1daa804154a6d730739495d958 |     
   xtensa    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/7002e1c3e96e5581394853a01f44bfc6e0222d5a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/124ecf25e13d17d682d6368eb55d8215496163de |     
  riscv64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/1e3fb81a01e8541fdde8bb7d1fcc160fd799600c |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c4404eb196c662c2363ec0252a70f5b757f0b062 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b49a6d7092c3b71a41bafac182266e99a913fe15 | ORPH
  riscv64    |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3dde573164866a2a18682a173e44d813c1a3e7bd | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9c9e176f597245eb02307a4c40c5d1cc3ac76ac1 | ORPH
   x86_64    |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/eecbb0ee0901735db9d5595d2d6b91bb22cca3ca | ORPH
  aarch64    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/5c5b04cf8bcd8ee3c41f58ffb62c6dc40b93a44d |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/abc28f192edb0e4aaa21f396d38d7f056b471e9c |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d140fa4062516de3b131e52ac6e097c65ed9de30 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/c3a2625ae4cbf763883015e052d93e414beb231d |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/42ae05f7503dddeae3c232a00c504b04f33f904f |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ae5ac58c180c65617a1e384c028d915d6d1e5b57 |     
    arm      |       safeclib-17102019        | NOK | http://autobuild.buildroot.net/results/1253701372c2ef7e3c47c55ab3cc94fbc1bcd99d |     
   nios2     |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/8e53ba86deaa0ba498a0fb4a6be46809268532ef |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/f70ae1ec92d6ff70e05486f52e49ab3e5a84fc30 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/5a22bd0538126a3631ac64d4e6ad3aa14bdb266a |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/8043c50a0e208dec7de5a44bf483e529c43a23d1 |     
   mipsel    |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/b68ff3d009e42b0e09d52fcf91e08313e093a22e | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9ccbc2fef6e03de656fd35c3df3685f742e6d5e1 | ORPH
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/a4fdf753ef55e4cc4b7d7d3efda146aba9aa7251 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
              host-grpc-1.18.0 | 1 
                   i2pd-2.24.0 | 1 
                 libdrm-2.4.99 | 1 
               libsigsegv-2.12 | 1 
             safeclib-03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/448164bd5d732d8b3b2355fdd6e4f9c55bc9ad0b |     
  riscv32    |        host-grpc-1.18.0        | NOK | http://autobuild.buildroot.net/results/aa69f90faddf8b482ad4913b25ae1faefc0adbcd |     
  riscv64    |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/f327bb3c093a3918e8346722aff60f3a1badaada |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/f1c7c3902d3a72c10361173ff5fb705574822b53 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/b041edce2473ecc3050f706a3fae9bd078a85086 |     
  riscv64    |       safeclib-03032018        | NOK | http://autobuild.buildroot.net/results/52f45843ada01d55b57e93dbbc58bcd8a046e7a7 |     



-- 
http://autobuild.buildroot.net
