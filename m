From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Jun 2021 05:47:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-15
Message-ID: <20210616054725.65CBD401CA@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 31  |  8  |  1  | 40  |
  2021.05.x  | 28  |  5  |  0  | 33  |
    master   | 68  | 121 |  0  | 189 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-6.0.0 | 14
filemq-8940f34e0f1c8f25c1c6... | 13
cegui-00b4e1fe174da53b7ed72... | 9 
              libostree-2021.1 | 8 
casync-4ad9bcb94bc83ff36cfc... | 6 
                libselinux-3.2 | 6 
               pipewire-0.3.27 | 5 
             safeclib-08112019 | 5 
           host-libselinux-3.2 | 4 
               memcached-1.6.9 | 4 
                openswan-3.0.0 | 4 
                      pdbg-3.2 | 4 
                qt5base-5.15.2 | 4 
                   seatd-0.5.0 | 4 
                libsoup-2.72.0 | 3 
             libsndfile-1.0.31 | 2 
                 rpcbind-1.3.2 | 2 
                   tor-0.4.5.8 | 2 
                       unknown | 2 
              webkitgtk-2.32.1 | 2 
              asterisk-16.14.1 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
            docker-cli-20.10.6 | 1 
                    ffmpeg-4.4 | 1 
                       gdb-9.2 | 1 
      gst1-plugins-base-1.18.4 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 libpsl-0.21.1 | 1 
                 mesa3d-21.1.1 | 1 
                    mpd-0.22.6 | 1 
                openocd-0.11.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
                    qemu-6.0.0 | 1 
            qpid-proton-0.33.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/0ae7f541a08a04018abd727df869855a37170175 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/109cd4649c099f5b561f4df25d24b56a99f332c6 |     
  riscv32    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5b90f727d3fb441c71daa08d0f5bc4937200557e |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/21bfd25b91a003c49f447a8df87e2292c49fe996 |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/38f0383bd95674c782e592923462d8c571a0a68b |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/149384f83b10ef4db5e5172725c7c298cd34b9dd |     
   mipsel    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/61bf2652721d5d0614a5824df80ae8272c4a3943 |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/12f6b7b43ed87249675fc43068a58ab970730882 |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1cb09e5f52435efc505c61707b2d5d2ee871524b |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6244cf43bc1a60970dd0d9d0becf5f5e82aaa468 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c2f4aa9dda53b345ba06b8f01fa9a8ee96bdc260 |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8db07af0141bdf8e0587c7aa531574211e823052 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/9ad768b7e2a3c59833e03986c245f2f4b5d25dcd |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/592fcffb226c8b44ada5fa3cdb8ab15c627f29dc |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7c8443d52024fd0f3bed1ddd8b3b1c6122e8ea6c |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e4b251886049f05ff7e2e9f45b3f4038c07e8316 |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/513acff6d14904044d3d34e936c58eb1746fc5bd |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e7fe413fa335d59345804ea7ead034e8c16b9b26 | ORPH
    i586     |       docker-cli-20.10.6       | NOK | http://autobuild.buildroot.net/results/f44475be8862712079443006f56c748f56525cca |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/4477d05e439449661cb19fecdf214f0c7d3d7e6d |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/3bf7d034b5feaf52b4cac00ff3385744ecf9f39a |     
 powerpc64   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/fd9f0395330bbce2510cd7e5925a22bb52268cfa |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/f1f04e2efc99cd6686bc886bc603dd99f7940cc7 |     
  powerpc    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/90a8cecaf4955fb5cc99eeb94707e3404aee3a9c |     
    arc      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/2358cb428a63c67bc872b93ece23e4e0c0724d08 |     
 aarch64_be  | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/92b5a674c8232cd43107f8bfc82d221ff8f2606a |     
   x86_64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/7256d8f3cc3a481bd41da7cf6d8b77aed4b17667 |     
    arc      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/a5a1ce07bca582232d90be893ad8e9c6081edee2 |     
   s390x     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/e89ba4307c22ec2d55136adeb35c62091707063e |     
 powerpc64   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/e35f8e491fc34fa83fe71f7a86f7b823e33ad8c3 |     
    i586     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/680e91d53c07e59d0237294feda9b0e02ae8158c |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/60b96bb341c064d46f60f9ac81faf8f334dbea2d |     
