From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 06:27:27 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-12
Message-ID: <20200413062738.4A6E085AE2@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-12
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 10  |  2  |  1  | 13  |
  2019.11.x  | 21  |  1  |  0  | 22  |
  2020.02.x  | 16  |  6  |  0  | 22  |
    master   | 137 | 90  |  0  | 227 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 15
                  assimp-5.0.1 | 9 
                libtirpc-1.2.5 | 9 
                qt5base-5.14.2 | 5 
                       iwd-1.6 | 4 
               libglib2-2.64.1 | 4 
               libglib2-2.64.2 | 4 
              luaexpat-1.3.3-1 | 4 
              host-grpc-1.25.0 | 3 
              libdvdread-6.1.1 | 3 
         python-markdown-3.2.1 | 3 
                  zeromq-4.3.2 | 3 
                  dnsmasq-2.80 | 2 
           host-nodejs-12.16.1 | 2 
             lua-curl-0.3.11-1 | 2 
                   mimic-1.1.0 | 2 
                 rocksdb-6.6.4 | 2 
                     avahi-0.8 | 1 
                coreutils-8.32 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 gnutls-3.6.13 | 1 
gstreamer1-editing-services... | 1 
          gstreamer1-mm-1.10.0 | 1 
             lirc-tools-0.10.1 | 1 
                minidlna-1.2.1 | 1 
               mongodb-r4.0.12 | 1 
       network-manager-1.22.10 | 1 
                 opencv3-3.4.9 | 1 
