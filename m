From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 06:15:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-12
Message-ID: <20190813061557.46B78226D0@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-12
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  1  |  0  | 22  |
  2019.05.x  | 12  |  1  |  0  | 13  |
    master   | 155 | 43  |  0  | 198 |
     next    | 13  |  4  |  0  | 17  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                suricata-4.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/07675b89a62cd225b328c691b4d96faa11ac759b |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         qt5base-5.6.3          | NOK | http://autobuild.buildroot.net/results/7fdcf4675fe9eba37a9b45b00be65a5b4363db6f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 4 
                   mpd-0.21.11 | 3 
                    mpv-0.29.1 | 3 
              qt5enginio-1.6.3 | 3 
                harfbuzz-2.5.3 | 2 
                 host-icu-64-2 | 2 
            host-mfgtools-0.02 | 2 
                      icu-64-2 | 2 
           python-numpy-1.16.4 | 2 
                  rygel-0.36.2 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                  cmocka-1.1.5 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                     dtc-1.5.0 | 1 
                    ffmpeg-4.2 | 1 
       gst1-plugins-bad-1.16.0 | 1 
       gst1-rtsp-server-1.16.0 | 1 
             host-gauche-0.9.5 | 1 
                 libdrm-2.4.99 | 1 
               libupnpp-0.17.1 | 1 
                 mesa3d-19.0.8 | 1 
                   mimic-1.1.0 | 1 
              python-pyqt5-5.7 | 1 
                    qemu-3.1.0 | 1 
          qt5multimedia-5.12.4 | 1 
              spandsp-20180108 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/4eff446a1cc3cead2182abccddf3e1b275b639f9 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/981d4bd03259f1c693c193f7ac8faca557a95c5f |     
  nds32le    |           dtc-1.5.0            | NOK | http://autobuild.buildroot.net/results/433bc2fcc058271696297c67574bdc42d0fe2adb |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/0c94dd3cccc6f7436ec1f500279a4b99ab89c110 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/bfc63a3f48fd20b284e7cdbf1574ba37160c157f |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/7e1416dd5287c9e4eb5e06b8eca9a22e182bd092 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/435da8d48e7a86baa9ab15feba9d65d8ce68b1e2 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/a3f8aeafc9941c8811802b234af6d8f622a2037f |     
    arm      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/3cabbb8feacd11c145e89425028a1c0fb43a366d |     
    arm      |    gst1-rtsp-server-1.16.0     | NOK | http://autobuild.buildroot.net/results/0462d24e873592b464726210bd985b935cf881f1 |     
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/fa341b7fd85c99fe3292e9f38874ac6ff7d205d1 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/121891c54f1f6ba3661bacdeb054aab56129d3e5 | ORPH
    sh4      |       host-gauche-0.9.5        | NOK | http://autobuild.buildroot.net/results/9881b5ac01d5c8f4c52446ea3b75e30682f2b6f0 |     
  powerpc    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/66151a44b63839b2da8d4b2f9c5118689b0519c5 | ORPH
  riscv64    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/9b3992ebd30e6ad005cc6d3ed6888aa3411bbfb5 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/d793e26cd7f9f161db55b5a5076261a0b946ee1b |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/4a2fdbf32b2d67f09aaf99651080be4da2ea6aec |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7db91835ee139c375e518174a592d326d8fa512f | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/3c6ae7daf5e698e634adaf3ffdb28de0e23e88ee | ORPH
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/16e2b136189da37a0c9038d2bb743dc96fa36cab |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/63ca68c94634aa264f403a685bdf91d55d6fee2e |     
    sh4      |         mesa3d-19.0.8          | NOK | http://autobuild.buildroot.net/results/1ac0bb30430222f4683a22265ec24c4e366b9ab0 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/9db461eb790495042a9b16de86db34312b32c56c |     
powerpc64le  |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/1678a6c5e5c9ee44b7a90d059d95c5d385d75132 |     
  sparc64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/ba11b09c0d99b005c71ddd4db7fa4caa5e68af9c |     
microblazeel |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/121a4bcad1082cff893a5c345f3f2361e76d7e82 |     
powerpc64le  |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9725e6ab519fba7c968884535f7b95ab4113f978 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b33df4e056500de9aaba3d89cde64628f55ddda9 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d770129b9dfcc1ad59c8bdcf719338b02c14cbba |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/b8359f5ece21b9cb4efdf004950998a944f0fca8 |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/03a8c649f97c07bf8f718cf703a00289c9128aac |     
    i686     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/dfb7d76fda8f9185ab168a6d48d2027186f5c6f8 |     
    arm      |           qemu-3.1.0           | NOK | http://autobuild.buildroot.net/results/9bc0ed3ce74ec5e09263f625477393d5149eb872 | ORPH
    arc      |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/273d20d6c38672cf610bd1e48aae020bcfd4a658 |     
   x86_64    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/4c7c791f3b8ddf134ccec6964e301e2692a62311 |     
  mips64el   |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/60ba18466bda7df252bc4f52524404d3a3375290 |     
  riscv64    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/ef270958cb1d52569abc5e19d9d9adca023b7200 |     
   x86_64    |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/240b3552846d0efa903c932eb20b3399fb12324b |     
    or1k     |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/da89f36971d62d3ff36d8b3c2ebc1c4864e5b139 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/31eca34ccb086be797e07b5d3154dc40ee4f77ee |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/d4956c4a4c9df1ce686e824ef9e80d96715d0f2e |     
 aarch64_be  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/89c5e78c88c4c730d9ba0645b20db557c5f4804a |     
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/260cad872cebd360762b673a7efa226307ec5036 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 1 
           python-numpy-1.16.4 | 1 
                    xen-4.12.1 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d2b7426750307dd558ad56cf09a0587de26955e0 |     
   x86_64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/4a2b53e2f700e4e5359af48a7f8af5fbf963ffbd |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/c46f0d5bb3f9eb76f8d5e0114000fefd722ea999 |     
    arc      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/ecc7b2e26d3fb3e5bc46fbb33750fdf7ef61afbd |     


-- 
http://autobuild.buildroot.net