microblazeel | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/85535bf89467b8d3de65e981d7d1373c73c77e2d |     
   nios2     |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/62b16abcc760c54d82f087466256157064c175d7 | ORPH
    sh4      |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/283c4a6378e5df9b1c14b1ef2ef7f2e5d7cb2e33 | ORPH
   mipsel    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/d9bc7d8d736886fe9a7b954c2721555161be22e7 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/cf2bd630ba6303ce657582d516cbc074886662fa |     
    m68k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/4a5a33f7a96a831ab2f078f322e84250c214ff55 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/335afb315176cea9f8dc113fef0cc162a4d62ee5 |     
   xtensa    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/dd494bc79c0aacad07a7a7538fb9d991fb105d59 |     
    or1k     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/250a54806158dc326ae1de581935806029e93b43 |     
microblazeel |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c29f53a3b1aeca2f468aadea48131b1b8eb67ab4 |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/94b6c63f807364b08713afc2a5b30b37d2b70496 |     
   nios2     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/448bf3161fabc52507e6ee7e6737a770fa3fee10 |     
    m68k     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/5b18586d9b907e835302799048843f71afc3151d |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/8230776385a10c5807c2a0b262cbae606ad4ff3f |     
   nios2     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/0bb7121dc57073bb340a56520440f26b47498105 |     
 powerpc64   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/2927564254e8f9c9796312546529dce9f1f4efb6 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/663e57af9f05d3480745d0ec85f083c6166476d7 |     
   nios2     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/36746e743556c57d8038ca8a4fee8302d9af853e |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/776f7eb46f005622572ab8a1d4512b2ebe1e2e37 |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/b46dda09391ebe526d1dca327c60b09a379af088 |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/f5d01b67fef50b8318c8b86cc6efc682af3451ea |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c9cc635f374aee6cdc3e4833cec88a1b1ddecd2c |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/06bc81ed4286eee94da151f6740f04705f5a9385 |     
   sparc     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/6d0f42d52e294e75f44c7e92594ee0077675de7e |     
    sh4      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/f79ac2cf6079a7bd552d6d1d9a43a0813e210154 |     
  riscv64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/e87319adfd86449daedfe0963044ef35cc9b4a98 |     
   nios2     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/3fbc281d6236717a43ec9d0b60f15a1b57692cde |     
   mipsel    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/364a16e08db31cea7c62bd5445e40d07cc3f90fb |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/0ca2f9d1050e2aa16a6fc033bcbc2a5c08fcff41 |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/4fc852f9b10fa59f951460349c101fb8d8470e85 |     
  riscv64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/50069587f00a9687c29a641cfdabba4d5c390da3 |     
microblazeel |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/d011f5f2382362dd20d65c1feb9fd01c74b90194 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/3053542aa54d9df8c1fd809b030e4e9cdd9d26f3 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/a9b0dd8a66e6e4d87f2cfd466c838d86d0afab5d |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/bd7a19bafcbd839ba21fde20a868179be1968977 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/db34a387c2a399955f3663776614521e8f458f54 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/d9bd3df2166d807388d8dd87719cbd7a0f326b33 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/9ed6e21983ad66993a222ae14191db0dfb840f6f |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/7ff2f3c3419b29bc7094c6727e7c278bd2a04717 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/19509c5cc016a305db01a7ce0cc094c86ef2be2f |     
    i586     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/fed0b4f5430a766755618d668725a0de156a8dcf |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/40e59d00c630f7bae6093d28c204ef66de1bd29b |     
    mips     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/1d5819afcb384027ce44c45b2ae582e36c07a1fb |     
  aarch64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/2eb437501af8c9ee82ff528f527b3a44f1e55724 | ORPH
  aarch64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/3e2047729376de3492ed952261da3543814d1105 | ORPH
   mipsel    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/7ad585ba506312b6befc1101cdfbe2d651e691c2 | ORPH
 aarch64_be  |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/3702fc86b710008a1af106dc1446a801b0fd8036 | ORPH
  riscv32    |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/106e9601a4ac14c09db6c6e764fd8aa0f839dd76 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/522edaf2cc1cc6a01d04ef4191b602336770dee1 |     
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/316d37d4db2c283c56280b1744a291b2ba88045a | ORPH
  riscv64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/13b375dd28147a9837be74ee2b9f5c525770efe1 | ORPH
  mips64el   |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/e3b1e7db3dbc93e07f0f4fbc3087dc9c506b9855 | ORPH
 aarch64_be  |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/828cfcf569690926eb813e804bd3eab064eb10b5 | ORPH
    arc      |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/f7e4eba74a759c8d5210611728c144791a0dc0c2 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/7dd0fe1fca9ea6e911d31df7b92db4288754e38f |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/9c57804480ab4d9203f063b84a89a109c8ebf780 |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/0491c059f299ee55c3481c69e9d87763b8580c3b |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/37f007b321d20b471b89f10b9ca3a2e699910672 |     
   xtensa    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/5bb7e59a3af86a9200a2adef1ac1efc7837992a2 |     
    arc      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/30660a2f9e1d76660b11a8f6af466b69fb8cbc9e |     
    arm      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/3cad7de543f5b40a0133f41133207477129adac3 |     
  riscv32    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/9f02121f06c12224e45c83dc44b1aa510b7767cf |     
 powerpc64   |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/0387418653bce40319620d201aa75f431d5cab2b |     
