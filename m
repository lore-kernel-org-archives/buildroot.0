From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Mar 2021 08:13:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-01
Message-ID: <20210302081342.E93506F688@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  2  |  0  | 17  |
  2020.11.x  | 14  |  5  |  1  | 20  |
    master   | 138 | 47  |  0  | 185 |
     next    | 31  | 18  |  0  | 49  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                  dhcpcd-9.4.0 | 5 
  gobject-introspection-1.64.1 | 3 
            erlang-jiffy-1.0.6 | 2 
                 mesa3d-20.3.4 | 2 
                  monkey-1.6.9 | 2 
                    mpd-0.22.3 | 2 
                rocksdb-6.13.3 | 2 
                      tio-1.32 | 2 
               apcupsd-3.14.14 | 1 
              asterisk-16.14.1 | 1 
                 dc3dd-7.2.641 | 1 
docker-proxy-55685ba49593e6... | 1 
               domoticz-2020.1 | 1 
             libopenh264-2.1.1 | 1 
             libopenssl-1.1.1j | 1 
              micropython-1.13 | 1 
                    mpv-0.33.0 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
                 openmpi-4.0.0 | 1 
                 python3-3.9.2 | 1 
            qt5location-5.15.2 | 1 
                  quagga-1.2.4 | 1 
                   sdl2-2.0.14 | 1 
sox-7524160b29a476f7e87bc14... | 1 
                    unscd-0.54 | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a1c8b35aee257596e78cbf68944e5d731a570602 |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/b244e52fbe04bede15e40af7ad8c61873097700c |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4342d74d7da710bab9b60358b22e723b0a789760 | ORPH
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/8ad824c8044078dac483e14fd665aa8c85f6e85d |     
    or1k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/d4babff2df81b45185062d021def1ab492bbfb8a |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/f26f9826ca9513516c972379df7cf30021779197 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6945b59f22a0ec63dd68820edd89bc5e965696ff |     
    sh4      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/5ff995c5b951f2ac0e687f9f16bc88238c6bc6aa |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/b89a6fcafa9d259b9a5b47daec104daa65fc5fac |     
    i586     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/2f12eb5cc34a55c5350f90d5476ca410cc7d6430 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/29af5515b4dfc3691d9ab581a928d80daebf4c5f |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/53b9084d7384d7f550904730de999d530d1c298e |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/660b71fba0020d37bc2d69de1c09f8989aae20de | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/77aa1c54ba7cc692e2580d506f0874ed086a3a39 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ba11aa44d686688c9fb5ac763ce9c7a3fa124fe6 | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0b4edcdf25abba7572614fa163f473cfc7d9f316 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e9e2a21677e8166760ef1bae06ad6fc1d85657f6 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4da79ae8402de5f73f84261d7dd4c25e04cb9ac6 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5c75545f5bd71ddd086b355150f7c4401f9809bd |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b29db4ad31d030933bb80a1d2f043f5b0f43c1ed |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/abcef7bf9ec36825dcd991c2bf21774f11aa6743 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/434b325a7c68fbb2aa5977bd8700a7bb65eb3380 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/2385955480d4ef67d5307394a0ee3f94e9308b67 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/53bf1852ab000961e68508b245ac1365df7ffac0 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/8b02c188c782b4d7eed94c2d573a82d6f8b0a413 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/5d475b55cb2388b967126bd3ce88d76c8be1282e |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/0d71a8e074a7badc6a92762db750de88701174ec | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/b44d3d4f884fa3a4ce1ca243db25f096ef93853b | ORPH
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/82ff8eb31ddbd3ca4c04fa38fc3f13979f0d5fea |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/7fc86b4fb9781ddbfaaa78ee5f9a43d9c140d5b8 |     
  aarch64    |           mpv-0.33.0           | NOK | http://autobuild.buildroot.net/results/00384a14af5f4f94dc9e3e71127f5054113f256c |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/558b05aaffa577932a047b15e8832e2f9a2e00d8 | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/f446f27854288c9c764140583726e2f20f1369e0 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e6f1850bb66752ea021d942cc83eddbb947638cb | ORPH
   xtensa    |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/e53e3880b63a23fa3b3e6d34664d40d5ddbdff89 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/5a4b007a3f18dda630bb4c125e299084b81ef2cb |     
  aarch64    |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/a7b815119d4fb255ed41e8e0589052fa01a87bcd | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/6d57e93d33928142530cc5b582fbce9cc44b7831 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/41a7cc776386b74924f8dbaf53d78f681985df20 |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/bf044a88f3d02e45522ab3cf78e5beb3ced15173 |     
    arm      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/d96f27cd96926060046e2e1115777f5bceda3741 | ORPH
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/88243f9e4abd20046966c740cf5861b04b13f2a1 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/337513beb6f18ac1251f6c611ea8f6f58dff3fdd |     
  riscv32    |           unscd-0.54           | NOK | http://autobuild.buildroot.net/results/7e9d55761cec06974a2a3ac1b573c4f33c40209a |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d785d1cdbdd1021df06842b0067e74b634735321 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/9d29f42b02cc6d4bdf92a2d9841f6ac6b918dcf6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/075989851ec8705085c1ebd549641fefa941097b |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                       unknown | 1 
                upmpdcli-1.4.6 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/833b4b995143f2d4d83c4bfa26941d808eca559a |     
    arm      |         upmpdcli-1.4.6         | NOK | http://autobuild.buildroot.net/results/dc1c7b7f0bd0ecba327ddd87e361648ebe331004 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
          gstreamer1-mm-1.10.0 | 1 
                     host-mono | 1 
                 mesa3d-20.2.2 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/37f350eaaa955ab3cb74b1287ce43d2e1a3f81b6 | ORPH
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/451d82e09ee4c0c9e750ef38608902d105cff9da |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/310ca340e065b31b94ae1bd1c013049482477505 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9a2b416f33f1db4e5e67cfb011e82060eb598584 |     
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/291f5215e9332f73dfc0484e7d70489ffdf23e64 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/204807af953d74341c80d3e3a631bc983d33597e |     


