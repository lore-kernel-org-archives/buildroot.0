From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jan 2020 07:18:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-26
Message-ID: <20200127071852.29FE42046A@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 10  |  3  |  0  | 13  |
  2019.11.x  | 14  |  3  |  0  | 17  |
    master   | 103 | 93  |  1  | 197 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 13
                    parted-3.3 | 7 
                    brltty-6.0 | 5 
              host-grpc-1.25.0 | 5 
           libwebsockets-3.2.2 | 5 
                    olsr-0.9.8 | 5 
                apr-util-1.6.1 | 4 
           uboot-tools-2020.01 | 4 
           host-nodejs-12.14.1 | 3 
                 libnss-3.49.1 | 3 
          libpam-tacplus-1.5.1 | 3 
                 mono-6.8.0.96 | 3 
                 opencv3-3.4.9 | 3 
                libgdiplus-5.6 | 2 
               libsigsegv-2.12 | 2 
                     lxc-3.2.1 | 2 
                   mimic-1.1.0 | 2 
                    mpv-0.29.1 | 2 
               protobuf-3.11.0 | 2 
                       unknown | 2 
               acpica-20191018 | 1 
                 augeas-1.12.0 | 1 
                  cairo-1.16.0 | 1 
                 exim-4.93.0.4 | 1 
           host-doxygen-1.8.17 | 1 
                host-go-1.13.6 | 1 
            host-mfgtools-0.02 | 1 
      host-uboot-tools-2020.01 | 1 
                   libcap-2.27 | 1 
               log4cplus-2.0.5 | 1 
                minimodem-0.24 | 1 
             openjdk-12.0.2+10 | 1 
                    owfs-3.2p2 | 1 
                  polkit-0.116 | 1 
               qt5webkit-5.9.1 | 1 
                       ripgrep | 1 
                 ripgrep-0.8.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/8fb46acf05ad7d25e794d4eb48cbfb84f27d523f |     
    m68k     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/2124c05979b95c3f9c915a38293dd1b869c9c92c |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/e29b7f7259e48b188f37a45b2240b83b22b2efd8 |     
    mips     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/90b7ab8810344a9ec1d7b6bedeafafb86df26e93 |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/198bd9024a175590bc2f4ef4147ebc3de98a79c2 |     
    arm      |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/2c9f65b26978b6af92bede6d5fbbbbfcb9c833d0 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c638061d0d1fd87d245dfb3b0ecbe03cba9f5d39 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c4fd08dfe5cfd83c6f4a39b8662adf1be7277992 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9299cf0fedcce0a73fb524a9906044ba01698dce |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6919220084b0f68f989b23d7e110f1a19e215fe7 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/cdd4b126e700fdd4d4410adf9a4ecaccb51eb364 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/b0584f79d62e5dc9d88a7d7084e2911f33374375 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/a255acd9961f1171788326342e9df5ff5b91ad76 |     
    i586     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/271ea298c333ea3161b93c631c06f418dda7e456 |     
    arm      |         host-go-1.13.6         | NOK | http://autobuild.buildroot.net/results/a526ee13a050e11f198e067d0d40e930d978779d |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1c1a9dbb4513e9284a04da6382595f9a6f2658f7 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2fa92343229be492de37c35b0c9ca61d2467d7a2 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c44f06c2b109c00acead7d7c0abbd207a8dbef48 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/501f3dd8c83ffde086ee20b1217ddb31773843cc |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d3f6487e20e15e65d6eebe06829bd4a4eb30d9ef |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/d86e2e73bd80b0bd8aec2af1df10e80810a2b5b3 |     
   x86_64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/60799f869f1ef1200268794b9fdfb79737bf2f5a |     
  aarch64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/16e3233527e8e7868f56ab342381809b7ac8fc83 |     
   x86_64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/b513756e57b8ea021b172b4839a26b421ff4e68f |     
  riscv64    |    host-uboot-tools-2020.01    | NOK | http://autobuild.buildroot.net/results/84fe7bbc7ad45e38d41a650853b14e1b262960a5 |     
   mipsel    |          libcap-2.27           | NOK | http://autobuild.buildroot.net/results/7c979da38bba4aa34a961cd4da615487c4ca86df |     
   xtensa    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/2f3f7e01a3533811eee66f4fd8d2f8b90bf7b2a5 |     
   x86_64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/5fa56e23dfa534eb17a2c6bc0c30febc6e133720 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/5775769847b8c21da0b644469b951e9e26d19413 |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/a4407a6d34e27df079a935c7280a79f26db8fbd1 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/f533b2dd978c61db09fe2accd6a1aba8313ae989 |     
    arm      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/dc375efdaa7495c728b8ebc1017272e3daf5e6d5 |     
    arm      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/f3df9614a164713b3ab342580f8a42e69e777394 |     
