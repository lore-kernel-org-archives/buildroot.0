From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 07:17:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-10
Message-ID: <20200111071757.E0B1C86BB2@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  1  |  0  | 15  |
  2019.11.x  | 13  |  3  |  0  | 16  |
    master   | 87  | 56  |  2  | 145 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             freeswitch-1.10.2 | 8 
               libsigrok-0.5.2 | 8 
             libva-utils-2.6.0 | 8 
              host-grpc-1.25.0 | 6 
                apr-util-1.6.1 | 3 
                 exim-4.93.0.3 | 2 
              fluidsynth-2.1.0 | 1 
                      gd-2.2.5 | 1 
                  gmpc-11.8.16 | 1 
           host-doxygen-1.8.17 | 1 
            host-mfgtools-0.02 | 1 
                   host-nodejs | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
                libglade-2.6.4 | 1 
                   libnss-3.49 | 1 
             libopenssl-1.1.1d | 1 
                         mimic | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.5 | 1 
                  snort-2.9.15 | 1 
                   tor-0.4.2.5 | 1 
           uboot-tools-2019.10 | 1 
                       unknown | 1 
                    xen-4.12.1 | 1 
    xserver_xorg-server-1.20.6 | 1 
                  zeromq-4.3.2 | 1 
zxing-cpp-e0e40ddec63f38405... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7f9c8ae585da1666d1f1eb031b3b17c28606b578 |     
 powerpc64   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/637e20cb3edd8a66ec1294cc4257a4fec4120ce2 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/62edbc406c80a8abc80708b7ca3ed882303ef778 |     
    arm      |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/cfc45adbf4a0fdb82f004a6a044310bb9286f773 |     
    arm      |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/ed372ecc8ba154d2c6c5913ea8627e28b22a7e85 |     
    arm      |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/88609eefe55af2ca50d43e17d3424b923528b07a |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/969ff9e07a9c4ba50f9db5c2705e672fe35704e9 |     
 aarch64_be  |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/13265fdbe2a0429c83805742c68e3e512208129c |     
  riscv64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/122a1f20388d0cc1cfcf6bd6e79294c7c5ef93c0 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/6b5ad42d744619992aaaf91af51bdf9b52c2e7a2 |     
    m68k     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/1d379121b8ce926a3e0e324ccfaffd831e75607a |     
 aarch64_be  |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/ef1f3992a73babf60ecf771da0278cc04a5ca280 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/682e345c0730539e2b1d1a95d12d6f65eb32e554 |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/c1dca24f95c1fa767042b52e21ca86fa046dbd19 |     
    arm      |            gd-2.2.5            | NOK | http://autobuild.buildroot.net/results/a4616967d1b038f6ec2c15fa41fd0e3ab62a7e43 | ORPH
  mips64el   |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/fa2c480f98c21dda9d18f7a6281bf210c7f11f73 | ORPH
  aarch64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/c93931d2afb9dffc21071b5437e4e12726856067 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e8a4ee3335a82bafe8d40c2662c7d3cf5839f1fa |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3f2e4d36e206a106fb66df30e6fabe7f7931bdf2 |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b80d02ef943c83d007eb79d4aba19ed0e0784caa |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/31fba87cd1bf0026cddf28cd123a83213771d7c2 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/db7d0523cfdef02f797b29f64dbf55683b10a178 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ebe9c3ed44dd0dd15ee06c306c261b2f582b3d0d |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/3fe219c4437b91ff51e627d12ab3483da58e1784 |     
   x86_64    |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/4428d8dc79ab0f728218c565feb14200bd1d0c67 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d6cf6de8a1b85075166ff4363992bcf3b23cd850 |     
    i686     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/6e12c8f3a64cd9241901666ed55b8893ac72803c |     
   x86_64    |         libglade-2.6.4         | NOK | http://autobuild.buildroot.net/results/f55dd098e1a229e50f078c1c760c6319b3a4bcd7 | ORPH
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/d3d5da5d0f3c495376cd0f3d63b846ff16d429d9 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/c26b7509a7103948fbb8b756b9fcabe6441ce562 |     
  riscv32    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/a4b19a21a5c1e350296e289e1edb28e68bc85617 |     
  aarch64    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/122cc5a7cff417c964649cd6fa3b0a5e28c41ef4 |     
  mips64el   |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/f4e8c41462d54c6e201eb65e1529aa6a03d86260 |     
  mips64el   |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/ab2e2bd14bae02637634449f7ca61c2ce3dd565d |     
microblazeel |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/493ef46a0a4a58e7c091a4082d2b084eec13eb38 |     
    mips     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/64a89bda7f714eb1681a09cdf842d87854a599de |     
  riscv32    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/d4c1cc2b374a75cbb558209de8c87d1aaa4f6b9b |     
  mips64el   |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/bbe212347f403338bd77ffc20c87ec0118ac75b3 |     
   x86_64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/ba1797468b616e6afb2e3fbd35d024bdb2864279 |     
    arc      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/7a9ed884247ed9549cd440769fe26a68125119f6 |     
  riscv32    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/32ec83756735833ed5c0735579c44d55e05741eb |     
  riscv64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/005772cf7f17f3c774f3dd75500e8d7c1102d04e |     
    arc      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/87df23eccd894c27307bd75f878a42cab8f5096f |     
microblazeel |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/9f869bb0ace73a76b47afd39fc96378c6488134f |     
    arc      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/106f7e23345d0d97653819d30bebd592b5beae59 |     
  powerpc    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/a017f3c07e12625100c1cbc8fb3e3bc529efd4e4 |     
    arm      |             mimic              | TIM | http://autobuild.buildroot.net/results/8ae96ee4ef9be9672ef1fcb7b35269ec311667b6 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/bcd2aaf1cb5c272a8e13e7bbf9557bec2ef4372c |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/810e13587090a89eca3b36687c538314db7744ef |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/62fbc2986a323967b07b2bdec64ebbf25c7ce8e4 |     
powerpc64le  |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/c787870c28b28581a8dda09b07e86c38acdc8a45 |     
  nds32le    |          tor-0.4.2.5           | NOK | http://autobuild.buildroot.net/results/7003e6dfad7558aeae3c761d0104d28ed4650ad9 |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/fe535aee7eea7cc4ad5f40c72239c1557d8a7f0b |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/65059b0038b8205bb0aae05cd9fca1334d4d0c30 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/4c8e83e3276cabad101a7955dbca3fa385ce032f |     
   xtensa    |   xserver_xorg-server-1.20.6   | NOK | http://autobuild.buildroot.net/results/b35eb6582e0a2180ea4f162869898bbf228c0945 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/41f6917035069990e50348dfa4b8291639287173 |     
   x86_64    | zxing-cpp-e0e40ddec63f38405... | NOK | http://autobuild.buildroot.net/results/c9e57e0f59675218b766f0722be0703b7d6d721d |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923254  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923315  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923342  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923359  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923361  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923362  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923364  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923438  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923477  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923527  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923614  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923605  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923608  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923651  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/398923696  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/30d3dbaeeaebbb9c93b0a2fc6527074818489798 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                     gzip-1.10 | 1 
              host-grpc-1.23.0 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/9f32f51ea00482d00b7c11dd8e72599e5f75934f | ORPH
    mips     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/d3874b51d893c950d9e9d64ebd98401eba25d750 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/f3d3bc2623d5a11616d0dde8a03d1e45558e69ad |     



-- 
http://autobuild.buildroot.net
