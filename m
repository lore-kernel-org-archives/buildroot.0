From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Aug 2019 06:17:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-04
Message-ID: <20190805061748.F33D485749@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  3  |  0  | 21  |
  2019.05.x  | 20  |  0  |  0  | 20  |
    master   | 146 | 67  |  1  | 214 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 10
                       unknown | 6 
                     mdadm-4.1 | 4 
                  flashrom-1.1 | 3 
                      icu-64-2 | 3 
              qt5enginio-1.6.3 | 3 
     toolchain-external-custom | 3 
                gnuchess-6.2.5 | 2 
                harfbuzz-2.5.2 | 2 
           host-harfbuzz-2.5.2 | 2 
           host-nodejs-10.15.3 | 2 
                 libdrm-2.4.99 | 2 
                   mpd-0.21.11 | 2 
   openvmtools-10.3.5-10430147 | 2 
           python-numpy-1.16.4 | 2 
                  assimp-4.1.0 | 1 
                collectd-5.9.0 | 1 
                 diffutils-3.7 | 1 
                   dvblast-3.4 | 1 
              freeswitch-1.8.7 | 1 
                     gpsd-3.19 | 1 
       gst1-rtsp-server-1.16.0 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libsigsegv-2.12 | 1 
                   mimic-1.1.0 | 1 
                       mongodb | 1 
               mosquitto-1.6.4 | 1 
       python-matplotlib-3.0.3 | 1 
          qt5multimedia-5.12.4 | 1 
                  rygel-0.36.2 | 1 
              spandsp-20180108 | 1 
                    strace-5.0 | 1 
               wireshark-3.0.2 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          assimp-4.1.0          | NOK | http://autobuild.buildroot.net/results/d989f895efe05dd5d1e2594d2dc38e9fc476e0d3 |     
   x86_64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/8acb6ba8ffe47473e8a7d5be0ca4bdefc3500ac3 | ORPH
    arm      |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/2bc1b5b40e43ff4e6d9eb968fe87f3181cbd3acf | ORPH
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/7361746283a93fd1d77a46e6ddf3f0d5d4e98b61 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/f690485cc3a41b0a10d00362bdd5fde0561996f6 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/749da64ea4492d69cc395957612ed08f169cc8e0 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/9ea2aff309652827e8564a5854915df68b9edeff |     
   x86_64    |        freeswitch-1.8.7        | NOK | http://autobuild.buildroot.net/results/629d65c2dee7be68809f27da71fc3f7b5873837a |     
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/cf006d34e2a7d3db5e66eb2909982ab7f286a526 | ORPH
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/186aa9b27d2ceccd8b6263ebd7152ab3dc792267 | ORPH
   mipsel    |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/4828becd70edbe57edf7e2a71e5c1a8bf0b474d2 | ORPH
    i586     |    gst1-rtsp-server-1.16.0     | NOK | http://autobuild.buildroot.net/results/fd46d57015086289beda9e28bcbcd5ed309c4b64 |     
    m68k     |         harfbuzz-2.5.2         | NOK | http://autobuild.buildroot.net/results/60450ec39b331d1b892ce44a1a25451cd1d63d75 | ORPH
    m68k     |         harfbuzz-2.5.2         | NOK | http://autobuild.buildroot.net/results/710fc4b1aebfbe2fb7ea9a323245d682924f6137 | ORPH
    i586     |      host-harfbuzz-2.5.2       | NOK | http://autobuild.buildroot.net/results/b8ea9c4c006fb4e29f0caad927ac37025252b848 | ORPH
    arm      |      host-harfbuzz-2.5.2       | NOK | http://autobuild.buildroot.net/results/a6fb2175307635185be8cbeddde5e9eb9251c110 | ORPH
   mipsel    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/2d2ffea4a43a3e58c96dd85032d3e114f040a77f |     
    i686     |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/1e144e217d9f13ee1384d6015150f102b699b27a |     
 powerpc64   |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/4360b3d688c6866ba353d576d1091d17901de2b8 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/bff8ee87ae68644b4c0f4525ab8b7e3d410c5463 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/62e5d0bc351241499de51cea85ade6e95e1e9a6b | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ed51aec158eb5808edddfd67b54a9e149ea95fc3 | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/38b2ae0fe339390bb60fd110111016793db4bc86 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d15ed604756cac4e4a87afca61b7a4778f293baf |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e747bffcfc6c4a29ff9eac6918ffc18d254012bd |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/4ffc2db7a650da1252e0da13fbdf6c294ae2ce25 |     
    arm      |           mdadm-4.1            | NOK | http://autobuild.buildroot.net/results/022a6c97fe29ff34f0a55640ea72f3404a438091 | ORPH
    arm      |           mdadm-4.1            | NOK | http://autobuild.buildroot.net/results/024b9cbcd3ad7495806b315219fe266e23e1b1ef | ORPH
    arm      |           mdadm-4.1            | NOK | http://autobuild.buildroot.net/results/979b5e9dd8fb27969ed6bd0b82d9dd5f88b2b986 | ORPH
  riscv64    |           mdadm-4.1            | NOK | http://autobuild.buildroot.net/results/a0d9b49c99b36468e2ef506d55a1c3cbbcf43a4e | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/0d8e187c651a8009f618b3ab879f7874dca67b4b |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/647ed59dac1873062ea840ec7b2e1cc0b3f8c4ff |     
  powerpc    |        mosquitto-1.6.4         | NOK | http://autobuild.buildroot.net/results/2ee69a5d7834c9a4845ebde801be6aa8f97cc5fa |     
 powerpc64   |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/3ad546033d835dd3471bc9fa8cb486e06834549f |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/819f01a615a96d8fbc20f58c2b4fc56d5910c080 |     
  powerpc    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a9cfd09b0a1e01c873f82f720ff7d34cb57184ee |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7ff1b03c71bd5b261be67c3d0d88031fcd47b3ce |     
