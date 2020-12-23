From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Dec 2020 08:14:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-22
Message-ID: <20201223081429.4C66D871EF@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  0  |  0  | 10  |
  2020.08.x  | 12  |  0  |  0  | 12  |
  2020.11.x  |  7  |  1  |  0  |  8  |
    master   | 48  | 60  |  0  | 108 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 29
        host-sentry-cli-1.57.0 | 5 
                  boost-1.74.0 | 4 
                      rauc-1.5 | 4 
              fetchmail-6.4.14 | 3 
                 host-rauc-1.5 | 3 
              asterisk-16.14.1 | 2 
                  apitrace-9.0 | 1 
                    htop-3.0.3 | 1 
                 libusb-1.0.24 | 1 
                 mesa3d-20.3.1 | 1 
                openblas-0.3.9 | 1 
           python-pybind-2.6.1 | 1 
                    qemu-5.2.0 | 1 
                   rhash-1.4.0 | 1 
             timescaledb-1.7.4 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/8fea93a88bb34e98e391a048c3b996b45ebac803 |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/6e6014d5bb6026d318de2fe68896355aaed70946 |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/0fb354c2ad814cd3b9dbd133a1f56cf509e15207 |     
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/552bf159da5694e6aa12e92bd74e0fbbfdd6c16b | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b606681f69c68b302181b5e8839d38abd7f7a802 | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0ce311cd3fffe798350fa0a855502bd72bb7b2a7 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f1e32468c01bc749d32eb6082b12ede35caba1db | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8a25744fdc64a7b5bd821d5b7a07b1f2abd2080b | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/fcedecc388c177988e2a084ae6bb475da32c50fe | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/98f61612735958af8b12d9b9f5b48ff628632884 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5db9ee8ae2bd9a319b48e7a211e694901905d6d9 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2e7e618879e60a2a7e0615ee04ecb42b41d2cac2 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/25335c8982e3cae3ef145352747b1d136a500865 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/56718a1b1a2c5491a8e1a98ffe083050057207bf | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7201b0bcd11a78aeafe336dd366fa2c66cadba89 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1d9f3a2038f6edd4597525e19ee6816b8e805341 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7fa22df97cbc2cc53fe9d90cbb582b95d9a2a2a7 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5c94040ac3941c0c6b46872ba35f58d920822ee1 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2c54e30b97fc99203bae351bf83ba4cc8a7a4550 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f3a732f7afa501e6d5c076e006f3bc13f4f5ceec | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f6229fc1d324624a55171668c5a5ac53e2b2b070 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/65734f186f6a780e4f8654a2920af972249606b4 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4fce74545425be09e0b0e0ae3a168a45fad29485 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5d30caba9eb726df1382f568d29ad86cca683579 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8415b084b1ff7eb644a94bc588fcbc3ae126cebf | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4d75df2683cb5035b0775babddf138ac04f3c05e | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/be49c7eb7ad6a4c4fc5a42db04a4bf74717831c1 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0d10c400c4e843d8a697d4c81dacdcf5e118ddfc | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/579888d92e5ccafb9e038788ebcd240218099c1b | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3d607cc8f695175ee367052ce779f61f4782ae97 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b0bf0b24a560f96a289e3e0708b0bb6871f3f840 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0c625ced294233954fac2f0853eb36336d119ee4 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/a752aeff39793df27f52e3be90504328aefd8b0d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/5bcc4fc33f7b9dd65e91d52093479aa17bd9fcaf |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/01dc092045bb09e20e44aad351327800d06b8044 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/33db653946b68ab1557dd0fa515056db5c87181e |     
  riscv64    |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/fbd71b3ebd72398de34634e1754a99d59ce3afb0 |     
    arm      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/3153d79ffda0757932f723f6e06e1450617f5bf7 |     
    arm      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/f55e532e4e8e3e3b1aea77166877bbf4bc8fda5e |     
   x86_64    |         host-rauc-1.5          | NOK | http://autobuild.buildroot.net/results/38b825ea61f06f7c3f2346122030c2e8577f6db5 |     
  mips64el   |         host-rauc-1.5          | NOK | http://autobuild.buildroot.net/results/064363b68f7bb62b5bc67b5ef24053b82be66cda |     
    i686     |         host-rauc-1.5          | NOK | http://autobuild.buildroot.net/results/95449327c31c5bfec7fb28c7e0fb3f1ad4edfe33 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9237e8edc5c20ee832a700442a1fe9ed17b1f330 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/66f92b909d3e70c4e72686d1f8ef74a39ecf64be |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d43a2cbb8f8a31cbb5dfdc2b33718427e37040b0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c375e08c1d8ec8cdecbec1d14a66031d63aaaeba |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/28b01375365d747c9ff9ff12c96aae16f4c843ae |     
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/020650e0dd72f7ec1a1f75e1291d64120b33ae4f | ORPH
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/facbdbab37af964d40cd6d05eb4571e914162812 |     
    mips     |         mesa3d-20.3.1          | NOK | http://autobuild.buildroot.net/results/060936814989281d9de1e2c1711cff386c5073a5 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/ea460e83a11cf1bb3ac0b9f543a54c56fd277d9f | ORPH
    i686     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/2744d774db645bfadadb3621e6734ef92b911114 |     
   x86_64    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/21b5d8fce6e364ef497091fa579ecdbd40b66fff | ORPH
    arm      |            rauc-1.5            | NOK | http://autobuild.buildroot.net/results/d0cfe637df9f60de4f5855e142ee38f203e11295 |     
    arc      |            rauc-1.5            | NOK | http://autobuild.buildroot.net/results/6511b55ea2a331ff656c3cce62a91712231549f7 |     
    i686     |            rauc-1.5            | NOK | http://autobuild.buildroot.net/results/b1493aef0e90c6477227d9f5e37ef12467d33b48 |     
  mips64el   |            rauc-1.5            | NOK | http://autobuild.buildroot.net/results/829ae7ed66686c11a941ac99bd08a06f754affb4 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/2ed9c91d9526f7e56eb3d6f0849d248f9d3670c3 | ORPH
    arc      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/41f5c64317ca7a0702eabd758d7fb5dcdc170a07 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/910700d58b85cd98705235f45e206cba730531d5 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

pistache-f2f5a50fbfb5b8ef6c... | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/28e8f07c3a0547dc7b9459cdd9b79299053409be | ORPH


Gitlab CI results for 2020-12-22
================================


-- 
http://autobuild.buildroot.net