qextserialport-ada321a9ee46... | 1 
                 qt5svg-5.14.2 | 1 
                suricata-4.1.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/fe6af654bd36c80d75f5e26e87ddac30309d12a5 |     
    arc      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/09b308b32291227aadcd3abd5997b5d75012109f |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/dffee6d1e79fd6058257cc1c30d0b837e43688ed |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/f5b18a0f0804f6d237e52246dfb0f1b904502672 |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5bb073980c6a19bf5bc14db949151bd3e7ef280f |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/64fcd507f98d099fb5a62709ab8b1247c480b5ed |     
  riscv64    |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/34d4419511a69864f8eace1cc0379e22a410c699 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/f836eeaaf3443c062adee408c1110cb78a4cae1f |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/35d602f0626fdcc19ac1c7f953455d1e52654726 |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/5f58919bfb3c0cf12993db2c7fa417a8c432c102 | ORPH
   xtensa    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/d9e2d11e01fa3df43aa7f6ee9bb0d4483ec2e316 | ORPH
    arm      |          dnsmasq-2.80          | NOK | http://autobuild.buildroot.net/results/3fdc2cba20162eb86eaa5c49a056fb40fb18a392 |     
    arm      |          dnsmasq-2.80          | NOK | http://autobuild.buildroot.net/results/18ee507461028c399b513d0552d509b64082d7ad |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/83a46264a0c91c0d01feac1194738f2d2986ce4b |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/b8b3fb4a6d4d010ec11df9c9c10f3bcf3cd702e3 |     
  sparc64    | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/7b147adcaba7e83a880db9c409883bc048a1f12b |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c2bed9fea7a07ee352fa9390da7ea1ece4ed2607 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f5e6d7b38bdefe4626dbec868959194de534895f |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9fdc8b4828993c92139f979ba6c48343cc1c6c96 |     
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b86be8c51d9bf9baa98747da559fcf8e4da350fd |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/f676837a17d635ae650c3e1d5746ade47b992425 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/a31dc195c29bd3ad28a77f0ff7a56435f2f0a61b |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/fde62a9e7717052846a1a05e3aa90d79ba3e3088 |     
  mips64el   |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/381f8287172a4e4ea21e25758af75650b20f77ef |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/963b6f83a500fd86d36f60ddbec8926232fc010b |     
  mips64el   |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/fafebf2ef807bc621a261044bd1c4b196b02caff |     
    arm      |        libdvdread-6.1.1        | NOK | http://autobuild.buildroot.net/results/1481799f0badd53bb0ca620a0b83f29b702e06b8 |     
    arm      |        libdvdread-6.1.1        | NOK | http://autobuild.buildroot.net/results/b857e66a4ac40412277877d93cf66076c604deff |     
    arm      |        libdvdread-6.1.1        | NOK | http://autobuild.buildroot.net/results/09d2e995ceaf6062732b5654682f20467ab9d546 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/a5e06d02ddec114210f484ad065522a6f6aa4282 |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/33939143f1f08b26d115aa0bcedd973603c3d5fe |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/327097e3afb2e66a95f12778cc54bc70a38715a7 |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/e3ae4807b7a3ee7ce78df85c51b0f2fe0e9a7089 |     
    arm      |        libglib2-2.64.2         | NOK | http://autobuild.buildroot.net/results/14a124e647023a335a04e16bca4905f2443b710e |     
    arm      |        libglib2-2.64.2         | NOK | http://autobuild.buildroot.net/results/edd040fe9cc0b37437343ed4a3107940932eff19 |     
   xtensa    |        libglib2-2.64.2         | NOK | http://autobuild.buildroot.net/results/8cd2f9996cb0247c911168b573d4dd4aa3fe59b2 |     
    arm      |        libglib2-2.64.2         | NOK | http://autobuild.buildroot.net/results/7881e27fdf7668b38b130f4e51a66c6a96186aa0 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/63164f594ed7bc2f3b832bdd2ed54020f933d1a4 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/f0de58b3414cab6c51ca89ba3ab54d4bfe8825e4 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/bb7cb8437d7c4a448bb449e4c324432eac82a3e3 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/5fc2189f6dbaef940fd9756fe96f816e7a037518 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/b911619b2ba1d96a62bd62670ce15859cedcb041 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8135949bb9a7a811c0e90d7ff18160afd6734bd7 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/871606382dad1a0e1073c76ee60c918965f87ecf |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/06b4e5bc860202a71f5599fa5b192713dfb11087 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/078c907b16525a7e812ddd097818f9f8120a54b4 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/53c9072f1d122fd3c8843e623a9de5820cf93810 |     
    arm      |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/31aaec1135707e7a0471beadda7d5c14009b923d |     
  powerpc    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/26c813bd7e0fd0e93beea55978941f8dba460ff9 |     
    arm      |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/13d126ec9fea699710dd74b5bc266a1ac3f16e48 |     
  powerpc    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/14fbeee94d3e19cba9520574b22a6bbc0e1bfa80 |     
    i586     |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/aae148a766ddcfd93ee2fb21ac9fec5a35f57f4c |     
   nios2     |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/c4796eafb5da7fbe2849a6bbb03bc3ab838b3be0 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/df50b98f053ec4dfbf04469e091b9e75edce539b |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/381bd937cb4b1023e8669ac6fc7f87c558bd14c0 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/9da224a2cbfcc100ee5fd4441db34badef6dc62d |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/8660470f2f64dece9827edec2981b18dcca2cc39 |     
   nios2     |    network-manager-1.22.10     | NOK | http://autobuild.buildroot.net/results/63793f2d3a336a2bcfc67c71d152f7bafccc662f | ORPH
   xtensa    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/56deba635c23829a8cc5b8d791a82916c8312576 |     
   x86_64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/b3531fa625e25780032674c493585a02b43c988b |     
powerpc64le  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/852c2e6b2ab7cd256952f1a3e12fb509ec489510 |     
    i686     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/8837b8312af814ea0b65d8b321ad2ec8fd474ac3 |     
  riscv32    | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/449ffd096dd0c5726a9675d8e2d874319bd91bb3 |     