microblazeel |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/17d272e9a3785207b741f4fa3874c0466d78816d |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/f90bdd1d9ba4699fbc3b75d8a2515fa32f126b27 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/285b0ee8517599c09db2b75636e34a8e451cdaa9 |     
    arm      |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/08757598daa16a74464166c98816b73045b5e33e |     
   xtensa    |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/403f7db3299c35c2dcb935b38e8499f11a707d9c |     
    arm      |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/56b927348acdaf25672f0901b7cc83d25dda3f10 |     
  mips64el   |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/70bd35ac04fdace507d9205fa993f49ee817e552 |     
    arc      |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/efa6810690545c9cd66928726c4d151021c69999 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/f561e07655336abae72812b034bfd16e21610d94 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/413bfd94599e6e40e54d60c54eb4c83e1383e7bb |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/ec0e9dd4d0bedea533cb5cc453cf1a005ac1dfdc |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c3dc8763fb97e4a6d0ccf6de843a58da6533df93 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c2dfaa80cb7d5d12f825aff7bb81b6b1befbae04 |     
    m68k     |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/636a31c40a0c1358b795adb99b9987293789a7e9 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/780ff5eaa215d25ebdad856b993f7efba1442ae6 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/1a2bd8bb2346406bbdf75a145e214b68ef216cd4 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/fa93d20eff22fdcaf308260bd62dfc75b40323e8 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f3fb7a65b28fa073d8cdd50e1e5edb78900bb8c8 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b0afd2fa746ffab6f9bddbc34a691c1e0200bd57 |     
  sparc64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7e2deee1dd7fa657958334604f2c88b425948157 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/1674dae14c4d37bc78af596a06ec3d995746fb31 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/5f47c7862083bde774424089363d2f26d5f2744e |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7d12ddcaa9cd7b947aea7e6cb07cd7c085261c52 |     
  powerpc    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7b6315d6d150fea23e7fc4dabd38772775ace425 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/a5e0581f41a7f9a68649a54c867eb61ea5879fde |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ed1bc836dd58d0b3edb7270803c55c2bbb5392d2 |     
   sparc     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0b6ddd496de8df3a89ed6aed3a94bc4fab040f86 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/66be570dc60f2ac3712f41e62fa1222de3264368 |     
powerpc64le  |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6192690cbfae5f6b85c200fb21389fb641acc811 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9476fa1a6b2fe156a4f29403e28b981a89011e29 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/4ebb857b8933f1a9eb6d6c03047363c4015a3230 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/633cf7e932e515b617b3a75b12cc0d33e3854e05 |     
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/bbebe47e32463fc18ad2e2cb92a2c88123490356 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b308a6a886ba8e15eb48886930185c1947a97f86 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/343134d71d974941003ce67bbced130114e2a482 | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/25e030b4c719fe236eb0ba5082e834ed30aa1634 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b6f59b6d1b714a1f826bcb5f0cf83b975b459270 | ORPH
 powerpc64   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/64f6646a0bae48741b3b1fc1da32fd6ba860e909 |     
