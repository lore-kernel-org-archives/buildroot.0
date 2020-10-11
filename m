From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Oct 2020 07:10:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-10
Message-ID: <20201011071022.F0064204AB@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  |  3  |  0  | 23  |
  2020.05.x  | 13  |  4  |  0  | 17  |
  2020.08.x  | 16  |  3  |  0  | 19  |
    master   | 122 | 52  |  0  | 174 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 7 
              asterisk-16.13.0 | 6 
                  boost-1.74.0 | 3 
              cryptsetup-2.3.3 | 3 
               capnproto-0.8.0 | 2 
          gstreamer1-mm-1.10.0 | 2 
             kismet-2016-07-R1 | 2 
                   libcap-2.43 | 2 
 Makefile:753: target-finalize | 2 
                  pango-1.46.2 | 2 
        python-m2crypto-0.36.0 | 2 
               target-finalize | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                clamav-0.103.0 | 1 
                 dc3dd-7.2.641 | 1 
               domoticz-2020.1 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                   eigen-3.3.7 | 1 
 glslsandbox-player-2019.08.23 | 1 
              host-guile-3.0.4 | 1 
kmsxx-cb0786049f960f2bd3836... | 1 
              libostree-2020.6 | 1 
               log4cplus-2.0.5 | 1 
              micropython-1.13 | 1 
                samba4-4.11.13 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               util-linux-2.36 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/319acca9ba59d5623167537ef85552dafa077e5f |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/2a8b47325dd2c89ad4c5aedf354a86a5a8a1b67b |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/71fc595ef911f90e9b5e6086f977aa401d0cd816 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/9bae327fee0592448bb197cc415286928de91118 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3bf28ea4fd106424423841260f21a552136213e0 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3aabd4caabe0da228d8342bb1170f543b8f96875 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/de8fa30fedc82a7c77bc6f806efac88ccafd4862 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/6c84e4cb716e19fab4a4acd40d87e53977e98e0e |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/90094cb2d11f1a912857db8736b14a9ca43a9276 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/80d9c885ca7f1f98258785c37a4eab56edac2e42 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/73e4f2bd6b8e6629a57e96ed56d18c7ef2f6fc71 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/83571d80b1dc1d3628c7b3066dcdb5ac442cc2c1 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f46508155957d3ee4d0341f2cc303e17c20e5765 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/e37cad4ed5b5ef6a7a55b5ea5e3c3fc3e5c1342d |     
 powerpc64   |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/6a7dba7a5b5abe0db80a01d46855b880b6e87fa5 |     
    mips     |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/bb54c2ea733c595365e6bf6635193123753c7e6d |     
    arm      |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/f6aeb1ca02703907c4911fa983a60f107a2f6f58 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dd7008a5eb55ff3fa15cf68431a5e42f632b2428 | ORPH
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/7b3ff4e421b0ffda719d42d2972452b694f04546 |     
   s390x     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/ad6e6fbc0db0f7c4b151360d6c9b2b0abf72fe91 |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/86ac9308af57107cb3e08eb33181c50664477ba2 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/ed3888b3801f7fa7b473b71160b4469d04743089 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a16db9bbb3f9b901337a38f22b44d1e4dffd82d5 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6fa5a56f25cae9806532c87affaf72a1d50306cc |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/9229fdb6dbb8cc8f19f6e0a24ad79081035a7215 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/64d93794c027277241f425199c26a49be1258991 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2f86d25ca8821f151dc89a24e45a265ce3a9d341 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eb5b2a05c3b2e52ecb9e68da5373600fdac90c6b |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fa25319c9b1484efbc6780d7ffa04dd29802d623 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c58689cb608dd83b94973b77c15c876ec465f978 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7836630a5ff55292a8f5a4b673b0795bb0d4d392 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aa6efa97f29f3ad9e5bc76a3c2b3ad6c27be4289 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3676c09cb1386147f70fb989fc5b9b71d17cb3a0 | ORPH
  riscv64    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/4378192a4055b171597bc82c1d0c72b04dded268 | ORPH
    arm      | kmsxx-cb0786049f960f2bd3836... | NOK | http://autobuild.buildroot.net/results/abb7a82275e35063767584f0451fef13bc2132d1 | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/874de6700a5822dc45d0f0114c6a4de9c88aad5f |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/ec620a586c0b0f83e275b7c0649c15a26a38b9dc |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/8da5fc9b4a5225e687fb583021ee2b93d2ee0c18 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/628a133ce8656469d461c8c0391a2f7676cf6600 |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/cc5e2d86e1433814e2f5701b8e07e57a7fcdabe9 |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/eb7cf042f06388c1beca173c23d0c3e4a8286f97 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/bdb1d520e77a676b146adaedf0dca825271a3664 |     
  aarch64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/11da0ffc818a27b1527ea4cbfcf8d573e8d0ddf7 | ORPH
  aarch64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/ec31642745300d5abb38de3497b536a8ff00bc35 | ORPH
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/854e80adaff19984582a063a2e1fdf36ca471b08 |     
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/6f39ad46ec8b78b3edc55a5871cf80393257028a |     
  riscv64    |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/b4cfbae42506ad6c803ef31e52f4ef1e77ba2f75 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/28a9559faf8a18be8446e405bba8ed4b0d99ea50 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b30c03d05024cd4708cb9d600f4af74365bd600f |     
   xtensa    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/62917d2d0570f87d2b1cd8e8119e018335b5003a |     
  riscv64    |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/99fc48b5e33ba19e2ff987daf650de27c1ea76f9 | ORPH
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/952760a2534c92aee1983dd0079b00ef53c2fc70 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
               target-finalize | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/71765a00f8daae9ceb30e8b9cacea0cc60280d6e |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/cc48927cbe9ae6c2d8b12d65467ec40df82febf6 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/954a6268e6deecad1acd0024b575bd3cca44f4e9 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               host-go-1.13.15 | 1 
              libostree-2020.3 | 1 
 Makefile:753: target-finalize | 1 
                qt5base-5.14.2 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.13.15         | NOK | http://autobuild.buildroot.net/results/bc4a8259e8760645668c5f5586db65b36d6e2ddf |     
  riscv32    |        libostree-2020.3        | NOK | http://autobuild.buildroot.net/results/b9ce79fa8b2bb3434a57ffbf8bc5dcf19c0455bc |     
  riscv32    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/ff4da360518e4392cb90aba906f1e46a628519c1 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/8c2dff3efa654ddcd4374f8debb90c6237af44fe |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

            host-systemd-246.5 | 1 
         libcpprestsdk-2.10.16 | 1 
 Makefile:752: target-finalize | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       host-systemd-246.5       | NOK | http://autobuild.buildroot.net/results/9e1917eb9bb737b1f75821ac90750066723c7659 |     
microblazeel |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/0a7ebf2bdca81325fc2b1edbea2fd00eef372b11 |     
  riscv32    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/f5ca64fe0a391726d43cc6c33d55ade36810e2b5 |     


Gitlab CI results for 2020-10-10
================================


-- 
http://autobuild.buildroot.net
