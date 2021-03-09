From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 09 Mar 2021 08:19:02 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-08
Message-ID: <20210309081910.AA7AA605C2@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  |  4  |  0  | 24  |
  2020.11.x  | 13  |  3  |  0  | 16  |
    master   | 104 | 36  |  0  | 140 |
     next    | 28  | 18  |  0  | 46  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 13
                  zeromq-4.3.4 | 3 
           optee-client-3.12.0 | 2 
                 pixman-0.40.0 | 2 
         s6-linux-init-1.0.3.1 | 2 
                  boost-1.75.0 | 1 
                 dc3dd-7.2.641 | 1 
                    efl-1.25.0 | 1 
                  janet-1.15.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                     mc-4.8.26 | 1 
              micropython-1.14 | 1 
                mono-6.12.0.90 | 1 
              netopeer2-1.1.53 | 1 
                      tio-1.32 | 1 
                    unscd-0.54 | 1 
             util-linux-2.36.1 | 1 
                    vlc-3.0.12 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/ac5fa03cfc933173d8f14e2a132f93d367c119b3 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/193e7eeba6a86daef0e9a6a883b49c92cc448156 | ORPH
    arm      |           efl-1.25.0           | NOK | http://autobuild.buildroot.net/results/e615e6288bc41186980d6e0f9bbb588f6899ad11 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c2acef9d9ec3d08cfd7f79db3d396b6918533c18 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/25d19d7a1ef8135c6c9921b1e3bafb3db4e8abfd |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6aa58120f72368ff1a23bff78a528d71414dc715 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4029522d83da866672f023a52ed781e24cbc9a3d |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ef5d872d37a61bd095baacce6386a07342150b02 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/63495e0e10b800c44b3e0a9dd32ff4fa360d6e96 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/653d367f465dbf87f2c29237ab4f02974ce42ab4 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0b822bb835a1e941426960519e07fe317f4590b0 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/79aca59dc2282e663b71d8098da367ef7a35d018 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b85d6c03de178cf3cb527f05910429d602dd1ff7 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/79d75250e4d76f8482ba66fe9c5446402ab56800 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aeb8b1ec3b81825d370e836aa20507ac4ddc95ef |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/94b0ea4541a399e23b3d7c357a4367562da96536 |     
    i686     |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/fc6a63daaa2b769d5235677efd5f018c4c335c63 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a82bac89755d9fa84ee27d640157a5a88ea31410 |     
  sparc64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/1999e64ced4715dd30143fb69f8287fb317a1ec3 |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/4798bdac53e16468afc4df909c71c4e0552190b0 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/386b15f02be83bc0a13038617f26f006416b32da |     
  riscv64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/f7ca22978ffeda0f72927fb839a3092f19b11ef3 |     
  riscv64    |      optee-client-3.12.0       | NOK | http://autobuild.buildroot.net/results/34b9946e6d59112a7eead304933534ad4739a84c |     
   x86_64    |      optee-client-3.12.0       | NOK | http://autobuild.buildroot.net/results/fdda47263b2cc5859d474cb2cc769ceaaeb44661 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3846b2bc962abc9975c0018781e20e22a6fca9f3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/172622b3515d1671a1e8206a5d6de9abe5a420d9 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/34cfaaa4584ff78cc0265b09931882c1bf5df01d |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/75c688df0e18006cba93d9f170feae09e1e1fc72 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/236fa1be5203216ed2bc86eab0259356c51f443f |     
  riscv32    |           unscd-0.54           | NOK | http://autobuild.buildroot.net/results/0deebd7d43e31b58b1baff0a51ae032b9923e206 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/b4a020274b40c4fb041f2dc571317b897ee4bd76 | ORPH
  riscv32    |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/2cca8f8966423c798ecd7374be6fce52a18e8573 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b088b871473d480dd2a4c12f03c49b6818b231e2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ec4dd093fcef1f9d78e7df8c96858df225aa3547 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d85c22c4cfe9ff55f81eed4a1b001b4b1ea75bbb |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/26d95c4121900c81107fb2c7e106d8cabcc99b81 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  botan-2.11.0 | 1 
            igd2-for-linux-2.0 | 1 
               libtheora-1.1.1 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          botan-2.11.0          | NOK | http://autobuild.buildroot.net/results/540553bfd37eff9c5e86482adea223266ddfe2cd | ORPH
    arm      |       igd2-for-linux-2.0       | NOK | http://autobuild.buildroot.net/results/cbb1e560598a4c4f6ec3051ef0a1f761f69161c4 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c2fb06f59febb266e5ff3aa7d8f99c7340537487 | ORPH
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2a896d1190bf78e9582a5d2d8c4b4bef385ae398 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
                  monkey-1.6.9 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e5cd572cc2ae8bf173f88549dac34c55ceb22b1f |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/3ae574e1ea777de6ea6877a4689e897e3d049ccf | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/897df31eb868535d06a80078a5f3ec2e418d7212 |     


