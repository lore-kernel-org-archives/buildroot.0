From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 May 2020 06:26:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-10
Message-ID: <20200511062707.479A785E1A@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  | 12  |  0  | 34  |
    master   | 213 | 86  |  1  | 300 |
     next    | 20  |  9  |  1  | 30  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 6 
                    atk-2.33.3 | 5 
              host-grpc-1.25.0 | 5 
                 mesa3d-20.0.6 | 5 
             host-squashfs-4.4 | 4 
         uvw-2.5.0_libuv-v1.37 | 4 
                  zeromq-4.3.2 | 4 
                  assimp-5.0.1 | 3 
             host-gnupg-1.4.23 | 3 
              ibm-sw-tpm2-1563 | 3 
             paho-mqtt-c-1.3.2 | 3 
              bitcoin-0.19.0.1 | 2 
              exfatprogs-1.0.2 | 2 
                 granite-0.4.1 | 2 
             gstreamer1-1.16.2 | 2 
              host-audit-2.8.5 | 2 
               host-efl-1.22.3 | 2 
               libupnpp-0.17.2 | 2 
           libusb-compat-0.1.7 | 2 
                  ndisc6-1.0.4 | 2 
                qt5base-5.14.2 | 2 
                 rocksdb-6.6.4 | 2 
                  stella-6.1.2 | 2 
                      fio-3.19 | 1 
                 gerbera-1.4.0 | 1 
      gmrender-resurrect-0.0.8 | 1 
                 gnutls-3.6.13 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
              host-erlang-22.2 | 1 
         host-exfatprogs-1.0.2 | 1 
           host-nodejs-12.16.1 | 1 
                 jack1-0.125.0 | 1 
                   libnss-3.52 | 1 
                       libuecc | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
                    qemu-4.2.0 | 1 
                  rygel-0.38.3 | 1 
                    strace-5.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a0fe9a150e1e194b8292cb0de53926b734131fbe |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/d686eb65a5ec2e45095a98601b14c92f8ba72592 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/6c7097155e2f39550e741505a55d05542a58a678 |     
   nios2     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/5152f5de1e75db6bc34dec2da0d3ca62fc17e35d | ORPH
powerpc64le  |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/64e80444e287545a681ee4e083f92d855863135d | ORPH
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/64268be07d974de4b3d1ca13c72bbaf702b73fe7 | ORPH
  riscv64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/91e9db842906f1ddb1eedc940ebfe18b5b3cc31b | ORPH
   nios2     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/5d7434c511e97d2156083f21417c75afb3d3d01f | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/b885462ec03627531999669a3e802f0afa08e3b5 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/4a2213f9972de5202d4997cb6252abfd8fb140ce |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/7677d1e41f53f571870de48b2b59f6ccfb0d74c0 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2036731db06ea6449516361a552913194901cd95 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/b7481b8b72637e4bc9ed00bc69aaa9376b6f9e5a |     
  aarch64    |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/f8ebcfa382a36a231f88d738989986095f180bfa |     
   xtensa    |    gmrender-resurrect-0.0.8    | NOK | http://autobuild.buildroot.net/results/6b51969484372e02c6959687983612620c5ee940 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/a272c7b1039309920d9673a8e252f19bc3bc5003 |     
   mipsel    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/1dca16ed083a9f0b4b9437a06ed757f571e0acc8 | ORPH
    mips     |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/260474ece8afc004283bb8aa26e369319f0f8549 | ORPH
   x86_64    |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/0c567d644ee43db7c6b96164a6fc03a33ff67953 |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/509102057dd94e97809be4b48f9f38c6ee42e978 |     
  riscv64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/196c2ffd384cb8ebb3544b39c3dce5c4680d7e1f |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/0bf1dbc4bbc59e66b4f57fdafc72bc28759df368 |     
    m68k     |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/ebd0b495ed230e8b262e1398dc2a406a9ff485da |     
   xtensa    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/ca0d4aaa0e9f580624a376ddb80307de46a64a56 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/1e5a853dbc3dc17823ab56a177afcb23e24dbfb5 |     
    i686     |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/97faddef227a1294d1be322e254c1e7a43f2284c |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0caa513ff8c477eb87f238bb77541f2266a2f5f7 |     
    arc      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/9a354e8fda3a001d5fd8ba970658162537084f33 |     
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/7f7a0334eda627ed38a90b82eec2fd2a6a585bcd | ORPH
   x86_64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/44f5d6b7befed304a3e731d74503fcfb99d21784 | ORPH
    mips     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/b7c246ba975f783210acf49490dcf95cceed4dfb | ORPH
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1318a8d67658f3395d06e407fbabcc7c55f0ed14 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ab9856b76e67e5af168d546a267e203b969f8cee |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bcfc5c3dfea62da1803bc623ec7866648dadb65a |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e5187ea69c7856d8d795216acdfe7c483383351a |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e44e4cf2c364c6965292b22436e745f5a82da1ee |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/4c8cf414161f2071edb89271851f1f0885dc25b7 |     
  aarch64    |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/ebc9a485ff6412b0494973d3950dfee275a88da9 |     
  mips64el   |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/35f616f4bec08095bb5dc832e0e14ec91ed8f093 |     
    i586     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/a25260ef31b1ddb11737280a65eab8aa43357261 |     
    m68k     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/98cb12d3919c8d165c79899e1673e754d40c27ad |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9e5aea7f56effbab454aeb6ececf22f8c96947fe |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1907ab1c4f8eb97f586e4f785d4a547533c094ff |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/7cfe60e118b22d85ccfaacc7a33eea2aa1c323ef |     
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/aa4ab10c01d7b3a43e19bdab5f66c2b3ea930b99 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/99769b550dad65fd22b89084c13fd5c1cfe36dab |     
  powerpc    |            libuecc             | TIM | http://autobuild.buildroot.net/results/e19f437b0fbec15e2a6aca7591f7b5341f5784c1 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/062c2a70bd9ac9d32eadbd6ca18c2861b96432cd |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/67cf83c7b476050e34323e5dad92273d2f325e3b |     
