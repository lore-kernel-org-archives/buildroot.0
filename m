From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Aug 2020 08:00:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-19
Message-ID: <20200820080038.D96C4863E0@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 28  |  4  |  0  | 32  |
  2020.05.x  | 18  |  7  |  0  | 25  |
    master   | 162 | 49  |  0  | 211 |
     next    | 46  | 15  |  0  | 61  |

Classification of failures by reason for master
-----------------------------------------------

              ibm-sw-tpm2-1563 | 12
                     avahi-0.8 | 4 
            live555-2020.06.25 | 3 
                qt5base-5.15.0 | 3 
                  zeromq-4.3.2 | 3 
               apcupsd-3.14.14 | 2 
                   gdbm-1.18.1 | 2 
          gstreamer1-mm-1.10.0 | 2 
             kismet-2016-07-R1 | 2 
                rocksdb-6.10.1 | 2 
                samba4-4.11.10 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
dump1090-bff92c4ad772a0a8d4... | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                    efl-1.24.3 | 1 
   gdb-arc-2020.03-release-gdb | 1 
              host-grpc-1.30.2 | 1 
                   mimic-1.1.0 | 1 
                 python3-3.8.5 | 1 
            qt5location-5.15.0 | 1 
                 rsh-redone-85 | 1 
                      tio-1.32 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/c07bd8a3670b6b8bf88f7b18b019ce5e39677ecb | ORPH
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/808a0b217e246a36ff215eee0bbad15772fc8451 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f5390b2e1d1166ad4f7c261ecad3c2389c197420 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/bfd48bfd069d5b6fa1973e50e81807bbf5e6314e | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7676ebaf872ee2fc412228e8271e4c78241eeae9 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/40095ee0483cb7e799c4fe70affce1ff2dcdf20b | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/61f414a987122ef42ae3435079a361881897e1b0 | ORPH
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/88dc97fcaa649014edb3b54a5dd4bd8ec4715bbd |     
    i586     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/31924a06b6a5b7eb7f9c46931475b54c3cada4dc |     
   x86_64    |           efl-1.24.3           | NOK | http://autobuild.buildroot.net/results/5985b39b87c5c392b4f9b65c12008ec7b3a143fe |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/1a133a93e23f5aa0ab9c5f1c47d1d7f006fd088b | ORPH
    arm      |          gdbm-1.18.1           | NOK | http://autobuild.buildroot.net/results/39c405096908e1d15f2462b990717215bea0750f | ORPH
    arm      |          gdbm-1.18.1           | NOK | http://autobuild.buildroot.net/results/d09b5368bb624df629296359a5abcdd37ba61e9e | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a702f5c3c08f741c566f9bbf3f3478c3a5519202 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f62b94e49513c3707cb40b64570598b82d31ddb5 |     
    mips     |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/04ca87cc18798e7d82cffa0763b46f8f2c4146ea |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/57e4b2e029ef617c49274e7e6a743d1c52e9741b |     
    i686     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/cd7101d56a83011b8af27c0e7ac34c0ef26f6690 |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/6519dc4362cdbf68e41138a93f72cea611a2347e |     
    i686     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a7c58d52451e15a2fedf52f0d381b1c9713fa881 |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/21ecdf65c828aaa42f996b94345a202211d049ff |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3c7aba24d69e5cfd808fe9bf6ae1562d2e974240 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/8406bb5adfc1e5215a1686ed3b155f961f6059e0 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b91436db8d493039d9cf4d01eed339247f5f2028 |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e574de0dbae8c085d0be13fafdc578e5035c2ebc |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/63ad200932d4fb9f74b098ab4ae0313f06f4496d |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/25f881002dc538b8287147df17c3a736bfc557b9 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d39caa6d746cec3918ea7da3311662818a5c9992 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/34f815dd381b8289ee8759ea986e4e0c5da65951 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/85a160c2d8ad43c99328f8429cdc938898120fcb | ORPH
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/eb6223c03ddd4f1b146613b45d5780248209c474 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/7b157a60064261d4e4404ef375cb214cbde00dcf | ORPH
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/4cbeef658c3942eba1ed3c083ba78871230d57f4 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/eef80452c7fe7a938d7048f3305bf2506e36914c |     
   x86_64    |         python3-3.8.5          | NOK | http://autobuild.buildroot.net/results/55ded660e82ca44249b5b7fc05b43c81d179d271 |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b5d476f291987b68e2001da98621ad0367d0e1ff |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/2d05d659adfe58cb87a034d44a4cdfc241d2f823 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ee472971d7b2926793f61d302b7a2c08e9135fcd |     
   mipsel    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/03bdc9a09a1f16108029bb06a4c06732cdbd476c |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/d75330eb1812792a8c88bd401c1c16beb2ad789d |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/bc3388424c80f8ff4634099898d4dffec8374df9 |     
    arm      |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/e608db0103179c5511c417653b66e9ee4979993b | ORPH
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/023a1ab998e4e2c7010928cde8e64b342614e42f |     
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/c8b2b02eb2e53bfca87f2d4c0ecf1e344b2eabae |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/212972fa713d57711194ab03de0017de6fe273e3 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/8cea717eedf05eb8ec9b030e5c9cf7c3f5823a04 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/70b2d1abb97fdc5433506f49a38f7bfde7528a43 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/74fcb15a4c39978f941d296f9ecf51d8a56a592f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/83e99dc5962638b35cf524c0bdc54fd9bc99c2f6 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
             kismet-2016-07-R1 | 1 
               opencv-2.4.13.7 | 1 
                qt5base-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d54fc0f38e13332b9a60255712ccd69f2adc0814 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/e459d0dea54074f9dd30538cd5114c505a1a53e1 | ORPH
   x86_64    |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/23333a98bccfcc2f32f8d20520f1eeecbc11a806 |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/8ab19886a47034f8667362499bb2844b1dbe1e3a |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                  assimp-5.0.1 | 1 
              ibm-sw-tpm2-1563 | 1 
              luabitop-1.0.2-1 | 1 
               opencv-2.4.13.7 | 1 
              openjdk-14.0.1+7 | 1 
                qt5base-5.14.2 | 1 
                       unknown | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/d14f657a74ecf224b791211b251569beece960e4 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/19815074b0775d43b79616baeefd0a6fabbb31d3 |     
    arc      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/a71fb7a9e9b7f75c88c794a9d42c08d6a1ef44ea |     
    arc      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/a70d3010f541487bca58fba7e63c57d0ac66b750 |     
  aarch64    |        openjdk-14.0.1+7        | NOK | http://autobuild.buildroot.net/results/71d69f5d76de9c6d253ea24f095425d49f9b340d |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/83021ad91ac8b68830c0e58e5275bb77d5bb7b56 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d11388673c2dd6f8185af9dbf47ba7300b14594b |     


