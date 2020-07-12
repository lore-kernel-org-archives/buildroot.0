From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 21:09:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-07-11
Message-ID: <20200712210941.550708824E@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-07-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  2  |  0  | 15  |
  2020.05.x  | 25  |  5  |  0  | 30  |
    master   | 83  | 72  |  0  | 155 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          fuse-overlayfs-1.1.2 | 10
              tinydtls-0.9-rc1 | 7 
dvb-apps-3d43b280298c39a67d... | 5 
libcamera-96fab38e02792a109... | 5 
                  boost-1.73.0 | 3 
             freeswitch-1.10.3 | 3 
              host-grpc-1.25.0 | 3 
             kismet-2016-07-R1 | 3 
            live555-2020.06.25 | 3 
                qt5base-5.15.0 | 3 
                  assimp-5.0.1 | 2 
                     avahi-0.8 | 2 
               domoticz-2020.1 | 2 
              ibm-sw-tpm2-1563 | 2 
                 opencv3-3.4.9 | 2 
                      tio-1.32 | 2 
                  zeromq-4.3.2 | 2 
                   cegui-0-8-7 | 1 
                coreutils-8.32 | 1 
                 libnss-3.53.1 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
                pipewire-0.2.7 | 1 
               pulseview-0.4.1 | 1 
             qt5wayland-5.15.0 | 1 
                  rygel-0.38.3 | 1 
                  umtprd-1.3.6 | 1 
                       unknown | 1 
                wayland-1.18.0 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c57b0d6aad2da814bfca5c08c934e532190751cd |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/469644038bc89879bbef2639330f4250644ab956 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/bd56b4b1fd80ca676581cae47b4f84cd7a9b1cfd | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6d01f4144302dcea9d255a44bf05f796584c705e | ORPH
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/a241dcae5fc8cffaedbfc6320c4be557c08a2cc2 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/a9f77e72c684536fb413359b0e9cb1069899afd2 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/45c4cd8640da950849d66cafe2dd169a1959f071 |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/c3f0076e257c0d9543749d52fb1200cbbbf0bf09 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/f3335ed28fa9a8ef07cce66d7e2eb67de62e9fe0 | ORPH
  sparc64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/fbb2461170e3aa745e65ede8cb47c66f3d235767 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/24acd84ca3242ff24a1f3cd151cc725365d812ca |     
  riscv32    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/029f2e1d4a28e60ddc073588721f39278550e48f |     
  powerpc    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/eaee27e10524d54ee55ed66cd9263af8ec52118b |     
    sh4      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/74a084089a1f514d2ee7f2f03d26b3714f168685 |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/acf84fa33848407220cc4c3505b54c9ab4583919 |     
  riscv32    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/1202dcf8150395affa40dd8ac6939af03b137fbb |     
    arc      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/0cce5ef4e60a34e8e42bf37db8afb98ff681b58e |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/548a8d98dc6eb1de81249db92b872d2c034de019 |     
  riscv64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/5b9f2ef9681f0ba6a8d6fd5dae8e2d39674b60cf |     
    arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/e18eef4a9a592ceff7e030164a79bc6f36746ad0 |     
    or1k     |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/becb3ada7de861580b4e0a7dc7d52242d731a0bd |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/d46de1bd8411c89d2516e2276ebebd980f41d5b9 |     
   mipsel    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/1852a0011f831fb67b62d804c3645ff658ece178 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/a91a496d02c9b8238688c2dc2684dda3231a30dc |     
    arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/3440056a0e181cc0c5b5069e2aaa56beca619d6f |     
    i686     |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/5d935cc7e81e72a4f844aea0f16e898d3001ac20 |     
  powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/6791ea95df0f53ad1432f6c112968a90fc7877ce |     
  mips64el   |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/c61ec94b25cae4ff7d138ab354b8549e23a7acec |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/e305056e2ce561b26a773a274deffccd474c9681 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/07d3fae61a7d2f61cb5877c5a6823ffdd425115c |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/08e92e38d91c9be8f9280c2ccbe02577268f5485 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6db77bc358e3eac95fda676690eea40d261788ff |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/616aa742484c651bdc1744085fb70909d731e1f5 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/bf3a991e959c7056a3221d4d211a2f916d3227ce |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/cf4b7802baae2cbe96b576b1ffa0a0836489e19b | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b5a2bf684b7cee6ce6d276baf794a17ce1593965 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/37e37b88ad34b0c57cb01835bc0b8ae76f972f6b | ORPH
    arc      | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/0e86669783e8499aacc306513f1ec18e4a5ec017 |     
    or1k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/70df55eeda93448b8333781ade1c4f54ef5cd2a9 |     
  mips64el   | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/56c4c16ce8e083fec5dea1e4837055a489420f9d |     
  mips64el   | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/8ad4af3f9946283451550043349507cdeb586d62 |     
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/479f3a77927138a33082c7b33c6d3372bb3cf349 |     
    arm      |         libnss-3.53.1          | NOK | http://autobuild.buildroot.net/results/8fa6e0c72d177185f98dfc7ff512eecd81aca05d |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/8a389ad811c5e4aa935c0e768d59402390629a13 | ORPH
  mips64el   |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/e9ea0820b9e37c8b576f3fef135e89096e8c7c37 | ORPH
  powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/fabb9e320a5e1a2cfb9a6dbb52b5c2da3dca1a8e | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/097ad74cc7143d5f407959b1484fe88b2d3a703b |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/94cce2339a6a8686d5898b7c6736da55cf3eab7d |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/4e0ea805f867cfef96ccb596bbdfe54d9587dcfc |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/427029ee23a47282ee67d37426aa158934377dfa |     
  powerpc    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/3e3c4447c7a4acb9b26b771b4838fc1ea00bdc9a |     
  aarch64    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/e3ed38251b8fa2374fd20a220c878a4297bc5995 |     
