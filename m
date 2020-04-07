From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 07 Apr 2020 06:27:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-06
Message-ID: <20200407062724.7FF4620517@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  2  |  0  | 19  |
  2019.11.x  | 22  |  5  |  0  | 27  |
  2020.02.x  | 15  |  5  |  0  | 20  |
    master   | 161 | 100 |  0  | 261 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   libnss-3.51 | 42
                   cegui-0-8-7 | 6 
                libtirpc-1.2.5 | 5 
psplash-fd33a9b3d68c89fa22f... | 4 
                  zeromq-4.3.2 | 4 
                  boinc-7.16.5 | 3 
              host-grpc-1.25.0 | 3 
           host-nodejs-12.16.1 | 3 
              gnuradio-3.8.0.0 | 2 
             host-pango-1.44.6 | 2 
               mongodb-r4.0.12 | 2 
                  ndisc6-1.0.4 | 2 
                       unknown | 2 
                     avahi-0.8 | 1 
               belle-sip-4.3.1 | 1 
                coreutils-8.32 | 1 
                 granite-0.4.1 | 1 
                 jbig2dec-0.16 | 1 
               libglib2-2.64.1 | 1 
                   libiio-0.19 | 1 
                 libuwsc-3.3.4 | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
                 opencv3-3.4.9 | 1 
                  pango-1.44.6 | 1 
piglit-ef761094be04d14e258a... | 1 
               protobuf-3.11.4 | 1 
                qt5base-5.12.7 | 1 
                 ripgrep-0.8.1 | 1 
                 rocksdb-6.6.4 | 1 
                suricata-4.1.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/bad406dcf1acc2bdff2f02a03a3c7fb1d712037c | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/778c036cae4ae85ebd4c553e39552e8ebaf377b5 |     
   nios2     |          boinc-7.16.5          | NOK | http://autobuild.buildroot.net/results/575b73b4956f7ff5821e6a96cd0dd97944e7e20b |     
  sparc64    |          boinc-7.16.5          | NOK | http://autobuild.buildroot.net/results/a8ef5f36edb90c43564071561350390f03812523 |     
   mipsel    |          boinc-7.16.5          | NOK | http://autobuild.buildroot.net/results/2c122d412993c2ead3300597d9870753a5aca4bf |     
  aarch64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/65fa719e8b2466409a12eb103a8938e1488efc0c |     
powerpc64le  |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ef37a0cc16daacb7206d736c86b511c7d90eefe0 |     
   mipsel    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/a60579dae9a0b946e43d0e02d97156f51f63de09 |     
 powerpc64   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/8c472cace42fa76d1e8c3f31d26fcf7c06722dfb |     
microblazeel |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/2284627eb48c3547bb7623d289be37076b43ec71 |     
    i686     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ee661546ff66a95da114d246544ef4e95cbca679 |     
    m68k     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/17dd7a8fb9d99997ac2a210211b4aca2e67fa541 | ORPH
    arm      |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/46d5ec514cd7d989b9eb9a8649a82b036f1b9578 |     
   mipsel    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/2ca7ebc25b46863338b8af76fa4c7816f19bdd4f |     
   mipsel    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/09f43a8aa8048d019af699eda805759340617017 | ORPH
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1bad39db82e65cea7f75fbf2fff5b2f3b1aeaf7a |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1bb64c975e570a49de21422f864cd33b01aee05f |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e2c3b9d9b5655fa089371fadd97c559804355bee |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/0d8ff12fc8f46738b2899c461d0a9bf4d3438562 |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/20aafe6bcbbefaf4b60f3a33ef9568c5ddd5c1d9 |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/15295f6684e6e0763f8ddca67f787043af6d7e40 |     
  riscv64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/f0ea19f66f9444121cfa4efb0feb7f28f48822d2 | ORPH
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/f0333ca03148884af006bebeb1b2a3facc71e5fc | ORPH
  powerpc    |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/2d2a1c9a1028d2a611ab0825c1b032084fa69351 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/1d5d77370b3237ea441e9f4b359d795dcf36d54c |     
    arm      |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/83c7295f901d917ea9c0dea6555d5362d936f854 |     