Classification of failures by reason for next
---------------------------------------------

             libopenssl-1.1.1i | 2 
                     mc-4.8.26 | 2 
                    mpd-0.22.3 | 2 
                    brltty-6.3 | 1 
                coreutils-8.32 | 1 
                  dhcpcd-9.4.0 | 1 
                  janet-1.15.0 | 1 
             libgpg-error-1.41 | 1 
                libselinux-3.1 | 1 
              netopeer2-1.1.53 | 1 
                     ply-2.1.1 | 1 
                 python3-3.9.1 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/5ec12842850d71646cad0664edc407491fc05315 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/d543dee559c4b602e935d94a2aa094ca08f9332d | ORPH
    m68k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/91ea4cec79ffdeb6725fc70d6f4a58be47d18dc3 |     
    arc      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/84cfa93000a42a6146e4bc2bd7d456a9f85ec7e9 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/6a20329b82f1cb6d2abd054803125975bc116d93 | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/5fd3d7be06db75d76eb82c17e3d32855e4a61b77 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/dd9b43fd7df301c33976c99d2cbc6f2d10300d9c |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/1ad053883d0e3684336d250aa82cfda1cfa76796 |     
   s390x     |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/5621a957ea906ffcb372a26013b43f445e9d05f7 |     
   x86_64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/d40ed3e1ca0a919cbf6a5d38c5572a0ed915efd9 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/6bf55403d359fc85dd76462fa78ae9a6f89260d5 |     
  mips64el   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/cf9e4de7796d166ebdd173935efece3038ececbb |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/6b4779e6bfdfeb0f1588e0776cb41886e68f6186 |     
    arm      |           ply-2.1.1            | NOK | http://autobuild.buildroot.net/results/531efbfdaf054f74d14d1bddd2f6abe937f89fab |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/0111c2ed54618daaeedfc66b0ea04eda00a7e855 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/6785816fdd4db6646f8ef3ef5e74e708f7b0a39b |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e950d120ae9cecc27ac158e0976b5ae714fa8497 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e8799e8a4b29fe6fe1ce279fc69a86e15e87078f |     



-- 
http://autobuild.buildroot.net
