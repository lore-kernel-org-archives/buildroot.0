From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Feb 2020 07:16:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-13
Message-ID: <20200214071628.C15A28817D@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 20  |  0  |  2  | 22  |
  2019.11.x  | 16  |  7  |  0  | 23  |
    master   | 120 | 85  | 20  | 225 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

host-sdbusplus-4212292bcf13... | 11
                   erlang-22.2 | 10
                  host-ncurses | 8 
                         libnl | 8 
                      bash-5.0 | 4 
                    brltty-6.0 | 4 
              host-grpc-1.25.0 | 4 
                    parted-3.3 | 4 
        host-gutenprint-5.2.14 | 3 
               libglib2-2.62.4 | 3 
                   libnss-3.50 | 3 
               protobuf-3.11.0 | 3 
                 rocksdb-6.6.4 | 3 
                apr-util-1.6.1 | 2 
                  cc-tool-0.26 | 2 
                        gflags | 2 
                 mesa3d-19.3.3 | 2 
                   mimic-1.1.0 | 2 
                       unknown | 2 
                     vlc-3.0.8 | 2 
                 augeas-1.12.0 | 1 
                  cairo-1.16.0 | 1 
               fail2ban-0.11.1 | 1 
                   flatbuffers | 1 
                  gensio-1.4.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
           host-doxygen-1.8.17 | 1 
            host-systemd-244.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
             libopenssl-1.1.1d | 1 
               libtheora-1.1.1 | 1 
make: *** wait: No child pr... | 1 
                 mono-6.8.0.96 | 1 
                   mpd-0.21.19 | 1 
                    mpv-0.29.1 | 1 
                oprofile-1.3.0 | 1 
         python-psycopg2-2.8.4 | 1 
                 ripgrep-0.8.1 | 1 
                suricata-4.1.5 | 1 
                      tio-1.32 | 1 
toolchain-external-codesour... | 1 
                          vpnc | 1 
               waylandpp-0.2.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/dbbad28aa42fd298ae11faab56d479567516d6c4 |     
   nios2     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/d649a6b796e98b80ef6b419ef930c5ac34bf3599 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/22ec2a8a87a320ba1bdff194810ef43278751ac5 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/12ff6bd9d191c760de03c4d7f9d61321dec2515b | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/83328c7a088d99d3292c067cfbf4c07f0f7ced8c | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/7896cc79fe976fd95b0cea69bb01f938ded57f0c | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/7ab2c2824cb8f4c7d76599ac875868f9881754ca | ORPH
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1a4c26dc26eaccc3f22009860d0826816d736283 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7eb60a319c8b126448733073eaf941193112b45d |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/31d70fc48527b5619bc6d7a1101544324cbb8bfb |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/619f0a4a85264ab73d790cafadbc897b032bfdc5 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/06c75e5102b7d67f9d198e7a72c936b5461256ac |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/ee06462cc4e88d6bd5cacc72b6f6210dcf99a2c1 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/2c24a6ea743b6881f69336b6dd8a689e2aee52f8 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/3755781b08b58a5d42e57675347f507160ceca2e |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/b8d34e231cc2fe4e1f134990b9a4f1d191c89ca8 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/d706d03a9fa2bfbe22fa4e6ab20442a8c4a6b390 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/ab402fc422c11e6b372d19ebdbf558f115c808c8 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/06103bd13ac99da9867d0a5b44a1c9c82befb808 |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/159e30446c60393a89a2302b9f008ee192683776 |     
   mipsel    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/2a70bc4ee11ee009a6d7e869c3abc84e7637c9fe |     
   mipsel    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/058de1a59ccd7f230a7b921daa9db64953328102 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/fb8c1bcca982fb4747092f3c4b4ec96898449a17 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/349ea161b6d5cbe75e388f7dd40dc90d3641880c |     
  mips64el   |        fail2ban-0.11.1         | NOK | http://autobuild.buildroot.net/results/e688c3652bd474ac682984e2e5947701942f0f57 |     
   xtensa    |          flatbuffers           | TIM | http://autobuild.buildroot.net/results/b96a3558f9e44274542a5d011a0e620a4025a016 |     
    arm      |          gensio-1.4.1          | NOK | http://autobuild.buildroot.net/results/9966967b8f50a3fbca437357d34d967b2a15e024 |     
  aarch64    |             gflags             | TIM | http://autobuild.buildroot.net/results/9760e3abb4ae76a8d028fa6621f35760876acb79 |     
