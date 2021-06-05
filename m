From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 05 Jun 2021 05:47:21 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-04
Message-ID: <20210605054728.BD58A83AB7@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 27  |  3  |  0  | 30  |
    master   | 123 | 28  |  0  | 151 |
     next    |  8  | 32  |  0  | 40  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                  lvm2-2.03.12 | 5 
                    ffmpeg-4.4 | 3 
                 dc3dd-7.2.641 | 2 
          gstreamer1-mm-1.10.0 | 2 
                 pixman-0.40.0 | 2 
                  zeromq-4.3.4 | 2 
android-tools-4.2.2+git2013... | 1 
            erlang-jiffy-1.0.6 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                mono-6.12.0.90 | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/9c9af5732b6e7f7e6eb039188c1ab509acfc2a03 |     
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d0aa57712556f482705979f2ca2ec166322fc781 | ORPH
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/267151dec9d2328a5f8c61ddf224219a4f617e5c | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9615de96c422b99020baa861f170124dc489eac1 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/64ef2d54f5ab6e390840717339616e2297c6a0d3 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/25e4d72ed61ca335c2755c46d7a9e8a10cd03794 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ec559d0d29233b310792ef1606ff8fec006ab507 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d34ab0eb5ab795900355bf2a38270d75f9de3511 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b7516923c3332bc9eb424c462d8ca01d2c6828fd | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/67dd3777f39d7f2f0d9f6420b41c8b2885d419cd |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c99640d50bd59bb3d754bbf061d05347b86bb6b0 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/10f84e394894ef25ae06bae12789b644d9f2041e |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b5b10b3f3b48db3760e2bee781e2df677d4ee941 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1bd1c6d03af05b2795e8fac691741d5a9d518372 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3e921b04fcc3055005ce9910262d7f3162e2871e |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/7bb39bf588bfb4f3c6dd221dab0925b3f19dfc57 |     
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/a4ea87da502272dc2e677123b6fbcb0c23106f0b | ORPH
microblazeel |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/dd7452099a3fb332b74dadef5a2befad8e6272d3 | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/8239c0dce15c447e542b4d6c127ae9511d78587e | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/e9a8ff855a547d12a0e9a0f9e0a73c72402cf25d | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/995f46ee0033e34261ba7b24b61c41e7a088602b | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/3b9760c3bee42278ef0a91cbfcb1290d565ef97d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e8ba1a1ee7642f8a87db0ebaa4620dd0776a9d5e | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f2fbd573cdaa4ae04ccdd2e044e750007e9d69e5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2619b5440da66db4e01144870d6d4f14b30fd719 |     
   mipsel    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/82564225678574d0568c8e2550d326b2a3100f1d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4495699a23be650957507b90d8c0090b1853941e |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/dc566ff21e1c95b2b5c5d2079a9019291a31dd92 |     


Classification of failures by reason for next
---------------------------------------------

               aircrack-ng-1.6 | 4 
filemq-8940f34e0f1c8f25c1c6... | 3 
             libtorrent-0.13.8 | 3 
                bitcoin-0.21.0 | 2 
                  gnutls-3.7.1 | 2 
                      pdbg-3.2 | 2 
          perl-net-ssleay-1.85 | 2 
                  zeromq-4.3.4 | 2 
                   bullet-3.09 | 1 
              libostree-2021.1 | 1 
                 libpsl-0.21.1 | 1 
               memcached-1.6.9 | 1 
               netatalk-3.1.12 | 1 
                    qemu-6.0.0 | 1 
                   rhash-1.4.1 | 1 
                   tor-0.4.5.8 | 1 
             tpm-tools-1.3.9.1 | 1 
                       unknown | 1 
                    unscd-0.54 | 1 
                    vtun-3.0.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/da464dd449bb950104122535eabf8a4e914d0a9e |     
   xtensa    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/d06471ce4c161b61980343d76288d60be26efc48 |     
    arc      |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/007b7d88aed3902fb8ed10ee5c0ff0dc1899756d |     
   mipsel    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/69c33d6fa472d18586ea24c7e56a43d3a15a2bd9 |     
  powerpc    |         bitcoin-0.21.0         | NOK | http://autobuild.buildroot.net/results/cbcccce29811a78bf4ccb1f36a4c51b604993504 |     
   x86_64    |         bitcoin-0.21.0         | NOK | http://autobuild.buildroot.net/results/8bc5b5962be265a84d6f510984077ca4ea3b713d |     
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/6411bfac81ce5f7c4a8f0da59b224815a03916fb |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/2bdd92f88b8191f2e318c1cba0af3e477a95e242 |     
microblazeel | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/05926e2d4166aa587817739fbcedb01d5431d31a |     
   x86_64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/c5a247bdbd196aeeddcf04fe1fcbeb51e3a27b36 |     
  mips64el   |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/92dfb4e6967e2141165b06b5f094d12b47c213d4 |     
    arm      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/c4f82d9cedf39576d72e8db21f76775532d77625 |     
   nios2     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/b4f5f6112fc6edc87f09f367ed2fad3b8d8bb7c0 |     
microblazeel |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/442d5c36ac00a72b65928001db63b6633cd4ccde |     
    mips     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/f11a54c88b08ec04a58deaeefedc1f9510236e2a | ORPH
   nios2     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/037e813f122fcbe962da81f6dc32b7b08832c265 | ORPH
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/cb3780110e0edf6159b86464513dd05b13af5ff3 | ORPH
   mipsel    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/99be4017616a3454ddd7b4770e1cb92bbb4926be | ORPH
   x86_64    |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/034e4bd85cc101514b231a2105cf2987c8da5eb4 | ORPH
    m68k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/51c9c07cc1876d6ffbd2ace372b9d484f6109178 |     
   mipsel    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/0cc2076425c59e80a93b43f14d3130d2043b6840 |     
  mips64el   |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/fbfa1be035cff48f0a3ad569783e8561f25d9925 |     
    arm      |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/cedb1b36423e98b2ac9400df7935c03068c2c57b |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/34d782310ec106282686ed75536e5e985c417b0a |     
   mipsel    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/e52dc9c613c8c66216b1d381f70d3ed24c398402 | ORPH
    arm      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/a328e23df9b24446db0012704ff1eb66d06fc387 |     
microblazeel |       tpm-tools-1.3.9.1        | NOK | http://autobuild.buildroot.net/results/c104263d0fb6f758ac1e654b114f68b4fbfcf6bd |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/40ac88c1aca3c211bec8f6edfffb51a64ce0d245 |     
  riscv32    |           unscd-0.54           | NOK | http://autobuild.buildroot.net/results/efa1a1e9931dba2e06283d96151c7047bdfc15b8 |     
    arm      |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/6e66de44a61c4b0ac07244b8ab51821c47a54052 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a26cd962ad7a144b5789b85c7d0af8d583775678 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e826ca02628523a7108409a46f488bc436591abf |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               cutelyst-2.11.0 | 1 
                   eigen-3.3.7 | 1 
           host-libcutl-1.10.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/9816bfd2f8d1a7396b00ebebf777285a43a158cc |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/a0cab500e0a5a0d316d02ddb13f9e5bc50b0d8fb |     
   s390x     |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/a05b48e2710906222438dcec3a6caefd4e005937 | ORPH



-- 
http://autobuild.buildroot.net
