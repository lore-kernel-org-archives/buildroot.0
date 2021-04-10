From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Apr 2021 05:11:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-09
Message-ID: <20210410051120.8E13060665@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 30  |  8  |  0  | 38  |
    master   | 172 | 76  |  0  | 248 |

Classification of failures by reason for master
-----------------------------------------------

         s6-linux-init-1.0.3.1 | 20
        host-sentry-cli-1.57.0 | 4 
                  monkey-1.6.9 | 3 
                  ndisc6-1.0.4 | 3 
              skalibs-2.10.0.2 | 3 
                  zeromq-4.3.4 | 3 
               belle-sip-4.4.8 | 2 
canfestival-7740ac6fdedc23e... | 2 
               capnproto-0.8.0 | 2 
             libopenh264-2.1.1 | 2 
                mono-6.12.0.90 | 2 
              netopeer2-1.1.70 | 2 
                 pixman-0.40.0 | 2 
                rocksdb-6.13.3 | 2 
                       unknown | 2 
                  boost-1.75.0 | 1 
                 dc3dd-7.2.641 | 1 
  gobject-introspection-1.64.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  mender-2.5.0 | 1 
                    mpd-0.22.3 | 1 
                    mpv-0.33.0 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.15.2 | 1 
      qt5webkit-examples-5.9.1 | 1 
            quickjs-2020-11-08 | 1 
                 rt-tests-1.10 | 1 
                    ruby-3.0.0 | 1 
                 samba4-4.14.2 | 1 
          sane-backends-1.0.32 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                   sdl2-2.0.14 | 1 
                      tar-1.34 | 1 
                    vlc-3.0.12 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/6f1fbec2925159c2152b69ccf370e751357ae083 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/001cb448ffb8cd6731b77a720c1df3cdbe5a1b9c |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/2bf4f226a8256c83ad35f80e9e6df4b99fc2cb52 |     
    arm      | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/f9673311f925b352f283393b3ad7a490fe8cdf4c |     
   x86_64    | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4f9c93c1f585cbc7c36dd1017bc0542b072d1edd |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0e265b9c969bd5ef7c6dded4bdbff36018b2b846 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ab7cbf5856f96afa6943a291cfd0fff2c146fca3 |     
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8b9878bd2ea9a14f8aee47304a99680e74733abf | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/84b621298ea9b4d418896bbd3253777665d73486 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/53ccadf0cbb068d2d6fd088aeb9cfb3457792b7c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/948efe02c43c994d38f5f5c7bd3b98a718b0df74 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f5981da6cbf97c8a05f4d6c196b29d690b3a30bc |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0a2a74a20b570561b1c24993a2be9d51bb0bad39 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/4e81162736b51dbcf2e68f324d65319c91ccaa34 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/22ccc277c52f4e492559a801dd4021f8576ce606 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/f34c9443c864a499c1127a2adbc564828dfaf443 |     
   s390x     |          mender-2.5.0          | NOK | http://autobuild.buildroot.net/results/4c74a04b2f900d454facdc5dc5997d60a1c555fe |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/46d3100d03a08c14f5923413114a0a3ea5e53b1c | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/c304d58a8e297514f4028713934337e9ee6d993d | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f7d1d9f3ca57098e8e7a9e58117f45069b42dc0a | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7d46d5d00e4d95f52a1a03bc2966a0688cddd13e |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/3a11f5d872cde4a3f98f10ec042b6ee31644e2b7 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d8fb19fe80ef1d7dd71dedff66ed08f4661da065 |     
    arc      |           mpv-0.33.0           | NOK | http://autobuild.buildroot.net/results/827ac0f22a1c69a2cdb2b0baf8fb3f3305ec5b17 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/123849d72a4eef83fdb3bbabe800b1393f432aa1 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/6b945a61737ce3d6b57230cddb8dbb289c1eadb1 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9eaae7986b680ea23d827ea45bac24f528d80392 | ORPH
    mips     |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/f9675013b717963f2d945a6eb5175c113267ab53 |     
 powerpc64   |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/d5d601516c48a3944ac486ac75e48f00a293a1c1 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/e84c3c955c61ad7cc378b0bbf596aaec19d91007 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/c4047b707eb712269d578fade0cd17fdd3bde574 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/db2f06279c9ee49adf2a6de66d012f9aa0dd76f1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9427173d97e345354debbc014b80b82aa19a9f4d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e7b5e79a397e040e39de59bf08faf97c50914c01 |     
   mipsel    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/71fcf53326e14a9e08653f7ac02b42830d623a80 |     
    arm      |    qt5webkit-examples-5.9.1    | NOK | http://autobuild.buildroot.net/results/0dbc672725924f080915ca8e31a829834a60fd7a |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/838d455a4caeb1cdbb22274b4ea844f5336305bd |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9bf2cf72db827094c060f266919129b959684f70 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/0fca46b46a5fefd4f55a06a33694753e1a8dfdf8 |     
  mips64el   |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/0baa30409d5dbc8511e796d7a6478172eb7924ea |     
   sparc     |           ruby-3.0.0           | NOK | http://autobuild.buildroot.net/results/9fe05ff9d0f97eb1ef76b10feb510666be1ade13 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/adfc5924e95d0a240a11e8e87fbe739430106dab |     
 aarch64_be  |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/d9eedbbdecb20fa1f918b1063305657489aef377 |     