powerpc64le  |             gflags             | TIM | http://autobuild.buildroot.net/results/abb4703e39330dbf367baa7379f4d260597e1e89 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/db9831fa30b1f2722bb586682b494abb5baab166 |     
microblazeel |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/e65a0a6f80e4114b445fd5c714f7a9791d3ea094 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/118ba25eeb5ff0d15acf863111d668b74d2c29c7 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/eae065a18836e1ae1b60f0916583bb68c31a544e |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e6631347a3c250c7467d0c600c769adb5e7219f3 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f942d898140849d4cc9a9845626e25d170e1c6cd |     
  mips64el   |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/ae7ff4c94a07d574948e18ce1145d211ddd9aa96 | ORPH
   x86_64    |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/b7f624b100711d120bfaf1e8ae14c7eb92ef1f49 | ORPH
  aarch64    |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/6555c1a074037357a1bc29b856955da49ce71d58 | ORPH
    i586     |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/6d749e9b5f1d3d5dca375507dbd6e1a4f0749fce |     
  aarch64    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/3c59ffb6a1c6a368843780859799b1f0fd694197 |     
microblazeel |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/e1f9d787bfe3d719650fd6d92bf2e9c586b4ab49 |     
  powerpc    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/51e7752553f8817f779e2f4cb1650ce15ecbd56d |     
 aarch64_be  |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/df99de0c3bf6a52ec244c7b9246bbe0bb4e83054 |     
   mipsel    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/45cf0e1875517a1791059eac552adaa811665638 |     
   nios2     |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/4dfc884b3a7b6d41be1e3da06cc003afcf765cf4 |     
  powerpc    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/c60bedce86156b7d39f7fb2bc8488494a46f6294 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/dd28a649eb3dc2ce54c62365b34e87b63a61d1cf |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/ce4274f6d1f8bca9cd91ade40cc86815e0214110 |     
  riscv64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/f5dcbbddcd5b4a634448c6fec2ecb3efb13a44ab |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/64ccc0b4f0f8ef6367b97a5e9ad7ba5b57e29177 |     
    arc      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/790948f5642ad49ff20cda4f22b745f4b85ab622 |     
microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/584287c6d45b0f696846308b3aec58a54535f4f1 |     
  riscv32    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/eb0bea28c181ea5aad05549ab7eb0f0130e927a8 |     
  powerpc    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/4bb6eb88614b0aee06e5a2d7eb5a37992a165476 |     
  mips64el   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/d03e4fed2f291c52cdf401711b7e6951b6081052 |     
  powerpc    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/a82dc09d1444fa5faa5e7f70c58cae2dc0239ba9 |     
   sparc     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/f9ed2fa7891d0a5dded7806628b342521ab751a2 |     
  riscv64    |       host-systemd-244.1       | NOK | http://autobuild.buildroot.net/results/b944583c03a6db5624c906e6645e874dc70d1067 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ffad46fd0ae8798a13a5096d90d28e5e1555d860 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/fcdd00365aaf69f35c940f6b7402545f614ac887 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/1d340f0f1221f19ad36b1cbc3818da08643963ef |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/b35f8da54c9a35e3448de225b2bdabd538efdb0e |     
   mipsel    |             libnl              | TIM | http://autobuild.buildroot.net/results/f93e2a344f2ae3420dba06f370628cd224bc12eb |     
  mips64el   |             libnl              | TIM | http://autobuild.buildroot.net/results/f2f97ea41e347b2fe100d340ad9bd94dfe9721af |     
    mips     |             libnl              | TIM | http://autobuild.buildroot.net/results/a5a317c53dc67562ecd8850b80c0da9c42893bee |     
    arm      |             libnl              | TIM | http://autobuild.buildroot.net/results/8895403d81177b9da9920c1055172a0bfd9dbb13 |     
