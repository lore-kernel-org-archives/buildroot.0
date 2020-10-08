From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 08 Oct 2020 07:11:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-07
Message-ID: <20201008071122.B842686D41@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 17  |  2  |  0  | 19  |
  2020.05.x  | 17  |  5  |  0  | 22  |
  2020.08.x  | 20  |  5  |  0  | 25  |
    master   | 103 | 36  |  0  | 139 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 7 
             kismet-2016-07-R1 | 5 
                  ndisc6-1.0.4 | 5 
        host-sentry-cli-1.57.0 | 4 
                 jasper-2.0.22 | 2 
               target-finalize | 2 
                  boost-1.74.0 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
          fuse-overlayfs-1.1.2 | 1 
                host-gdb-8.3.1 | 1 
              micropython-1.13 | 1 
                  pango-1.46.2 | 1 
        python-m2crypto-0.36.0 | 1 
                rocksdb-6.10.1 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/cfb9fba31df213049548f2ae90a8caf218649131 |     
    sh4      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/25b678c8c45bcbe6b81fed285ad9d6c0b6a00b69 |     
   s390x     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/8a5efc834fe1605b7902f9eda0fdc3a0da93c5be |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/1ed3f966dab9debba5b43df6062c29e3df7e7194 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d87db64427f25f3fb2a34c4b282a4cee5d7e27a4 |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/eb2b2f4c35befc7e621de30bb5d2518b4c614c5c |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d7ed254bf13b7fb9059f2ed60c5b863e5d4dff98 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6a4bd70a836011861eb103a653981d746e329ef6 |     
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/79292c2b724bed1b7661c785652b4d22eb231bf0 |     
  riscv64    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/3f0b7c7e903e7db9079e79833cfbe1e469544c49 |     
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/0449adb3243ee02d1685c97b41a8c6b52da4c265 | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0f9896629f6daa01854164cad9b975816281d45b |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/068354304731d771e185e76628ee2fa9f278e2aa |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5960b57b0568f0d359fb9cd457e7153302fd05c2 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e2ca4bc1f23427b7b9d2bb099c77bff21aed892f |     
    arm      |         jasper-2.0.22          | NOK | http://autobuild.buildroot.net/results/a06797cdc5a41392b7e94f30832dacdb35cc65a5 |     
   x86_64    |         jasper-2.0.22          | NOK | http://autobuild.buildroot.net/results/210dd424a9a9d8d015dd8e6d3f9346d2661aa208 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/fbc450fdc4404ae8e68eb59a819c4bba0f90b5fa | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/4bac672bfdf629bf20a4ee25def2792bdf2a24d4 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/2e109e4d05c59886b59547f5f4766bc09e070328 | ORPH
   s390x     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/f03d7a91c54f7a985a8af4ad0535445d681f776a | ORPH
   s390x     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/775c78538a7a4171934b12f0b32bbf8beaa8df11 | ORPH
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/f963497a19c496ba3f7705f1699f97866f61039a |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/850ad4a2261e167f1881344b75a6ab27f94f272c | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ad2f7a9927e995d2fdf606b3bd15aedad70e8c80 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/bd6836a908d69328fdbae81bc8a0b22452a30113 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4656b3d01fb219aa2b45a7b8d510a37e71a01921 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/6aea33426a86c29ae7e6115e6726371b442f5878 | ORPH
 powerpc64   |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/3dd93fa4b9796fffd3bad3a5cc0257fc6283d698 | ORPH
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/60100c7d4e2585ffe7a6b545fc560761b2a7d433 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/d67ea133a779d8a2090a5ee7c3095379eef7a85e |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/607640eeafcd372fe63225bc9b3f26f647a5f6a5 |     
    i686     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/23618f305e735e6446dcf36e299c3b70d6bc7c13 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d3c2f58aee80003d57fa0c58acb7d592e7954266 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/2775ac921be35466f11169e4f9e85b227f5556c2 |     
   mipsel    |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/171172f7854d291d0937918f3c40ec2383a3cfe1 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0166b85d18fbd13bd01f9fecdcb6473bdfca1ed1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b7d4d6f0a5372a1481326c77f7d18f4c040ead93 | ORPH


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              luabitop-1.0.2-1 | 2 
               target-finalize | 2 
                coreutils-8.32 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/48eca7ed4c68fca39bae02e5b88cc97afb532b67 | ORPH
   mipsel    |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/a779bf6bfb571f6908f6e470d4fe540bea13a160 |     
  mips64el   |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/d967b1445a62941873c4d8a4355fc6bce86fc3ee |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/55fe65e1c25375d1314b328d0598881c16235497 |     
   nios2     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/0eda62f5030b6f83e46ef49b8f3279a0be58c8d8 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
              host-grpc-1.30.2 | 1 
             kismet-2016-07-R1 | 1 
               target-finalize | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ae595e26c7b5dd3430a3db85d3383dc6c99888ca |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/2ba77a881f8f3cbbfc5e314ed230d94166c5a640 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/4dd84bf5eaa4a00559a39d812e98f2c8dbd2d053 | ORPH
powerpc64le  |        target-finalize         | NOK | http://autobuild.buildroot.net/results/e9176b72caa2c6318031693e143e769a8880ed15 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/53d2cceb2bb013f39b634c9a1f5201ae9d110744 |     



-- 
http://autobuild.buildroot.net