powerpc64le  |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/13d59d2ff258eeb631d96423cb1d921cf8322eec |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9d12368ab552cf8e9c93019290e37fb4fc941944 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/724aaeb550a1c52e7ed8fdc01047b5a06570e44f |     
microblazeel |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/eb03fbd96d7c674268198b4f030cd5bf4d40f5cb |     
    mips     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/38ac783c7151967ddfb71fdccafd2eb87552264a |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/744300d5fcc85fe7603c00978a134fdc00808024 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/21e5f45bbec05f22efc3ae2713d360c5a6f502ef |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/af9bb4e3cb1262c9f769eb179b6937b76712d82a |     
    arc      |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/05a74e764cb1492e5caff347972e8b78170cf6eb |     
    m68k     |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/659a3be42073b7c0a612c4591258128fe3598c78 |     
    arc      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/550fd6bbe229651f500b3427ffe5667901cbd03c |     
   xtensa    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/1f42f46af7e600b45030e6199edb5122f917766d |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/fedafa2507617d313169cfbcef5d00bdf55007cd |     
    i686     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/0081d3b17d4c8abfd9cd6b02702812d7d4a4b3cb |     
   x86_64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/7b4587d841254c79082acd3f9f0bb20cc06f48ef |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1d5b9bb961662fd13d1b01ba12455e151f4dcc78 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/b3c78b8bf5b86470a66572e1a49a0024654e8bda |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/c6c56ca387910638b928005928485232923a6d17 |     
  powerpc    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1474b31f4d3385ab405b8faeb67c16083d494654 |     
 powerpc64   |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/857536b5fcc3ae129ba406e8d16eac31ca89b101 |     
    arc      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/233e760296eb2ae569439357e2baaf5b575187ea |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/66fe0e984574364f2ce6ec427d360231e18e00ee |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/233a3def5da012e0733599df661648ab8cedd203 |     
    arm      |        webkitgtk-2.32.1        | NOK | http://autobuild.buildroot.net/results/5adbae999edb7212e0dadd5c59c41f8a27faf105 |     
    arm      |        webkitgtk-2.32.1        | NOK | http://autobuild.buildroot.net/results/806f549922c1b086715382843e5ff68d3b6364c7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/61d1d32ccded251f378fdb9621ffee769459bae6 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                rocksdb-6.13.3 | 2 
                   sdl2-2.0.14 | 2 
                      apitrace | 1 
                  apitrace-9.0 | 1 
  gobject-introspection-1.64.1 | 1 
                  ndisc6-1.0.4 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |            apitrace            | TIM | http://autobuild.buildroot.net/results/0ece3b443926fc237d5e29699fcc6e3fba699624 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/86385a3f5516704d75d1684d9bd2ab3e440231c1 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ca214041436af9f2951f09a4cec8ae0ccf50a485 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/78c10e51a2d7f95caffbcbf1bfd27f29cad27611 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1e2e39a86bd8d0a69791a6debba86ae67a2b177f |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/25fe803aca125f2c07b799aa335edbddb433ea78 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/08d0b5c53cbe888cf27591b286cec5798281ce33 |     
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/4b33bbda66442cd94f057da135d5c10e1a6bfa99 |     
    or1k     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/b0682932ab1b59dc644359f4927e032da8031f2d |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                host-go-1.16.5 | 1 
        host-sentry-cli-1.57.0 | 1 
                   sdl2-2.0.14 | 1 
                       unknown | 1 
                    vlc-3.0.14 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         host-go-1.16.5         | NOK | http://autobuild.buildroot.net/results/71861ac43fb9004ab1f20ea0010c23b3ed7e9db0 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e5d4d9c84cea4217a367c16f2dedd605e6d731e5 |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f7a0b199311e158ee9b47d1155ba9e2612306db0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/afec30adcfd48c9203049403fe1e7aec9c8b12c6 |     
    arm      |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/4a0a0a202bdc0f1187042320b17cfbee47cac979 |     



-- 
http://autobuild.buildroot.net