powerpc64le  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/dbeb85c4ee58067bad2cf7be867838b5d3169f7c |     
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/cc85a6ebe0f77a70f4cf3be13681cd282bc42aa3 |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/eb84d45026e1b67060e41e43a3fe9db3a2a39a21 |     
 aarch64_be  |           owfs-3.2p2           | NOK | http://autobuild.buildroot.net/results/0d582dda367507991a4c38141db36b0fa8e47e67 |     
   sparc     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/9ad0430e91f9a9eea68707575bcfe9639f6fb3e2 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/21bd6a666b2a1561b9ebd1481492bc2bec6ebab2 |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/bf6b4d1b9fe5c4086cea26d904f882c45bd0ab9e |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/9cb148a46ebab64980e81355e0d26d977e2eeac7 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/d32773d23941dc51bd963799ff52e8c79c1cf32c |     
   sparc     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/3742635b2a84bcdfdd23480426f6624fd3f262cf |     
    i686     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/c374be5d234875ec6a06cf1539169d75625c1360 |     
    i586     |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/51a9d4732c6b973849e582e27af8c897db46cd5e |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/bca2b55faf31cc3f7e125a5d4f5af8aec5ad13d5 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/4530221ccd97d12774fcf3f946f474186d433de6 |     
    arm      |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/38e4bdf90a53f1dd993120df1997e61eca450086 |     
 powerpc64   |            ripgrep             | TIM | http://autobuild.buildroot.net/results/929214bf85af5fbe7926265641fd7952c2175f8d |     
 powerpc64   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/738a02aa497a1b845ef87060c18e5d34c0a34378 |     
    arm      |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/b3502588e424b784d0e0592e3b7b0f0bcd57b88e |     
    sh4      |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/bd8744974c3078578355c710c7bac231ee2d0b5f |     
    m68k     |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/430492a879b56e060bd2c8085948bca896f5ae69 |     
