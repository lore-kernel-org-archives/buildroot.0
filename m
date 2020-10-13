From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 07:10:01 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-12
Message-ID: <20201013071008.34F16869F5@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  5  |  0  | 18  |
  2020.08.x  | 19  |  5  |  0  | 24  |
    master   | 114 | 39  |  0  | 153 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 6 
        host-sentry-cli-1.57.0 | 3 
                   libcap-2.43 | 3 
                  uhd-3.15.0.0 | 3 
                  boost-1.74.0 | 2 
                 dc3dd-7.2.641 | 2 
              micropython-1.13 | 2 
                 opencv3-3.4.9 | 2 
                  pango-1.46.2 | 2 
                       unknown | 2 
               capnproto-0.8.0 | 1 
                host-go-1.15.2 | 1 
              host-guile-3.0.4 | 1 
             kismet-2016-07-R1 | 1 
                       kmod-27 | 1 
               libuhttpd-3.3.1 | 1 
                    mpv-0.32.0 | 1 
             quazip-legal-info | 1 
                samba4-4.11.13 | 1 
               target-finalize | 1 
           uboot-tools-2020.04 | 1 
                    xen-4.14.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/0731ce7154cfee7c2c193a9789b164c8e26ff6ef |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/30c7fe75bb26e5e8024b67981a9533a0a95b572c |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d7a95beda15c9aab2ce5211b9c6c9a8e36b9c9b7 |     
   s390x     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3d3b971471dd399c1ae3bafb3f974473d8c14e7e |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d929a9044f4c61dca61127b5592bb0242a384e93 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/497ba13bf7c7c38abbd38f26121d2a98ca1c7ffe |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/3016fbce83921a959ae4a1cb27975fffa30dcace |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6ff7938b3a05c80d0ab84b3fb35277de1c97744b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0c107ab0f976d0b2421ed14cf04965e8b6200524 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/93782f373f7b6374ff632c88f46ab435927824a8 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9ccfe02880a9ae260116c64dd833e15b2f05f0d1 | ORPH
  mips64el   |         host-go-1.15.2         | NOK | http://autobuild.buildroot.net/results/69c44b5e248cffd36c4b85df0ecd0cbadad2a9d0 |     
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/1056d21f3b341c31064d7bf98aa060a64e690e2f | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b89a563bb5720e8be729e9e630915525941f09cb |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/87c3733a83965a6cbe0280da0a7b8c65d193d90f |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2614d2edd962bc7294be9294e29b474078e01c3e |     
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/e740c437dbe0b85fffa28e261318d9279fe30835 | ORPH
  riscv64    |            kmod-27             | NOK | http://autobuild.buildroot.net/results/5b0bda47c5fe53baa1fc25072169b74f34e6ea64 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/3e86d4b4a94cea89641841a1a120498b11606b34 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/c2c40129d7a121549201d390511eef048b21333b |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/9b269ba440e49c1333ad1d178f7f4f9018dbb459 |     
  riscv64    |        libuhttpd-3.3.1         | NOK | http://autobuild.buildroot.net/results/1c690a614102e3f828bf04d0cd09030c7348d600 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/bc69a9546a89aad8577a6f61f0344b89de38e548 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/f504c2ac1e45de445464e7259f400503f029ae69 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/3dc2b3534f7f576f6e8e5e3e6d39b1e23b261551 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/1aa3487a577c1d6cd290623965638f54fcd165a6 |     
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/741d62860d8a81aabbcb9079b9c5558b27a85baf |     
    arm      |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/753b4bdc178cd67f2666266900ca1104be25c2ec | ORPH
  aarch64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/1b4ebe9d92ff2bd96f88509601c74a406e35c62c | ORPH
   x86_64    |       quazip-legal-info        | NOK | http://autobuild.buildroot.net/results/4a8dc1be76d9f08d44b158f39734932793348a03 |     
    arc      |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/f6b1b50ab3b5386ef6e652347657bfe5414cb336 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/86c0c190452fa20702cc3e21dbbf400379b18d07 |     
    arm      |      uboot-tools-2020.04       | NOK | http://autobuild.buildroot.net/results/c06a9ee8e4e4a8798c426078e672902e41e861a8 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/dfd92f2f64165a6838b39737c2cd11fe475977a4 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/087772001c7e4fa48f2a2f5fefea8419ee34ccc3 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b22fb3d9fd2a908292e06f8b429bb0219f9f8c83 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/c00e8e222225d2cb45f17d4c050c5fa682e6cb9a |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/3baaf6805c152aeb116e27ec72836e6dd5de45ee |     
  aarch64    |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/3953105b69c81779c068195f99149b45a60c9417 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  botan-2.11.0 | 1 
              host-grpc-1.25.0 | 1 
 Makefile:753: target-finalize | 1 
         mono-gtksharp3-2.99.3 | 1 
                 ripgrep-0.8.1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          botan-2.11.0          | NOK | http://autobuild.buildroot.net/results/a2aa282392b62e51c099df1ee80bbba5988b9c7e | ORPH
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7a5a0bef081a7f7d47be354c23c87421293feb28 |     
   nios2     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/c72f181444546e50164e195a266967f8fd7db4f8 |     
    arm      |     mono-gtksharp3-2.99.3      | NOK | http://autobuild.buildroot.net/results/97ccc7b866d5e98d552a4fe31e31d26505de43a3 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/6731d03d3f876d563dd603e360a857d1928208e7 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 1 
                  ndisc6-1.0.4 | 1 
              python-pyqt5-5.7 | 1 
               target-finalize | 1 
                       unknown | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/597baf184bda410770de8bc9e3668c1b63a0c697 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/aaa179cdabb5891a003078d82519a2a495580f44 | ORPH
 powerpc64   |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/07e6f4dfe427b43d3835e33a452d585ba01a96b3 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/40e3601e0078fde1babdded76a6f96bdad42bc5e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a51a4c59774a2ef701a9eb929af58247a7ccb1b9 |     


Gitlab CI results for 2020-10-12
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092816  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092818  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092819  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092766  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092767  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092768  | ORPH 
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092821  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092801  | ORPH 
...InitSystemOpenrcRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092805  | ORPH 
...InitSystemOpenrcRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092806  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092807  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092808  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092809  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092810  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092811  | ORPH 
 TestIso9660Grub2External |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092790  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092796  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092829  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092836  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092869  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092871  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092840  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092858  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092835  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092848  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092828  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092831  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092864  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092845  | ORPH 
       TestLuajitLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092851  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092866  | ORPH 
          TestPostScripts |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092773  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092823  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092824  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092769  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092770  | ORPH 
...ELinuxExtraModulesDirs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092778  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092797  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092771  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092772  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092762  | ORPH 
TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/785092763  | ORPH 



-- 
http://autobuild.buildroot.net
