From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 04 Feb 2020 07:19:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-03
Message-ID: <20200204071921.3A9EF2050F@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-03
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  0  |  0  | 21  |
  2019.11.x  | 18  |  2  |  0  | 20  |
    master   | 95  | 136 |  0  | 231 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-ninja-1.10.0 | 35
                   mutt-1.13.3 | 13
                    mpv-0.29.1 | 10
                    parted-3.3 | 7 
                    brltty-6.0 | 5 
                  jack2-1.9.12 | 5 
                 mesa3d-19.3.3 | 5 
                 opencv3-3.4.9 | 5 
                   aubio-0.4.9 | 4 
          imagemagick-7.0.8-59 | 4 
                       unknown | 4 
                apr-util-1.6.1 | 3 
           host-doxygen-1.8.17 | 3 
                    norm-1.5.8 | 3 
                      bash-5.0 | 2 
              host-grpc-1.25.0 | 2 
               libupnpp-0.17.2 | 2 
                 mono-6.8.0.96 | 2 
               protobuf-3.11.0 | 2 
                 samba4-4.11.6 | 2 
toolchain-external-codesour... | 2 
           uboot-tools-2020.01 | 2 
               acpica-20191018 | 1 
              bitcoin-0.19.0.1 | 1 
                  cc-tool-0.26 | 1 
              fluidsynth-2.1.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.0.10 | 1 
                host-go-1.13.7 | 1 
           host-nodejs-12.14.1 | 1 
             host-pango-1.44.6 | 1 
    host-python-cython-0.29.14 | 1 
          libmodsecurity-3.0.4 | 1 
                 libnss-3.49.2 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/26b5e9d1de79b50a3816e563abcd194de8c7b643 |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/c64e9294eae4d0b71ad7d91e83d8ac6e3b629c32 |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/eb3511629c1781959eedc213a4234fc8e9e6828d |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/cb3cbd23f4f702dba804ffacc1c2ad1fe5e08329 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/712150342d941e89bc8ef8dd7d86bfa49abf4114 |     
    i586     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3e1d45aae068dd65ed154ae24c80dc16dc57d482 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b08a3f9cceff0ff0046ee6266739b210b79f246b |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9f48a2300961b208e5af15cc26fce3bfcb3efba8 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/88c7f1782faba154e19cf59d8c23e41de3e7eb70 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/5c76fc07f4ab5748d13b1151009ba95b69c68a09 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a879e2bce942acb998f3f34b62fcffbf64bab1c3 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fa7219b98d3194788d581e4e8dac21c2dc27539b |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d1bee5a0d9e5c5a5e1feb98015945abf922d89f7 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/42863c324a512ef19b930c6bd31553414ed1771e |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/cf0e0a49211e068c029fb1a7d72d45d873138abc |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2a68df1b08cb6b3d27ab9be851e3de3250a502f3 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/e964e7e28d9176a1b65168318bb0fe6d31373729 |     
    arm      |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/f51bbf4e460a7b38b735c555ae4ec76e6b90659c |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/c1e6bea9ec545f51197cc01c3ccf431ef5dfdf72 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/cdfa895f16a3a3b3e273d49de6b846788f997cfc |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/3828198d4ea589f2b0c57cce0089b2e069d26640 |     
   xtensa    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/35526fbe8718f5611832fc47985a7576a9cadd7b |     
    arm      |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/d6e68b8766b7d8bb53c231ad9920377f442d8ac6 |     
    mips     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/05a1a951a628b8b4169446d95a2593cdaf9cce55 |     
  mips64el   |         host-go-1.13.7         | NOK | http://autobuild.buildroot.net/results/4df7a12ff8d1dc532704712880e908518a583b8f |     
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/de3fec961acf2f30f8c5bb0f02931d87e42dcd3c |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bbeb4b77778bfd1cfa38d0cce37e807567edd3db |     
  aarch64    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/6b248bfcf975ab12a7af810175bde04c91b4048e |     
