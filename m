From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2020 07:10:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-19
Message-ID: <20201020071031.7D3178747D@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  4  |  0  | 17  |
  2020.08.x  | 18  |  3  |  0  | 21  |
    master   | 96  | 43  |  0  | 139 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 8 
              asterisk-16.13.0 | 5 
        host-sentry-cli-1.57.0 | 4 
              bitcoin-0.19.0.1 | 2 
                  boost-1.74.0 | 2 
              host-guile-3.0.4 | 2 
                   libcap-2.43 | 2 
                  ndisc6-1.0.4 | 2 
       python-matplotlib-3.0.3 | 2 
              sigrok-cli-0.7.0 | 2 
  binutils-arc-2020.03-release | 1 
         conntrack-tools-1.4.6 | 1 
               domoticz-2020.1 | 1 
          fuse-overlayfs-1.1.2 | 1 
              gnuradio-3.8.1.0 | 1 
             kismet-2020-09-R3 | 1 
             qt5wayland-5.15.1 | 1 
                    quazip-1.1 | 1 
                rocksdb-6.10.1 | 1 
             s390-tools-2.14.0 | 1 
             transmission-3.00 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/730ab443eae6cd93ee8a32c1b22e441a652e2e51 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d65a8665441b5291ae2a175f2c9b94cce3d44419 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3db8e5333da9bb32792030bd0055cf98c2c8c432 |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/056bf6484f7c25dc54c96994c33ba1826bafc619 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7dd9d936ec11b59aa5d08b0f871ca77addb9d85e |     
    arc      |  binutils-arc-2020.03-release  | NOK | http://autobuild.buildroot.net/results/9d928af61918abee8f36cae0292b10f5f885b329 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/8601672134836f0925df7d5c75e2deab44385902 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/366c7a690bc9da939b59696fc168c7b5f0fe8c63 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/e2e4bcf4a83181aa5226a66084eca7919c7abe39 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/5bd55ee2ab92db1ba77d2b248e7480e4b43a5ce5 |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/994cf7aa25ee558b8f36755ef2fa63e8b21bf777 | ORPH
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/0a2d6773b41c466c588335dc49f429739dd23f34 |     
  riscv64    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/18e9effc3a1ad37a54290576539be530fabfcc19 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/709134eaa2be860541faeca5e4589f42634c326f |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/5ce8409825048d92d136b09d72f1b50ec96468f2 |     
    i586     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/295ee8265417d8422e08e363df24dc6226b9690b |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/425189f8a4f64685e396ccdd20071fd09846efa7 |     
microblazeel |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/e335e92964a6b5c3b6572185811c72809e141830 |     
microblazeel |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d0d71673d67dab182036ba045a1b0e694d49238c |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/461208b27946fca2937e6ae6d02fa39514149b0f |     
   xtensa    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/cd47d48c4b7ae4f2306b6b16022ae30635b02222 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b343a2a8eb90309cb436ab3eb82c532c6ff145f8 |     
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/83573b02bdb9da5d22a30d8a941e6c20a9f2d6a0 | ORPH
   x86_64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/b9876ee9f7e548a62d43447cbab8aafcc1742b63 | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d95a1888b4c69e1210bcc0d07211ba33a0fad63a |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2a570db57b30686aa412821ba7ab71f812adedb3 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d645deb2637bb4c46a27f2367a30b6dc719e3fcd |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4d25428b918c7b3f1862484af43ad9992e931ed1 |     
  powerpc    |       kismet-2020-09-R3        | NOK | http://autobuild.buildroot.net/results/ca118dd0925e1280bba45e127c2796d17273bcfe | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/6678824b772d62cd54e3f5c7eb4a63d2e7f41cd5 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/2f1e72ddc1e0b15e1c55c0a9c7befa1906ddd316 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/dbb978051acb64d422086785cadf51ee681aed4b | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d2b4a079fb1cf015859ad584e0edfbbfb466e0b9 | ORPH
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/81f6427d69f4b1aa314cbd46b5eb61495467a4eb |     
 powerpc64   |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/183f2075cf3c96ed767a3d5d6adc3c1269a343c6 |     
  powerpc    |       qt5wayland-5.15.1        | NOK | http://autobuild.buildroot.net/results/0e6feecd49745d1c843eb820a81dc444a92220d1 |     
    arm      |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/4cb93530d98ee384b0aa53f8d6efe21d8f439a96 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/8b5049283f069aaea224c71840142b86f0a20472 |     
   s390x     |       s390-tools-2.14.0        | NOK | http://autobuild.buildroot.net/results/f906ca8650a7a9ccca4a2ee359a807d08a7763b9 |     
   xtensa    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/9dba176076d3485fe64be556b784f71bba9945d2 |     
    mips     |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/183d94f4911ce9e287ac3b6329c91e2eba4f561a |     
    i586     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/5b69f7fa2d9965fd82a615fc1bbcc11738e2a4fb |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/139a72c92e38036db08b8f5a916e7ec948a32629 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