powerpc64le  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/7e5fcc014c4ff8d2d7879645f7c2616571dc55ab |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c575fccc8d56fe24376df27942d417b226b9aa76 |     
    or1k     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/a212d9e4a066e98550153c4a177393dd93976b08 |     
    arm      |       qt5wayland-5.15.0        | NOK | http://autobuild.buildroot.net/results/b68f2b036b82b7d7206785f0bfac275dd8618a6e |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/4a4aca1460889009aec756ceaf2dff57926578fe |     
    mips     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3e323799de26c965f6c3fde1bf5fd894011426ee |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d05175577d5fee47c23a48a33bf963e8eb6d24c5 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/216953245cfca9ed81843e8a20daf2db435e1e44 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ac2fcbaa068496aefcbe3de3a3acdf062ff9c1f3 |     
  sparc64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/deca82934fa9efdfd1d00c80e34354230645b1d8 |     
 aarch64_be  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b57bb1a5139f58750e9ccfe4f340aa17e706b9a2 |     
   sparc     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/0fab1ed3cfd6b117dadff4424aa99dc6354f77ca |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/8104158c5854697348a74c3460067d54a63e6a5b |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/15b47c9483bbb1902a39df3f329412fecf1c13c0 |     
   x86_64    |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/3250b551207da2d201146723d3d8639398842b17 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/05aa6a34c3b2ffe29c7fd7afdf4bf2dc6862fb93 |     
microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/581957784b4d355e39bf8ea277f82b74a6b66f4c |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/3f49302e7d05d666a51db0cb51365620a63e3b40 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b6c864822dffcc12ad5a4a9d7823a930868b4342 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b94431fb42f70b4d4cfb3d9eaeb00f797d5d591c |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

             kismet-2016-07-R1 | 1 
                qt5base-5.12.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/4f7e780ad53bb6b5fd8009b3ce6eff46745bb4f7 | ORPH
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/cea5cee8301bd99e66c74130091d407bb74c2be6 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                    gcr-3.34.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   libnss-3.52 | 1 
                   mpd-0.21.22 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/a11af8568cba5742b4722234f62af57f42e3da00 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e67670f34bb2af9ed316283aac971d6461afdef7 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/3cc5011b0c1587b4a9e0908db930467ffabd1241 |     
    arm      |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/827bd615304568d6e7ed2f34faeed5c2347832fb |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ca8bbb3ceae8363d329eed2abcf52352a6adf9a4 |     



-- 
http://autobuild.buildroot.net