microblazeel |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/0407fcf5aa2f7b64c07d6307998138c068664128 |     
   xtensa    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/97fc39bee0e1960fed01ddb602d753fb904b9262 |     
   nios2     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/61fa63c123364ac422385b1038e815a0c619e0e6 |     
  mips64el   |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/c9fc2a7601ffb8e8724c399b5f20ce7db457d39c |     
   mipsel    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/50408962739302a95b5cf7245be32330482f73e5 |     
    arc      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/89717cd2997fe9960dcccc84304508423c4c37de |     
   sparc     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/ea1c5777506ddeb6400f1e931a7dca14a6e0577f |     
   mipsel    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/737f11b521d7c7ac197e7a0cd3dfe70bcf03fa7e |     
   x86_64    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/96ddfe5abc19da334cb1a44f5374f279da6a8de0 |     
  aarch64    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/52f4d511fe8bea5b7e9c32f636f65c121323eab5 |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/c53d1b723f80b7cf2c9b00b0f4fd67b60eb4b716 |     
   sparc     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/311728b565d12d1656c99d8838d2f2742b5bd3ef |     
   mipsel    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/12119f1a605a488ce24ec4f0e64adceacd728fb8 |     
  powerpc    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/d270d38b91ae2ca6a54fb92a5eb6a5afe87eaa66 |     
  mips64el   |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/87ff2fa69763f0638895adde7ae763889c5e4940 |     
   mipsel    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/a1db82a2dd110f653b9e62fbaf236613e14b1c4e |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/0e25f148c211f6269a511e99d4c56516ff499010 |     
microblazeel |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/8d42b01804512f1e0fc9f5aba8803b8262bd8a91 |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/bb21b3837f6844e4479a7133621b66c819f8a24a |     
   mipsel    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/6e36190ba4cdf6a24270358d22a60d74efd3ffc3 |     
   x86_64    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/992b34c5625ec733d8dce678aa7a7540c4768ca1 |     
   nios2     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/34aac92782671450cfbe4f58523cb8689e7174b3 |     
  mips64el   |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/82d741ceb3bf781ef4cb25dcb515bc36722ce001 |     
   sparc     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/d76fb3b6685bac6c05cb3395335dbc800f51c8bb |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/dc60db6864623739d2f067a0bb84e8a6bde9dd4a |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/48746d69ec872f58d8327b18d9beb27adcd28a06 |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/6594a74e8d1c8a35828353bd4079c24f10751a09 |     
  mips64el   |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/6150430d396b74a81be87d942ca571c7c15dfc52 |     
  mips64el   |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/f0605a2092dd9bcce61d63914e90ddf25819f9e8 |     
  aarch64    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/390dad9da6056e85abd5af528a2776665fbd0310 |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/13c7bfe3450a0e1c97fc6fe6ee51fb6934bde49c |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/e5a02faa75345009e7cdcbf9d693199bee4741aa |     
    sh4      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/b4d187b9497734f5e16fc0b39e8141b4dbf7662b |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/f1c172e9a5d76067c212b91f6e7586957baf0c00 |     
  aarch64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/b4e8e365b62042dc7e6222e5d2bff708048ce6a0 |     
   mipsel    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/c7a464116ff88b9da17e0f3e32bca193e6876ae0 | ORPH
  powerpc    |   host-python-cython-0.29.14   | NOK | http://autobuild.buildroot.net/results/399bec35ad6b29f1fef06484447db7f99f7cb7bc |     
 powerpc64   |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/81a3633758a02ea21b20794522d27f8cdbdae01c | ORPH
   x86_64    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/fb0137bdaad50512ff5c049e27e89513a7f044b4 | ORPH
   sparc     |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/135d15dba43deffcf18ab0ff60a3dc28bc3ddb54 | ORPH
   mipsel    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/7e823ea5a4d29ca347f6469fefda53708326e207 | ORPH
  mips64el   |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/5a3fc794d8594f59d81af874fd629cb706995717 |     
    i686     |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/cd5da8cb3da8479ebee60d011ce0c5dc0e59aab7 |     
    arm      |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/080693ca29c680029190583d425de511d7e153fb |     
    arm      |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/3e143ca325aa18f6a42b6d821f3c27dc34a3e753 |     
  sparc64    |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/637b5e3d19fd9d31519954003cd420ea06b44f75 |     
    arm      |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/f4d7b784ff14cb416ed24e29afda4f6f89a1fd51 |     
  powerpc    |         libnss-3.49.2          | NOK | http://autobuild.buildroot.net/results/fb9e18f96e569d32e0bf7883dfbf2a7f72b7ee29 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/bff1e3f044c35243c07e3b257c6166f09cf23297 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/17484e7b3d01948ab05d79f1e77a6830b93b48d8 |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/f7fbb949c05588d6f465cfac90d53bbabf0fb560 |     
  powerpc    |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/97f1e8734b533fa551d1abf78a175800949b27ad |     
  aarch64    |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/ab22f52f7c274bd514af48bf3eb662347825e10f |     
  mips64el   |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/e46d91e56dce97f5ea99ae4de116afd664871896 |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/57f14298a6809778b072888d5a6839577b642b70 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/ca034b5c39746fd37924430d3bee7153db1a0f0f |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/17b2ecaf11d50cd04f1674ccebf72d9a76cd8cae |     
   sparc     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/cc88c08c86fe83b29277acfd5f82e104b129b002 |     
   x86_64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/edff0fe615222914e2643deb571f37d7af7dcf96 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e8728ff2b833438751d59651ee9832dc1ceb3342 |     
 powerpc64   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2b377bcfda6e7ae4d6bb894664e3a4cb13a70b6d |     