microblazeel |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/21df7da4354bb8d1401f47b0688c9c71a9501e76 |     
  powerpc    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/0bb6f4e4e0c3730ede2267f6a8f6950a0d363dd2 |     
   mipsel    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/186650f86587bef11571261927e85bcc76ae2752 |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/b4241a253eede54009c11d32e424724c3b2e4421 |     
  powerpc    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/194a8b9de55a09b7388cba48a66be6e1720acca4 |     
 powerpc64   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/0cb42581597e10951c70ca4eec99ab9e95ba89cd |     
  mips64el   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/f87ed08d79188f52bfc8502015492f04913c1c4e |     
  riscv32    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/fdaf1f80a95d48d562730d22a77d57fd1fbfeb38 |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/705e190a21a92f26eecaacdef7d68be72df559c4 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/5f0d48ebd4932a7dd33aaacbdead034635f68fed |     
microblazeel |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/434911ddb8c9dbcaa6b2a541d36c1afc75fe4c38 |     
    i586     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/fd5252ccd3a7da43b94bd56bbb402ed93df43e75 |     
  mips64el   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/5364de0215f17617ece8a0b93cc5d838994d46dd |     
 powerpc64   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/66d1cfe30ef802b5910c0e8d84cafd22cac96834 |     
microblazeel |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/e20d872f198f88dac4be64ed61492f5a3272bfb1 |     
    sh4      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/e24958a52671210b7be432042dd4e63b0e1c4f3d |     
microblazeel |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/6fa425704d38ebb1c418b99886eece011734bca6 |     
   sparc     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/fada00f8e6ab470d384f1db575365779b0da6a21 |     
powerpc64le  |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/b355364b24d08bbc4248bb7958284d911759d0e2 |     
    i586     |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/24649741421a742d08bc043fcd1f052ddae948a1 |     
  riscv64    | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/44e140321bdecaf5a2aca9a1bda538013a5a2941 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/2c49452373ce436aa37725417b0ca04c6f682802 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/8c8b29a942bba753ad95cb1f96b0ae4d84f80327 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/41c957ea8a12216fcc527c0245f39d0f963d1d0f |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/08114f8f2e76b7fad8aae5a181d68eac52f9182e |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/c3f7d6a58206d560b3e66007fe6b134b610b08cc | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e1fc5ea68e2619322a1e2a04c67a38f3834bdfd1 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/2909b0a9604e92cd5cc2ce047ce002c177cdcb0f |     
  riscv32    |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/5e5408b3b5da840f6fdf3dc66dd994edadd56b15 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a077d6f810856139be5307e76a926643f6529039 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/57df59e16546f9739e1ab273d82a7d235da816c7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8f413652096aed6f96967648a88a38638dfb46f4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/46bd702410d90c8fcdd9b546537a6a087b2477fd |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
canfestival-7740ac6fdedc23e... | 1 
  gobject-introspection-1.64.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  monkey-1.6.9 | 1 
                 pixman-0.40.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/fc40d8ee30759f37427a93154ab1a70580674bd9 |     
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/439c17912bef7b45ad13975ef2318cd1225de162 | ORPH
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3bed842e311de3919c3a351a268eed730d8801ee |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dc11b918238310ebab7020fad24226a21a3548ba |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/f1000927c1538cc3b82cfc0e3283d4dcde41c79a |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/23496bb6a05589a3d2bbe1ffb59fade0a3d46f49 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a622bd0c4901058310d2e1729cebe10402bbd5fc |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0d1249f0f65c90cd7d8c70012fb938c68b198e9d |     



-- 
http://autobuild.buildroot.net