microblazeel |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/5e2a5f6d01ec3656569564ec34d609c6906b2dd9 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/fa8d3a6c340ee3c6b7be2f51968c9dc421b853c5 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/514cedc632bfe2f958ebdc9565b928796e3a5e28 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/db689fd3a092ba3ce0d09e1d79cc5aa14cb9a0fb |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/92442857ca5e3415346dfc9e499c1a8eb1b3393d |     
   x86_64    |         qt5svg-5.14.2          | NOK | http://autobuild.buildroot.net/results/58a55b0d063326a55002e87cfd04801c8b3f7b54 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/d2c981adcb6a1dc58057d783f329b6d5ea86c729 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e81a20c8c3f8243cc3e133f946ec35832c387b29 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/aa8b0a91469270a9cc47168b680887f96de91f01 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9608b198bfcdadd7a438af36e81b971992343a2e |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ec2e498516abceacf0d14306fa5e343ec8170f63 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/25b00bbfd265c9e0aa83727f8c686ca7dc179e93 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a33cea20a225c43de863bc3038cc586d456096d2 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a20a4b059f25d2cc5874dcb7ddd8d902fd0c79a6 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/a25de2fc03303a162b94d05401e69b40d162c439 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5e833e510f99c3561d10c6bb3475500bda2e03cc |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9e8dbe4ab47de6362f7e84cae4e40cdae47467b6 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/899c56e4e7e3f1662297020b6d17e8dc79d18033 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/c6562f43cd1ac96dde71926f303d7947dff25522 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/143d63e11e2ba8042f91f25471416e1038b1d7ae |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d5cdf8362ea8230c42a7c68acf78ec7ef948f9ef |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bccf61d888ef236033edb6ed445915ccf53b94a6 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/7ee507d5cf6a02ccdf9ff5eba4a5dd5c71c57ab1 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/05a5672aea1d89ee6dc11e9932ebb9d3ec4b5284 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/2272048ceff2d870785936a1ad982b20f01189c7 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3435f65c683e558425e800c7a2797f4279c4a80a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7cfb3399158a364466aa272f26c93f54ac43d716 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
     toolchain-external-custom | 1 
                    wine-3.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/350c9b06faf172980bbeddfc7e225e9b1a732465 |     
  riscv32    |   toolchain-external-custom    | TIM | http://autobuild.buildroot.net/results/2d7d513cb60337c51f9a992f0b312e82bb2244d7 |     
    i586     |           wine-3.0.4           | NOK | http://autobuild.buildroot.net/results/3267d98bfc48d23230a0e9b56e26c66acd745321 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