gr-osmosdr-46698a67e7e06419... | 3 
                 rocksdb-6.6.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/76b033021491a383c04a08fbc7fa100f1501c062 |     
   mipsel    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/4f2da5383e58d6ca9cdfc2eb40b3f70684511d8f |     
    i686     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/a5543c9f4c5fd1c11896080b89bd3dabbf29f887 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/29f8a3fd440663eef6b43d481eff81c16c787d86 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

  binutils-arc-2020.03-release | 1 
                  monkey-1.6.9 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.03-release  | NOK | http://autobuild.buildroot.net/results/2d66a948727d4d0733481e6ace343bcb05c12bd8 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/29db1b28554803441b1fc2b35fd0a09a3ff8259c | ORPH
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/891f1b3a856f72319e89ea1100c3d9344314ee5a |     


Gitlab CI results for 2020-10-19
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100438  | ORPH 
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100573  | ORPH 
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100576  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100586  | ORPH 
               TestExt2r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100495  | ORPH 
                 TestExt4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100499  | ORPH 
...rch64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100920  | ORPH 
...tlinAarch64GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100921  | ORPH 
...ch64UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100925  | ORPH 
...inAarch64beGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100930  | ORPH 
...750dUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100933  | ORPH 
...hs38UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100942  | ORPH 
...v5eabiMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100950  | ORPH 
...Armv6eabihfGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100959  | ORPH 
...nArmv6eabihfMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100961  | ORPH 
...abihfGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100967  | ORPH 
...bihfUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100975  | ORPH 
...8xxxUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100984  | ORPH 
...8kcoldfireUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100989  | ORPH 
...lazebeMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100994  | ORPH 
...azeelGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101000  | ORPH 
...zeelUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101004  | ORPH 
...otlinMips32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101007  | ORPH 
...ps32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101011  | ORPH 
...tlinMips32elMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101022  | ORPH 
...nMips32r5elGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101027  | ORPH 
...r5elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101030  | ORPH 
...2r6elGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101033  | ORPH 
...r6elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101037  | ORPH 
...nMips64eln32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101046  | ORPH 
...64n32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101051  | ORPH 
...linMips64n32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101055  | ORPH 
...6eln32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101062  | ORPH 
...Nios2GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101071  | ORPH 
...tlinOpenriscMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101076  | ORPH 
...owerpc440fpGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101084  | ORPH 
...e5500GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101091  | ORPH 
...4e6500MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101097  | ORPH 
...ower8GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101101  | ORPH 
...pc64lepower8MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101105  | ORPH 
...werpce300c3GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101115  | ORPH 
...00c3UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101121  | ORPH 
...werpce500mcGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101129  | ORPH 
...00mcUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101136  | ORPH 
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101140  | ORPH 
...ootlinShsh4GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101148  | ORPH 
...otlinShsh4UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101154  | ORPH 
...sh4aebMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101158  | ORPH 
...arc64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101161  | ORPH 
...nX8664corei7MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101173  | ORPH 
...6core2MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101180  | ORPH 
...tlinX86core2MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101181  | ORPH 
...86i686MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798101189  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100910  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100914  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100916  | ORPH 
                 TestF2FS |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100503  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100446  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100447  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100448  | ORPH 
              TestGitHash |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100489  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100485  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100590  | ORPH 
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100592  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100593  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100542  | ORPH 
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100547  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100549  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100554  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100556  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100558  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100561  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100563  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100566  | ORPH 
...0Grub2ExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100508  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100521  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100532  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100534  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100611  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100632  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100601  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100606  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100616  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100661  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100627  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100897  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100645  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100618  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100662  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100666  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100629  | ORPH 
       TestLuajitLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100649  | ORPH 
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100675  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100679  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100683  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100624  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100670  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100899  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100906  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100692  | ORPH 
           TestNoTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100487  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100701  | ORPH 
         TestOpenSshGlibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100704  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100712  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100714  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100721  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100725  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100734  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100736  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100738  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100730  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100739  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100740  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100745  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100758  | ORPH 
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100750  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100768  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100772  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100792  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100596  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100857  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100861  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100869  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100881  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100884  | ORPH 
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100891  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100894  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100753  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100757  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100762  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100773  | ORPH 
   TestPythonPy3Colorzero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100777  | ORPH 
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100781  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100784  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100788  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100795  | ORPH 
     TestPythonPy3Gobject |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100831  | ORPH 
    TestPythonPy3Gpiozero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100843  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100849  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100598  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100855  | ORPH 
     TestPythonPy3RpiGpio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100873  | ORPH 
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100880  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100886  | ORPH 
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100890  | ORPH 
                TestRedis |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100896  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100449  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100451  | ORPH 
        TestRootfsOverlay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100469  | ORPH 
...ELinuxExtraModulesDirs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100477  | ORPH 
...SELinuxSystemdSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100571  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100537  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100454  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100456  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100441  | ORPH 
TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100442  | ORPH 
...sLinuxX86_64LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100444  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/798100902  | ORPH 



-- 
http://autobuild.buildroot.net