Classification of failures by reason for next
---------------------------------------------

                     mc-4.8.26 | 2 
                    mpd-0.22.3 | 2 
             babeltrace2-2.0.3 | 1 
                  dhcpcd-9.4.0 | 1 
             libgpg-error-1.41 | 1 
             libopenssl-1.1.1i | 1 
                 mesa3d-20.3.4 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
              netopeer2-1.1.53 | 1 
                  perl-gd-2.73 | 1 
                 python3-3.9.1 | 1 
             timescaledb-2.1.0 | 1 
                       unknown | 1 
                    vlc-3.0.12 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/a786199fa0277ba234b261ce0f504408381a6fd0 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/12fd212235dd74b2145808ace1cea29ed87e8819 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/5cc48ff08fe84c50146aceed37b2ca0f789dd0b1 | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/103b4db38213bc04edfbcf04510abcc6909b45a8 |     
 powerpc64   |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/31e54d3c45bd3fd963f8799d856b2204af9c51aa |     
   x86_64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/1433bb6933f15622b3f3c0342e040399038fdd86 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/64a974e08ea1b0038a82a2e375861e7d432a63df |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f85d9d0b6ffdf1ea35967897afe095bdd7cad61d | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/d540dca2fa02ba3be570dfaf124d574d537b7360 |     
   nios2     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/9ad8be797e703a1d8d652f404daab113c940521a |     
powerpc64le  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/86073ac6e22dca58b2ed5c555d33eac0d678456e |     
    m68k     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/71bc425b7f022b9fd09ad300f5998edf5da8d470 |     
   xtensa    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/bc3c8945952e3c591609e7b7b21b5d425eaadbb6 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/2b18e3e415299a999fb0d1d4ca55b7dcfa8ff44b |     
  aarch64    |       timescaledb-2.1.0        | NOK | http://autobuild.buildroot.net/results/1f7247fc2716d8196889fdf0bcf2062c9446f5a8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c1e5e3381f021616a697c41222adf4a868e82ddc |     
  aarch64    |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/1e397c9e804db09173c4ebbbc66ff74e7a790963 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4549fbee4f5c843aead7ef1b10d202a27c15a2c8 |     


Gitlab CI results for 2021-03-08
================================

Detail of defconfig failures for 2021.02
----------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078271768  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078271821  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078271888  |      


Detail of runtime-test failures for 2021.02
-------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272165  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272180  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272181  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272182  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272183  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272184  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272185  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272186  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272187  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272188  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272189  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272190  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272191  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272192  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272193  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272194  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272195  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272196  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272197  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272198  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272200  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272201  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272202  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272203  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272204  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272205  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272206  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272207  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272208  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272209  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272210  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272211  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272212  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272213  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272214  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272215  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272216  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272217  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272218  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272219  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272220  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272221  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272222  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272223  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272224  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272225  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272226  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272227  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272228  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272229  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272230  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272231  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272232  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272233  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272234  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272235  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272236  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272237  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272238  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272239  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272240  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272241  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272242  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272243  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272244  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272245  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272247  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272248  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272249  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272251  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272252  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272253  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272254  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272255  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272256  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272257  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272258  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272259  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272260  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272261  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272262  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272263  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272264  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272265  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272266  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272267  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272268  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272269  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272270  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272271  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272272  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272273  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272274  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272275  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272276  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272277  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272278  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272279  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272280  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272281  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272282  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272283  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272284  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272285  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272286  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272287  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272288  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272289  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272290  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272291  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272292  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272293  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272294  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272295  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272296  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272297  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272298  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272299  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272300  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272301  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272302  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272303  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272304  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272305  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272306  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272307  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272308  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272309  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272310  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272311  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272312  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1078272313  | ORPH 



-- 
http://autobuild.buildroot.net
