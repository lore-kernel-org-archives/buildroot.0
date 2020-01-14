From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 07:18:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-13
Message-ID: <20200114071828.0B7DD2049F@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  9  |  1  |  0  | 10  |
  2019.11.x  |  9  |  5  |  0  | 14  |
    master   | 92  | 43  |  1  | 136 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 5 
                   libnss-3.49 | 5 
                       unknown | 3 
                apr-util-1.6.1 | 2 
                      bash-5.0 | 2 
                 exim-4.93.0.4 | 2 
           host-doxygen-1.8.17 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                oprofile-1.3.0 | 2 
               acpica-20191018 | 1 
               asterisk-16.6.2 | 1 
                bitcoin-0.16.3 | 1 
             freeswitch-1.10.2 | 1 
                    git-2.24.1 | 1 
                  gmpc-11.8.16 | 1 
                     host-llvm | 1 
              jpeg-turbo-2.0.3 | 1 
               linknx-0.0.1.37 | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
                   mutt-1.13.3 | 1 
                 opencv3-3.4.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
               protobuf-3.11.0 | 1 
toolchain-external-codesour... | 1 
           uboot-tools-2019.10 | 1 
                     vlc-3.0.8 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/dbf080f61c935ba6791d49e4030f6aa7926bff0f |     
  sparc64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/8843b7c231c565d358fe4b031b0ca4a927b3bece |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/fe62db307e99dae3a7fd82df1665831d1ed12cdc |     
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/81f86ec373ac8d8063cf28e287e90ec3dc5fc806 |     
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/d7e2ee3e62d0baf28b9a21e68676c348abe3cca8 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/209dc302e3cb81aac55650654fdc4ba7b434b181 | ORPH
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/a31b5083fcc14b3ef84c11a66f3f16bcb61a728b |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/a471b65765168d80b52a8600ce71af3fe652ba80 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/96b753a4b18981bcfac8fe584958fbdef1b9194d |     
microblazeel |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/254df1722b3d5bc149efc8b512df00b1086be232 |     
   nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/abc08e86cfb37507c5d74b02bd566e4d7b20dd36 |     
  mips64el   |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/cdbf76721753702bad89f624b3a151375a666081 | ORPH
    arm      |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/f5357aab5be1a65995acb4dfa8274f1f867a90e0 |     
  aarch64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/26943ed216e598c1ee12ab3df07a9847053b791e |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fbef5da37d8e30b1c8edaa1eb01f4a1218faf375 |     
    i586     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3f724caeabd5f72952b20b6a592434146c097a89 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0b4936ea5a92fe00f29e215a892eba9bc7839351 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f76495c7b7e34b880253f5affec0388bbed7a4ea |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/19ee4b949a0b59116d9228cedf1b044af3a80311 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/1d642f99faac3f44933587be1d1e825fffd622a7 |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/eff3ee35496c8ea8097cbdb4c97874bee827c7bc |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/97b6ca15f27db953ef4558205222da358004bd3f |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a32bf937fd3f3f6d45f462fd007dfa87b2b1baaf |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/1e29a3ba5cbb2d279db9ac641bf98d258fcda626 |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/e830018259bf80b6a0b253b71a644bafb45b142e |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/2a8cfdc403f210f65d3106b1516077a183fd8e85 |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/d7980dc5321ac12cd5a928888eda5a7673ee1fc6 |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/4803c4419f080f8424214fe35016a6257b2c7a35 |     
    arm      |        linknx-0.0.1.37         | NOK | http://autobuild.buildroot.net/results/758ad4accbb2a7d0ee401bec0b71290fc5b8f5d5 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/85b5c2c27a7236dd99b50a00b1567cb2b3dc6e67 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/dcc634fc66c9580cbc9314e37a94fe8923590688 | ORPH
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7bd65c939a942caf0c9b0e3cc7d82b90dc5b713b |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/219258c90709fc34748929f1dcdf4f0649215e61 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/dbe94f2819602bf3a13c461016f7fcf6de769e50 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/bcc96cb2e1d38b5802d165a859738e109dedaf55 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/822a294062b44f42c510e66536cf577fdeaa7999 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/5955f487295b94033bea9d0449e6ae7626eee64d |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/04c39f63b83f880e4b82153c8c8981e68e020ee9 | ORPH
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/cd4ef24164956fda257dbb37ece85299eb4d380a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/00d9226114d0fe510ed320fafd8aee9ebef99ba9 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/4779233eeff29c8b5ef66f72c0c0714b4d5ccb5e |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/d2bb1ea6e83961b365a414f10e002e4c81a8c7d5 |     
   x86_64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/4fbe42c2e916350622691331beeb64426fc8853f |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/cd61b2341dc2b10b1964cffc74767f839eba74d2 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/a93f8f8cf0e431aff3ff02e31830658545958a04 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
                  gmpc-11.8.16 | 1 
                oprofile-1.3.0 | 1 
       python-matplotlib-3.0.3 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/272e4921f37ff8cb9990fda548ffae55ff693992 |     
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/4cad3a6ddaa9d149fc08c98dc7cfa480064ffae1 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/9a6569876dd9b4840792646619c58ec3bbbbf170 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/908b643fd9a69c966cdb413b9f04e006d5abb704 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/14af2dc3219847a92c6ec2db14ba387159b61fde |     



-- 
http://autobuild.buildroot.net