microblazeel |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/b4162d2d1d1552256aa6f33d349861efc387e535 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/578d1d149dfa10ef541f0831aed1bd3cd75d9b07 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/cb71c95a630d4cac51587f96016a9866e67bc462 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              python-pyqt5-5.7 | 1 
                qt5base-5.11.3 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/ba4a6a6c0ec3e78032f2eca7e8c0316bab371e4b |     
 aarch64_be  |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/4b7a0fc0bfecf7361daac75a04067cc4502cb5ba |     
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/8d8a137b2c50b3d3f7426adb7277dd991d2caf17 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
toolchain-external-codesour... | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/86c91a70b54401f36d138b138e8d57a63a3624a2 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7e03ed2914b42071a62773d7c300022cda2ccdf6 | ORPH
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/5179ab4e62c35214f8aad22ff140a01f86c14b01 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8..7_SP3.... |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20191018     | 20200110     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.3       |     
                   aircrack-ng |  DISTRO  | https://release-monitoring.org/project/00032 | 1.5.2        | 1.6          |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r25   |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.800.4      |     
                      arp-scan |  DISTRO  | https://release-monitoring.org/project/00110 | 1.9.6        | 1.9.7        |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.6.2       | 17.1.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.35.1       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
                          axel |  DISTRO  | https://release-monitoring.org/project/09344 | 2.17.6       | 2.17.7       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2020-01-22   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2019.5       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2019.5       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.60         | 1.62         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 4.4.0-alpha  | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.13      | 9.15.8       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.33.1       |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.2        | 3.5.1        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.19.1rc1    |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 2.0.0        | 2.1.0        |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.3       | 7.16.4       |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.1.0        | 4.4.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.11.0       | 2.13.0       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.4.1        | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.5        | 0.5.6        |     
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.3        | 0.5.4        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.41.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.41.0       |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.13.0       | 0.14.0       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20191204     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.9          | 6.10         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.15.0       | 0.16.1       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.16.3       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.2.2        | 2.3.0        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.26.0       | 1.27.0       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/07487 | 1.5.5        | 1.5.6        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.12       | 1.2.16       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9.1        | ORPH
                          dhcp |  DISTRO  | https://release-monitoring.org/project/05584 | 4.4.1        | 4.4.2b1      | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.1.5        |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.11       | 1.3.2        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                     e2fsprogs |  DISTRO  | https://release-monitoring.org/project/00646 | 1.45.4       | 1.45.5       | ORPH
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.01        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.178        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.24         | 0.27         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.2.3       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.13       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.3        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.21       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.6        |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.31       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.18       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.30       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.3        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.17       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.38       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.4        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.22       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.2        |     
                      fail2ban |  DISTRO  | https://release-monitoring.org/project/06602 | 0.10.5       | 0.11.1       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.2.1        | 3.3          |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.5.5        | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.1.1        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.12.0       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.01.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.5.1        |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.8        | 0.9.9        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.35.1       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.3.4        | 1.4.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.24.1       | 2.25.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.63.3       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.7      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.11       |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.8        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.7.13.5     | 3.8.0.0      |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.19         | 3.20         |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.11.5       | 2.12         |     
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.1.0        | 5.2.0        |     
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grep |  DISTRO  | https://release-monitoring.org/project/01251 | 3.3          | 3.4          | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.27.0-pre1  |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.2        |     
               gst-plugins-bad |  GUESS   | https://release-monitoring.org/project/21849 | 0.10.23      | 1.16.2       | ORPH
              gst-plugins-base |  GUESS   | https://release-monitoring.org/project/21850 | 0.10.36      | 1.16.2       | ORPH
              gst-plugins-good |  GUESS   | https://release-monitoring.org/project/21852 | 0.10.31      | 1.16.2       | ORPH
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.2       | ORPH
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.2       | ORPH
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.4.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 3.0.0        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.2        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.43.2       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.0.10       | 2.1.2        |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.12      | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.331        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.1.0        |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 65-1         | 66-preview   | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.9-19     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.1        |     
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.2.3       | 19.4.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.2.1       | 19.4.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.2.1       | 19.4.0       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20191112     | 20191115     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_488        | 3.489        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.5        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.3        | 1.8.4        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.3          | 5.4          |     
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.22         | 1.4          |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.12       | 1.9.14       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.7.3        | 0.8.1        |     
                         jhead |  DISTRO  | https://release-monitoring.org/project/10546 | 3.03         | 3.04         | ORPH
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.20       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.66         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.66         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.66         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.66         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.66         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-12-R2   | ORPH
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.2-Leia   | 2.1.1-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.1-Leia   | 2.2.0-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.1-Leia   | 2.1.1-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.1-Leia   | 2.1.1-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.1-Leia   | 2.1.1-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.3-Leia   | 2.2.0-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.4-Leia   | 2.1.0-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.2-Leia   | 2.0.3-Leia   |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.2-Leia   | 2.5.4-Matrix |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.8-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.4-Leia   | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.4-Leia   | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 4.1.0-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.20-Leia  | 5.3.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.8.8-Leia   | 4.8.4-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 4.2.0-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.15-Leia | 6.2.6-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.18-Leia  | 4.2.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.5-Leia   | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 4.1.1-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 5.5.1-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.3-Leia   | 4.2.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 4.9.4-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.5-Leia   | 3.2.1-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | v2.2.1-Leia  | 2.2.1-Leia   |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.3-Leia   | 2.2.1-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.5-Leia   | 1.1.1-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.0.1-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.1.0-Leia   | 3.0.1-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.0.2-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.1.2-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.1.1-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                     libargon2 |  DISTRO  | https://release-monitoring.org/project/15244 | 20171227     | 20190702     |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.31         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42         |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 0.7          | 0.8          |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.1        | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.31         | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.7        | 1.0.8        |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3          | 3.3.2        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.4       | 2.63.4       |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.0        | 1.8.1        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/01632 | 0.5.31       | 0.5.32       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.7        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.17         | 1.17.1       |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.40         |     
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.20.4       | 1.22.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                  libmpdclient |  DISTRO  | https://release-monitoring.org/project/21364 | 2.16         | 2.18         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.49.1       | 3.49.2       |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.1        | ORPH
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.191211  |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.0.0        | 2.1.0        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.1        | 1.4.2        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.2       | 1.24.4       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.47.2       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.2        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.20.0       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20191204     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20191204     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.2        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.68.3       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.0        | 1.9.3        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.14         | 4.15.0       | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                    libtommath |  DISTRO  | https://release-monitoring.org/project/15565 | 1.1.0        | 1.2.0        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.12.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.6        | 1.12.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.34.1       | 1.34.2       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.6.0        | 2.6.1        |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.9.0        |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.4        | 0.10.0       |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/03531 | 2.44         | 2.46         |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.0.1        | 4.9.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.05      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.5.2        | 1.6.0        |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2020.01.24   | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 2.0.0        |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.9.3        | 2.10.0       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.183     | 2.03.05      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.18      | 10.5.0       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.23       | 4.8.24       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 165          | 168          |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.5.21       | ORPH
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.52.1       | 0.53.1       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.34.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.1.0        | 5.1.1        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.1.0        | 5.1.1        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.9.0        | 2.9.1        |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.2       | 1.12.4       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.3.2        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.0        |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.0        | 3.2.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.6        | 1.8.7        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.5        | 1.1.6        |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.36         | 0.37         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20200118 | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.206        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.4       | 1.23.1-dev   | ORPH
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.39.2       | 1.40.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.7       | 1.17.8       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.14.1      | 13.7.0       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.10.1       |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.4       |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.9        | 4.2.0        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.27       | 2.0.28       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.3rc1     | ORPH
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.5       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.1        | 0.4.2        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.3.4        | 0.4.2        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.7.0        | 3.8.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.7.0        | 3.8.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.7.0        | 3.8.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.7.0        | 3.8.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.19       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.29       | 0.4.31       | ORPH
                          owfs |  DISTRO  | https://release-monitoring.org/project/21559 | 3.2p2        | 3.2p3        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.19      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.33        | 10.34        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.1       | 5.31.8       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0202       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 7.3.14       | 7.4.2        |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 72           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.2.92       |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20191204     |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6b       | 1.3.7rc2     |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.0       | 3.11.2       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.1.0        | 5.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
   python-aiohttp-debugtoolbar |  DISTRO  | https://release-monitoring.org/project/56563 | 0.5.0        | 0.6.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.5       |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.2.0        | 1.3.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.11.1      | 20.1.3       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.8.2        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2019.9.11    | 2019.11.28   |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.13.1       | 1.13.2       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.5.0       |     
               python-colorama |  DISTRO  | https://release-monitoring.org/project/03807 | 0.4.1        | 0.4.3        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 20.1.2       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.7          | 2.8          |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.43.1       | 0.43.3       |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.13.3       | 0.15         |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.10.0       | 3.11.2       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 2.1.1.dev1   |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.14.0       | 0.17.0       |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/20876 | 0.3.1        | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.11.1       |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.15.1       | 0.16.0       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 21.1.0       |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.97         | 0.98         |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.4.1        | 4.4.2        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.0        | 1.1.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.0rc1     |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 0.8.1        | 0.8.4        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a2      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 7.2.0        | 8.1.0        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 0.6.2        | 1.0.0rc1     |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.43.0       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.18.1       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.6.0        | 2.7.1        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.5.1        | 0.6.0        |     
                python-passlib |  DISTRO  | https://release-monitoring.org/project/13203 | 1.7.1        | 1.7.2        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.0.1        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.4        |     
                python-pexpect |  DISTRO  | https://release-monitoring.org/project/07654 | 4.7.0        | 4.8.0        |     
                 python-pigpio |  DISTRO  | https://release-monitoring.org/project/19651 | 1.44         | 1.45         |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 19.3.1       | 20.0.2       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.3        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.0       | 3.11.2       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.8.0        | 1.8.1        |     
                 python-pyasn1 |  DISTRO  | https://release-monitoring.org/project/06996 | 0.4.7        | 0.4.8        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.2.7        | 0.2.8        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.18.2       | 1.19.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev6   |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.5.2        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.0        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.4.2        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 19.0.0       | 19.1.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.6        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.3       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.14.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.77         |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.28       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.26.5       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.46.3       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                 python-pyyaml |  DISTRO  | https://release-monitoring.org/project/04123 | 5.1.2        | 5.3b1        |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.1.16    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.2.2        | 4.2.3        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.1        | 3.1.2        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.13.1       | 0.14.1       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 45.1.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.3.3        | 3.4.3        |     
            python-simpleaudio |  DISTRO  | https://release-monitoring.org/project/21607 | 1.0.2        | 1.0.4        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.16.0       | 3.17.0       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 0.45.5       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                    python-six |  DISTRO  | https://release-monitoring.org/project/04027 | 1.13.0       | 1.14.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 2.1.1.dev1   |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.4.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 1.9.5        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.13       |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 2.1.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.42.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 18.8.1       | 20.1.1       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.4        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.8       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.14.1       | 0.14.2       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.0       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.7        | 0.1.8        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.5        | 1.8.6        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 0.16.1       |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.25         | 0.26         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.7        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.24.4       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 4.7.1        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.1        | 3.9.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.0        | 1.1.1        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 45.1.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 3.1.1.1      | 4.2.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.0        | 9.1.1        |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.30.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.14.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.14.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.3-beta.1 |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0        | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190201   | 2.20190609   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20191204     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.9        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 11.0.2       |     
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 6.8          | 6.9          |     
                  rpi-firmware |  DISTRO  | https://release-monitoring.org/project/21744 | 1.20190925   | 1.20200114   |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.1911.0     | 8.2001.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 1.0          | 1.6          |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.7.0        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc9    | 1.0.0-rc10   |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.40.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.40.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.3       |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.5       | 4.12.0rc1    |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                           sed |  DISTRO  | https://release-monitoring.org/project/04789 | 4.7          | 4.8          | ORPH
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 3.5          | 4.1.1        |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.15         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.1          | 4.2          |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.1          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.7        | 1.1.8        |     
                         socat |  DISTRO  | https://release-monitoring.org/project/04848 | 1.7.3.3      | 1.7.3.4      |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.32-9731... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.0.1        | 4.3.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.8          | 5.0.1        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.10.16      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.2        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.12.2       | 1.13.0       | ORPH
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.8.28       | 1.8.30       | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.1.1      |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.1        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.5       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.1        | ORPH
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.24.1       | 3.25.1       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.3.1       | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.12.0       | 0.13.0       | ORPH
                    ti-cgt-pru |  DISTRO  | https://release-monitoring.org/project/59398 | 2.2.1        | 2.3.3        |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.0a         |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.0        | 2.3.1        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1          | 4.1.1        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.2        | 2.4.0-rc1    |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 4.10         | 4.10.1       |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.8.3        | 5.8.5        | ORPH
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.96         |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.34         | 2.35         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.47.3       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.1929     | 8.2.0149     | ORPH
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.4          | 2.6          |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.59.0       | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.19       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.2       | 2.27.4       |     
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 6.0.1        | 8.0.0        |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.3        | 5.5.5        |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.3         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.3        | 5.0          |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.2.0        | 3.2.1        | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.2       | 2.27.4       |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191217-... |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.12.2       | 4.13.0       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.4.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 352          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.11       | 0.3.0        |     
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.4        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.2       |     

-- 
http://autobuild.buildroot.net