powerpc64le  |             libnl              | TIM | http://autobuild.buildroot.net/results/9f160fcd6b41e90891f191a5de8fd685fd2ecf0b |     
  mips64el   |             libnl              | TIM | http://autobuild.buildroot.net/results/37c8d0ba26fdba6ba818c192a8cf7972ae5f6471 |     
    arm      |             libnl              | TIM | http://autobuild.buildroot.net/results/389818ba95f8c0b1d677178cdc3198174809bef8 |     
  sparc64    |             libnl              | TIM | http://autobuild.buildroot.net/results/d2ad44f407248533deb46ed882aadb3b864adbdb |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/275189dd7d2081c2fcafce0344a3edc5471405e6 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/c02be81429aff47503371d68f1cdce5b84e06dc3 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/f73bdf1c40f25ee7eb01dd0590c1184581fc4d32 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/2146da282e32de7d41ee7088b7ba46250982ca7d |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a0d9fdcf7af05d5af9ade33ff51f1eea9ac71b14 | ORPH
    m68k     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/7a6c2d2f83cd7b79d4c10f50c5aa547f2ef5b270 |     
  riscv64    |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/7d16f8f84fe3eed043990c19c885288a9bb67d9c |     
    arc      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/80a1eb11a7ea352b959db123bf036c01917e47d3 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/29fbceb550ca9e23d8d6a1abd9e525f82e160bc9 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/75f741341b708620a314746e5e814654d2eb4db1 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/fff0dd08f71facbe367d982d19158ee084ae8047 |     
    arm      |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/2521fc9212b9f010a15681a38745d36eeaae5172 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/22360a5143f207bb3aaab19980e3094ec5486afe |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/b7ca61b609aed076277567ac92f52778acb5eda0 |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/71464b57e6f5b014132d3e5f214f4fa68c463435 |     
    m68k     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/9ce2ffd4421668c19ae64d4cfd56cba9969ec769 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/ecedd541774038eceeb01e864e44c79432c95cf1 |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/c9632b85773a24ad4a248122165f8311a231a16c |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/95da89425b45b678ffafc15afa3137f94128295a |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/63189a80a9b33f2cba433198e53c47125d966db9 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/920fa7339c687c2a0758ede09c78c6434ec731f6 |     
   sparc     |     python-psycopg2-2.8.4      | NOK | http://autobuild.buildroot.net/results/a24b0555fd4261b50dc3986635c30717d9cbe764 |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/fcb141a8f06cfc772cfa6751be39ab0b2dcb3c9f |     
    arc      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ecce2430a805737f334dd64ec072e1ae97f0e7ad |     
   nios2     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/7c188c280084dbc6db0ef28707c98da00af4ce90 |     
   nios2     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/718fee3d20ef00ffa5c3e617a036cf2b82c97411 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/fbf60f25ece2ab86d0297f4f70ce1647cf8f1f4b |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/167d3809d82df8f8456e29584b2604d0b4c93d14 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/4782e91d8e6af437d7125d733022615574dc441f | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4f1b3ed74c5fe0f8035f458783106840e2b09260 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/5a06d5d63fe62ebf214dd5888f96b9df8182655a |     
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/198c3371b26113da8370f31a7032241a9d34403a |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/ae395392287bcd2c47923d0ac767913360f756fe |     
   x86_64    |              vpnc              | TIM | http://autobuild.buildroot.net/results/5468723fe320acbc9ae792781323e22506293a74 |     
   mipsel    |        waylandpp-0.2.7         | NOK | http://autobuild.buildroot.net/results/e12774ee0121de9971be04d2ea4fc38089a3d857 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  host-ncurses | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/b8e068695c5cdc3dd2c6b427b170ce0aa550caad |     
  powerpc    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/93c420197dd7c4697d601cf3ad71be65523b52b4 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                     vlc-3.0.8 | 2 
                bitcoin-0.16.3 | 1 
host-google-breakpad-7515ab... | 1 
              host-grpc-1.23.0 | 1 
              jpeg-turbo-2.0.3 | 1 
               mongodb-r4.0.12 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/61b892602c86d9860dde88c57f3132cae148d155 |     
    mips     | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/7708a2a95c4252b80eade544db6309ff0c6f3932 |     
   mipsel    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/6e005e8f6c96ee8d28954d921e076724d6b923a7 |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/6ce495d7f5be5de95f2c36b90801aad71a99c152 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/897c3f875c733f1cf4493296b2b67313771c45cd |     
    or1k     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/eca6f4e22ab3afcecd2b93e6609602b3142ad3f8 |     
    i586     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/dfd0f0cd515066891523a0eb6b748170cfc68fbf |     



-- 
http://autobuild.buildroot.net
