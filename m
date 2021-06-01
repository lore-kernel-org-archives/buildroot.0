From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 01 Jun 2021 05:48:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-31
Message-ID: <20210601054815.52159605D4@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 28  |  8  |  0  | 36  |
    master   | 109 | 34  |  0  | 143 |
     next    |  4  | 12  |  0  | 16  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                  lvm2-2.03.12 | 5 
                mono-6.12.0.90 | 3 
                       unknown | 3 
                    ffmpeg-4.4 | 2 
                 mesa3d-21.0.3 | 2 
                    mpd-0.22.6 | 2 
                   bullet-3.09 | 1 
            erlang-jiffy-1.0.6 | 1 
              fstrcmp-0.7.D001 | 1 
 glslsandbox-player-2019.08.23 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-lvm2-2.03.12 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 
               target-finalize | 1 
                    unscd-0.54 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/fa565ceea558f4828e17b3957e755eb83653dd04 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a599f3442e0de5f9885e39621cba13c1dfee567e |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/dbc2d869fee3ecff864ae9e31b7068f6f4ed6225 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/91940d77b6aff9298085a53b13bf12f8057d8ec8 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/9f66f5f8f6680aa0437b626556e31dbc354b62c7 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/96f0169410169a943d179295ffb9a6a3355314c1 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c76c33619999d04a2f074d70194d419c3446274a | ORPH
  mips64el   |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/372e8fc028a461b301db0b3edbfbc83c877f8655 | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7630d0d735402f8267ad18c9b8f669d81ceb83fc |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f225867d97824b75ac2e4c5d0788cf1cf4b66a30 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7f6bd63ed62d9abadb6ede49891988d96216362a |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9fb7f688361b8cfa543e97773417528b9c90d284 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/036cec634062ae7df935da2c939891d20d047e5a |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d0e775df15a6e280064f19d9a26c299a3ce2a370 |     
  mips64el   |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/075fa0796fb1cc43afcf599f86e07c5885453ab3 | ORPH
    arc      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/b978c9d8d01c1320cae386471e63eb83de1188db | ORPH
 powerpc64   |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/86ebb713e87c3892122cc628e3ce8d805943978d | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/ab6f6c753b8d480f7009beadbf61667edfd98fe7 | ORPH
    m68k     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/b1421f27c3f99a8aa445636df5ec01989cc3b5ee | ORPH
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/9034017d357ff38752e28f21f60e7f8edd0458ed |     
    mips     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/0af8ec54a87a57e720518257e4d1ac92a55624c8 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/cb47492f94b250b2171c839615322751564ad051 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/fc2dd232c7c2cdca12c1f6b3e3850ed8dfa26e8c |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/539a784b8b628ef81fd3567b4ae47da70973e1c2 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/fcc70681f72fd2f079881b59b902a4eb6d08e7de |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/f90b1f5a27ab388998ecd36adf6c1355804c3f4c |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/a3b9481a2c1eaaee7004bac3a3ca7ac738f05a03 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/8076752ab4e7982cff7eb19a9ea2647844ca0341 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/38d27ae1bfb548dfb4da974e82edfabfbb46d039 |     
    i686     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/c5057efe484bf61f37958f9f08c0c8c7270f4c60 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1c39b5a4c0efd37f5b603171925c193f93b5286e |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/913b1e914564aade1836983b4205e291ea4c95c2 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/5c39bc500d7b592324bca420ce4d0bdc10caab4c |     
  riscv32    |           unscd-0.54           | NOK | http://autobuild.buildroot.net/results/563d8722f403ab602527a7ee2af0a0d30f1f961e |     


Classification of failures by reason for next
---------------------------------------------

             libtorrent-0.13.8 | 3 
               aircrack-ng-1.6 | 1 
               apcupsd-3.14.14 | 1 
           heirloom-mailx-12.5 | 1 
           host-libselinux-3.2 | 1 
        host-sentry-cli-1.57.0 | 1 
                    pppd-2.4.8 | 1 
                   rhash-1.4.1 | 1 
                 rpcbind-1.3.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/95e567074aee2424fdc18864e6105ff68635b26f |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0082702d57469b09cc99225ea95083a24b7e747e |     
microblazeel |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/12ec7739b890e5f96aee086dbe39bcca683cd460 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/bdf0ea976986e17d42fb266a82c3a527298ef986 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e166d8635c22a43216316883441c20cd649d4388 |     
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/611c008188fc8c2e6deb865c9b8f1a9487f9abf9 | ORPH
 powerpc64   |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/d9bf236027dfe235eb236bbde9a914063260e79a | ORPH
    mips     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/db0fced5a312c14c10928891cdaff685d21270c1 | ORPH
  aarch64    |           pppd-2.4.8           | NOK | http://autobuild.buildroot.net/results/fca6e162b7e3ad13bfd1b7d5bc86e6436a78e745 | ORPH
 powerpc64   |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/b60cf97e12c308eb9660583d8f5cedb784e18bb1 | ORPH
  aarch64    |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/99065c84e9eace671d9f3da859fc43e3aa6fb60f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b03a351db92db920763c875e6488e5765aa13026 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
           host-mono-6.12.0.90 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libtheora-1.1.1 | 1 
                    vlc-3.0.14 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/6d011140ef5350c9ae47819882b32b7a1445983d |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a4321b8b0d3d1fd09d3df3fdafa748728659bd8b |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/88b76a2c21044ba936d73e899cf7256c90599706 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cd1a7fab4fdd9f3d2316c836bfa825fbd998cc2b |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/183ec46a035c2ad420a33fc6e75b0003ea421782 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/5e0cd237a63525ab87c9cc733c7814cf8e84a0ee |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/177e2f3a7dfcce49dc072c466482a141eddfff72 | ORPH
    arm      |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/daa0bd127a6c812221b402e1c064ec0473ae402d |     


Gitlab CI results for 2021-05-31
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140125  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140562  |      
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140446  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140448  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140449  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140451  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140452  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140453  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140454  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140455  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140456  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140457  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140458  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140459  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140461  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140463  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140464  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140465  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140466  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140467  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140468  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140469  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140470  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140471  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140472  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140473  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140474  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140475  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140476  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140477  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140478  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140481  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140484  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140486  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140488  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140490  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140492  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140493  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140495  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140496  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140497  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140498  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140499  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140500  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140502  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140503  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140504  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140505  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140506  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140507  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140509  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140510  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140511  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140512  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140514  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140515  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140516  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140517  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140518  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140519  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140520  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140521  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140524  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140525  | ORPH 
...scv64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140526  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140527  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140528  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140529  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140530  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140531  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140532  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140533  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140534  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140535  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140536  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140537  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140538  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140539  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140540  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140542  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140543  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140544  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140545  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140546  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140547  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140548  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140549  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140550  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140551  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140552  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140553  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140554  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140555  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140556  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140559  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140560  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140561  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140339  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140356  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1305140357  | ORPH 



-- 
http://autobuild.buildroot.net