powerpc64le  |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/fd32c55e34a0bd1f9fc8fe64846d0cbb86f9de51 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/56aab9ed4de538076dea80b0dd714b51921e1d31 |     
  mips64el   |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/a9269808ae4919a0835ca86d595d46594042f7f8 |     
    arc      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/440a5d06de63f55b971be5f045c393dacb7dd411 |     
    or1k     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/77e99c5006fd0d6852dc34ed6afc42419664bfb1 |     
   x86_64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/74d3d1a7e11619298c7f55258e2b069ad7e76ba4 |     
  aarch64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/5d28a1da76d05592f84cfe4350029368133b1220 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/0e4d22726bffd687db466d2e8480484b8e2f01c9 |     
  riscv64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/542093f399d3681b9defb24135946cd23a92ead8 |     
    arc      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/971f656e6e4eff88949e924b0f6a6c176338d42f |     
   mipsel    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/996c8861c64e7fc0e50a7c419a43f2db0bac4164 |     
   nios2     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/b1f9a0cbf119367dde41ad33e6c5305e1c32db9e |     
  riscv64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/6259cd57350545a12b1afbaf349a44db5764fe05 |     
  riscv64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/4869ce0cb2d08f854fc6aafd3295f0aa364d33d3 |     
  mips64el   |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/ea03700c6430dc7741d5cb2fc5276bdbcf91ec90 |     
 powerpc64   |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/5f85757e0f3d9763913ef78749c0841953c91894 |     
  aarch64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/4cfd8a8d7a2c4e13220655b5aa3936e81d31f49c |     
    mips     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/ebdd1280772bb8b15a921ba1c35e56b2fd9bd724 |     
  riscv32    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/63be1cba0c702bfb8cc414f3b795e9e2e0d3d106 |     
   mipsel    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/738b0b41fc10c2f983a801e8940ee34afdf1a317 |     
    arc      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/7b6528230c6be106e78f7a4cfbdeed06f4cdf9fe |     
  powerpc    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/adb2216ab7ee64f20ac74ae9c5a1852af518c0d4 |     
 aarch64_be  |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/29d88d17c6b77233c4121172e356a8d077b1d56c |     
  sparc64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/528d0ae4fb9bfa825b693e5337431dc7d1f21c49 |     
    mips     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/0268d1588851e87a3307988581ad592d43e82da4 |     
 powerpc64   |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/d6a2763da3eb6349998b69e50fcefccf004fb9fb |     
  mips64el   |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/5a0a68fc82fc98d70bc89d7ac3565db2713bd8f1 |     
   mipsel    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/85d5d0dce5973e8884c319f0fab857c756a9a379 |     
   x86_64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/d7c27007424ac8b9f7044f69a43ec9af65156d58 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/d06dfbc56d7b71bc9bc3a09816d2d083ff1ba6c4 |     
    sh4      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/08ffae3a041a57633416381b5aabcd8a7d5bd3ed |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/d837a89fce67f6426fa9819ead2f2cc0ab5f8174 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/ef1f78c05cec2b5bb10ab0211c4735c1f7c665ab |     
   sparc     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/aa673e18c8fd4b63a1af479561cb321dd8274ce6 |     
    i586     |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/f152342533f97f6bd6795e3ea81043923fe5946f |     
   xtensa    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/16267aae4c376825437ab63f7a719e1d4d8053ae |     
    arc      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/9015151a141dc833c532471cd626b64a0fe37c8b |     
   xtensa    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/871c7812293a63e551673474ef8548e194a8cae3 |     
   x86_64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/524aaff166f21290d45e7b049b0e6ec9fd54a97d |     
 aarch64_be  |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/2f0f4c001121a9868b9591647b7d092ab372a369 |     
  powerpc    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/b7f4f962feb05435ce1a4a90a4cd3d856dd36195 |     
   x86_64    |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/114c0ac4c7b090308ff3c74332e8ce9d96f46230 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4b3f2308a757b595353117e67825ebfc90e488da |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/b9e5749fa26534259a437f9137f5154602421434 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8aa5ec4db09955e46f71ac42eed21226a11c1158 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/c399cc9c82c7da8cb94de34826ac6c211f8b3125 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/75e9872d3455f492de47c19d48a46fbc6738430c |     
    m68k     |         libuwsc-3.3.4          | NOK | http://autobuild.buildroot.net/results/4b71896ac1d2b75e52daf95b4e4ca371f9527688 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/79f89afae7fc70d1fdc7c5db3905681b640e36e3 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ba68288f73d14b11e27e9e9a0b23949b70f23604 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/254014c0d60549de76343d3e586459c98dcfd792 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/8b8923a4d5225bef56cca17b283dfce473569d99 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9b33a60b7446f016be5f6b7139f30c172464c104 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/12259480eb24d12781ccef2a6c1664ea2b4f6baa | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d094dc89b9541b3b7a144074074f704cee4ea777 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/ce827314483cf2bdd4417afe673d8df271067934 |     
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/51004a25b39c1ee824ac70f9b4d444f5271a9abf |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/7ba999f8d66cd7d997fc6fa157596f6e8b275c6e | ORPH
  aarch64    | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/8ede89a673f83896745f90fd51458cac5fe7bb8f |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/8b5d0a807a4d11f335737cbbc26b2c84b6d90e4f |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5c4a04053b82d6cab435e8da2c35cf211e83500b |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b6f16c239ada144614a44663a7d5fdcb5998b85d |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/93446dcb2d5dc8e4ec354f09ddac228d6686d533 |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2b6b127bd0ad60870b0733eefc3567aa3c30295d |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/9e1a5132d71239a596dafa97fd71aff6fdc10d0c |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f1141cb578793e29bca900cca2589b0c61c9fc44 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/1d8131c6e82f4dc5fae8730e708d9d019e82b5ee |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/a489de4d0e5f169629076696247b1e2f9f662651 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/93dbc7ff1b596b6ae4ab2ce766ddedcca011154a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cae10bad505a41da68d59f0738679d47367e9cd0 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/9bffb0bd365476002e6a56fbc1e4edb81ec21300 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/9f691204edeaece48e78c7ec359b0262b44fb5c3 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/dc3db29fe31c98400a79333fb00f2c59f3bb421a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/9778147c4c568967b6e676e29f68c86119aead0e |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/802592f97253e2ca84db2e558107de22226005e8 | ORPH