host-google-breakpad-7515ab... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/af851aebfdb1e4185cbe15b80fab293081a0691c |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 haproxy-2.1.4 | 1 
              host-grpc-1.25.0 | 1 
               libupnpp-0.17.2 | 1 
                    mpv-0.29.1 | 1 
       python-matplotlib-3.0.3 | 1 
                    qpdf-9.1.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/1fc79773d4fe29148dff32544b4fc85c70e89473 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ac9afca878433b2e72350845c14e0c9b1532e811 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/23eb373a7be0bc35cb3ff8a3356c13e3e905a06b |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e344dad4e91bec2ce52512a30724a9fb4e0d0927 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/f4cd552d520a2fd1b252b40007b051189de923f3 |     
    m68k     |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/d6d8cb09e8f8721e70ed785f11c755330bd7ee06 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8..7_SP3.... |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20191018     | 20200326     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.36.0       |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.1.2        | 4.2.0        |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.1.2      | 1.2.2        |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/00037 | 1.2.1        | 1.2.2        |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r33   |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.850.1      | 9.860.2      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.6.2       | 17.3.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.2       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.36.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.36.0       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.2       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2020-01-22   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2020.0       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.0       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.3.1        | 4.4.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.3.1        | 4.4.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.3.1        | 4.4.0-alpha  |     
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.13      | 9.17.0       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.2        | 3.5.4        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.20.0rc1    |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.72.0       | 1.73.0.beta1 |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 4.4.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.13.0       | 2.14.0       | ORPH
                        brltty |  DISTRO  | https://release-monitoring.org/project/00220 | 6.0          | 6.1          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.6          | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.5        | 0.5.6        |     
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.3        | 0.5.4        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 20160414     | 20170601     |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.43.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.43.0       |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.8        | 3.7.9        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-alpha  |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.13.0       | 0.14.0       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20191204     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.9          | 6.10         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.15.0       | 0.16.1       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 10.0.0       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.17.1       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.6.0        | 0.7.1        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/00338 | 1.4.5        | 1.4.6        | ORPH
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.2.2        | 2.3.1        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.26.0       | 1.27.4       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.9.0        | 2.10.0       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/07487 | 1.5.5        | 1.5.6        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.12       | 1.2.16       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9.1        | ORPH
                          dhcp |  DISTRO  | https://release-monitoring.org/project/05584 | 4.4.1        | 4.4.2b1      | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 9.0.0        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20191210 | 1.3-20200327 | ORPH
                       dnsmasq |  DISTRO  | https://release-monitoring.org/project/00444 | 2.80         | 2.81         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.5      | 19.03.8      |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.12       | 1.3.3        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.5      | 19.03.8      |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.9.3      | 2.3.10       |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.9        | 0.5.10       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.12.0       | 9.12.2       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/21344 | 1.5.2        | 1.5.3        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/16911 | 1.5.1        | 1.6.0        |     
                     e2fsprogs |  DISTRO  | https://release-monitoring.org/project/00646 | 1.45.5       | 1.45.6       | ORPH
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.0.6        | 3.0.7        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.03        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.179        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.2       |     
                         empty |  DISTRO  | https://release-monitoring.org/project/20564 | 0.6.20b      | 0.6.21b      | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.8        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0-rc2     |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.14       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.4        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.5        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.22       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.7        |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.5        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.32       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.19       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.31       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.4        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.18       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.39       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.5        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.24       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.4        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.7        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.3.0      | 2.6.0.1      |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.2.1        | 3.4          |     
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.17         | 3.19         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.5.5        | 0.12.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.0        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.13.0       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
         freeswitch-mod-bcg729 |  DISTRO  | https://release-monitoring.org/project/21862 | 1.0.4        | 1.0.5        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.03.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.5.2        |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.8        | 0.9.9        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.36.0       | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.3.4        | 1.4.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.50         | 9.52         |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.64.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.65.3       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.7      | ORPH
                      glorytun |  DISTRO  | https://release-monitoring.org/project/21354 | 0.2.2        | 0.3.4        |     
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.11       |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.2.8        | 5.4.rc1      |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.8       | 1.14.2       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.19         | 3.20         |     
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.4        | 1.0.5        | ORPH
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.3.1        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.1.0        | 5.2.0        |     
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.14       | ORPH
                          grep |  DISTRO  | https://release-monitoring.org/project/01251 | 3.3          | 3.4          | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.28.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.36.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.6.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 3.0.2        | ORPH
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.44.1       | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.3       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.334        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.2.0        |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 65-1         | 67-rc        | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.10-6     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.1        |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.1       | 3.20.2.2     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.1.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.1.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.1.0       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20191112     | 20191115     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.489        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.6        |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.5.0        | 5.6.0        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.3        | 1.8.4        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.3          | 5.4          |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.11         | 0.12         |     
                      jbig2dec |  DISTRO  | https://release-monitoring.org/project/01431 | 0.16         | 0.18         |     
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
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.69         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.69         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.69         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.69         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.69         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-03-R1   | ORPH
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.3-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.2-Leia   | 2.2.1-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.2-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.2-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.2-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.5-Leia   | 2.2.2-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.5-Leia   | 2.1.1-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.6-Leia   | 2.1.0-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.4-Leia   | 2.1.0-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.4-Leia   | 2.1.0-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.3-Leia   | 2.1.0-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.4-Leia   | 2.5.5-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.9-Leia   | 3.0.2-Matrix |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.4-Leia   | 4.1.4-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 5.2.7-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 4.1.6-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.4-Leia   | 3.2.1-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 4.1.5-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.21-Leia  | 5.4.5-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 4.11.6-Ma... |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 4.2.6-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.15-Leia | 6.4.1-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.19-Leia  | 4.3.6-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 4.1.3-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.5-Leia   | 3.1.3-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 4.1.5-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 5.5.7-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.4-Leia   | 4.2.7-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 4.10.0-Ma... |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.5-Leia   | 3.2.5-Matrix |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.1-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.4-Leia   | 3.1.1-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.3.1-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.4-Leia   | 3.1.1-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.2-Leia   | 2.3.0-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.1-Leia   | 2.4.1-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.2-Leia   | 2.2.1-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.1.1-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.3-Leia   | 2.2.1-Matrix |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 2.3.0-Leia   | 3.3.0-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.6-Leia   | 1.2.0-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.0.1-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.2.1-Leia   | 3.1.1-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.0.2-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.1.3-Matrix |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 2.0.2-Leia   | 2.1.1-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.1.1-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0_RC     |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 551          | 557          | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.9          | ORPH
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.33         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.0        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.7        | 1.0.9        |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.1        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 0.28.4       | 1.0.0        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3          | 3.3.2        |     
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.24       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5.1        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.0        | 1.8.1        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20190621     | 20200225     |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.17         | 1.18         |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.40         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.3        | 1.1.7        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.5        | 1.1.6        |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.0.0        | 2.1.0        |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200311  |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.0.5        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.1        | 1.4.2        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.4       | 1.24.10      |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.48.3       |     
                      librsync |  DISTRO  | https://release-monitoring.org/project/06309 | 2.2.1        | 2.3.0        |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.3        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.1       | 0.20.2       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20191204     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20191204     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.3        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.70.0       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.0        | 1.9.3        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/01729 | 0.9.3        | 0.9.4        |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.14         | 4.16.0       | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                      libtirpc |  DISTRO  | https://release-monitoring.org/project/01740 | 1.2.5        | 1.2.6        |     
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.4        | 1.2.5        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.4.0        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.12.1       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.6        | 1.12.1       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.17.2       | 0.18.0       |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.11.1       | 0.12.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.9.1        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 3.2.2        | 4.0.1        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.06      |     
                       libyaml |  DISTRO  | https://release-monitoring.org/project/01800 | 0.2.2        | 0.2.3        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.109      | 1.0.130      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.5.2        | 1.6.1        |     
                        linknx |  DISTRO  | https://release-monitoring.org/project/21373 | 0.0.1.37     | 0.0.1.38     | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.3.1        | 4.4.0-alpha  | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2020.04.12   | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.4        | 1.0.5        | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.15.1       | 3.16.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lshw |  DISTRO  | https://release-monitoring.org/project/06701 | 02.18        | 02.19.2      | ORPH
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.31         |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 2.0.0        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.11.0       | 2.12.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.0       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.11.0       | 2.12.0       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.2.1        | 4.0.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.22      | 10.5.2       |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.3.1        | 4.4.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.6.4        | ORPH
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.36.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.1.0        | 5.2.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.1.0        | 5.2.0        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 57           | 58           | ORPH
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.6       | 1.12.8       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.5.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.8.0.105    |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.1        |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.1.0        |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0-rc1      |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.7        | 1.8.8        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200411 | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.206        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre2   | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.5.1        | 3.6rc1       | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.25.0-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.3        | 0.100        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.39.2       | 1.40.0       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.16.1      | 13.12.0      |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.10.1       |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.5       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.4        | 6.9.5_rc2    |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.9        | 4.3.0        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.2.1        | 6.3.1        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.3        | ORPH
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.9.2        | 3.10.0       |     
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.5       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.7.0        | 3.8.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.7.0        | 3.8.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.7.0        | 3.8.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.7.0        | 3.8.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.19       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.3.1        | 4.4.0-alpha  | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.20      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.2       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.5        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.4        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202003       |     
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 2.4          | 2.5-rc1      |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.2       | 5.31.10      |     
                perl-data-uuid |  DISTRO  | https://release-monitoring.org/project/11837 | 1.224        | 1.226        |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.067        | 2.068        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.32         | 8.36         |     
                      perl-moo |  DISTRO  | https://release-monitoring.org/project/03123 | 2.003006     | 2.004000     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.22         | 1.23         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.70         | 0.71         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.008003     | 1.010001     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0204       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 75           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.2        |     
                 pkcs11-helper |  DISTRO  | https://release-monitoring.org/project/91990 | 1.25.1       | 1.26         |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.9.4        | 1.10.1       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20191204     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 0.87.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.11         | 2.12-rc1     |     
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6c       | 1.3.7rc3     |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 6.3.0        | 7.0.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.4       | 0.11.5       |     
                    protobuf-c |  DISTRO  | https://release-monitoring.org/project/03716 | 1.3.2        | 1.3.3        |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                        python |  DISTRO  | https://release-monitoring.org/project/13255 | 2.7.17       | 2.7.18       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b2        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.5       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.2.7        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.3.1       | 20.4.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.0        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.1.0        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.0.1        | 5.1.0        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2019.9.11    | 2020.4.5.1   |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 2.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.3.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.5.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.1        |     
               python-colorama |  DISTRO  | https://release-monitoring.org/project/03807 | 0.4.1        | 0.4.3        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.2.1       | 20.4.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.8          | 2.9          |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.16      | 3.0a1        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.43.1       | 0.47.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.4        | 3.0.5        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.2.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.5.1        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.10.0       | 3.12.1       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.4        |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.1.1        | 3.2.0        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.0       | 0.17.2       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 2.3.0        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.4.0        |     
               python-influxdb |  DISTRO  | https://release-monitoring.org/project/12696 | 5.2.3        | 5.3.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.13.0       |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.15.1       | 0.16.0       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.1       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 21.2.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.2.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.1        | 1.1.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.1        |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 0.8.1        | 1.0.0        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a3      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 7.2.0        | 8.2.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.44.0       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.18.2       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.5.1        | 0.6.2        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.2.2        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.5        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 7.0.0        | 7.1.1        |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.5        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.8.4        | 2.8.5        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.18.2       | 1.19.1       |     
              python-pycparser |  DISTRO  | https://release-monitoring.org/project/08175 | 2.19         | 2.20         |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 20200404.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.4          |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev6   |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.6.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.4.3        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.7        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.6       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.14.2       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.79         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.11       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.28       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.29.0       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.51.0       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 18.1.1       | 19.0.0       |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.3.10    |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.22.0       | 2.23.0       |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.1        | 3.1.2        |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.9.0        | 2.9.1        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.13.1       | 0.14.3       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 46.1.3       |     
            python-simpleaudio |  DISTRO  | https://release-monitoring.org/project/21607 | 1.0.2        | 1.0.4        |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.1        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.2        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.5.1        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.16       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.1        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.3.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 0.9.1        | 1.1.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 3.0.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.3        | 6.0.4        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.45.0       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 18.6.0       | 20.3.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 20.3.1       | 20.4.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.0.0        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.15.0       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 2.0.3        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.8       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.14.2       | 0.14.3       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.2       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.7        | 0.1.9        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.19.2       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.5        | 1.8.6        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.51         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.25         | 0.27         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.8        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.25.0       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.1.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.2        | 3.9.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.1        | 1.1.2        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 46.1.3       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 4.2.0        | 5.0.0-rc2    | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.30.0       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.14.2       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.14.2       |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.8.3        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                        reaver |  DISTRO  | https://release-monitoring.org/project/06095 | 1.6.5        | 1.6.6        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190609   | 2.20200229   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20191204     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.9        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.0.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.6.4        | 6.7.3        |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.12         | 3.13         | ORPH
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.15.1       | 4.16.0-alpha |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.1911.0     | 8.2002.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 1.6          | 1.8          |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.7.1        | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.42.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.42.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.2.0      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.2.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.1.2      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.7       | 4.12.1       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.29       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                     sg3_utils |  DISTRO  | https://release-monitoring.org/project/04801 | 1.44         | 1.45         |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.5        | 3.3.6        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.15         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.7          |     
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.3.11a      | 3.3.13       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
                       solarus |  DISTRO  | https://release-monitoring.org/project/21319 | 1.6.2        | 1.6.4        |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.1       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.10         | 5.0.1        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.0       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.0.2        | 6.1.1        |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.5          | 5.6          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.11.07      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.4        |     
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.1.1      |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.2        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2019.11      | 2020.04-rc1  |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.6       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.3.21       | 1.4.2        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.2.1       | 12.3.2       | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                      tinyxml2 |  DISTRO  | https://release-monitoring.org/project/04976 | 7.1.0        | 8.0.0        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.1          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.0        | 2.3.1        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.1        | 4.2          |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.3        | 2.4.0-rc1    |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                         uacme |  DISTRO  | https://release-monitoring.org/project/22795 | 1.0.22       | 1.1.2        |     
                        uclibc |  DISTRO  | https://release-monitoring.org/project/13815 | 1.0.32       | 1.0.33       |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20120424     | 20200328     | ORPH
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                        umtprd |  DISTRO  | https://release-monitoring.org/project/46129 | 1.0.0        | 1.3.6        |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.0          | 2.1          |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.8.3        | 5.9.2        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.4.6        | 1.4.7        |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.96         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/07455 | 2.4.0        | 2.5.0        |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.3.1_lib... | 2.4.0_lib... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.48.3       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.0566     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.8        | 3.0.9.2      |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.4          | 2.6          |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.60.1       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.20         |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.2.2        | 3.2.3        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                       xenomai |  DISTRO  | https://release-monitoring.org/project/18451 | 3.0.10       | 3.1          |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.2        | 3.2.3        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.5.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.43         | 5.44         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.7          | 3.9          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 353          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.11       | 0.3.0        |     
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.2        | 0.7.3        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.4        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.2       |     

-- 
http://autobuild.buildroot.net