powerpc64le  |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2581e99d5e2db532b55abbc287fd40c0f8dc1f0f |     
   sparc     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5d1c1cf21eb4043f7069d492f750ea694a2e8634 |     
microblazeel |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4fa410db14fda48979b18a004438f2e11725d571 |     
  sparc64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1981f4988b63fc053566ad8bbea3b27129b1d0e8 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2f4ac06f1d83bcb6068f2cc2c265f6e9a4258fc0 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/dd26ca8a6f837376f6ed34d3e57b4d753861e986 |     
  sparc64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3d7f07f9d38aa6280b554959cbf753ae2655093c |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a0f50eaf76142c33165b2cc4ebffc58d456a14fe |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/8262899006619b0a6383ad16e854b1bc9d7b4008 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b352d04446da8d3a7d8233fc2af578a2dda27b40 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/dd5a7aa0689aee78eee5b8b2091dd68df935e6ef |     
  aarch64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/375078ed8f965ecf92eb9674bd071a518c3ef894 |     
   x86_64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/b76b6cf9602bcf5df69a7276762eab54cf74007b |     
    mips     |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/382634669241fa8cea0d1018df58ebba25bbceb2 |     
    arc      |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/77359fef37bf9b596208b85aa29ee26eedb3a8a0 |     
   xtensa    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/227d4b9e2b48c5b3f2dcf0fad9eefa2816c1eb0c |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/26226d8f39064604eb1e923168c21e9d09e75b3c |     
    arc      |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/389e64a441eb41fff170d378a1d3385514e7d797 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/4a0e4f18b28429c2784dca64d81a27236ebdf725 |     
  riscv64    |           strace-5.0           | NOK | http://autobuild.buildroot.net/results/ac32e83dc5eb5ce2809fc4b9d11f540dbdae9ed6 |     
  riscv32    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9fac0222f330975c4f217751f37364dcc8eb12e7 |     
  riscv32    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/acc7a41097ba07a6a2d6f94721e3aaca257a7dc9 |     
  riscv32    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/b872befe1adec2633b9cbcc49bc0eb7619f606c2 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/b3a5a044cb667453f142f958e540f9f897964c76 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/04853c63ecc6b5069812916daaad20d7a34a3e3a |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a8b7a0538688619c357901f47538e9f2c037ba89 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/307b40a40c37bb30c49115f5daa8c5981d7700f0 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/5924d3c41ace5e95f6b2d633719fe9322c835cbb |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/c6d222616469dbbd2c8f13075dd8ba8274a0f520 |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/917a191a405e1792c701877c3e1b9640f52ac730 | ORPH
    arc      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/01e23cfbfdced102be94f020ef82634bf05dd9e7 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 2 
                   mutt-1.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          mutt-1.11.2           | NOK | http://autobuild.buildroot.net/results/4805b04167fa845f3aeb0e096a0205f0973d6eec |     
  mips64el   |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/0b700e26fcd1f4175cf736d8cd6a3fb86a60494e |     
   x86_64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/6564315952ebc479b40c1ebdde62bd3db69ca307 |     


-- 
http://autobuild.buildroot.net
