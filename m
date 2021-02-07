From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 07 Feb 2021 08:15:30 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-06
Message-ID: <20210207081537.7DBAB85E6D@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 26  |  3  |  0  | 29  |
  2020.11.x  | 17  |  6  |  0  | 23  |
    master   | 168 | 125 |  0  | 293 |

Classification of failures by reason for master
-----------------------------------------------

                    mpd-0.22.3 | 15
              netopeer2-1.1.53 | 13
             libopenssl-1.1.1i | 9 
                  perl-gd-2.73 | 9 
                 pixman-0.40.0 | 6 
        host-sentry-cli-1.57.0 | 5 
              iputils-20210202 | 5 
                  zeromq-4.3.4 | 5 
                  dhcpcd-9.4.0 | 4 
                 mesa3d-20.3.4 | 4 
                  monkey-1.6.9 | 4 
                libselinux-3.1 | 3 
                openblas-0.3.9 | 3 
                   perl-5.32.1 | 3 
                       unknown | 3 
                 dc3dd-7.2.641 | 2 
                host-go-1.15.7 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.4.8 | 1 
                  bustle-0.8.0 | 1 
               capnproto-0.8.0 | 1 
                clamav-0.103.1 | 1 
         coremark-pro-1.1.2743 | 1 
                coreutils-8.32 | 1 
                elfutils-0.181 | 1 
            erlang-jiffy-1.0.6 | 1 
          fuse-overlayfs-1.4.0 | 1 
             gdk-pixbuf-2.42.2 | 1 
                hiawatha-10.11 | 1 
             kismet-2020-12-R3 | 1 
          libmicrohttpd-0.9.72 | 1 
              libostree-2020.8 | 1 
                    mpv-0.33.0 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
                    orc-0.4.32 | 1 
           python-pybind-2.6.1 | 1 
                 python3-3.9.1 | 1 
                    qemu-5.2.0 | 1 
                rocksdb-6.13.3 | 1 
