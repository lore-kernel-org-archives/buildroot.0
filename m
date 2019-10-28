From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2019 07:17:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-27
Message-ID: <20191028071802.E7AC186DF0@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-27
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  1  |  0  | 16  |
  2019.08.x  | 28  |  1  |  0  | 29  |
    master   | 152 | 93  |  0  | 245 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  leveldb-1.22 | 6 
              host-grpc-1.23.0 | 4 
                libdrm-2.4.100 | 4 
                libselinux-2.9 | 4 
                      icu-64-2 | 3 
   jitterentropy-library-2.2.0 | 3 
                   libnss-3.47 | 3 
               libsigrok-0.5.1 | 3 
        ltp-testsuite-20190930 | 3 
                 mesa3d-19.2.2 | 3 
              python-pyqt5-5.7 | 3 
                 uclibc-1.0.32 | 3 
am33x-cm3-11107db2f1e9e58ee... | 2 
domoticz-0f411f781ae4fb4a82... | 2 
                  flashrom-1.1 | 2 
          gstreamer1-mm-1.10.0 | 2 
                libgdiplus-5.6 | 2 
              libgeotiff-1.5.1 | 2 
               libgtk3-3.22.30 | 2 
               libupnpp-0.17.1 | 2 
           libwebsockets-3.2.0 | 2 
              mdevd-legal-info | 2 
                   mimic-1.1.0 | 2 
                 opencv3-3.4.6 | 2 
          python-web2py-2.17.2 | 2 
              sigrok-cli-0.7.0 | 2 
         supervisor-legal-info | 2 
         uvw-2.2.0_libuv-v1.33 | 2 
                    4th-3.62.5 | 1 
aer-inject-9bd5e2c7886fca72... | 1 
                    bird-2.0.7 | 1 
                  cmocka-1.1.5 | 1 
                   duma-2.5.15 | 1 
google-breakpad-7515ab13768... | 1 
                   gvfs-1.31.4 | 1 
          host-libsemanage-2.9 | 1 
                libcurl-7.66.0 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 libv4l-1.18.0 | 1 
                    mpv-0.29.1 | 1 
             openjdk-12.0.2+10 | 1 
   openvmtools-10.3.5-10430147 | 1 
           oracle-mysql-5.1.73 | 1 
                qt5base-5.12.5 | 1 
                 ripgrep-0.8.1 | 1 
                 rng-tools-6.7 | 1 
            systemd-legal-info | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           4th-3.62.5           | NOK | http://autobuild.buildroot.net/results/f1a6c3c09e779de249ecea045d3b213c2940750e |     
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4cdd6f0368cc9d3c6e88f01b1a8929eb0839b638 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/49c25aefbb9dc121967192f389b895fbf4c4c361 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/e7ecdf88e2d4639556d2f891d50aecc97533ebdc | ORPH
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/e58d16fd04e9061ea535324a3962dabca7d92790 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/d82a3b7369ba6bce40a50dd70556da664c2f4751 |     
  mips64el   | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c2ec810e117e944ae72b2eacb5c8f644a1732462 |     
   x86_64    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c69c82f8e0e058772c4e4e54247f6cf8f59c12dc |     
    mips     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/26d00bb69dea09c8dfaaebc89990a3dac300001e | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/0f173444ed45f8e4e2b1e3ddb1554f096b4b5128 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/f255f95a5c87bff91ee15304526654ff2950c420 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/7db515a808e2d14ba30fe78c67b2da433f046984 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6281157555529fd126018249d2402a6e7c53b039 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9bbc8b209cc646d279dbe81c66b095afc8d0753f |     
    or1k     |          gvfs-1.31.4           | NOK | http://autobuild.buildroot.net/results/af54a940611821b6c0318411f57a020de3682009 | ORPH
   nios2     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/af3f63bf844a4ab945e98907be530f09c8e015e6 |     
   x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/34466187f6db048fb136c75234d2686f76f42c8f |     
   mipsel    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/1f8af6ca75bf749b071511846a9df71f849d06d1 |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/b30a3aa430d43a4c64de180ec33c87ad5ee725f5 |     
   x86_64    |      host-libsemanage-2.9      | NOK | http://autobuild.buildroot.net/results/92670d34a523dbeb602cc89288dc1f3e0d047139 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/fc331ae8e2484be6818f4fc334d3f8c9658fffdc | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f6c923a37aa0a4d9bdbc56e06ccf21653dd184a7 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ef893e5068742af2ecf71e7aba423c23604d6427 | ORPH
    i686     |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/84639c7e681942e25b1eeaaee5dfef1f6fc8f133 |     
    i586     |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/34b1aa8ccca3539063276e004183a8029037a09d |     
    i586     |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/cba1ae830c7a4d1740098fe67aec59b4dc2f9a03 |     
    mips     |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/75b2ee5300245fb5a37479e91287a6d71232162f |     
  aarch64    |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/da990baa98de8ac1e77fe1b30362558266ee1163 |     
   nios2     |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/e46d67d0e8b4b47fc09e631ca46ed02594ced801 |     
