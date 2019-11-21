From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Nov 2019 07:16:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-20
Message-ID: <20191121071622.5F7E022812@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  1  |  0  | 15  |
  2019.08.x  |  6  |  2  |  0  |  8  |
    master   | 98  | 36  |  0  | 134 |
     next    | 12  |  4  |  0  | 16  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 5 
              host-grpc-1.23.0 | 4 
               host-llvm-9.0.0 | 3 
                libdrm-2.4.100 | 3 
                  gmpc-11.8.16 | 2 
                oprofile-1.3.0 | 2 
                 ripgrep-0.8.1 | 2 
                snort-2.9.14.1 | 2 
                  cmocka-1.1.5 | 1 
                  flashrom-1.1 | 1 
                   grpc-1.23.0 | 1 
                libcurl-7.66.0 | 1 
               libsigsegv-2.12 | 1 
                   mimic-1.1.0 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
               mongodb-r4.0.12 | 1 
                  ndisc6-1.0.4 | 1 
       python-matplotlib-3.0.3 | 1 
              python-pyqt5-5.7 | 1 
                    strace-5.3 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/f3d68e63963fd32361621ad64c658c16a613099d |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/9d6cf1aa8d7b9971c4f07a5b7191deda2e7f00bd |     
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/0855a13fc38758e29d10227b9f8de96e521e06a1 | ORPH
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/3de1fe382fecca38e3d80055a7bf80bc66843caf | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/b3c88e31ab638563b897c0d0fa8c092b74f4caac |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/4d0b3c03090992702cdfc04a9fba09384ad48036 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/4d40ea3e90891599a47e0fe7b4233f09a17c7146 |     
    mips     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/218ee75ecc912158a356793245b4277a739bc3a2 |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/3925a6abaa7caea5b7da1a8b9fca99fe0cdf4b86 |     
powerpc64le  |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/54fadb26c29d2e7933c7b932daf5cbd7c059ee42 |     
  riscv32    |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/4fd9e023b57aec27a32f808cf983f566f124aa4f |     
   mipsel    |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/cfe1f506b9cfad637a3763675d762be0eec17b5c |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/c52ccc039d45fc94f3dcb547ae6ac22fcf9d1487 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/5de8b6654f7dfb7006cbe4fb1ff58ddf76c9ce43 |     
   mipsel    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/19bf311fa80d046d087d23b2a47f569b2af22c66 |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/5885dd40859e4b617d02ea41f31c754aed25ae23 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ddf0c556ab5e518b303cb5435149f1c849c428d2 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/44bdc243f87ea8a3c56056517e0280266e0126b8 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1903b58b1d5e313e336ad72c11eb45d16b8af448 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1eed406898f06c3776695718d514e4de6df68347 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/df0439443a5a229ec5f7cc04b2f579e14ce485cc |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/4a11d6037629ec52a94a7fc726d4c005414aeac5 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/91b7e439b12ebf991430b3402b7261f43fc2317a |     
 powerpc64   | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/739f8385eb4d66d4d8c3f4c778bf507c2e43bd64 |     
    arm      |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/7dde318fde999195488fe7705318cb2efb09245e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8d9dfc9064b0400e26d2c58a377bcc285a8ffacc | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/8e096faaa44b876bd4175fe813b1d2ee10d0965e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/7f9bdeccbe955075fbeba03ad68929061d4c46a6 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/23f7f67aa483934a2d59fa0c901b87dc1a36fc54 |     
    i586     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/86eea913fa8b75d77976053258bfe44a65afd81e |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/c90f20a6a4711ea0a6cbbb8083b0de6d53e7604d |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/40f952a906b2481d3ac1ad38722482765bfe222b |     
  riscv64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/6e17dee044d60e93f37b33ca6582ec0c85984c01 |     
  mips64el   |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/4aa7e13f6ce3f5a715bf9906c6e9784bd315e773 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/1ca58729abffe6fac786d3fed124dde48228e5d0 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/68a6100b6d7700f1cd6bb5cd52c30324a17f9c39 | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-mono-5.14.0.177 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mono-5.14.0.177      | NOK | http://autobuild.buildroot.net/results/aa4ec8b842ba3ab12327ca595f4b085c6c1a0041 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.18.0 | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        host-grpc-1.18.0        | NOK | http://autobuild.buildroot.net/results/b77d7219b98188171340acfd3d9c4b8c347d29ff |     
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/524704b3639b5df60adaea0b5563c79c13714e1c | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 1 
linux-serial-test-9965dad53... | 1 
              spandsp-20180108 | 1 
                    strace-5.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/2f5195c8c6251c179b958c8447fa7c80813f485c |     
microblazeel | linux-serial-test-9965dad53... | NOK | http://autobuild.buildroot.net/results/edc3dd8031b9720f8bfc0e2fda4222d74b1b2505 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/90ee26600173da1b8db491488c7c0f99e840c520 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/8b6105e81ca4b8f27432ae3f0c85bb95d0ff8a07 |     





-- 
http://autobuild.buildroot.net
