From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 May 2021 05:50:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-27
Message-ID: <20210528055053.CC30840EAE@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 28  |  9  |  0  | 37  |
    master   | 119 | 40  |  0  | 159 |
     next    | 12  | 19  |  0  | 31  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                  lvm2-2.03.12 | 4 
             host-lvm2-2.03.12 | 3 
                 dc3dd-7.2.641 | 2 
                    ffmpeg-4.4 | 2 
                 openal-1.20.1 | 2 
                   sdl2-2.0.14 | 2 
                  boost-1.75.0 | 1 
               capnproto-0.8.0 | 1 
           comix-cursors-0.9.1 | 1 
  gobject-introspection-1.64.1 | 1 
           host-libcutl-1.10.0 | 1 
                   json-c-0.15 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   libglob-1.0 | 1 
                 mesa3d-21.0.3 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.4 | 1 
                 openmpi-4.0.0 | 1 
               pipewire-0.3.26 | 1 
           python-pybind-2.6.1 | 1 
                qt5base-5.15.2 | 1 
                   strace-5.11 | 1 
                 uftrace-0.9.4 | 1 
                       unknown | 1 
               w_scan-20170107 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/1f487b6726fcfa44e4e22fc4fd70a836d8892fe3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2cbe305286531a80f69737ed60602020dbe8c116 |     
   xtensa    |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.net/results/8cace1bd4e50c8131b43d104b077617d29a1f066 | ORPH
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1d0bbfd91e02cb43f277757510e979bac9eb4730 | ORPH
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7d3261ea262e76eeb0311628701ed3c510b3beff | ORPH
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/93c58d70f678814fcc6aa542b2bd397506624857 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/78f14864d582f46ce17d0fbc506ea8240c119c89 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9838cb0e9272154c407a95ba299d375f7328afa0 | ORPH
    arc      |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/b6b60142a7d921218dbf5c1e58c3e8c930a77579 | ORPH
  riscv32    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/94c1de4703f9cfe4d76cfc6d8b9c128c1bb1cc2b | ORPH
   sparc     |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/fa718c680a136484f4e3b798e61d3c5160acd865 | ORPH
   xtensa    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/4bb15356b96f2cf71183623e516097e73b0f8126 | ORPH
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aed86a1049ce8f485b92d1e1e07b90a50b8db0b7 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2b2bd6f710dee5b8814aaa59868beb92eaa14488 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1c47ae72cd52be17bec793b05683c7bedb64f763 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/64c65048f7d9e92faca5d5d8e0e5561584709653 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c85dd434cc154b305ea846dc4c1c8d19837b1e42 |     
   x86_64    |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/706fbb7cfc6108f6682a9b0fe5b5acde76e82158 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/24e2c428a9998086ad3c8735c8503bb40ad1c744 |     
  aarch64    |          libglob-1.0           | NOK | http://autobuild.buildroot.net/results/ee2579d0545b4d72c6a77230eb8c57de86deb096 | ORPH
   nios2     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/54ce703f5905edfa595ddccc178d5b6de1a07c5f | ORPH
powerpc64le  |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/c85ef179e7ba4a8603012952208b70cce3bbe856 | ORPH
   x86_64    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/fc0f084af5e40aaa360779f55ef6eacaa064ef4b | ORPH
   nios2     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/0ceb0c3a90ef83b3b61f83ceb4cf77f1a29452c0 | ORPH
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/a8d0e4f5e0e67702daf1e65fc03b6c0d00510f7d |     
  riscv64    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b0afb40ea613326ba47b2ab39a395821cb4a4729 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d14574277f3114f609c8f9e64cb7708b61eae492 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/ad74889c1129416090d3702aa10b3210a9588701 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/628999b2fae80927bf68cc058e56990694f0ad9f |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/f5fe2c48c58d43b37c48b749e2bbc760883bf999 | ORPH
   xtensa    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/ef53534daf84397b4e22392f2a6be2c335819ab5 |     
  powerpc    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/a46e05015dbccf659a59ea3a0b8785a599c05ba9 |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/ac7c484138e24dc79ccc46434169f83b2dbba8c5 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/75f0df134b614fa50de14f4bcf1fe05ea42f7dd5 |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/82a5b04dbc21328e6f1a6beea1dbaeda3bbda693 |     
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/c6c4fb3b9098c5fc5dbe4415e2a9757fc775b746 |     
   x86_64    |         uftrace-0.9.4          | NOK | http://autobuild.buildroot.net/results/980bb38c6417bd48828379677762382030c5b28a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/02ea31271c9d68afd2ddd8b595ee0196006635a9 |     
    arc      |        w_scan-20170107         | NOK | http://autobuild.buildroot.net/results/63729fdde6ea31a10d9ceb578688396f6e5239e5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/adece0521d4109a5f5b28007e9006dce788f1c8c |     


