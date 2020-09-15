From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 07:09:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-14
Message-ID: <20200915070956.691418567A@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 25  |  3  |  0  | 28  |
  2020.05.x  | 17  |  5  |  0  | 22  |
  2020.08.x  | 23  |  2  |  0  | 25  |
    master   | 112 | 91  |  1  | 204 |

Classification of failures by reason for master
-----------------------------------------------

               libuhttpd-3.3.0 | 6 
              asterisk-16.10.0 | 5 
                   guile-3.0.4 | 5 
                       unknown | 5 
             babeltrace2-2.0.3 | 4 
                  boost-1.74.0 | 4 
                       iwd-1.9 | 4 
                  luajit-2.1.2 | 4 
 Makefile:752: target-finalize | 4 
          gstreamer1-mm-1.10.0 | 3 
               capnproto-0.8.0 | 2 
              host-grpc-1.31.0 | 2 
            live555-2020.06.25 | 2 
               target-finalize | 2 
                 uclibc-1.0.35 | 2 
               apcupsd-3.14.14 | 1 
                   atftp-0.7.2 | 1 
                   axel-2.17.9 | 1 
              bitcoin-0.19.0.1 | 1 
                coreutils-8.32 | 1 
                  dhcpdump-1.8 | 1 
                  dnsmasq-2.81 | 1 
       docker-containerd-1.4.0 | 1 
docker-proxy-55685ba49593e6... | 1 
               domoticz-2020.1 | 1 
                   faad2-2.9.2 | 1 
                 fwts-19.09.00 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 gnuplot-5.4.0 | 1 
                hiawatha-10.10 | 1 
             host-cairo-1.16.0 | 1 
              host-guile-3.0.4 | 1 
       host-librsvg-legal-info | 1 
host-meson-tools-0a02e2d344... | 1 
             kismet-2016-07-R1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   libcap-2.42 | 1 
         libcpprestsdk-2.10.16 | 1 
                   libnl-3.5.0 | 1 
                libpfm4-4.11.0 | 1 
            librsvg-legal-info | 1 
               log4cplus-2.0.5 | 1 
                minidlna-1.2.1 | 1 
                       mongodb | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