microblazeel |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/da5f0575e5206c593fff0b6ee57c0ca5cfb2a8be |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.0.10 | 1 
                nodejs-12.16.1 | 1 
                qt5base-5.12.5 | 1 
                    strace-5.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b147bcc6a9e8bc4c6ca16b7c88cf609696335e99 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/7eeb2b0bc6be72a7371c9e820fb8e41e0943e92e |     
   mipsel    |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/4fea978d1bacf3ff3804b2ea2a37495c062bc86b |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/34973121364dd5faf6e7701b3ef48aac4a76cda0 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/78f4df1348a77e773ec1ab73d2a16225877d7618 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 haproxy-2.1.2 | 1 
           host-nodejs-12.16.1 | 1 
               libglib2-2.62.4 | 1 
                libxslt-1.1.34 | 1 
                 opencv3-3.4.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/05f28d39669a982f35a1f4bf039495718d09b204 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/ca234733014701419c50b4c69ee40218ae93f78e |     
microblazeel |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/3d34fb58bbb7c08a2fb725da9f6a91c2b2a0f00d |     
    arm      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/866459f086be6323fc46aea5369cad957fd8e8d4 |     
  powerpc    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/4f319253ce7a8fdafd7dcaf04aee6913c33e2a83 |     



-- 
http://autobuild.buildroot.net