Classification of failures by reason for next
---------------------------------------------

                  botan-2.17.3 | 3 
                qt5base-5.15.2 | 2 
                haproxy-2.2.14 | 1 
             host-flatcc-0.6.0 | 1 
           host-libselinux-3.2 | 1 
               host-qemu-6.0.0 | 1 
                 libssh2-1.9.0 | 1 
make: *** wait: No child pr... | 1 
                     mtd-2.1.2 | 1 
               netatalk-3.1.12 | 1 
                    qemu-6.0.0 | 1 
                   rhash-1.4.1 | 1 
      softether-4.30-9700-beta | 1 
             transmission-3.00 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/c7ec9af882e863500c84d635aae3e1e9b1e90f8c | ORPH
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/aa60a2c34620b40fc796311591fd215a974a6976 | ORPH
 powerpc64   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/2db369ab0cfdbea2f8d5a57aa18d61dab94f90c5 | ORPH
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/15e6ded7bebe904e62f8f489ebbdbf08b7f16103 |     
    arm      |       host-flatcc-0.6.0        | NOK | http://autobuild.buildroot.net/results/790bd9f18c26938e5276d64eca86143d2c866986 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/6fc7bf30ef98e8b995d3a51aa4326e2712d05668 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/2b3c3ed795fb9747b3931bfff4328fca2c94a5fd |     
    arm      |         libssh2-1.9.0          | NOK | http://autobuild.buildroot.net/results/a11c4f3711775ba37c1302cbb4af4b9619e198fe |     
    i686     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/22545f420fd3c69e1b52d14a8de00ae02f02960c |     
   nios2     |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/95cc6eda6ed9d9f5f45c486458b3d42422ea730b |     
   mipsel    |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/bd07cc369124cf189d685146a7254704bf76ef0f | ORPH
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/fc4fa032f5d81fad70e05ae8648190aee75d4f5d |     
    m68k     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/9a51ec1a8e8701f0762e5578fe624b26caee1f06 |     
  aarch64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/19ec2460c1213cb686f0d403dfd4d7ed1a966bae |     
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/68df344c492aaf289ba7e98239743b3b0e8dbd7c | ORPH
    arc      |    softether-4.30-9700-beta    | NOK | http://autobuild.buildroot.net/results/7a4024e1e4150bd376e5f74adb20a7fd90fab2b2 |     
    or1k     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/adab6625b203ff6210a5a9e725099f47d2a04d22 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/740ee18f099db3693980d31783ff1c0c933a7c9d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ca92508d0b2cefe444a6f7a0fe5b0ace8479e8d3 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
azure-iot-sdk-c-LTS_07_2020... | 1 
        host-sentry-cli-1.57.0 | 1 
                 jack1-0.125.0 | 1 
               luasyslog-2.2.0 | 1 
                 pixman-0.40.0 | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6719952e27ef9b918054f92f36a92a3993d4ec6a |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/1552aacd2cecab93d5a27b4760d85a48607f089a |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ef90ac0e4d352291054a3ba36bd706f2ab8213f2 |     
    arm      |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/3739cab6b26fd22609669c56c73eb80de45d309f |     
  powerpc    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/06194dbbac5631f77476817f340e0f359174d42d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7ea9e6d9c5ee6713fed7281076564d4c01316b10 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/fc21994007d2beb80c2e3a1dcf19585c1a845e12 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/511198f16467cc39e26a3a00b3c39a16da4bd546 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/6235f694e1caede702445261d2424711003777e0 |     



-- 
http://autobuild.buildroot.net