package/librsvg/librsvg.mk:... | 1 
                rocksdb-6.10.1 | 1 
                  uhd-3.15.0.0 | 1 
             util-linux-2.35.2 | 1 
                    vlc-3.0.11 | 1 
           wayland-utils-1.0.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a73923ff5795eadc0141bf7483dad03b6e8a9e66 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/e945f45ee60d22943e9d947decb1f72d51de159e |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/1f879ea66d34913812d74d55d60a1f9b9bb8151c |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/48c03b19e01d428323e2b6fa903c5d8dc00d9506 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/87204a4dbc065c0e7c180dc63037f4795d3d31d0 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/c064f2278cd8bbdb7fe84f6b3ca118a0571933d0 |     
    arm      |          atftp-0.7.2           | NOK | http://autobuild.buildroot.net/results/89b77a12d3a9d3c30fc2715d7b0be6330450a489 |     
    arm      |          axel-2.17.9           | NOK | http://autobuild.buildroot.net/results/e7a36d26eb415593e62062f48baca742d8d4f8ba |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/c77098282e299d3aec1931376af3b19e785ad76b |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/5f880845d2088d2075d0f4a5a457e65d7460b64f |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/1e50e1ff90c1ac2af2223365dc0cd6e1914bcd75 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/4dbff8cbd091b8865fe44388f1728e8f0d24ee1b |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/d26d48475f3e109e623fd730564c4d6f9e90b76f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/bcd1a4168cea1288111789a0a4b36c19dea90c9b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d0603740d171378ab89cc853f33c23d77164fe12 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/3e3ad92f251d948a3cf5e473b664b4ce0502cce4 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/1c58fa9c9df6a2244bffe8d200adb39ff5ae8176 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fe5b71a9679263093fdff2c1a3d0ab51b83b4b89 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/42a2eec5c24f91f3ba271f81c3d97593452ed16c |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/d72c84d66f7cc384f46ab45f6a01f847e2661e56 | ORPH
    arm      |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/db3be149ec71de8376f685a6a9f027191d9bccc9 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/810d60accad31d7363216f3e033f908d3c8d8e33 |     
   x86_64    |    docker-containerd-1.4.0     | NOK | http://autobuild.buildroot.net/results/235a87af94feac70bdf91ebf6c23e08051f81eea |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/c6ad5bf83c284792b72a15a009598a85a4102142 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/499ec1907ee26591f15862d31b9a3a10fa6f1d66 |     
    arm      |          faad2-2.9.2           | NOK | http://autobuild.buildroot.net/results/2296745670cac7a09bcf1a75ae912803ad3755a4 | ORPH
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/82f469a012d8f568890d286a4000bb318bac858d |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/dbffb9e8944bcac2f0d7653a3ecf650138a9ad62 |     
    mips     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/2c47f7e37989ace11f2ef62945ea6ae7f0d82837 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9e724c1675929d6a88347d63fcebff8de4d943a4 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6cbda808ad11bdfd402e94a830be9103f207846c |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/68e58ab7f2c2022bd77b2cfc393e0d2408ebc668 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/3417f18c05f4295ef5acbb5dfd7ef8acb4e82a74 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/7542278f8de8c1afe2f4f85ab7b193f6a135cfb7 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/484926f007611d28b1c97fdd60a33c6f8e846857 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/0ee273bcc94eec3d059c989726248ccb2ef38b32 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/88c5812b9e1c0538f355cbe9325c532a74dca1dc | ORPH
   xtensa    |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/1a6742164820e7a43c9f14e7cca017b921322c49 |     
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/d984133da188533b98c3538dd36551737a4e8296 |     
    i586     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/3c33af86618c284e104f49adacb6f24190b88139 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/0ee14e362c03588ba404c4c356a19910804d952f |     
 powerpc64   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/6eee85c044bf28c13b72a89c09b77504acf3d7c6 | ORPH
 powerpc64   |    host-librsvg-legal-info     | NOK | http://autobuild.buildroot.net/results/d0fe65b9217169e8f0f6eaa9e8fa579dabfd1704 |     
    arc      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/5abd3310aa3c9a7e677d668cd781901fd31707b9 |     
    arm      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/38e5be5b5175eab083ef9ba9cac4758914314e19 |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/2a605ea9ad53449c3c0db5b71dfb1eca22e5738b |     
  mips64el   |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/358ff7261f8fbf29836fffa26ec43d6c2617df46 |     
  mips64el   |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/ce85b50e6d0d3872b5eeb1b51fa3a4d3d3f67f3c |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/c87f5a66e388b1d7b8c24ae74f091f076cbf23ae | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d56b236fea4d0510555e01d067a77d744a556aa5 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/dcf8d7d213e34662d307b7cd352ff277c843f979 |     
    i586     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/f6f3d6b67a2691702053bed3d5afd0ca389cc5a7 |     
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/73feb926562f0ab85de60248477b7c6111422c60 | ORPH
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/8ad23a82bcf32cd22256f9984a8f4cfa45951eee |     
  aarch64    |       librsvg-legal-info       | NOK | http://autobuild.buildroot.net/results/49993dc3c5ae71aae9dc2d853d0650eafa6e3601 |     
  mips64el   |        libuhttpd-3.3.0         | NOK | http://autobuild.buildroot.net/results/9e1539c78c5d8b32f552a4d949ecfc6103f50379 |     
  powerpc    |        libuhttpd-3.3.0         | NOK | http://autobuild.buildroot.net/results/7a9931809c9d2d6a6319aa6a55d620522c209e9f |     
    arm      |        libuhttpd-3.3.0         | NOK | http://autobuild.buildroot.net/results/965be1c72996df94668be81d1e90ed6937fb9a7c |     
    arc      |        libuhttpd-3.3.0         | NOK | http://autobuild.buildroot.net/results/1d3379488507cf04db2a4f3aa347905b54765af7 |     
    arm      |        libuhttpd-3.3.0         | NOK | http://autobuild.buildroot.net/results/ee14969cbbb29f3a0a1dbe1c9b4327b879bddf29 |     
    arc      |        libuhttpd-3.3.0         | NOK | http://autobuild.buildroot.net/results/b458e762a72549a428b421d9c9bd0909e3d1a24c |     
   mipsel    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/d7536ce93e7ba4f20929b2ff23a48cf7803e8001 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/67fba96e3d8f7fc2dfd53016e2c3aa5838bf3a63 | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/4a13cc893f6e21791a4a5670e6c7d5d40b1ab185 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/95f13d68a079b0e0528c7ea43578b56b6f9e44dc |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/48961b848033e15fa0f118b5ee9dac1e571e6f15 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/bed4add838129956b2452c26de3ddde4c9b08d76 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/c361f1c3f5551e847998330d278df880413aa70f |     
    sh4      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/fa0a8f5af170042761d8e694918fa42338108d0d |     
  mips64el   | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/e8ee3eb7e7fb7825d101638e103050ca4af9d2b9 |     
  aarch64    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/7705f6ed50bcae375dec10c5e422e50e647c7f46 |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/40df1f24ba716c6dc38f1183426f6c84e40b2f0a |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/9c43482a47189c9c4c1fd4cfe04ded2547744b9d |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/41c813f099e45741080e660460959ee61567df0e |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d32a1da18c9ff5f8e32b743239c7a5b6edbed641 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/907adc65e7a06910684b819a49867812ee0e1fa6 | ORPH
    arc      | package/librsvg/librsvg.mk:... | NOK | http://autobuild.buildroot.net/results/00a32728ea94b9a46b85671ec6431c616095f33e |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/f762befef46e01ad90c27fe015981de2692f8742 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/c41a3dfd7080169d9260078e12de0a65dbe1db8e |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/6705b591317ffff6d5daafe9fbdda98ef997b422 |     
  powerpc    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/e466ca4a52d1fccfc9b03a82b7ddb4e140f666e2 |     
    arm      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/cd352f22c9791d66b4932bca09a0f8afc71b8991 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/4338bc085b18e924e851b35fb593699cabc077dd |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/0068e2f299041968ce4a143243d79de526638a10 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/21ec7e9796490d954413c1df78e5703379c1bffb |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6ec3ad73564e980eb497d30dc9674c9f30f58376 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/575fda869b4cbad21d1fa66e8fd5950e99690327 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/8788c27a951ab81c420a5a5e7176401ee250e9c4 |     
    arm      |       util-linux-2.35.2        | NOK | http://autobuild.buildroot.net/results/5053de4ddd08cc7f6cbcc4d485dc2a146bd1cfa3 | ORPH
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/bd77f8fe877038ff1e8b9936d5a052833fa3003f |     
    arm      |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/84ad38933e4f42b74c3185c8c5e777fd714c9601 |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/378b792ab14f3822537f576c563be517891d8812 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

            ecryptfs-utils-111 | 1 
              tinydtls-0.9-rc1 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/efcc185c23c65b050fb8ffcdbfb81439f0b0d6d4 |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/6aeac54d1ec3fd0b092bc4f473c830d26a0b0e3a |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/92269ae99d1ffa2b9f86ef338d893340f3a5463d |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
                   mimic-1.1.0 | 1 
                qt5base-5.14.2 | 1 
                       unknown | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6ab359ed8524e6c8889ddfbb2386a4a0b9369782 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/4244832aba0a4623c80ea016ba47e09df0da494a |     
    mips     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/41a5e2c12c4d85baabd7c6418c0aff0ee989da65 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5cb1d6509b8c06b09a2f3843afcecf7782d6a115 |     
 powerpc64   |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/3fe3372442cec918be03bc03f9e189deb171ae8e |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/aa50eaf9b963b675e9462f545d930cb64f6bfa22 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a09915df8ae13c880b970b6426662db55773a8c7 | ORPH


Gitlab CI results for 2020-09-14
================================


-- 
http://autobuild.buildroot.net