powerpc64le  |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/24bc64c52bf48b813041ecbc5bbc22bd93093b8f |     
   x86_64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6ad4a6be3b7c7fec60eba44a3269e48fd319fe82 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7515dc1afc33824239499abd4ff922175ac8ee32 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/dd7015829f6d7e2c8cdd0f8006dac22049bf5abd |     
    sh4      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/79ab3aa98af20c35a38bc7b94e004d76337eb030 |     
   x86_64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/33bb7a719733505d1fe5bbd15d0b7f7e729c2cb6 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/d21e6e6a45ba69b6c1813d2e6177e19a29085d28 |     
    sh4      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8eec973bcb674b3fb2a843d7685b7e796f4c617e |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/36e78a78776b012edeb716e0ee871506d75591d1 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/f00c4bdd71f967984587fc9d8ef306dc268d8102 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/80ebf8bcb095f24e415c48f0bc78b997a0325516 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/354fd5334a9eb5dcb0b9064d22af45280fe921a3 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8a09b4b508df02a9d32d56bdd3264e276d74fcd7 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/d99e9218ce4077419b545dbdcc88775963cf8fe7 |     
    i686     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/481d9dadb45662f453d520fd524084777bb7677d |     
microblazeel |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/5fe923ed7a53d5ec5675741a66532b06d07ab989 |     
   sparc     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/eb3567daecedacca1814d959b8f7ad722ebb3625 |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/d502e97d627f9a129be25d7a6297690aac452f4d |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8ad9c074ab899ef5e652fe15427e922d497309a8 |     
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/991c6eb22362542422d48846ec1d43fea2686900 | ORPH
  riscv32    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b0d0963a9f012c59ae7ef4aeaad597700156ad47 | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b17da277b5b2cae358251f9d1c4184c7088719b8 | ORPH
   nios2     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/ae5d4a34f31165f94243aef3c658766e999e249a |     
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/5a55d6ffa95f28cb944b90c59b537815131bc892 |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/6428e59cde33caf4587abb9bf63fe660a0c4c839 |     
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/4cdc802ffcbcc8cb7f8c82a1e04203d83d9288f2 |     
   x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/0abe7e65efbf46236054c997cf334de7cbb7f16c |     
    or1k     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/c9cbca04ebc25f90b0929f8bcaa9199d797b0ae5 |     
    i686     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/06c373c93a63192f55bb3112df30313b2f54ac7a |     
  mips64el   |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/a9bb36a84ab194cb8525701a2d255a72d9e1f9f4 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/4993cbdf46ad330e7d9fbe0ab7645ae14c8f1ffb |     
    i686     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/4de429d0fb46246cc1ecb35c46169c105bfa2b26 |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/52638fce9ef1010844bcfa0aae547bf3f1b6c831 |     
  mips64el   |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/67c1a1bd39ac649c5444fa4d076cf1c405453582 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/e4e1dec53940f2c0f3e24cfd96604d9791084df1 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/3f8989c2ca8bd0296fa26d140b305d88ea66367f |     
   x86_64    |         samba4-4.11.6          | NOK | http://autobuild.buildroot.net/results/9d8a3547c0834b00642e7c1704755c9f94765a90 |     
   xtensa    |         samba4-4.11.6          | NOK | http://autobuild.buildroot.net/results/2c9bac7836ebad05e9b0299b9b8cb2a5f93de514 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0aa70602471725aadd304d2ff2d716d33958de9a | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/11c839d8a8c8a19c22a2faa06838bfbe7fea11e0 | ORPH
microblazeel |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/c976ed5eb7760cba192d22b3f1e7460596fd82dd |     
  aarch64    |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/9babd5bcdfb3f8ddef943f6c045d840cbece96dd |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2889a6a450521482e6dd524bf29261a684b5c24c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ce1356d5fd9288b2744a8560e953e2d5651edae6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5d8fda7c488a03c14942d87467d501acd633d24a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b93644019684958984692ae7de23e475fcc61ac2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e1c552874d2aedc452258f94dd7a44ca3c41a14c |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                     vlc-3.0.8 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/8243bd9a4657aa1bc8d5d77666d465ff04a2572f |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/9d9969c69a3d6cf9bb152480b3d156981012563f |     



-- 
http://autobuild.buildroot.net