microblazeel |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/e4636a692956fc6c887f2cc39ffa552213b4e62e |     
microblazeel |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/870c5c58dcd8b21fbc9f4d30da3e8696ec29d6c8 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/daed129418393b0ca484590d0c39dd5a575c0bc8 |     
   mipsel    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/49c7d1545b99da476c1c2814ed93848c388211f7 |     
  mips64el   |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/ba8b69b688e85dc3bd3733965d5216f5f5b21155 |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/5d0db1cfe3b7e7c2a079a2869a9080cd8aab1546 |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/540bb72d4adce7e14cae376532f854793379e97d |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/6e6ee51624a1a21cfbebf7d54a819aadbcbbb5b2 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5631b3bc2a942c2d44b65640c8ea066b4b588ee8 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/371f8b04dbf205862c0c3dc606b10e122ea129ae |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f1dd33addb5e5bd67e1adefd5b34d0cfab6c2643 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/299f2335ac6f67510267d81bbd1cbe90f90383bc | ORPH
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/68edb9bf19949b4b8d8119dd58d7979aec289cbe |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/280de4dd4651663d62baa154dccf3cd525b6fa21 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/133410eebc62238326b1216e690536e4f8e1aaf5 |     
  aarch64    |           qemu-4.2.0           | NOK | http://autobuild.buildroot.net/results/c78297d0b17787da36f3716c78f7b30bf1d5f14c | ORPH
    i586     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/68791f44cf10a77726968712d02a71008d444ea6 |     
    sh4      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/730f24c5812f0c27f009220176a25757cc8b97a9 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a59fedb03a35597edece83d40ad6fa8d962b31ce |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ec26a8ff6ca16ce96a773e9803baf4870745b5ee |     
    sh4      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/73596a6025bf4f82a5a0c2e8da03ccbf8b07f3a2 |     
  mips64el   |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/96e2e72cad3fa8bca3d0ea7ad18fa0e027b929cc |     
    mips     |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/cbb61ec5f9d5621781d5e849ecc54cc29d4cb826 |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/7f61bbbb0ba181d01aee7d485cb2caaeb9bd3118 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/2e269e36208b73825e211028aa4a76448f2814a8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/970035f430f98cc0796b482714d20a1b058e6f78 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/ca0f364dd97fb6ebe9a2a67b4f86254255987a24 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/b9a64691deb5dd147cd15dc45eb714283047426e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5d9389c6bad29af412f5729b57c521679060c1da |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/197a13e2fb21d1e8ae3d3ecda7828ca666421610 |     
    i586     |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/3dc7f2dfbd92ef8589afa52d1e451b525ba7c884 |     
 powerpc64   |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/c8162608e57d254cc7e670b2a4aa0197957df8e8 |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/bae287ded5b08c72e4e3d1903fa647c2d8c20811 |     
  aarch64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/b042d838c661c526d14da1fcd1d4b1204e676d45 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/9555af84c36efc4eb25237deb4e07978233c64cb |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e32eafd49a1c166f17ad57bbb5f1569dbc80bae2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d58de4ef10e7a06f500719f9d120a6958a5928c8 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ae1350bad4c47ceb315ee9fef2b959bfe8788419 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

             paho-mqtt-c-1.3.2 | 4 
                 binutils-2.32 | 1 
                 exim-4.93.0.4 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
                host-dtc-1.5.1 | 1 
                   mimic-1.1.0 | 1 
                suricata-4.1.5 | 1 
                       unknown | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/43aafad46312e63240cc61eb0012b4a5f3677e51 |     
  riscv64    |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/d615d17b97bec0cc4fa6d578d7a9770c42826e61 |     
  riscv64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/c831fb4b0c840cffe760ee69775290d8bc62a8c8 |     
    m68k     |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/82d874332ed9bebdf80acd9e462489558db208d9 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/037a159e620487372aa34961b12d747ca8a193cb |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c1c5f88f2371525d93620ac7804059ae075470f2 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/8b5d7095b488478a7719f4f253a71074dbc12208 |     
  mips64el   |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/a86c071074597ab8c24b0d991149a00c531fd003 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/3eec8b9ed381d7f55d21962c611f8b8c30107097 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/4af63e2986f6010933f1604928c5fb6a91c84bfd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5da0ac0ebb50dcd97450f6c772fabca964e138cf |     
   xtensa    | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/c80ffdf1d07a65d3898b96e6f4657a92dcf760bb |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    atk-2.36.0 | 1 
                 dmalloc-5.5.2 | 1 
             gstreamer1-1.16.2 | 1 
               host-efl-1.22.3 | 1 
         host-exfatprogs-1.0.2 | 1 
            host-mono-6.8.0.96 | 1 
           host-wayland-1.18.0 | 1 
                       libuecc | 1 
                    strace-5.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/c902802fadcbc1115f4d727bc956d4d2a87e86f5 | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/81537e6dcc40278293a9987644107fa341076507 | ORPH
   mipsel    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/52ac133195cfd491ad8d8b7eecd24ddfbe6221d4 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/93dfe64e58b1b1d120a1bcb83bdf4f4580c0e6b1 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/1b89a3b2ed034f28de08eda9d145e8f55305dcf4 |     
    arm      |       host-mono-6.8.0.96       | NOK | http://autobuild.buildroot.net/results/e5fec45bd9f6fe39bc4785188b55b332f9729159 |     
  sparc64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/e3115bcbf5e4636290576fd44dd3a6684a42c4e8 |     
    sh4      |            libuecc             | TIM | http://autobuild.buildroot.net/results/ba06bec64091313d89b11f2f687550558ce7d2c5 |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/1a6d9b101217cfb7e0dd4a15a2babdf85ebac731 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a2f5ff89e51878a2257e1244abebfd2dd348937d |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8.7_SP3      |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20191018     | 20200430     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.36.1       |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.1.2        | 4.3.0        |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r36   |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.850.1      | 9.870.2      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.6.2       | 17.4.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.2       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2020-01-22   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.2        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2020.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.1       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/21396 | 1.1.0        | 1.2.0        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.63         | 1.64         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.3.1        | 4.4.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.3.1        | 4.4.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.3.1        | 4.4.0-alpha  |     
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.13      | 9.17.1       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.2        | 3.6.1        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.20.0rc1    |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.72.0       | 1.73.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 4.4.1        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.6          | 5.6.1        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 20160414     | 20170601     |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.7.0        | 0.8.0        |     
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.44.1       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.44.1       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.31       | 1.4.32       | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-alpha  |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.0          | 20191204     |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.15.0       | 0.16.1       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 10.0.0       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.17.2       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.6.0        | 0.7.1        |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.2.2        | 2.3.1        |     
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.3.1        | 2.3.3        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.26.0       | 1.27.4       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.9.0        | 2.10.0       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                           daq |  DISTRO  | https://release-monitoring.org/project/13264 | 2.0.6        | 2.0.7        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.14      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9.1        | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 9.0.2        |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.5      | 19.03.8      |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.13       | 1.3.4        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.7      | 19.03.8      |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2020.1       | 2020.2       |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.9.3      | 2.3.10       |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.9        | 0.5.10       |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.17       | 1.8.18       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.12.0       | 9.13.0       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/21344 | 1.5.2        | 1.5.3        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.0.6        | 3.0.7        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.24.0       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.03        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.179        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.3       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.30         | 0.31         |     
                         empty |  DISTRO  | https://release-monitoring.org/project/20564 | 0.6.20b      | 0.6.21b      | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.8        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0-rc3     |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.14       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.4        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.5        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.22       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.7        |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.5        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.33       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.19       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.32       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.5        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.18       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.40       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.6        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.24       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.4        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.7        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.3.0      | 2.6.0.1      |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.2       | 0.27.3-RC1   |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/13755 | 2.9.1        | 2.9.2        | ORPH
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.2.1        | 3.4          |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.4        | 6.4.5        |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.1        | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 6.2.0        | 6.2.1        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.13.0       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.0.0        | 2.1.0        |     
         freeswitch-mod-bcg729 |  DISTRO  | https://release-monitoring.org/project/21862 | 1.0.4        | 1.0.5        |     
                      freetype |  DISTRO  | https://release-monitoring.org/project/00854 | 2.10.1       | 2.10.2       |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.03.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.7.0        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.36.0       | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.4.0        | 1.5.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.20.2       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.50         | 9.52         |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.64.2       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.65.3       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.11       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.5        | 6.2.6        | ORPH
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.2.8        | 5.4.rc1      |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.8       | 1.14.2       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.19         | 3.20         |     
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.4        | 1.0.5        | ORPH
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.4.0        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.14       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.28.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.37.1       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.0       | 0.13.1       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.6.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 3.0.2        | ORPH
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.44.1       | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.3       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.335        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.2.0        |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 65-1         | 67-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.10         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.10-11    | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.1        |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.1       | 3.20.2.2     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.1.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.1.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.2.pre1    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20191112     | 20200508     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.489        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.6        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.3        | 1.8.4        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.6          | 1.7          |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.11         | 0.12         |     
                       jansson |  DISTRO  | https://release-monitoring.org/project/01417 | 2.12         | 2.13.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.9.2        | 0.9.4        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                        json-c |  GUESS   | https://release-monitoring.org/project/01477 | 0.13.1       | 0.14         |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.20       |     
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.70         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.70         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.70         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.70         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.70         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-04-R3   | ORPH
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.3-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.2-Leia   | 2.2.1-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.2-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.2-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.2-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.5-Leia   | 2.2.2-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.5-Leia   | 2.1.1-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.6-Leia   | 2.1.0-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.4-Leia   | 2.1.0-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.4-Leia   | 2.1.0-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.3-Leia   | 2.1.0-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.4-Leia   | 2.5.6-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.9-Leia   | 3.0.5-Matrix |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.4-Leia   | 4.1.6-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 5.2.9-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 4.1.8-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.4-Leia   | 3.2.3-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 4.1.7-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.21-Leia  | 5.4.8-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 4.14.1-Ma... |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 4.2.8-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.15-Leia | 6.4.3-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.19-Leia  | 4.4.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 4.1.5-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.5-Leia   | 3.1.5-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 4.1.7-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 5.5.9-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.4-Leia   | 4.2.9-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 4.10.3-Ma... |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.5-Leia   | 3.2.7-Matrix |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.1-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.4-Leia   | 3.1.1-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.3.1-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.4-Leia   | 3.1.1-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.2-Leia   | 2.3.0-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.1-Leia   | 2.4.1-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.2-Leia   | 2.2.1-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.1.1-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.4-Leia   | 2.2.2-Matrix |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 2.3.1-Leia   | 3.3.1-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.6-Leia   | 1.2.0-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.0.1-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.2.1-Leia   | 3.1.1-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.0.2-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.1.3-Matrix |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 2.0.2-Leia   | 2.1.1-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.1.1-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 551          | 557          | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.34         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.15      | 2.10.16      |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.0        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.7        | 1.0.9        |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.1        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.5        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.36.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.24       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5.1        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.0        | 1.8.1        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.1        |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.40         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.7        | 1.1.24       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200311  |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.0.7        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.1        | 1.4.2        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.0.2        | 3.1.1        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.48.4       |     
                      librsync |  DISTRO  | https://release-monitoring.org/project/06309 | 2.2.1        | 2.3.0        |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.3        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.1       | 0.20.3       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20191204     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.0          | 20191204     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.0          | 20191204     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.3        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.70.0       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.20.2       |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.12.1       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.7        | 1.12.1       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.17.2       | 0.19.1       |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.11.1       | 0.12.1       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 1.0.18       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.18.0       | 1.18.1       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.9.2        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 3.2.2        | 4.0.7        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.06      |     
                       libyaml |  DISTRO  | https://release-monitoring.org/project/01800 | 0.2.2        | 0.2.4        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.130      | 1.0.167      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.3.1        | 4.4.0-alpha  | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2020.04.24   | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lshw |  DISTRO  | https://release-monitoring.org/project/06701 | 02.18        | 02.19.2      | ORPH
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.11.0       | 2.12.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.0       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.11.0       | 2.12.0       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.34.2-2     | 1.36.0-0     |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.2.1        | 4.0.2        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.22      | 10.5.2       |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20191016     | 20200505     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 168          | 169          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.3.1        | 4.4.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.6.5        | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 20.0.6       | 20.1.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 20.0.6       | 20.1.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.37.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 57           | 59           | ORPH
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2020.02.1    | 2020.05      |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.2.4       | 4.5.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.8.0.105    |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.1        |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.22      | 0.21.23      |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.13      | 1.26rc2      | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.1.0        |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0-rc1      |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.7        | 1.8.10       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.13.5       | 1.14.0       |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.37         | 0.38         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200509 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.206        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.0       | 1.21.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                   netsniff-ng |  DISTRO  | https://release-monitoring.org/project/02071 | 0.6.6        | 0.6.7        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre2   | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.5.1        | 3.6          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.25.1-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.4        | 0.100        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.39.2       | 1.40.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.9       | 1.18.0       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.16.3      | 14.2.0       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.11.1       |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.6       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.5        | 6.9.5_rev1   |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.9        | 4.3.0        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.2.1        | 6.3.1        |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.49       | 2.4.50       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.4rc1     | ORPH
                       opensbi |  DISTRO  | https://release-monitoring.org/project/21804 | 0.6          | 0.7          |     
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.1.0       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.7.0        | 3.8.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.7.0        | 3.8.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.7.0        | 3.8.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.7.0        | 3.8.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.20       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.3.1        | 4.4.0-alpha  | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.20      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.2       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.6        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.4        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202003       |     
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.34        | 10.35        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 2.4          | 2.5-rc1      |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.2       | 5.31.11      |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
            perl-exporter-tiny |  DISTRO  | https://release-monitoring.org/project/11846 | 1.002001     | 1.002002     |     
             perl-json-maybexs |  DISTRO  | https://release-monitoring.org/project/11953 | 1.004000     | 1.004001     |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.40         | 8.42         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.112        | 0.114        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.010001     | 1.010002     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0205       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.0.4        | 2.1.0        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 76           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.4        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.9.4        | 1.10.1       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.0          | 20191204     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 0.88.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.11         | 2.12         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6c       | 1.3.7rc3     |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.4       | 3.12.0-rc1   |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.6.0        | 5.7.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b2        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
            python-argon2-cffi |  DISTRO  | https://release-monitoring.org/project/33377 | 19.2.0       | 20.1.0       |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.6       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.2.7        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.0        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 3.1.6        | 3.1.7        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.1        | 3.3.3-alp... |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.1.0        |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 2.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.3.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.9          | 2.9.2        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.17      | 3.0a4        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 2.5.0        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.48.1       | 0.49.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.4        | 3.0.6        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.2.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.5.1        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.5        |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.2       | 0.17.3       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 2.4.0        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.4.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.14.0       |     
                  python-janus |  DISTRO  | https://release-monitoring.org/project/56567 | 0.4.0        | 0.5.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.1        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.2       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 21.2.1       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.2.0        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.8          |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.2.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.1        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a4      |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.44.0       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.18.4       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.3.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.5        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 7.0.0        | 7.1.2        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 20.1b1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.5        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.4       | 3.12.0-rc1   |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 20200506.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.5.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev8   |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.6.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.4.3        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.7        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.6       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.14.2       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.12       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.28       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.30.0       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.53.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2020.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.0       | 19.0.1       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.0        | 3.5.1        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.5.7     |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.3.10    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.9.0        | 2.10.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.13.1       | 0.14.3       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 46.2.0       |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.12.14      | 1.13.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.2        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.4        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.5.1        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.16       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.1        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.3.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 3.0.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.46.0       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 20.4.1       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 20.3.1       | 20.4.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.1.1        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.6.0        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 2.0.3        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.9       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.14.2       | 0.15.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.2       |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.20.4       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.5        | 1.8.6        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.51         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.25         | 0.27         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.8        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.26.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.1.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.2        | 3.9.0        |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.5.7     |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 46.2.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 4.2.0        | 5.0.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.31.0-rc3   |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.14.2       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.14.2       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/15197 | 0.8.1        | 0.9          |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.8.3        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                        reaver |  DISTRO  | https://release-monitoring.org/project/06095 | 1.6.5        | 1.6.6        |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 5.0.8        | 6.0.1        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190609   | 2.20200229   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.0          | 20191204     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.9        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.1.0       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.6.4        | 6.8.1        |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.12         | 3.13         | ORPH
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.15.1       | 4.16.0-alpha |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 1.6          | 1.8          |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.7.1        | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.43.1       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.43.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.2.0      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.2.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.1.2      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.9       | 4.12.2       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.29       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20191204     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20191204     |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.0          | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.7          |     
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.3.11a      | 3.4.0a       |     
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.15.1     | 2.9.16       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.1       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.10         | 5.0.2        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.0       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.11.09      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.4        |     
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2-rc.1   |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.8        | 5.0.3        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2019.11      | 2020.04      |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.7       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.4.2        | 1.4.58       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.2.1       | 12.3.3       | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.6.0        | 1.7.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.1          |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.1b         |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.0        | 2.3.1        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.1        | 4.2          |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.3        | 2.4.1-rc0    |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 2.94         | 3.00         |     
                        uclibc |  DISTRO  | https://release-monitoring.org/project/13815 | 1.0.32       | 1.0.34       |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20120424     | 20200328     | ORPH
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 4.10.2       | 5.0          |     
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.4.6        | 1.4.9        |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.96         |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.4       | 0.12.5       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.48.5       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.0732     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.60.2       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.18.0       | 1.20         |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20200413 | 1.0.20200506 |     
               wireguard-tools |  DISTRO  | https://release-monitoring.org/project/62381 | 1.0.20200319 | 1.0.20200510 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2019.06.03   | 2020.04.29   |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
                       xenomai |  DISTRO  | https://release-monitoring.org/project/18451 | 3.0.10       | 3.1          |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.2        | 3.2.3        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.6.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.43         | 5.44         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.7          | 3.9          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 356          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.11       | 0.3.0        |     
                         xvkbd |  DISTRO  | https://release-monitoring.org/project/05273 | 4.0          | 4.1          | ORPH
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.2        | 0.7.3        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.2.5        | ORPH
                          zbar |  DISTRO  | https://release-monitoring.org/project/13689 | 0.23         | 0.23.1       |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.4        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.2       |     

-- 
http://autobuild.buildroot.net