sox-7524160b29a476f7e87bc14... | 1 
                      tio-1.32 | 1 
                  waffle-1.6.1 | 1 
                    xen-4.14.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/83c68c79497867e76bdd60e44bb0b040de3a258a |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/1e247ac57f8fd0f258dbf240adce137f7bca82c1 |     
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/8b085ff4f07bede0e6c553b9b29794f66f3eeb45 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a0cf7368e5126ff7a5a518e6ece552c1959dc9b3 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/28a76ce53f6bc9670097f46fa209f2514987f94d |     
    arm      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/50055e8ae085518ec2e166c5344451e6f1bb2fac |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/b60ca9d83f7ef7d3899e68afa4da51ce54b47e00 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d443b38197528fcf9f1251c771d68d710e0b3ff1 | ORPH
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a6a31b165d4014c08f22b319518ce6753cf8c3ab | ORPH
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/b232675e41b184b1d9478faf1985e9eff28b9dd0 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/7c06ffdf7b0906d7c651d3f6ebdc84fa5afb1d34 |     
   sparc     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/e8dbb7cfedc90172e47b4a73d4401808d133eec5 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/0e669fec4473490bb4816a5e10b9487ba0cf465b |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/58ae2a4a42006b38e7758913be073fcf5b231921 | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e9c45ca43df2b9bfb277c69a4e39c7a12f1e65de |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/2c3ce96d1fb65087a601c6698f39729757b7f975 |     
  riscv64    |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/21c8ea8706bb73b5ff62a0f98e0794d758bfd80a | ORPH
   mipsel    |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/385b8ef86aa311751c08e3d91051d2f42da22eae |     
  mips64el   |         host-go-1.15.7         | NOK | http://autobuild.buildroot.net/results/0fb3875e5462b45044d72e04f35b9a835f503d2c |     
  mips64el   |         host-go-1.15.7         | NOK | http://autobuild.buildroot.net/results/4f47eed63fb9bdca854886601af636389f7cf26a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dcd767c7a94dbfaa729646cb0abc261235d8c8ab |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/333724e3b079c96e75a8a880db3297f3288ceb31 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b107424a323de75bc6a1ba3382ac64574007cae7 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0f95f5d8bb69bc56f235b1bff98570d6d40d85b1 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ec10225ca4a6968f1b124339ea47acbeae5e385c |     
   nios2     |        iputils-20210202        | NOK | http://autobuild.buildroot.net/results/a507bbe568f4a32a01c26907c1b9036218225d83 |     
    arc      |        iputils-20210202        | NOK | http://autobuild.buildroot.net/results/6349ff957948d7ff66a88ccfab27cb74c945a430 |     
   xtensa    |        iputils-20210202        | NOK | http://autobuild.buildroot.net/results/fa77f6c546d5576bacc80c00cae32a587e6c7e18 |     
   x86_64    |        iputils-20210202        | NOK | http://autobuild.buildroot.net/results/13948cb288ab04e5550b8297525d2bdb9d732213 |     
  riscv64    |        iputils-20210202        | NOK | http://autobuild.buildroot.net/results/543fe633528b12f06d76a379a41e39aa97af25fa |     
  riscv64    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/8aa7dd0ba71a6175e50e51a3b8141e87889c379b | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e6cf204d8fe7779c3a82d0aa3a6995dc17d82613 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9ded157acfae551c7203672aaaca84aa11b4c51a |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/8931424254029add7edac6231b3fd1a5ccb34437 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/c79f286a100cca7dbf0333f1da8574b57679c655 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/668fc8d35abb9454ee298ee99fe92a0725784358 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/7648afa0032475f0a65abe6c2c973a5d470521b7 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/eab4babcf983f340a0c877cc50b9c22d0a70b873 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/cdefd4a7160da698489813a876b36a226e4199a9 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/02cc62dc3043dcf40ba597b9f9136bbe012b302c |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/24912edcac02a9fa26f8effcd31e29fe62d87678 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/41b352ee50d006bd552105629b9e46a2c1c0e33b |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/91aeabb77b0854f88a13f0aeb9b8bc709c5a334f |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/99b8f53e7bace7b3bffe74731031d5e11147935a |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/e319a2db5c1b21535941351e8665ef697451bbeb |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/aee26470a68640a7617285cab07bff4185d98b79 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/636bc97ea6a87863f8995e03b539496131a7b3d2 |     
  mips64el   |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/c6ac2f36d0d77f3fd77f580e9c788076b1325701 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/defd0fcd26fff2f6273a58c9a4000ce1aff74566 |     
  mips64el   |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/313e1bbb9e7e53f23421b29b16ecc7857e89cae3 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/dd8a8e05dd1a64d143088906150ac9ca2e20df89 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/c1ea8e3185e3ef515f88aca0121cbee9ab014296 | ORPH
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d6c61d5d5ad3342e0cc7e859a6a20a20c58bdf3e | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/dba6d8b9b190b90c5b4ffcbda413885cc3397859 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/764ac15c2308505e0aab77409825ff0be22c73ac | ORPH
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/a6697ae2d5f4ff956122b62a460e58180c63bc22 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1b93c5ac02187a6ff49758f6ba5f2fb3462d43e2 |     
   s390x     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/6740a42773e6265076484f1941f730fa561f329d |     
  mips64el   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/527f752952654f6942136352769121d78155ec25 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/38f898658d491153cb2fb843aa62dcbbee3249df |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/7f1570584b84fa330b53a2710856f87ca5877346 |     
    sh4      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1a6aff88c1645252a167e2ed56543620f0af6be6 |     
 powerpc64   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/f17d83d31ca9a5e3692019fd374ac9186a444ec5 |     
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/0601ecb7264d3d4c2496c885db2abd6b495e2726 |     
   nios2     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/3e78dcda5156e446591ff56450b015513ecac336 |     
   nios2     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/2ef9bfe65a103576cc44147c31f6f45ef749fada |     
  mips64el   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/f6106ce9ce28cb82db21aee378d8a21aefe1ed95 |     
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/c1b88aa4c4896304cafe6967830f16228e76261f |     
   nios2     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/f16a5c64462242df6de5c50eb19092cb2f95ba86 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/dc622347412c524023cea492d17f708fec8c1f78 |     
    i586     |           mpv-0.33.0           | NOK | http://autobuild.buildroot.net/results/cf65d760419d4bf71981d6cb89a7c0834e30424e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/099d8f26765962f117915f33baee79d73356cf9b | ORPH
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/091044f1ca44968972ad2763988a8fc694b5edbe |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/6a8487da5ca93d656748510268832ab975e750bf |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/0e38cc9996f72b64201cc7518d00b73516e76f87 |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/b51e7d88dfe760be8ddff8c2474d57a9240e7274 |     
   x86_64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e4dc4348685b242ed8ec66d559034bed402186b0 |     
   x86_64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/a5020987f8fb9a7964f3e397b676befbb1994546 |     
    arc      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/9284f7f69bfba158eb9ea1733257615f46c1562f |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/fc294dde5b2165a58a468259499554502ab8d1b1 |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/f5bc4e553b4ace996549ebbe8ff513f18c06bb61 |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/fafcda33a641b05e25bf5a38ba38cc1efdee62c6 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/cd013d85044ab8d93508bfb8d2b0ff0fd61a180b |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/77b88703c1e886cb386636a969316ec55154e666 |     
    i686     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/ff754c929de44e0bfbbc412eac593d8aff60f6d8 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/e5060a6241096ea58a9a3c6eecb9d66da6d6af0d |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/9819fa8e5b56f401352bb2516a8c84e2305b3dd0 | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/93582c0b8e8cbb25590b0f93b03cb16fe57c7b09 | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/694de0fbe2617c16bb8526d865aa93a45b1d0a87 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/8636b3877edfa804bd316ec82f7640cf982b983a | ORPH
  powerpc    |           orc-0.4.32           | NOK | http://autobuild.buildroot.net/results/7e4e167a5b3e186b26fb87cfde92ed1bab69911f | ORPH
    m68k     |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/e28b47d94becc1a2dfdf5495634bfeb0bcb39579 |     