powerpc64le  |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/f5dc64d6884b8e69457953cf4acdea152c2a10af |     
    arc      |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/952c55580a7031ef6b90c760e95322b5a80f842e |     
    arm      |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/0990f6fd1176e54cbf18548045e5f1b9f6d7dbc2 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/320fa98861f293d7fffe8768c0839927114d8903 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/285b26c9ad853d489a9ca98059267badd0298db5 |     
   sparc     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/30a96d80fad2eacf8e43a55984926e25b1025265 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/6fc3c62a148bec0b7c732bd1ebcaab26cbd0d167 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/30b45e65b95a4fe264a46bb4c0d5a6017fbce7dc |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/b66dcda933447d2802b5964bf0d24d0f89fd1d1b |     
microblazeel |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/102abbc4f9575c2c9c3ef74ab957657b6eadc43a |     
   x86_64    |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/0b218544b32d60e8b8a151eaedc466e79aafc889 |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/e5ff2175b93bcd00af45b8048eb0ce0d02452d82 |     
  powerpc    |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/170514a4955cd843fc8858d31493c43e2a165b4a |     
    i586     |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/cb3f0cd92b4104e9af1b3d3820dc943136be0fd1 |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/69ceb1d551ea12d714793688a2d19367f17d98e5 |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/81978652a7b7aebfb71a1f5fb10423e3fb0d686f |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/431fea59aa77f4df20b1310b4dc050c80f7a2c9b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/775590a261c70620ede49faa9501a7d6be96215b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/44bc1f95e9a2aed44d105eccc241e6d3b5e7e1f7 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f52055f29f827f9aa5460f655f47cff21979e5e0 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a9cd6f09725f39256c892584b4f533b2de96c410 |     
  mips64el   |        libsigrok-0.5.1         | NOK | http://autobuild.buildroot.net/results/e67468b629c0b61e7f68cd6eb9db94171b385b50 |     
   mipsel    |        libsigrok-0.5.1         | NOK | http://autobuild.buildroot.net/results/f1d0868e99402954dc96773c5ace192525deeab8 |     
powerpc64le  |        libsigrok-0.5.1         | NOK | http://autobuild.buildroot.net/results/0e6a882b898b8fb43001ac2f802ad1479ba3a90f |     
  riscv64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/b8dd8071dac3cd7191b19bb9aa762d8103cee2c9 | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/713c0673b6be647dfe47cf5dae77b1bce4f9b0c7 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/feec35bbaafcbb05c4cad1631836d90d0926b819 |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/e55f340c104e94ac174dc57f19d2d215c59c4fb2 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/23ec724ca6a2dc9d08d36e691f0bb0b7cdef9e10 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/a0f4769fb99304b852e355d81c13380b180a522c |     
   xtensa    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/ea9531585f034dc629b50f77ea731ffce823abdc |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/54ef02415d5f14adb1bbf4fd0bc56eaf5d702c36 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/9f48ee3ccac85ea0071345153ecace07823f4ac1 |     
   xtensa    |        mdevd-legal-info        | NOK | http://autobuild.buildroot.net/results/963ea38f496cca8d1cc6db7b6d963d0bf40bdef8 |     
    arm      |        mdevd-legal-info        | NOK | http://autobuild.buildroot.net/results/9c1b3c17b8bc3197b67d0aae6379ca3a900845f2 |     
    arm      |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/9d011cc911512cd0a8996e4db6de5e29c58dce21 |     
  riscv64    |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/ea35c4daa3aa8d1605aa6b9dc98fff1c9e0f9585 |     
    arm      |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/6f9706322d6624b281e4f7b44edd0901e3e80e65 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d4092094532adeed50dd222046a2cc9f0f1af1c4 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/af301582b0b5b3aabd8ac630439e63469d2b3e55 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/cce52a02f15baeb9a0dcaaed0c2004b6ef5325dc |     
    arm      |         opencv3-3.4.6          | NOK | http://autobuild.buildroot.net/results/f9c58f66aabf5596c8ef96d1cd6d9f1065ee5fe4 |     
   xtensa    |         opencv3-3.4.6          | NOK | http://autobuild.buildroot.net/results/692d1a28c6078e8c507ffae011b657fe0a708343 |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/9f74b0981ee2850f3d0d57d95452ac6b7403fafb |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/ce9fee50216def5f7ea434bb60915ee851146208 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/e5d8ee5a90c37c4aeb198883d184b74e9be41cd2 | ORPH
 powerpc64   |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/b76b3a5d40d33bcc5d73188d2bb308159551a8fd |     
  riscv64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/3a310f4c3f675a19d248a7f2fa5eca55d475ed14 |     
  riscv64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/a37f14694e6f0c71635ed044cd6a84b5f9eae81c |     
 aarch64_be  |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/dbacb51c5d3ae80c86dc5cf9f613c99d21718598 |     
 powerpc64   |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/f68da890bd838ee2a0a9555d74885e941b24d49e |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/03be33f240e4a55fba4e6bc55f4fabfd2d3151ab |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/6667c461cfbe90b118ac94461a9ff975e66863e2 |     
