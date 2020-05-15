From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 06:27:57 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-14
Message-ID: <20200515062805.59F6C87D00@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  |  9  |  0  | 30  |
    master   | 184 | 78  |  0  | 262 |
     next    |  7  | 11  |  0  | 18  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         uvw-2.5.0_libuv-v1.37 | 7 
              ibm-sw-tpm2-1563 | 6 
              host-grpc-1.25.0 | 4 
                qt5base-5.14.2 | 4 
              exfatprogs-1.0.2 | 3 
                  rygel-0.38.3 | 3 
                  zeromq-4.3.2 | 3 
                    atk-2.33.3 | 2 
               belle-sip-4.3.1 | 2 
                 gnutls-3.6.13 | 2 
              gr-osmosdr-0.2.0 | 2 
             gstreamer1-1.16.2 | 2 
          gstreamer1-mm-1.10.0 | 2 
            host-python3-3.8.2 | 2 
           libusb-compat-0.1.7 | 2 
                 mesa3d-20.0.6 | 2 
                    mpv-0.29.1 | 2 
                thermald-1.9.1 | 2 
                       unknown | 2 
                 acsccid-1.1.7 | 1 
               apcupsd-3.14.14 | 1 
               apparmor-2.13.4 | 1 
                  assimp-5.0.1 | 1 
                    brltty-6.1 | 1 
                  cairo-1.16.0 | 1 
                coreutils-8.32 | 1 
                   gssdp-1.2.2 | 1 
      gst1-plugins-base-1.16.2 | 1 
       host-gettext-gnu-0.20.1 | 1 
              host-ncurses-6.1 | 1 
           host-nodejs-12.16.1 | 1 
               libtheora-1.1.1 | 1 
                libzlib-1.2.11 | 1 
                   mimic-1.1.0 | 1 
                mongodb-r4.2.4 | 1 
                  ndisc6-1.0.4 | 1 
               protobuf-3.11.4 | 1 
              python-pyqt5-5.7 | 1 
                 ripgrep-0.8.1 | 1 
              spandsp-20180108 | 1 
                  stella-6.1.2 | 1 
                    wampcc-1.6 | 1 
                  weston-8.0.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/6305222691ce54d5e3ebe861a3f4ffe71354960c |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4cbc7d6311ae0487cf8278ee64eabc0253d55668 |     
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/694172400bdb3f92841db2aaf53875b6d5122cad |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/e3f959c9f3e6840f1a7323e6bab4e2a067b6de04 |     
  sparc64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/19de6eea5f6ac6f2c6fc1ea0ff610bc93b2878a7 | ORPH
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/735f9e3459f5d043dda4c760e4013d1aad1c77a6 | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/12c581fd89243e2a1433c26908cc9c63c143ef9e |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/b5fe5942c33abb46db2fcdea877136e103fe1e04 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/c21fcd169c1a724d421fc191a500de77721df135 |     
   x86_64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/0fe67636bf466a01c82b484c4a0f88c0946257e2 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/9a03bc91524021fe7114654bb893cf27e3085341 | ORPH
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/93c3792b5c7f95fd2c1a34f9923447b76384be03 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/74032919b52a6561ea9abe37f4398e4d382a2d54 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/4daf5bd093c083289453f82bdf42eb59f3b71d23 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/44759648d04f119aa1c9c4a6b2e7dcf83acbb0fd |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/3a3b5d0d4423b690fb3ca8a27f373dc20ff959f9 |     
  mips64el   |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/398a723c600eb500b99aaa17b041cae6c0fa8b6d |     
    i686     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/b0d215ed60bfd9db329016d04ce4e096870d8db9 |     
 powerpc64   |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/87f135b7a401bdb2b428e1b271b06b40dc489505 |     
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/e0a2afbbc8ed664978dae0db42ee2ff9649ad0e5 |     
  riscv64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/bd327dcd7111850d310819264b3d0f953457abe8 |     
