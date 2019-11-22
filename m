From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Nov 2019 07:17:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-21
Message-ID: <20191122071756.28A6285F83@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-21
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 11  |  3  |  0  | 14  |
  2019.08.x  | 18  |  4  |  0  | 22  |
    master   | 123 | 36  |  0  | 159 |
     next    |  6  |  9  |  0  | 15  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 5 
                libdrm-2.4.100 | 4 
am33x-cm3-11107db2f1e9e58ee... | 2 
                  cmocka-1.1.5 | 2 
                host-go-1.13.3 | 2 
                libselinux-2.9 | 2 
                   mimic-1.1.0 | 2 
                snort-2.9.14.1 | 2 
                 acsccid-1.1.7 | 1 
               asterisk-16.6.1 | 1 
                 dmalloc-5.5.2 | 1 
                  flashrom-1.1 | 1 
            host-mfgtools-0.02 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
                  libssh-0.9.0 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-19.2.5 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                  ndisc6-1.0.4 | 1 
                oprofile-1.3.0 | 1 
toolchain-external-codesour... | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/7e6b09acb8fdcd6bf60685f61bf3cc215b05ea41 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/e6f19057da77f098ddbd7ca47bb73f6e31248d7d | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/73a9c4caacaa1003c7789b33a29d9efc39c24f9c | ORPH
   x86_64    |        asterisk-16.6.1         | NOK | http://autobuild.buildroot.net/results/9763b7affd78a8002c470501e603e4d8b08f60c6 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/78ea188dd1561be48f13049b05a9e34a233e7cf1 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/399dfc8e261891ef523b185d8539d3c1c5f3a0db |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/1da40a4be87071e560d91aecd9918ef9348cf406 | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/ff1015f5bb240c64c7d6fc3538ef70169993129a |     
  mips64el   |         host-go-1.13.3         | NOK | http://autobuild.buildroot.net/results/dee5b4ae18bcbad717a062d8d55330009bca7346 |     
   x86_64    |         host-go-1.13.3         | NOK | http://autobuild.buildroot.net/results/123853d1a5735dcc8a295a61fdb832f2bcbc1d73 |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/ccf234212f3b587dd1f2456f21665d750b69de01 |     
   mipsel    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e3b9b2fd4c8c3f4967001e66d697b8765e9f27c5 |     
powerpc64le  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e63bd0b641bde5a66c8a7cf471ab0180a6540dfe |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/644de7cc1c6f989e0c4bad70f4eaf25209f796bd |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/b0336b79aac85bb8600d4a55599383a0a886feaf |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/4446e61cea15e5bebb5605d59e0bd0d07712fa0e |     
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ca9576721214ecdce5622f2b7ec4fd4fc3699ac0 |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/7dabb78619123023ebefe519760ac5e6602afcb9 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/f36d133a5402a9b4b86d4c97ac6edfb1598dd64c |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/1804ac03f40eb01af163914ff3de05ada20a8696 |     
microblazeel |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/f7562570e0f1232daf3d3724544fab1711c94385 |     
    i586     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/aa336875aaff6f24c89a104220ce960e8ec55add |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/420185ff840db75e30fe74717dd4c456c1b6c166 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e28508ed0d8ed2e64eaf912a2340cdbc4cf52de3 |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/7acb40072a760288b9ac4a6cd5e48e6d56be00fe |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/2da36192ac53004c9aebea59235944289edecfad |     
    sh4      |         mesa3d-19.2.5          | NOK | http://autobuild.buildroot.net/results/a3d23b20dafb13c6220480f52b05ba9e441f7cd9 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f276d6aaaa130a03330dd1f417710c5a1f877f57 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/656d696c8588fe70d5d37a404a8cb930db20b632 |     
  sparc64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/8b36409f710663415d77218cd46028d9b92374d2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4fbbce18a41f678ef065b02f60ce2bd8bd955741 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/588bc2de0bda0fc0679d5ec972f133e7f2ec8401 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/7cbb2ef98e16b5b3aee4c1010a47c57645ef5488 |     
   xtensa    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/04fb9292043995056a438ba328c73dfbb248609d |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f5eede40b9690316d4b35b6df97359714937c6b4 | ORPH
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/93aebaba3117df6090684f7a3f7cb3d987aa62ee |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                 openssh-7.9p1 | 1 
                qt5base-5.11.3 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         openssh-7.9p1          | NOK | http://autobuild.buildroot.net/results/474d8ed074dda40a70cc58d0b4a7d66aaa5e8a86 | ORPH
   x86_64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/c6f1881e51a9add6911a5c2eb19f3c79f8df1cd0 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/190f30164a405ba83d0a74d85f0e7b5337c64ca2 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 2 
             openjdk-12.0.2+10 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/594720d6e3cd51b5e145d91a6e26b026a289f849 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0dc337cf265a1a4b34424a767c773b77d7bfbec2 | ORPH
  aarch64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/b604f37991a88bf50cdc68f15e6605d139e7564d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b4a58f68c6e72b529168268ded7940b970778e76 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 acsccid-1.1.7 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                    glog-0.4.0 | 1 
                 haproxy-2.0.5 | 1 
                libgdiplus-5.6 | 1 
                libselinux-2.9 | 1 
        matchbox-desktop-0.9.1 | 1 
                   sudo-1.8.28 | 1 
                    vnstat-2.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/9de5123e0c7afceae3cee9f6b8beab386a10bb78 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/1c0aac56fca6f6f7293ba2046c991ed2f63e805c |     
microblazeel |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/ad906d86633abd51bbd8326b302ec9143ebd43c6 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/7aac18d7a3ff208d3028ed1583f259e208b57187 |     
  powerpc    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/497d3e21facae50a998dcb46ca46cbc3fd22469b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a8f30694712ea4374548c38e79f6de5ca114d3e6 |     
  aarch64    |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/1539ab9c437a099a5528018542e2168a1638f373 |     
   xtensa    |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/467e6ca266fc77014cc5793a2850f1c58391f0e2 | ORPH
powerpc64le  |           vnstat-2.4           | NOK | http://autobuild.buildroot.net/results/f5e277df0048e0c322e4c440d097e5d5897f7185 |     



-- 
http://autobuild.buildroot.net