microblazeel |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/62b0bf5198f6922a7a81312d5f826f7bc691d247 |     
  mips64el   |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/fa22df0f4a9fe7332854a60f6454e00d3a10f18b |     
  sparc64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/6eb8e9297932bee85d59b725c62e6af9e7187462 |     
  mips64el   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/71b668dc53f665f4ac13880819b91af3876096dd |     
   s390x     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/8c5078515babc92422e64c626139c1d6e351bd5e |     
  mips64el   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/5c481522440265c96e74334dbc9acd1ef643332a |     
  mips64el   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/c51700a9dae0aa901109395df9d74387f3407af0 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/94e4aaacc6b850c13add30ba265bbddcfd47aa47 |     
  mips64el   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/2a7ebba248962e48e3b565fcec0e7a963f75fb3f |     
   mipsel    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/8e53c073c905b94529dc5a30cae43d0976a3ede2 |     
    i686     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/fc7242795c0eda05885cf4e4f46e36cb76d8bad6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/61c4fd5a906bda777c0d90c2a3b67c8040d1fc13 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9ca848b94f6cd694258399619de8dd47ca947a1a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/49975b73c99d4464a4b7949d6aee8bb8d4d013c0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0464853e69e1b6bd04d06ab6cdb6a25511a9f8ef |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4f371b2fd8a06f672ff39ecccb4e0e6d04865021 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/36c91a2b5d4321603d2c1548100eb05c4e02e0aa |     
  aarch64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/5f2fafddee32124d8d37b7fa7a5ef40c6ae3e411 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/449f308f3ba32d290f4acf30a778446cac8e1821 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/8eda5781957564f10ae5da667ec040882b0bba2e |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/5d7590f554acf61b55843ca48e1cde13c18b6bcb |     
    arm      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/73efdacf237e3d567fa66f3b3f68e624f5e35bc7 | ORPH
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/bb6656d80a0ae63146a72feffa7e5e715db99f43 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bde64c1ee45ae80371fa893e70a51fd6012a2f67 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/087909afc11e4b2709a4af6344299d57beafe24f |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e50503e7398a4e326e04e453e34ae752b81e010b |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/9df0faac4b3f91f7822d3463d80374e161029fa9 |     
    arm      |           xen-4.14.1           | NOK | http://autobuild.buildroot.net/results/53ddf074a38dc31fac7e6bc68b0352b854bebe2e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/35bfb3e88574e4893a5a376146c41a93f728b02d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bfa286b9e29ff4b6fbcc48ac1648438a26d96062 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/92f33525157b74a091ad0718dbc45477c7d30f44 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8f09d12a9774701b282ec651cb2d27dda59a6caf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9c84ad74d2c40a60cb56a54575c07d734d01bac5 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
            igd2-for-linux-2.0 | 1 
                  ramsmp-3.5.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/21541060953800c0a32244e37e14ee52d659aa2e | ORPH
    arm      |       igd2-for-linux-2.0       | NOK | http://autobuild.buildroot.net/results/3c2a7170bcbedefef4aa5b5bd9dc6a2a4ff5c420 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/210391cf1f9a4bdc6132c15975f8810cd59a302b |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
  gobject-introspection-1.64.1 | 1 
                host-go-1.15.6 | 1 
        host-sentry-cli-1.57.0 | 1 
              micropython-1.13 | 1 
       python-matplotlib-3.0.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4d72809ed2b24937c2042c7534e6989087036e73 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b295c1f77b6c97c07edeedd7b930deada18eac32 | ORPH
  mips64el   |         host-go-1.15.6         | NOK | http://autobuild.buildroot.net/results/88600ea6778e1f8a529c4b909bba254194044a46 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c6863d1d8569db5c6f851175a937a07c92af07cf |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/0eb5dfc99e1d64e74aa64dca8639c10b4b80ab5d |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/544d0034fd9f92c8d60e1f6604ba3f40b83acc1e |     



-- 
http://autobuild.buildroot.net