powerpc64le  |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/0ce40eedf96a90552337643d3a01f062f899a009 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e0eaeb87d9931bff58b4440ff58dd014e78c53d9 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/5ea00a6a557938b6fee8d017f3bc7df09b6bd864 |     
  riscv64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/0fcd379bb7a4fcee13275da6a2fed899a990872d | ORPH
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ca8a636f3d17ed3490c5a85f29945d0c5a77a3dd |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/37e79ad1ad00bdfc47cbc401bb7dfe9b748d42bc |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4619692746da0d50cfe2406ccb1f6c337f2cfa6d |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/687b608858fc6c28f48a2b702cc8873e1365610b |     
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e2ec9f9e88becdd0357d0160e9fb35753da9a6b4 | ORPH
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/4c160f1198877c730fbb81458d2a578a30ee7a93 |     
    or1k     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/50411831af164f805d00814afe20ba21ff892e54 |     
   mipsel    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/717bdbd501ce0ba7ac3c3843b06814206fffdd7c |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2d29704fe8db5898e3bac28c355b85e1cffd13db |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a3ee54b289a32f7733e65d2ab44b79e26b117fc2 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f3b52f02b28e92e7204c9e86b9d8407a0bd987ba |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1a06943b92a4127d0aedcb148985e64eeaca9293 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/12de7eee12fc874cc8c502e9f79c2af410fd8d19 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b6e63c6eafcbb6ecfb5ea9d34635e7c62f529570 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/42287c3abace8c4fc3b3c58d2a6fffe766fc2b95 | ORPH
    arm      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/8fefac76707b07f30f533396eb1c579f6a3dadd2 |     
    arm      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/15cdb278e4eaa3a41a81c04059ff45839f9b14ea |     
    arm      |         libzlib-1.2.11         | NOK | http://autobuild.buildroot.net/results/a0be42c34471e0a403d0bdb557425612fd81ff49 | ORPH
   x86_64    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/0fa2084b258018a174876d1c4c7ebdb52a397760 |     
  aarch64    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/374b2a1994915b92ab1deb404ba9ca93442171c7 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/96060c616365ea947308d2521b8c4c74cc4643b1 |     
  aarch64    |         mongodb-r4.2.4         | NOK | http://autobuild.buildroot.net/results/a667ef1b455ea2b9abbe19fc4af2da1e217fb048 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1e98d7b319d8a8b82ae38e0389ef6152d8126c46 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/853cd4b48662604c62520f429fe98fda64fe14ca |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1ad482244275cb0ebb3101f5a7d45838875daaa0 | ORPH
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/5d49eaef120bb35b5fb6ae77f5dfc9952eba37c5 |     
 aarch64_be  |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/122bb0a37d968cd79dc043b48f90f1ba4135491f |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ebdfeea228f43381401f66cad5d0077d287ce5df |     
  powerpc    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/78bd447b1d1483475803bd59699aa64aefe62c3d |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a7b0cfe170c5160c35a607ed03bdf42ecbbd2d30 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/84775ccc4128b5e1d10504c5657e39ee5535fafc |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/51ab7e3cc45b5293c0c0510497831497abfc1b8b |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/9a374b8126e55c5ed7d54c1fc5ffeac4a1a14668 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/9dcef83addf026321ae5a6d9e8f7b48e20c65cb5 |     
    sh4      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/79491d392d4eb5fd97c662f0d59cf7435898e035 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/2ae55dbacda686996fa9ebcfe8d93d5550e02d5a |     
  mips64el   |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/7c031d8ec89d1eddf7231ade5d3568397c58ebaa |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/496d1977197e891c184f44927c9a61ed69708b96 |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/4dc62d87ecf84fff5a23b7d9fb3076ecf8dfb5fb |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/944fecf94f4234e85703d189e64c6b9f44ee3710 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/664440981c5176c58b8b68691ab2fcd459176bcb |     
    arm      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/95e6d8b0bb18e15bca7778fc87a9fe11f820efe2 |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/f88c4f71e0609e08c99ff5abf09d07f10de3b838 |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/0e2303f3c8833136bc6648d03d8d3e51c3e4ce43 |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/3fb67f2d4a8ddc5ef4c34ebd3dfcfce67b202e1e |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/2108ea9cbcb941d5d01800c98e4505eb2a184dda |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/65110213c9439119a7a12dea612dca347a651b5a |     
  riscv32    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/2cefacd99ce3c856b823e499b5f373ed824ae684 |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/338f5e4172b72e985e962d6d044481476679deed | ORPH
  aarch64    |          weston-8.0.0          | NOK | http://autobuild.buildroot.net/results/e40f3071cd7381abfc4ca2d01ae5bd2cdea339b3 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d26d427ca6719c511937f929da963749b915c00b |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c05c10b0dacd34847e7ce16a915f75306e5f20ab |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d7dd03a157d0d898e50041fe9da63cc981b922d6 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

gr-osmosdr-46698a67e7e06419... | 2 
domoticz-0f411f781ae4fb4a82... | 1 
          gstreamer1-mm-1.10.0 | 1 
              host-grpc-1.25.0 | 1 
             host-pango-1.44.6 | 1 
             kismet-2016-07-R1 | 1 
                    mpv-0.29.1 | 1 
                   nload-0.7.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/227feb5ec9798b429a18d98408d4d6d864bae428 |     
  mips64el   | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/b440303f15dc9cd63364209d10f71438b0f8091e |     
    arm      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/17f4fb5fa40e31cabac89ee7df52cd02050b38d9 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/cc84e4c6df5acff3b304e9d931271ee5aeb04da8 |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/80652c54774bec9c2c01a171068dadc5e5596a49 |     
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/89cf6bff24a6b617062884c984d63c220f76104f | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/be6e7004952e27c8cd71aef9da49e7533e27160c | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2d588e6243188e502073757ec0b0a35ac0c4fe1e |     
    m68k     |          nload-0.7.4           | NOK | http://autobuild.buildroot.net/results/dbd092fb13912ed38329e93bd2767029652abc48 | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    brltty-6.1 | 1 
              exfatprogs-1.0.2 | 1 
        host-gcc-initial-8.4.0 | 1 
            host-pkgconf-1.6.1 | 1 
            host-python3-3.8.2 | 1 
           host-wayland-1.18.0 | 1 
               libupnpp-0.17.2 | 1 
                   mpd-0.21.22 | 1 
                qt5base-5.14.2 | 1 
                  umtprd-1.3.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/cccf8680052ce476c4421d2934cc178f7095576c |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/e0d247cb3b62ff640d96e9c3642b1a1488e83fa0 |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/c1748346a0d32c15d61ea3d232e88fa7fdba36bd |     
 powerpc64   |       host-pkgconf-1.6.1       | NOK | http://autobuild.buildroot.net/results/9ad62c33cd7204486273764c2370c34032f6a2d6 | ORPH
  mips64el   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/7502995d841af45604c59d6e7dd0e6287cb83324 |     
    arm      |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/22bcb8c90786e1ff02f58254428f37d931885a76 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/2d274f3d401c086d2fa7d2d262459ca07588ab7e |     
    or1k     |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/3fa9e160cf6136cdf71dd0ca703121583dfcbaa4 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/17dfd81e9773d40f2ff76f8f79f3b55c7c94b48f |     
    arm      |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/f36f089002a1274f161dc9c5bafc888bc5001190 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/02966c1a2a415cea65306ee85241d64952a682de |     



-- 
http://autobuild.buildroot.net
