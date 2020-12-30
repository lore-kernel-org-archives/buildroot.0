From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 08:23:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-29
Message-ID: <20201230082349.ACCD487165@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  2  |  0  | 13  |
  2020.11.x  | 11  |  5  |  0  | 16  |
    master   | 86  | 69  |  1  | 156 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 13
                  bind-9.11.25 | 6 
                  rt-tests-1.9 | 6 
                  boost-1.74.0 | 5 
        host-sentry-cli-1.57.0 | 5 
            quickjs-2020-11-08 | 5 
     graphicsmagick-legal-info | 3 
                    htop-3.0.3 | 3 
             timescaledb-1.7.4 | 3 
      gst1-plugins-base-1.18.2 | 2 
package/graphicsmagick/grap... | 2 
                    qemu-5.2.0 | 2 
                    vlc-3.0.11 | 2 
              asterisk-16.14.1 | 1 
                  autofs-5.1.6 | 1 
                bitcoin-0.20.1 | 1 
               capnproto-0.8.0 | 1 
                     efivar-37 | 1 
            erlang-jiffy-1.0.6 | 1 
              fetchmail-6.4.14 | 1 
            qt5location-5.15.2 | 1 
                   rhash-1.4.0 | 1 
                    rpm-4.16.0 | 1 
                       unknown | 1 
                       vmtouch | 1 
                  waffle-1.6.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/170cac1dd83ee5a4d4c50f838206b68f77b66834 |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/76381e4126a2d6ae4ee34bdb44198076a8fb972f |     
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/1a42279f1553cdce6e8325dfdf2f7f5f5c6c9ac4 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/7b376c67b5b6b99b55877721b2f017b2efa99a2c | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/71fb4424e84113d533064a03864849b5b6ed132a | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/7bab228277f6fbb2f25b83e0f51edf91a5793fa5 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/df3373ae09871d41d6748a7c164208ade90c6569 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/ebc349567c4f5b55726324b2bf0c897fe71159dd | ORPH
    arm      |         bitcoin-0.20.1         | NOK | http://autobuild.buildroot.net/results/005575fb6cc13ebc3021dc5af6ad36e8f20338ff |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/ed6b9e6062d9e22bbb0d85efccc28dffd84706e5 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/744a5c2d8516ed0771851291adb74ac78bb28a1b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/bf1787375ea201e8fa3c21df682d085bc7fcbec9 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/bc410fdfe63d6104a322d48da633f3dcdf7f1a72 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/dd313dbd5022a27304237543557cce708b4a6dbe |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bd33182033e146b35d75f8e0e52f68636e608901 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/200817df06202cd8253b329b8a2c23d28797ecea |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/76076cd38847efec0ed4848dd9369967312a162c |     
   s390x     |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/5d5a79c141126566acd3de24595dc7778bd1b780 |     
  mips64el   |   graphicsmagick-legal-info    | NOK | http://autobuild.buildroot.net/results/f41e6279fd18a61c381635f5ddab3cc57d6faf51 |     
 powerpc64   |   graphicsmagick-legal-info    | NOK | http://autobuild.buildroot.net/results/60c4c46c4cf7aed788c25980d3beff8777da99d8 |     
    arm      |   graphicsmagick-legal-info    | NOK | http://autobuild.buildroot.net/results/b45df9332e56ddb6343ef9230fee445214a29d6e |     
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/36ba4c85e906cba31dfd6e5857319dcb842aee82 | ORPH
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/46e1c50116af677e0a2cac884843fe1928260151 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9b98333fc7d79eff8282543943ae893c0e164c55 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/93c1faca7c23463bd0ab1b0f365aaa70f39f2ea8 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9ffb6c7be83ba8fe9fee73ef943481abdfebb2cd |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4e894f9c4ec877f291c241620824878a0e3332c8 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2c6d3a1bf477d41a0e143a549c1285bf479ce0fb |     
microblazeel |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/1086156cbe205c894ecf2cd4df14e30ba9572b8c | ORPH
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/fcc4467d10c402fc4c22f94aa10cd02642759b48 | ORPH
  powerpc    |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/35efc60afa7eec1bd7a4926627cb16904f19f61d | ORPH
    arc      | package/graphicsmagick/grap... | NOK | http://autobuild.buildroot.net/results/2b4b904b369ef4e62e50ee012f0752f1fa9dcb8f |     
    arm      | package/graphicsmagick/grap... | NOK | http://autobuild.buildroot.net/results/f9f7d04146e9074f987ff12613f4d954beabbeb7 |     
   x86_64    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/9abf78568c8b834779aa8e697cf8d92c04e08500 | ORPH
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/ff8b0df05f1dea502e94b183cbce9f69ee6c79a4 | ORPH
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/fddec75b5f02477776941eed0c42277ebee800aa |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/6c3ab42be00b4b4a9ae7eea5975aaa873b597a76 |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/d5f8aacd31b7a88c0ce169bd6a2cffa36d82be05 |     
    arc      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/73ac46ef69f596dd32d29571ac5589637066b770 |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/5d58b7729eac6a650364791273f0d5c3155b3ef6 |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/8c4b334dafd8c6342c624d19b6a858f58ad4fe75 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/401c54380a5482321369cdc8c8bc7b1a6e215986 | ORPH
    mips     |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/2355a5ec541698f3e7d26ea4014c2e3f35a32f1d |     
    arc      |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/0fcebc2fbf2f01ebb42bf55707f581cef1d2fde2 |     
    arc      |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/e4c2baf6044c720c71adc351881224b6f3f5d6a8 |     
  riscv64    |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/8dcc739b30686040e919ed1c9a6dcd8d3bb5ac52 |     
    arc      |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/164cede7bec5be6e8c60e99e96c17d83be2e32cf |     
  aarch64    |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/4a428cd2a3ac230c9945728eb7130656dd343493 |     
  powerpc    |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/0d9e13ebeb84043c593fee39bf3ad86842b8bc2e |     
  riscv64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/ed3089b3cbb4fe6ef59d4cef578fda20a4ef5d0b |     
  mips64el   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/a727b8f98b8b20de6fa12eb65de3cc8b6858baf1 |     
   mipsel    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/c07478fc05dbdf7ace4f4db32e9af3e9537d705e |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/62051685c5bd54a35d03427a09fddd5cb20521cd |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/39b21f9938655d268ef767247a558a14ac3cd756 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/7dc58f58673834af8d063868f0f392ca7a6924ef |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/3f9b0c290e38b9426cae838c114def5073808f48 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/60bc03117a32d0b9f1c66280cd8d8af45c0d9f4a |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/77b3b022f3ec2974219d559c49b996e7666c5dad |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/695d77951fe249ab5073da5478e40369a6b8ca80 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/3aa93f4ba68bded39eea101c1027536b6778f92d |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/2154af361126d788b841f3caf3b48b456bf8196e |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/9c104520946211807bcaf04c7d0c0fc2aac3ce62 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/064c86503370abbca464f1ec8e59bd2dbda806e7 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/caee56bdbc94e6f8f8f0a6b665f0e2750642943c |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/a9ef9a8e9cdbbe1acebf770f5704f83f36c8586b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/067b4b9da4ee2b98e6508016da6cdb4c9eb1d128 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/2c1d9f430f90ae994e49a19c0aa06b11d1b20144 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/f967e09b67cf750feaa8cc3173a7789f98853647 |     
   nios2     |            vmtouch             | TIM | http://autobuild.buildroot.net/results/52e83024506a0e646413d38647d607cdccfbf183 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/e400f8476c71aee2674a4c268e28c3a10ef11b95 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 uclibc-1.0.32 | 2 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/7137a87bd4c5fab6bdb0116d3fb42f2356522cb5 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/96248f7ceb9282ef8c4a1ab4afdffe4f46680213 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                       unknown | 2 
              asterisk-16.14.1 | 1 
                  boost-1.74.0 | 1 
                    mpv-0.32.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/2538b7a995e94fc19d05cc60a7bebee75f2b9904 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/533a4272259298f07067401449e780e6152e64ea |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/b4484a24786bb4bea02483cea9eecb289e54d2c0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f28ada3d409d568294c9134c33a4357b029c7d32 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/1e848593b33803e55e0205ea6c8a6c4f67e427ff |     


