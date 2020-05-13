From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 May 2020 06:27:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-12
Message-ID: <20200513062758.BAF0E88659@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-12
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  5  |  1  | 24  |
    master   | 200 | 85  |  1  | 286 |
     next    | 15  | 15  |  0  | 30  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    atk-2.33.3 | 8 
              host-grpc-1.25.0 | 5 
              ibm-sw-tpm2-1563 | 5 
                qt5base-5.14.2 | 4 
               apcupsd-3.14.14 | 3 
                 gnutls-3.6.13 | 3 
              gr-osmosdr-0.2.0 | 3 
                   gssdp-1.2.2 | 3 
              host-erlang-22.2 | 3 
             host-gnupg-1.4.23 | 3 
              bitcoin-0.19.0.1 | 2 
                  dnsmasq-2.81 | 2 
              exfatprogs-1.0.2 | 2 
             gstreamer1-1.16.2 | 2 
              host-audit-2.8.5 | 2 
           host-openocd-0.10.0 | 2 
                 mesa3d-20.0.6 | 2 
                  ndisc6-1.0.4 | 2 
              spandsp-20180108 | 2 
                      tio-1.32 | 2 
                  zeromq-4.3.2 | 2 
                  assimp-5.0.1 | 1 
               asterisk-16.6.2 | 1 
                     belle-sip | 1 
                   cegui-0-8-7 | 1 
                coreutils-8.32 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.6 | 1 
                 dmalloc-5.5.2 | 1 
                      fio-3.19 | 1 
 glslsandbox-player-2019.08.23 | 1 
                host-go-1.13.8 | 1 
           host-nodejs-12.16.1 | 1 
                   libnss-3.52 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
              qt5script-5.14.2 | 1 
                 rocksdb-6.6.4 | 1 
                    rtty-7.1.3 | 1 
                  rygel-0.38.3 | 1 
                  stella-6.1.2 | 1 
                suricata-4.1.8 | 1 
                thermald-1.9.1 | 1 
                       unknown | 1 
                    vlc-3.0.10 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5a513669b0e56f38418e42d9ae733554fe6c73f1 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/bb96f327d5343a3561ea978f480585b418ce52e1 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/44663f1bbf7d38ad3a10905c6dec175e9ec7d884 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5712ec85f340e347c25cc101ee4792d038060193 |     
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/17b6bc917a72f92d2fb66c29b761abecf0303456 |     
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/e87d0e86b7298fb539fc6bc9239bb8dd9d2908ff | ORPH
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/d05c2fa08d4783b981686c1b628aa18382b7fc3c | ORPH
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/8ab1f0969da2a5698627fb1aab4b630cf83dd0d5 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/5d3eeb7ac321311e23d8e3b00282eedd7250da7a | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/449c10a55944f116d30e06c6c815186c7ba67084 | ORPH
   nios2     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/f5b25743da0de6f45c5bc1efb0a716351dc51019 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/0afe39465be636ea2185895ef013861a06a330cc | ORPH
   nios2     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/5774632b3558c914bf6c013723e470c883b01707 | ORPH
   xtensa    |           belle-sip            | TIM | http://autobuild.buildroot.net/results/5c02cee6c26e7708800a7286faa7881043073ade |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/d5586370af7d1bfdd3db64b98ceaeab1d40fb337 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/dd22991e7ff836642f09a3c7b368c72b24a716d5 |     
  mips64el   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ce6e375cc3a25cf38077e44f3925ebfccb236e17 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/199b09da86464ae7f3916670e4d4e1985e1642ce | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/08a57036026442c03456cf8faf25d77e6a46f5f6 | ORPH
    arm      |           daq-2.0.6            | NOK | http://autobuild.buildroot.net/results/49d59bf3f8a610b47ded3df1c0c1a2e17b3dbab7 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/6587108e60b1d46addff8b36a34c307340d159e8 | ORPH
    sh4      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/7054aa3d742ee24d4bda7c5e3cc73cb231216ee0 |     
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/2e46b672afbc438302dafbf70909353a8ffec250 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2d979543923639ecec252dcee10d62d027b04912 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/0362e3f169d7efdd319ff3dfc71d6e181d9bc64c |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/08a90762faa1889b629b4f4d3d8ab41e05fec5c4 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/e8b634dc508692678392e407d4063cc2822f2d37 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/c519513559e9ebe1d56584ce9aa818aef5f039eb |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/71b51129b93ca3f1ad198c567734d32e92abe983 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/b42dc97d97ed5965b02c5ea048096fc22edadcf0 |     
    i686     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/0c3074a3d0610c3440a91c760db05855d2539c82 |     
  riscv64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/2e89b2bc200029107544835b2f99fcba7a23c9d3 |     
  mips64el   |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/62a8f11a76382aed70b4b2e2d9c36dca276e0d33 |     
 powerpc64   |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/5b43e8f2e30dc208f5fb6190383f2a01c0565042 |     
  aarch64    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/b362eb08f1cc2ad781caff77738bf3dab99470aa |     
  aarch64    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/3f3bf4645027e1019d42f134442b216d1634f209 |     
   nios2     |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/a4eb49c76b440ea24d0cfa7b3bb7d034c959cc86 |     
    arm      |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/a37d37fe360a9d046f57858bac96dfcdfae948aa |     
    arm      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/018331014d1f76c870d9467522354cbbc5d5b6d7 |     
  mips64el   |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/bff4ab8f88e0d016067874fbfdd17b6dc1bd2847 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e00b3eaee04aa365ebe4004708b0258e0f0ff378 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/62bac7828e9dcc6cf86af5f9779a4f2d6cd36e0a |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/055801415a82799fd1c954bd82c2453766b5a339 |     
    m68k     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/5fe8568dd9da3cff0dbeb5c481d892852db9983c | ORPH
    m68k     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/a8bfd9f55190a7e64ae1c90ed374f272b87d3c76 | ORPH
  powerpc    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/d01e918ffde75e94b854192d3aeeb8d5dd251d65 | ORPH
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/d90e887b508ac146cc23eff625dae5265ddd5e40 |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3c1b1aaa41163abf5d06c7cc370701bacd7daab9 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/86ee7aee9c1246a235ffeb4b63374852b3437a0b |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e97f89d2ed626e6c01312aef0b6932fe71556d5d |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/18ea24745d2fcfd75896287e8beb649d3ce89da8 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bb35124fe972797fc00c9f2956c86bacf75fa6c8 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/8d42227df0b7f16aee0bd5e7405c491e8e91ea1a |     
  mips64el   |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/549070fbc447cd8d7fca57ad73252a4dad3cffe7 | ORPH
   sparc     |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/1c636edc8c3718cb031d0ca48a70cb9dd34ee468 | ORPH
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/952313c2a5413ec4e639fed102e56dedddd7d2b9 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a390810f7e454b12057db404d96e58b961ec1604 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a5f3a7797f8efea90594354e9abca4c1fc27feb4 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fd049481920cb3991de3df700673498ee54f85f1 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a3ca726dcbbaa576b96e38c0a8cf05f757ef76b7 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/1baa096ea884759a448a84eac15b05c587a6851a |     
powerpc64le  |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/d4039505dedcf9b919ca43fefec1d7efa00ff232 |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/7466848ca309f74096329edc027daa457220ce5e |     
    arc      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/74f3d694f57f5f549855495edbd08e9629077999 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e3b8a67277361f44237df1130acb7dd53393d07c | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3617c0f26fc96ea00161a7dec88293ac5eaca15b | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/245f6b39019c5aa1b0cc893fb1953282d7314bb0 |     
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/f77dab9a6f7164ec472244c5b3b06bb79f4850be |     
  powerpc    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/698dc3d59d367cb98f3a1e9adc8b60ca85572481 |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/738faa75fa7b4d57ab4faa1e5b8892955fe361e3 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/49dab9fdf3cb642358204a695c3bc8cf5ccff604 |     
    arm      |        qt5script-5.14.2        | NOK | http://autobuild.buildroot.net/results/eb0167f958d79263c5875a7773b5e87d88b247fc |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/31aa4dc349a3f6a28c68969c1846ca6998b97d07 |     
    arm      |           rtty-7.1.3           | NOK | http://autobuild.buildroot.net/results/3f8e0d89b24a5e70e1d5e627d26780e0954b8ea4 |     
    sh4      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/54c799ba4376ebf5fa402d4ef0f4ff6735ffd600 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/5fa588e91994701e3ab5ad3a346c76e691ac96bc |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/8ed754875decb291f0ddba25aa73f031c2ab3ac7 |     
  mips64el   |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/5e26590de128691f9ac96b321f32b82f0d471f9b |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/96e24fab2a96a341708fa475b2f808e61fac7f83 |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/095d0b85bfea631bc4a0edc933e38b3ef5d6b046 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/ff3f19e10f44d487b3dfdf84c847750db71455f7 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c908fc130e9f34942dc29c8c968a9773389127fc |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c992a68df034392f1a7d99e5d1c33b0e47b3f2b9 |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/eded519b32e54f81e4ec7d0c63e24a04fe6ea082 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e03bf8118b5a612a03c0091c3365f5c58ea206e4 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c0dd597a37ad9c231c73d14bf34cbd14a2b43cc0 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              python-pyqt5-5.7 | 2 
               host-efl-1.22.3 | 1 
           host-openocd-0.10.0 | 1 
                       libuecc | 1 
                suricata-4.1.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/cc09b6b74ee5a80d42c88151af48f6bf090bf7cd |     
  mips64el   |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/1359818431ae3fd73edf8849762a37cef9cbe815 | ORPH
   x86_64    |            libuecc             | TIM | http://autobuild.buildroot.net/results/d56ada663e73669a0b4cdb1dbe3b4e5039ad1edb |     
   nios2     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/2c1a565bf7fe05c238ef5ba05aae571a966966d6 |     
  aarch64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/f3d6c5ee72e143f3d067bf4e86dc18fbad6b3eda |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/a8830a4984ffd1aa52006e2ad7fbc739828b88f5 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          gstreamer1-mm-1.10.0 | 2 
               apcupsd-3.14.14 | 1 
              exfatprogs-1.0.2 | 1 
             gstreamer1-1.16.2 | 1 
             host-gnupg-1.4.23 | 1 
              host-grpc-1.25.0 | 1 
           host-openocd-0.10.0 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
     python-argon2-cffi-19.2.0 | 1 
                 rocksdb-6.6.4 | 1 
                suricata-4.1.8 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4ded8680a08c0ec88817a02ca82272b0e8d74511 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/9995577bfe8210f4f56be9a3ace7ae42f2220e88 |     
  riscv64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/867687f32b7e3f4b5d821e5f62682d44f793b10e |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/363db8f8853d5312565886dcb9760bf6aa704e57 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/54c749d33b50835d0aec65a74f823253a8d1734e |     
microblazeel |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/08e345fb7bf70732bb778c2c1e676edd59d8a97c | ORPH
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c9041167d810e5c9f4dd65a0ea83a622218fdd68 |     
  riscv32    |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/7ae22247788a674b0a232e29bca19a29363eb3b2 | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1afad77633e74863413b2b15414413387efbc08a |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/653694c64a91b6549213cbbacbb3b07fd8f5bdcd |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/dbd36ea0a7a26caffd1a90a3cd8859931ea37c86 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/af565d46136464a1789358c8cc74cb0718951587 |     
    arm      |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/6913915a91273079295895b1b8387abdd55d699d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5977eb0538e6f40f96710544ef3c2e0d5072b81a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b0c7294c7eda22773944e9ad32c32256a176a12c |     



-- 
http://autobuild.buildroot.net