Classification of failures by reason for next
---------------------------------------------

              host-grpc-1.31.0 | 2 
                    bird-2.0.7 | 1 
                  boost-1.73.0 | 1 
              dieharder-3.31.1 | 1 
              gr-osmosdr-0.2.0 | 1 
  host-python3-requests-2.23.0 | 1 
              ibm-sw-tpm2-1563 | 1 
              keepalived-2.1.4 | 1 
             kismet-2016-07-R1 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
             stress-ng-0.11.17 | 1 
                suricata-4.1.8 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/c71ebd8c0b3ab657230ece7aecccbc23fd5156c0 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/e5c6a112991b85dc32c1d5fe7820dfb3858a8136 |     
    arm      |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/ba70d111cd1f2029a193a88af3b44daf6ef27786 |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/b9283d131d290f9b86e43173d1ca79730a527f4c |     
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/822a90b66441473b6323d94934700e6ab039691f |     
   mipsel    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/3186f9d82bbc0396ef29db194a6427d118f684b0 |     
    arm      |  host-python3-requests-2.23.0  | NOK | http://autobuild.buildroot.net/results/cc459e64015325656516aaf9b8797ffebe08ed28 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d8653d9badc8291e22ec91abc718b6047645740b |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/29430699217eaf24797573fb4cc18c995295be1b |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/d814f97177aea25f643801e9be12055cabfb2a1e | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/36169b4f351fb413d2b95bf73c581a116bba9bbe |     
    arm      |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/306913d0b500289684d535fee37a14e3e482d48d |     
   sparc     |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/c79c5221528a7a60d2c687068a38011979dcaa62 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/25b2abe24c589d8926955ce5466a2eeb0624cebb |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/9521ad119cc75f3c7c1e82c30b7e99e05e50ca6e |     



-- 
http://autobuild.buildroot.net
