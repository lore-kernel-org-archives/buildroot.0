From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Feb 2020 09:27:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-20
Message-ID: <20200221092712.15B12860D2@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  9  |  2  |  0  | 11  |
  2019.11.x  |  6  |  1  |  0  |  7  |
    master   | 62  | 27  |  0  | 89  |
     next    | 19  | 16  |  2  | 37  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 3 
                 mesa3d-19.3.4 | 3 
                       unknown | 3 
              host-grpc-1.25.0 | 2 
               protobuf-3.11.0 | 2 
                 binutils-2.32 | 1 
                    brltty-6.0 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 haproxy-2.1.2 | 1 
               host-llvm-9.0.1 | 1 
host-sdbusplus-4212292bcf13... | 1 
              jpeg-turbo-2.0.4 | 1 
                     lxc-3.2.1 | 1 
                 opencv3-3.4.9 | 1 
           oracle-mysql-5.1.73 | 1 
                 rocksdb-6.6.4 | 1 
                 ser2net-4.1.1 | 1 
                suricata-4.1.5 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/9b4f50d9382239dfb43a42118b1fdbca622f5e1d |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/46bf48c22e22172e727831ec5d4f303898e81a4a |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/a950e90d5f8405534566df5c7a8875c293cf8845 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/61be01c06167dc77de5e745bda219ec887cd80aa |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/026e849d1703f723e99b4cce52c8b7e8f2275a25 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e625442942a366846d3efa8645a4ffc2e51a0c56 |     
  riscv64    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/9a81cab06a8c2272b80d51b830306f9d5d1f108c |     
 powerpc64   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/dae0bb8d2c683e75747f38db372909cdb0e420e8 |     
 aarch64_be  |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/b5c9eff16b668668c9150161f07d9cb231493e04 |     
    m68k     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/c89b11b9a8bfc67cf921360d0d46c1ca3d67c4a0 |     
   x86_64    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/691684aebacb33c8886399a83d7930fb9f6b9fa1 |     
    i586     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/16405447d9b6053101d71656b34198473e30f22c |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/0f6cf4621bfb2524a5f91e73690ba93e069ac953 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/4a2af5aa4b99424857dd1d873009e54ce61d7549 |     
 aarch64_be  |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/010af9ea5ed2f2422c3505eb3aab25f92b215406 |     
  aarch64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/e4dac0818c2dda847d907538b355f7eeb26d52e3 |     
    i686     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/7518398c4193a2828f26e78f54708c403be92fc4 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/31505b5186f0e205fe16feaff36b55aa763b8bf8 | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/8a1358a6b758d5de85951a55c3060360a536bef2 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/864523f5985e48fb0386368aac8b8e5527143386 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/de875a0e0e126b51834393bb48eb247d1eaf523f |     
    arm      |         ser2net-4.1.1          | NOK | http://autobuild.buildroot.net/results/3747259d5cb89c39d7079ad975441377cebc8d57 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/2c63d669fdb529c1ee07fdc918397c07f53a5f1a |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/181b1ae6e329942f9f468be8e999ed72d6220172 | ORPH
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/07efa72248e39b27b6d6d5fbc75719c427725558 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e0668951aded3551cbbc0a0fd83a2e57cd223840 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/edcb4e14406adcad6b6cd23d2a7e57c45214fbf4 |     




Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 3 
                   erlang-22.2 | 2 
                libgdiplus-5.6 | 2 
                      bash-5.0 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                    host-clang | 1 
host-sdbusplus-4212292bcf13... | 1 
              jpeg-turbo-2.0.4 | 1 
               libglib2-2.62.4 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-19.3.4 | 1 
                   python-lxml | 1 
                    qpdf-9.1.1 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/a8272a57e89bab0122304a30fb267934d64bc816 | ORPH
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/97d721c7a6cf8a05100c234a46cbfca5e43ad84d |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fa8c46e32342041849ac4f740120a43598a1fa97 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/77fa676397d0fc5f3a591771ff46f1d9a2dca82b |     
    i586     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/7550270d665b701c309ac1ea554dbce86e11a2e0 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/db5d3cfe76e4e10b1ce5c02618039943e85dfb6b |     
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/13a0d61e2f3362fc21a7d1a7dba34def97938e2f |     
    arm      |           host-clang           | TIM | http://autobuild.buildroot.net/results/0a82d859c3aaf08dd76eeb6b9676a5a7f71e2adb |     
 powerpc64   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/a02e983b152fe11a5dfddda26f9906f4c0b99d7f |     
 aarch64_be  |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/6845de34a71c3ef2f1d3bfbeb39dfa42de3793f8 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/5a0a85d5e59e52171f8251fb29a14605389f8a67 |     
powerpc64le  |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/21704c2859f49720b22726fe5b8e2302fa96914e |     
    m68k     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/a77a65c6e03f0868ad3fdd503726b418445e9730 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/4613cc66a4f88229569ba0e93a24e6932fa9ab73 |     
    or1k     |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/83a7843db5dbb83f29e6472a1c719eb14b215d81 |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/e0e4bc2c5926b96860fb31c28c24a4646525414d |     
  powerpc    |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/41f0d3f0c1faaaef904e21e6ce62f917520397b5 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/2566d6889e51481e8a16e7337c2aeb48d3bea2f9 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
                    wine-3.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/f6bb75c4b65caf1718cfbc240857c1e89322cbf2 |     
    i686     |           wine-3.0.4           | NOK | http://autobuild.buildroot.net/results/cc1a7589c19e8d60164c9feba12f04657f1c9bdd |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/e00fbbfaf3dbd17d8ab7e1c2f29315fb18b1f916 |     



-- 
http://autobuild.buildroot.net
