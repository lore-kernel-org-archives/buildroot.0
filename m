From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 06 Jul 2021 05:46:05 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-05
Message-ID: <20210706054612.0C2C8403DD@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 15  |  6  |  0  | 21  |
  2021.05.x  | 16  |  4  |  0  | 20  |
    master   | 50  | 48  |  0  | 98  |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 7 
             libsndfile-1.0.31 | 6 
         host-gcc-final-10.3.0 | 5 
                qt5base-5.15.2 | 3 
              syslog-ng-3.32.1 | 3 
                  exiv2-0.27.4 | 2 
                   gssdp-1.2.3 | 2 
                   libqb-2.0.2 | 2 
                   seatd-0.5.0 | 2 
              asterisk-16.14.1 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                   gconf-3.2.6 | 1 
  gobject-introspection-1.68.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                libmbim-1.24.6 | 1 
                libsoup-2.72.0 | 1 
                libvips-8.10.6 | 1 
                 mesa3d-21.1.1 | 1 
                  ndisc6-1.0.4 | 1 
                 pixman-0.40.0 | 1 
                    qemu-6.0.0 | 1 
                 samba4-4.14.4 | 1 
                   trinity-1.9 | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/a40d3296388b97a2a4d6c5121627347e7b5452a2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b0d03c56d86de8502f13f18e216070e9f2c5cb8d |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/415059ae8ccd5c800f3a8e357273d8fb2e90ea90 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/47c1ac8fdec140fdc52fc022b8abfef1ec4d5545 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/30ba9219ff2d901a6f603c115414e2ff3464ce47 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/37b8bd14c8360ce08c7ee44737ac179a168fa5ae |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7555d96c3d3a6a48196b49e8c63af8273b84d292 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/82d00a656c652767598948311c4b0c64d997d1b3 |     
    i586     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a37d2900a7ec3fc061b19b20044fd48d026f05aa |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1a6cc18cbf27485af687cd63e674e80ae1fcd76b | ORPH
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f43d03109d3d57c66d6c92b16ecdcd7ae82ba7c9 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/97ecaef9ce9a285f2c3127ea48e141ba2d02f04a |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5ece4510830865d35bdd8fdf01b7c8211eec35d0 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/fee19a7a95b9106301b7b96fb5217024662b9097 | ORPH
  riscv32    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/f1e919dd92bc8b9f4eb87fd7f8fe772b5010477f |     
   mipsel    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/ea083cb233459a0f09eee2adf4340dce57eb7593 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/02c92e0619920db42cb83128fc4dc327b34ab1a5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1d81393f5f5bac14f3e4143dd0a9a3d6a3097683 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4f30382b3bc7b4868f29d4cf6d66ad7fb387b54a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4a1cabfba245821cdf13c66f96e95e7cb64ca7de |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e985758f6f5b8e46dcd4496c3022a08ecddbcc3a |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/974cdee2deb127ec2276675853e8b9d32b894839 |     
  sparc64    |         libmbim-1.24.6         | NOK | http://autobuild.buildroot.net/results/f8a81aad0e262a567a2b31712575472ae92e5518 |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/b8cb9edca2345898080148ce958d9557f24d8647 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/ef2a867e791f66954040f98191ae30865369c4b4 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/aed38799d455d57e726927c1993b510810593dac |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/410d4c1a3a59c37417bbb4413517565abbc6daca |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/6cf210c97dfe6dd677e4ff7d1f2e8b515add9770 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/7bb49f6d5f7fd7612c31c28c66f07fcd1b59b5fa |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/eeadc6ebe6ecca4e6caebc5f34e4ba8d653e3c5a |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/9f6fa160713013f35402235ece721ae6e5bc9dc8 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/4ea8d364319ad2d776d32c61be9fd08d8df7f7c4 |     
  aarch64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/eb9793a291fea1e58d541a7ed9c9c7c98542695a |     
    arm      |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/83871739397a9d80936dfe181ced70f9b9fbfca2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a83da0111a0fa8385f9a94d94a229c41e2e2590b | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6ed240e7abc6b65b8c411b94a0de53b8ea177884 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/3cee7d02f789e8db8fd3885882edce29c2dfc6ee |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/3edadea1e35f256858ea0e64eb318c8e02fa6b5f |     
  sparc64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/cd114fc7408f85125ac60259ab36ecb3fceb779c |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/75d761be8c84bd3405fb7e9a975905e1d98a1944 |     
  riscv64    |         samba4-4.14.4          | NOK | http://autobuild.buildroot.net/results/3a474c31d997a6fd7667b64fd9fc28c92879815f |     
  powerpc    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/d0594f747fb5bcb0440bf506b3bb5e8e4db2f90b |     
    arc      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/84c2248bfc0de728fc13f821e9438d02b377c4fa |     
    arm      |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/1ed64d9a2a707cbd06f9d2af29101b70b668bc06 |     
  aarch64    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/bc42a186029872ab35c214ccbc4f196be78bfcb5 |     
   xtensa    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/45e8b6243e61c1887cd402f1aa39cb89766e909f |     
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/a5e511d2b0c541c3ddce86ec159290458a4455b7 | ORPH
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/51933df361eb8b72f1886e15e97724397d599570 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
azure-iot-sdk-c-LTS_07_2020... | 1 
                 mesa3d-20.3.5 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/7282bf8c918bf20e0d12dde799e3d300ba62dd2b |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1a09cff4f300c7d3cc4349ed091e78136a5e85c2 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d08d49a0df82fd37b6e67c3515f7fd7ed13b60d5 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/332c86cd3db7795e47c6ec53d6be2d2afbf02cd9 |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/90b08cbaed8ea2752c98cc304c22f612ae1b1cfb |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/3d92e9e3c9601d0fe4f44522e56cbc9ac7d3f010 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
                mono-6.12.0.90 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/47d69547d62afa6ff35619fb04b1385cef7fc8d3 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1aaff85ce8a38401e200024a0c101289aa6718a6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5d8ebbc15277950b380fefa8569a7dfefa03c235 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/da42599ffdb00aa6ffa2425f41229c746f409a7f |     


Gitlab CI results for 2021-07-05
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770836  |      
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770276  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770179  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770548  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770549  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770551  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770552  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770554  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770558  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770562  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770563  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770564  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770565  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770566  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770567  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770568  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770570  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770573  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770575  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770576  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770579  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770580  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770582  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770583  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770585  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770587  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770588  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770589  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770591  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770592  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770594  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770596  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770597  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770600  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770602  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770603  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770604  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770605  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770607  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770608  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770609  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770611  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770614  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770617  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770619  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770620  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770622  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770624  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770626  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770627  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770628  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770630  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770634  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770635  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770637  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770638  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770640  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770644  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770645  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770647  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770649  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770665  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770670  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770701  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770708  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770711  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770715  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770717  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770723  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770725  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770727  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770728  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770729  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770730  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770731  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770732  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770733  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770735  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770736  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770737  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770739  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770741  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770743  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770744  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770746  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770748  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770749  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770751  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770753  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770754  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770755  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770756  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770757  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770759  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770760  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770763  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770764  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770769  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770770  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770771  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770774  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770775  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770777  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770779  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770781  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770783  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770785  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770786  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770787  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770789  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770790  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770791  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770793  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770795  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770796  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770797  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770798  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770799  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770800  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770801  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770802  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770803  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770804  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770805  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770808  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770810  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770813  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770816  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770818  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770819  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770821  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770822  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770824  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770825  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770827  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770832  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770833  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770834  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770835  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770248  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770251  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770368  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770498  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770507  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770512  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1398770514  | ORPH 



-- 
http://autobuild.buildroot.net
