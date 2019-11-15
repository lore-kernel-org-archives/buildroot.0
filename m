From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 07:16:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-14
Message-ID: <20191115071636.6103188863@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  7  |  0  |  1  |  8  |
  2019.08.x  |  6  |  2  |  0  |  8  |
    master   | 107 | 39  |  1  | 147 |
     next    |  9  |  5  |  0  | 14  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 9 
am33x-cm3-11107db2f1e9e58ee... | 4 
                libselinux-2.9 | 4 
                       kmod-26 | 3 
                  gmpc-11.8.16 | 2 
              host-grpc-1.23.0 | 2 
                libdrm-2.4.100 | 2 
                   grpc-1.23.0 | 1 
host-google-breakpad-7515ab... | 1 
                libgdiplus-5.6 | 1 
                 libv4l-1.18.0 | 1 
           libwebsockets-3.2.0 | 1 
        network-manager-1.20.4 | 1 
             openjdk-12.0.2+10 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
                snort-2.9.14.1 | 1 
                     squid-4.8 | 1 
                    strace-5.3 | 1 
                    wampcc-1.6 | 1 
                     webkitgtk | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/eedb814263c5de84d44a877e5299c1ac43768fc1 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/0ece6ebb7c73cb66cb43d47b49e31701eda19938 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7f87d320f3b2ef74310218d8334007e041f92d20 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/94c62e794e80299779af7486e05f76c1e0eb16d1 | ORPH
   mipsel    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/ec0f3bba3553cbe546bac98b87561c3238b3de03 |     
   mipsel    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/d2ee39e42d0c0055754fb9f250bd66e9332ea90b |     
    m68k     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/c440370080924552f3392a69f7d402fac0fa7c5a |     
powerpc64le  |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/558fdcea94a344988ebcc69de905d84d1f13785b |     
   sparc     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/f827af0d3f4806bc97e70cc0eaebe21774157022 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/df61308185c915d3522e5965082a9410d1ec5529 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/6aedf79893d73db70a99bb1ae7419c24499a3ac5 |     
  sparc64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/792c75bd2265ba6f113870b7ebdb56a240157c98 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/31b08abde4aa8f83d2e1b8f4bde1d8792376cfb5 |     
   mipsel    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/6fddeb120e751cbb6a8e8dbdcf19569b45d1970f | ORPH
  mips64el   |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/1a767f270806ea1cb1c89eb657a95c26489526ea | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/57f09f495a287d88437697997bda8c8fbecd2889 |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/f46e3bf72c5174e1a2d2edd0b94f20dc3b4d1d88 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/549c44eab3d54def7c44e500a60c353ca53d9d7f |     
    i686     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/6127ca5c2be7ee62916c059f8d914903e70f216c |     
 aarch64_be  |            kmod-26             | NOK | http://autobuild.buildroot.net/results/bb46c5e4677b506ccbd83f560248069c05e40b01 |     
    mips     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/e9645d9969481b09f507f6e0d0b35faaa283eb60 |     
   nios2     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/219c52dc8e19f3f44959019bcd3e1f9fb350fb33 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/66bc0682331f039389befd9e0d5368486750a171 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/d0008043cb818d5c5b24cc3b6d8673396cbc4dc0 |     
   nios2     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/a85b2d19cf87d0c675f322887ec61c03e800ca01 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6fad51b79d7e9780663fab324020d30515ed6256 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8730b6f844fff5b1908a08ffdea8135ad128be15 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7f39a5a6306fdac81138f4221a63a0dc51d50341 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b4497f19feb682aa76837ce6445ef7dc265ef7c9 |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/e0e506a1bedcecf1ea217c927babc12e2f89a941 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/3120f4a215d8f5a1c7f926959c32070c7b3fc4b7 |     
   nios2     |     network-manager-1.20.4     | NOK | http://autobuild.buildroot.net/results/2025b1bd721bb5c5fa6638ccf389d2fd8fd10339 | ORPH
  aarch64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/943d9aba9002f2791e5feefeb3e9af7bae58eac9 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/dc62e7deff2942c6018bb7473072f9d378326bee |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/201d4a9c4c9ee02c92359007a413c6e920e3a2f3 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/0e35f561f7fbc3c49742fbfea45ba411000431a8 |     
    or1k     |           squid-4.8            | NOK | http://autobuild.buildroot.net/results/77b60034af7e634abc8232775d67ae630dcff4aa | ORPH
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/8add59897ae39ba2feb79b32a2db36b8d8f14a5d |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/416d08179f89059af08d0ad2bac63adca07b081b |     
  aarch64    |           webkitgtk            | TIM | http://autobuild.buildroot.net/results/60bdb7befba09f1e8429175204915836beef8841 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                    host-clang | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           host-clang           | TIM | http://autobuild.buildroot.net/results/cfce874cad0b550770175ea177da2c113261449e |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

               libupnpp-0.17.1 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/3f4b5ea1c6002c0f1073010103a131ed8c679a8c |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/60371303f0d985feb36b0f5e44c959fce1098835 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 1 
                  gmpc-11.8.16 | 1 
                 haproxy-2.0.5 | 1 
        ltp-testsuite-20190930 | 1 
          modem-manager-1.12.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/521d68208983d09bac2482ee0e29cb2dc20325eb |     
  riscv64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/e7f37080c20e2131613517c3007b4569c28dbcf2 | ORPH
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/c41ccdb159b447daf353e877ed90c6d473421ab9 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/36e7804a9b78a0662d76cc92cb3a4377b3a63134 |     
    arm      |      modem-manager-1.12.0      | NOK | http://autobuild.buildroot.net/results/2386d296fd00fca506053d213806200f4bca80d7 |     





-- 
http://autobuild.buildroot.net