powerpc64le  |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/a412ccef864e8279dcc917e106b5f7b515ed95da |     
  riscv32    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/ac7d9e6dc5dd304bd76a50597fcf0887ea7e1381 |     
  sparc64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/82db98d67038329c4e158d80c370eceb261e56a9 |     
   nios2     |     supervisor-legal-info      | NOK | http://autobuild.buildroot.net/results/008af9399ad8f1728aa1191dddbe5cbaa79f4e9e | ORPH
    arm      |     supervisor-legal-info      | NOK | http://autobuild.buildroot.net/results/540303f884d9f891f58c660da22e2273956a92a6 | ORPH
    arm      |       systemd-legal-info       | NOK | http://autobuild.buildroot.net/results/4878af2ed318925ab530062576f91e7a1af47bd5 |     
microblazeel |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/654b21f9e0678bc6f936a0c055258bea1b0f6dc8 |     
microblazeel |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/a82a484409149d7f9aff6140ddcb89f627f508c7 |     
microblazeel |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/578d1234863e3f6d4003ff7326e8de4a77d1246c |     
    arm      |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/a56d527d63b215abf395a118d13c5897ae02ce8e |     
  aarch64    |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/fb084cffc765ad6447c56e2043f486c382bf62b1 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/f6380841cf913f3d9251fe4360317f844fa22684 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                snort-2.9.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/c5d29ff870a8ae38c8e2592186a6bd4c6a57332f |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.0       |     
                       alljoyn |  DISTRO  | https://release-monitoring.org/project/21665 | 16.04.00a    | 16.10.02     |     
                   alljoyn-tcl |  DISTRO  | https://release-monitoring.org/project/21666 | 16.04.00a    | 16.10.02     |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r9    |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.800.1      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 5.0.0        |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.34.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                        autofs |  DISTRO  | https://release-monitoring.org/project/00140 | 5.1.5        | 5.1.6        |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2019-10-07   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2019.4       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2019.4       |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 0.6.0        | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.10      | 9.15.5       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.31.1       | 2.33.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.19.0rc3    |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 1.4.0        | 2.0.0        |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.1.0        | 4.3.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.11.0       | 2.12.1       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.3.1        | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 1.1.3        | 2.0.1        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.111        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.39.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.39.0       |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20190315     |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.9.6        | 3.15.4       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.1        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9          | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.1.1        |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 18.09.9      | 19.03.4      |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.25.0-rc2   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.6        | 1.3.0        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 18.09.9      | 19.03.4      |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.7.2      | 2.3.8        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.7.2      | 0.5.8        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.2.0        | 9.11.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.1       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.09.1      |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.24         | 0.25         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.1.4       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.8        | 1.0.12       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.4.2        | 3.8.0        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.16       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.3        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.26       | 1.0.30       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.14       | 1.0.17       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.25       | 1.0.29       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.0.25       | 1.1.2        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.13       | 1.0.16       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.34       | 1.1.37       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.2        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.21       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.2.0      | 2.5.3.0      |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                        fatcat |  DISTRO  | https://release-monitoring.org/project/21349 | 1.0.6        | 1.1.0        |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.5.5        | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 3.2.13       | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 5.3.0        | 6.0.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.11.2       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.3.2        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.28.1       | 3.34.0       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.22.0       | 2.24.0-rc1   |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.63.1       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.6      | ORPH
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.7        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.7.13.5     | 3.8.0.0      |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.1       | 1.13.3       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.5        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.23.0       | 1.25.0-pre1  |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
               gst-plugins-bad |  GUESS   | https://release-monitoring.org/project/21849 | 0.10.23      | 1.16.1       | ORPH
              gst-plugins-base |  GUESS   | https://release-monitoring.org/project/21850 | 0.10.36      | 1.16.1       | ORPH
              gst-plugins-good |  GUESS   | https://release-monitoring.org/project/21852 | 0.10.31      | 1.16.1       | ORPH
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.1       | ORPH
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.1       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.8.0        | 1.10.0       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.4.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.43.1       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.0.5        | 2.0.8        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.2        | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.8       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.328        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.1.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.24.0       | 2.29.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 64-2         | 65-1         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.9-0      | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.2.3       | 19.3.3       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.2.1       | 19.3.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.2.1       | 19.4.pre1    |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_487        | 3.487        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.2          | 7.3          | ORPH
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.5.0        | 1.6.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.18         | 0.21         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.22         | 0.23         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.12       | 1.9.13       |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.10         | 0.11         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.7.3        | 0.7.4        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.2        | 2.0.3        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.19       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-09-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.4-Leia    |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.3.4        | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 2.5.6-Kry... | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 3.4.5v2-K... | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 2.4.14-Kr... | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 1.4.8-Kry... | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 2.4.7-Kry... | 4.1.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 2.4.14-Kr... | 4.7.0-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 2.4.19v2-... | 4.2.0-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 2.4.13-Kr... | 4.2.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 2.4.3-Kry... | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 1.4.7-Kry... | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 2.8.6-Kry... | 4.1.1-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 3.6.10-Kr... | 5.5.1-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 2.4.12-Kr... | 4.9.3-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 1.4.9v2-K... | 3.2.1-Matrix |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 1.3.0        | 1.4.0        |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                        libcgi |  DISTRO  | https://release-monitoring.org/project/21164 | 1.1          | 1.3.0        | ORPH
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.0        | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20191025-3.1 |     
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                        libffi |  DISTRO  | https://release-monitoring.org/project/01611 | 3.3-rc0      | 3.3-rc1      |     
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.7.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.0       | 2.63.0       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.22.30      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 232          | 233          |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.6        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.14.2       | 1.14.3       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                 libmicrohttpd |  DISTRO  | https://release-monitoring.org/project/01658 | 0.9.67       | 0.9.68       |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.3        | 1.1.4        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 2.9.2        | 3.0.2        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.46.3       |     
                      librsync |  DISTRO  | https://release-monitoring.org/project/06309 | 2.1.0        | 2.2.1        |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.19.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20190315     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20190315     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.68.2       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.0        | 1.9.3        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/01729 | 0.9.0        | 0.9.1        |     
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/15633 | 0.9.2        | 0.9.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                    libtommath |  DISTRO  | https://release-monitoring.org/project/15565 | 1.1.0        | 1.2.0        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.8.4        |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.5.0        | 2.6.0.pre1   |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.5.0        | 2.6.0.pre1   |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.4.0        | 1.4.0.1      |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.4        | 0.9.1        |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/03531 | 2.44         | 2.46         |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0-r3       | 1.0-r4       |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
             linuxconsoletools |  DISTRO  | https://release-monitoring.org/project/01827 | 1.6.1        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2019.10.20   | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                        luajit |  DISTRO  | https://release-monitoring.org/project/06444 | 2.0.5        | 2.1.0-beta3  |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.30.1-0     | 1.32.0-0     |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.183     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.1.0        | 3.2.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.18      | 10.4.8       |     
                       memtool |  DISTRO  | https://release-monitoring.org/project/21747 | 2016.10.0    | 2018.03.0    |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.34.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.8.2        | 2.9.0        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.3.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.4.0.198    |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.1        | 2.4.2        |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.12      | 1.25.13      | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.30.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.1.1        | 3.2.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.4        | 1.1.5        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20191026 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.3        | 1.0.4        | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.203        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.20      | 0.52.21      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.0        | 0.9.2        |     
                         nginx |  GUESS   | https://release-monitoring.org/project/05413 | 1.17.4       | 1.17.5       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.13.0      | 13.0.1       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                 nss-pam-ldapd |  DISTRO  | https://release-monitoring.org/project/21868 | 0.9.8        | 0.9.11       |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.12       | 2.0.13       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.129      |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          olsr |  DISTRO  | https://release-monitoring.org/project/21543 | 0.9.6.1      | 0.9.8        | ORPH
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.2.2        | 4.2.3        |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.2        | ORPH
                       openpgm |  DISTRO  | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.1       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.5.0        | 3.7.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.5.0        | 3.7.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.5.0        | 3.7.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.5.0        | 3.7.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.18       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.29       | 0.4.30       |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.18.1    | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/21376 | 1.0.1        | 1.1          |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.2          | 3.3          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.28.2       | 5.31.5       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-http-cookies |  DISTRO  | https://release-monitoring.org/project/02974 | 6.04         | 6.05         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.01         | 6.06         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.39         | 6.40         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.55         | 0.57         |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.22         | 8.25         |     
                      perl-moo |  DISTRO  | https://release-monitoring.org/project/03123 | 2.003004     | 2.003006     |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/10665 | 2.000008     | 2.001004     |     
                perl-sub-quote |  DISTRO  | https://release-monitoring.org/project/12678 | 2.006003     | 2.006006     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0201       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.4        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.4        |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20190315     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.77.0       | 0.82.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6        | 1.3.7rc2     |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.2       | 0.11.3       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.1.0        | 5.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.9          | 1.10         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.5.4        | 4.0.0a1      |     
         python-aiohttp-jinja2 |  DISTRO  | https://release-monitoring.org/project/21247 | 1.1.2        | 1.2.0        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.2        | 3.2.3        |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.13.0       | 1.13.1       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.0        | 2.3.1        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.0        | 2.4.1        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.3.0       |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 19.10.1      |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.7          | 2.8          |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.0        | 4.4.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 2.2.6        | 3.0b1        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.9.3        | 3.10.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/20876 | 0.3.1        | 1.0.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.1.1        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 19.2.0       |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.0rc1     |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.17.3       |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 6.2.0        | 6.2.1        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0       |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.18.1       | 1.18.2       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev6   |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.3.1        |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.17.0       | 0.18.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0rc1     |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.2       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.13.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.77         |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.27       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.21.0       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                python-scapy3k |  DISTRO  | https://release-monitoring.org/project/21599 | 0.18         | 0.32         |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.13.0       | 0.13.1       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 41.5.0       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.0        |     
                 python-uvloop |  DISTRO  | https://release-monitoring.org/project/12762 | 0.13.0       | 0.14.0rc1    |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.3.0        | 1.4.0a11     |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 41.5.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 3.1.1.1      | 4.1.0        | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.2.0        | 7.3.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 8.4.0        | 9.0.2        |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.13.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.13.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.1-beta.1 |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                          rauc |  DISTRO  | https://release-monitoring.org/project/20626 | 1.1          | 1.2          |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0        | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190201   | 2.20190609   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20190315     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.8        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.9.1        | 1.10.4       | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 11.0.2       |     
                  rpi-firmware |  DISTRO  | https://release-monitoring.org/project/21744 | 1.20190819   | 1.20190925   |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.22.0       | 8.1910.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.6.5        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc8    | 1.0.0-rc9    |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.2       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.0      | 2.9.0.1      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.0      | 2.3.1.1      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 1.0.3.0      | 1.0.3.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.0      | 2.5.1.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.0      | 2.3.1.1      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.0      | 2.2.2.1      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.0      | 0.5.1.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 03032018     | 30122018     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.10.9       | 4.11.1       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.0        | 3.1.1        |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 3.5          | 4.0          |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.2.4        | 3.3.2        |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.2        | 3.3.3        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.14         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.1          | 4.2          |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.9.0.0      | 2.9.1.0      |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.14.1     | 2.9.15       |     
                       solarus |  DISTRO  | https://release-monitoring.org/project/21319 | 1.6.0        | 1.6.2        |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.5.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.10.08      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.1        |     
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.0        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2019.04      | 2019.11-rc1  |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.4       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.1.7       | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                           tar |  DISTRO  | https://release-monitoring.org/project/04939 | 1.29         | 1.32         | ORPH
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.12.0       | 0.13.0       | ORPH
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.0          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.0.3        | 2.2.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 3.1.4        | 4.0.1-rc0    |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.1.2        | 0.2.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.1        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                       twolame |  DISTRO  | https://release-monitoring.org/project/12524 | 0.3.13       | 0.4.0        | ORPH
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2019.07      | 2019.10      |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.8.2        | 5.8.3        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.11      |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.46.3       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.1          | 0.2          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.1929     | 8.1.2231     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.59.0       | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.1       | 2.27.2       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 6.0.1        | 7.0.0        |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.0        | 5.5.2        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.2        | 4.18         |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.0.5        | 3.1.0        | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.1       | 2.27.1       |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191027-... |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/05193 | 1.3.14       | 1.3.15       | ORPH
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.4          | 3.5          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.9        | 0.2.11       |     
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.1        | 0.7.2        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.1       |     

-- 
http://autobuild.buildroot.net