Gitlab CI results for 2020-12-29
================================

Detail of defconfig failures for 2020.08.3
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417482  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417591  | ORPH 


Detail of runtime-test failures for 2020.08.3
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417725  | ORPH 
         TestCheckPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417887  |      
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417726  | ORPH 
           TestCrudiniPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417727  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417728  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417729  | ORPH 
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417876  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417877  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417879  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417880  | ORPH 
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417882  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417883  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417884  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417886  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417730  | ORPH 
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417731  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417732  | ORPH 
  TestInitSystemBusyboxRo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417711  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417712  | ORPH 
  TestInitSystemBusyboxRw |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417713  | ORPH 
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417715  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417716  | ORPH 
...InitSystemOpenrcRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417717  | ORPH 
...InitSystemOpenrcRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417718  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417719  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417720  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417721  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417722  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417723  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417724  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417703  | ORPH 
...so9660SyslinuxExternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417704  | ORPH 
...slinuxExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417705  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417706  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417707  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417739  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417747  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417735  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417737  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417741  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417755  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417757  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417745  | ORPH 
          TestLuaLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417749  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417762  | ORPH 
           TestLuaLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417751  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417766  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417769  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417743  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417759  | ORPH 
         TestLuaLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417773  | ORPH 
             TestLuaLzlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417780  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417868  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417753  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417740  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417748  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417736  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417738  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417742  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417756  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417758  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417746  | ORPH 
       TestLuajitLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417750  | ORPH 
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417764  | ORPH 
        TestLuajitLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417752  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417768  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417771  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417744  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417761  | ORPH 
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417775  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417869  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417874  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417754  | ORPH 
                 TestLuvi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417776  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417778  | ORPH 
              TestNetdata |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417782  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417783  | ORPH 
         TestOpenSshGlibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417784  | ORPH 
        TestOpenSshuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417786  | ORPH 
                 TestOpkg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417787  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417789  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417790  | ORPH 
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417792  | ORPH 
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417793  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417795  | ORPH 
       TestPerlHTMLParser |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417797  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417798  | ORPH 
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417799  | ORPH 
 TestPerlLWPProtocolhttps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417801  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417802  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417803  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417804  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417800  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417805  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417806  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417807  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417808  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417816  | ORPH 
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417809  | ORPH 
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417811  | ORPH 
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417814  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417817  | ORPH 
         TestPythonPy2Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417819  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417821  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417823  | ORPH 
   TestPythonPy2Colorzero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417825  | ORPH 
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417828  | ORPH 
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417832  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417837  | ORPH 
    TestPythonPy2Gpiozero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417840  | ORPH 
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417842  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417733  | ORPH 
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417844  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417846  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417848  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417850  | ORPH 
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417853  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417855  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417857  | ORPH 
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417858  | ORPH 
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417860  | ORPH 
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417863  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417865  | ORPH 
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417810  | ORPH 
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417812  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417813  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417815  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417818  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417820  | ORPH 
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417822  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417824  | ORPH 
   TestPythonPy3Colorzero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417827  | ORPH 
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417830  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417831  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417834  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417835  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417838  | ORPH 
     TestPythonPy3Gobject |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417839  | ORPH 
    TestPythonPy3Gpiozero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417841  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417843  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417734  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417845  | ORPH 
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417847  | ORPH 
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417849  | ORPH 
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417851  | ORPH 
     TestPythonPy3RpiGpio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417852  | ORPH 
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417854  | ORPH 
      TestPythonPy3Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417856  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417859  | ORPH 
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417861  | ORPH 
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417862  | ORPH 
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417864  | ORPH 
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417866  | ORPH 
                TestRedis |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417867  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417870  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417871  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417708  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417872  | ORPH 
                 TestTmux |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417873  | ORPH 
                  TestUbi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417709  | ORPH 
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/934417710  | ORPH 



-- 
http://autobuild.buildroot.net
