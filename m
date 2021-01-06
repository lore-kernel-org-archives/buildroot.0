From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 06 Jan 2021 08:22:07 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-05
Message-ID: <20210106082214.7C62986881@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 26  |  4  |  0  | 30  |
  2020.11.x  | 16  |  4  |  0  | 20  |
    master   | 170 | 61  |  0  | 231 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 10
                 uclibc-1.0.37 | 10
             timescaledb-1.7.4 | 9 
    trace-cmd-trace-cmd-v2.9.1 | 4 
                       unknown | 4 
                 dc3dd-7.2.641 | 3 
               qt5webkit-5.9.1 | 2 
                xenomai-3.0.10 | 2 
               capnproto-0.8.0 | 1 
docker-proxy-55685ba49593e6... | 1 
              fetchmail-6.4.14 | 1 
      gst1-plugins-base-1.18.2 | 1 
            host-libusb-1.0.24 | 1 
              libostree-2020.8 | 1 
                 mesa3d-20.3.2 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
                  ndisc6-1.0.4 | 1 
            qt5location-5.15.2 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
                 systemd-246.5 | 1 
                upmpdcli-1.5.5 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ee630d2daf49197bd9c8a7ae7477334f61ffce46 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/713cd19125bd71a9e2b9f46c5c8c6b2ca475ef19 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/5ac299c815a3adb259e56bd1ee5d333cd4ac47f2 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/eaa9c029993eb92be32ced257f738d93b6c61459 | ORPH
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/b9c60644e7b9f7e527e71d44db6539f639a8b50c |     
microblazeel |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/213832225f5669ed10db86b7fba140eb92671be7 |     
    sh4      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/b2f54cf7dbb561edbf50fe428c08f723b5ec450b | ORPH
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/16645aefee04c4c81e811ae98f74b1e69aedcf94 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a24d3a6dfe6296471f9ca54e67ae8ebcfb3416ca |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/358e8d4ae33191f6c0063951dbbcf4a769bf7b87 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2bcf4e55b5da22b82f7956a311979f30bfae0408 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a0bab01852a8abd6c0ef471b8f5136cea1423080 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/987fd9f3b53fe9f6f10d48f06a1a5081c77d1b54 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0ad90343d0a51b011f7401cc42eb6f0965033f2c |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/22bdded571b527db7f546fa47857bd8d061de21d |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/83af3054991cc39b01274364d3e8e4a745cbdbea |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/833fbd37666d91d4b5f138b8d80f29bd12d2c0cc |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d197bdeda618a914ad2c49687f00307f9a1808e0 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/799430a5629ad76e27a01c51d578ff9cf21ac942 |     
  mips64el   |         mesa3d-20.3.2          | NOK | http://autobuild.buildroot.net/results/a5c9559e380f785779a37fe9aa6bc99473beae0a |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/1bb0abb31ff0844b30fba37cdc679b01d7cd983d | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/a06571f1c3499ae36e83539db00620fa61364b3d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d1028c2550c312e5bfc1346e1d1cef2caa09aedd | ORPH
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/241db3460175d81d71e8160315f5d3a4755763b5 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/359910ebb8d5f3d778e9537eb56c58bb942792d2 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/505edb2db64560b56f3529595b2d2e9311c9ba78 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/84c78a79005f0e2bca42b6179b4e3fcf95a6f309 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/3e4c2613e77bd9f754f73b22e9e198dbc32e013a |     
    mips     |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/977da2c56f55111d6f07454077053bf894edb184 |     
   nios2     |         systemd-246.5          | NOK | http://autobuild.buildroot.net/results/da2123255492292fd162ee2bdf463535bf40121c |     
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/d57302894ae8d450e2cb54ce3c47a6ee86cab8ba |     
    arc      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/6236179d417186eb74fa0abc851d177c3f07c60a |     
    arc      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/c772f30e96b267490d97ca91bcddbe7b655f8ca4 |     
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/435ae612cbcc41a1362e5d3ed22868ad8b0abf03 |     
   xtensa    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/b31242d2312a734b442bf49b6b28bb6303f1cc11 |     
   mipsel    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/6de492cf3bebd0af4f30367811b877c91a830ed7 |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/f55f58959a9ac7fa4acb8abd21987c8bf83c7a0b |     
 aarch64_be  |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/95c28b83d5bcd104827ba52a8a8cff7145d18dec |     
   mipsel    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/02830e94f84926ed4736d585c4eaba0845b1a0a6 |     
microblazeel |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/8236a1ebfbbb5550ae9945aa9e2d20f731538224 |     
  riscv64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/33574b5d76774c49a2cdbe54d530b001492ed5a5 |     
microblazeel |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/55891e9e604e354c24347d7b06b1e84437ff5346 |     
  riscv64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/f7d07105db6095eb274218425c6748b39df967c1 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f31633e3129d85f20742d5ae6f9d146d85ee64e1 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/96529ce246a638c67841b6a50e318737816774aa |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f382802c02da48f6454835b8ef1d45293247ec98 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/2f591f35b833f9f6460b2a57f0c01c4186c7a0f3 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/cee1c90b6b4e19ad942d024e61ab7033e04d1776 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6ee6ad1d16e4703741c416eceedf617dc7a035f8 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8f6bf6bf6fe7cbddffdf6f5829122d13a1acdc04 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/065bd08b54fcb0a7212420b580494300b265ed95 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/0c9db4a0fab325ab03b9b8a2f6b47c89deb2c270 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/db42cb00ef54b29a5acbc73fed12c137fa84c8b2 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5a56e21bd6c43fc795fe453b303daf7488bbcdf7 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7baeaae2fcbc2d4e5012e42b90cf47c51aba3858 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/29d90b6f8cde2c738c331214db66529fa8c4c111 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ad23de192cb1a0aec3276eda93d53aa9b34c7cd6 |     
    arm      |         upmpdcli-1.5.5         | NOK | http://autobuild.buildroot.net/results/ea23b5ca4b51d670ec2fe964f1884c40575d45c7 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7bc19f43e14b595109a3002a4c7c76258fbc92d8 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/263290ac1c4d926bdabf78c3ad178d5ee2acd419 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/deec64e2981e2c36389a0cce4996317ed01cb5ed |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 dmalloc-5.5.2 | 1 
make: *** wait: No child pr... | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.19 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/1d0ffcefbf545d1748e928603fd07c0a8de98eb5 | ORPH
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/9254a0d3678fe2c96a4557026bddf91859b80ce7 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5ad186d3d054161f5d4f792448bca9fb6d5ceba0 |     
  aarch64    |        mongodb-r4.0.19         | NOK | http://autobuild.buildroot.net/results/c424b76b1b073692fc3649a94cdeb967a1547f6e |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
            qt5location-5.15.1 | 1 
                 uclibc-1.0.36 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5e799394f7c66bbc978eca88a986e3e3d1778db1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fd152f9ce73c5ebdfd5ca9868271be503773572b |     
   mipsel    |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/2e027b63f98ab587ffa04aafd708839fa703f6d7 |     
   xtensa    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/8eb3ad010b6f9443ff25bab45a4836bee6429f1d |     


Gitlab CI results for 2021-01-05
================================


-- 
http://autobuild.buildroot.net
