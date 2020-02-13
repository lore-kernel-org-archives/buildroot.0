From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Feb 2020 07:19:27 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-12
Message-ID: <20200213071933.99015816F3@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-12
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  2  |  2  | 21  |
  2019.11.x  | 10  |  3  |  1  | 14  |
    master   | 93  | 84  | 23  | 200 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

host-sdbusplus-4212292bcf13... | 11
                  host-ncurses | 8 
                         libnl | 7 
                   erlang-22.2 | 6 
                    brltty-6.0 | 5 
               libglib2-2.62.4 | 5 
                    mpv-0.29.1 | 5 
              host-grpc-1.25.0 | 3 
                    parted-3.3 | 3 
toolchain-external-codesour... | 3 
                       unknown | 3 
               acpica-20191018 | 2 
                 binutils-2.32 | 2 
                   flatbuffers | 2 
                        gflags | 2 
           host-doxygen-1.8.17 | 2 
             libopenssl-1.1.1d | 2 
               libtheora-1.1.1 | 2 
                 mesa3d-19.3.3 | 2 
               protobuf-3.11.0 | 2 
                 rocksdb-6.6.4 | 2 
                apr-util-1.6.1 | 1 
                  assimp-4.1.0 | 1 
                 augeas-1.12.0 | 1 
                  gensio-1.4.1 | 1 
                    git-2.24.1 | 1 
                 haproxy-2.1.2 | 1 
                host-go-1.13.7 | 1 
        host-gutenprint-5.2.14 | 1 
            host-mfgtools-0.02 | 1 
             host-pango-1.44.6 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
                      libeastl | 1 
                   libnss-3.50 | 1 
               libupnpp-0.17.2 | 1 
                     lxc-3.2.1 | 1 
        network-manager-1.20.4 | 1 
                 opencv3-3.4.9 | 1 
           oracle-mysql-5.1.73 | 1 
                    owfs-3.2p3 | 1 
                      pdbg-2.4 | 1 
                       proftpd | 1 
            python-cffi-1.13.1 | 1 
                 qt5svg-5.12.7 | 1 
                   sdl2-2.0.10 | 1 
                 ser2net-4.1.1 | 1 
                        sngrep | 1 
                    sox-14.4.2 | 1 
                          vpnc | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/c3738fdda16753730ab771df2ac07a35e0efa9d6 |     
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/42eaf5ccc4d23d17c6332f80c6ce800a0bf3f634 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/8b0ab8a88c89e78d037a0a903d06a12552cc16aa |     
    arm      |          assimp-4.1.0          | NOK | http://autobuild.buildroot.net/results/d06f4b3004825f4334c09f60d8247a0b22db79b6 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/e37f070c4d1dd48b27cfc6556d4e6b1d72d05ba6 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/608cd37186647ccefee430f5760c27f3910a0a7c |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/d9f89dc3224b397531db398ad6976b6ce2ec8474 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f374f0fc21aa7f00f5927d9a2c35e75f19b8abca |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8edca5a212ff5f90a7fcaaf1d1ae79267f4848ce |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1c8c2163b6cff259829eecf65438a0994f737962 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/01a7ba0b89166ec3a6c79f41075bc21cc2508cf0 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a7f70059af6b85b22a68a37241234f35e1fede67 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/146a4d95f009bd713c5f58a1afd6fb6af627be44 |     
  sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/3ff9a55f5b4a71bf947eaa8d9a71abf02535f4fe |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/64353b396d5b9c94edc1416a262243245c9d66c7 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/e5ff2159adeb407c0d890e838ea8b6c482b89fd2 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/15b11bb9e66425e1332454777651752783bbad82 |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/743188e5ec63f8d7b4e8d11686113503581d5a2d |     
    arm      |          flatbuffers           | TIM | http://autobuild.buildroot.net/results/a9e1d6558462a16fd821bac2bf26244c7185f2ef |     
    arm      |          flatbuffers           | TIM | http://autobuild.buildroot.net/results/d780de00c547305262aa7e118534dc39d9461d6f |     
    arm      |          gensio-1.4.1          | NOK | http://autobuild.buildroot.net/results/51ffb3276685bbf1fc6153dbad21bbf4cf57bdfe |     
    m68k     |             gflags             | TIM | http://autobuild.buildroot.net/results/b18407fe755059033426ef7f6510c8b431e3dc2f |     
    arm      |             gflags             | TIM | http://autobuild.buildroot.net/results/bb5dccf1e4cea2d1f3acc25dca68723c7c89277f |     
   nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/bf5ab99b970b0cebcd7008cdc139d1e622b7254b |     
    sh4      |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/c235e05dff55fe7585a394350f57402b39d10451 |     
  aarch64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/835d1c9e231d21647d303403e9c7e18c7946c19e |     
    m68k     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/be5dc50710af9e429f921f614a80cbbda50d4d58 |     
  mips64el   |         host-go-1.13.7         | NOK | http://autobuild.buildroot.net/results/8badea703c6d20bfa9da5bcbf0f07ac8a8c8a67e |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2106888ad0f61ab6311249c257ab2f56e71542d7 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fe9b11136e7deda464bf8c818ca6ba553193146a |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9cb5864b789e1f285d7a8747580d454f0d741513 |     
    arm      |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/fd1b2b7ff2cdd1f9268dcf7f5a56f03b90036f76 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/adbb251b14bbdc4f5a04f7f62ec2766f4dfdf1de |     
  mips64el   |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/171951c1b31b42f5116fc2ee567f1d70fac2058a |     
  riscv64    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/98e22a400de2b2018b3e0fe93d141c9ba2cda612 |     
    arm      |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/5cba6e4987d0f36916b699aa13ab8cbf34a8c39c |     
    arm      |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/114de9f9604590493c76fe8b8246d64e6d076639 |     
   x86_64    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/037a2bf44851bee4991dd5504c3d958f44ad5621 |     
  mips64el   |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/bb12bf73fe21afd4cf49d276ee400fbc94683f0e |     
    arm      |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/95a4d7eed85889ad060a5c435917fbf76ba15b00 |     
    arm      |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/d0d5ec96cdac01e3ce06c76a0794ddfbe3b8895b |     
  mips64el   |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/afd6ba074b08984ba6c8fc4dc55bdc1bcad684aa | ORPH
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/054677457e4e640f2af570322772a1bd2db44da3 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/ace0b2a9eea0d73b9a0d0fe3e67b4866766f726b |     
  mips64el   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/5a8c7005285e81a97a4e4cd30e914827b3e71c70 |     
  riscv32    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/40e2616a385b57760a5834ef3dbfacab17a9cc92 |     
   mipsel    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/63da8191c45c60de66061d5189e2699ce7d43929 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/37d0e86bb838b7830f6a259f280a565f60c31ec0 |     
microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/6730cff8e6042c7f23ba215f5e95227de399d6f4 |     
    mips     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/10246926123dad98d20afd0c70fc355660ae195c |     
    i586     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/cf39cf4e08d383880b66daab11671609031469c4 |     
   x86_64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/32b969300c487a6a20eff1cc01832f84188511ef |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/67d6cc2cf2bd538330eea50050f37adc8cda87fe |     
    arm      |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/3c94665e9154f43a227661f6dc797e5b733b95f2 |     
    i586     |            libeastl            | TIM | http://autobuild.buildroot.net/results/c8d78010ae607dde111c9f3f30e12f1b4df74f07 |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/849e09f7e53f8756c667e37e9f0fe596e4c2844b |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/09907d8c1885523931c5cddbdde8bb914039a3a3 |     
  riscv64    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/ac49372cbd6827b47ff1bf9ea3e3687ade0ab68d |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e712878a12c31d867697f907fa61b81912f9a179 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/3b13f10d31ccacba1e4dbbb2666708ed0a177bdb |     
  mips64el   |             libnl              | TIM | http://autobuild.buildroot.net/results/03e21639bdabbd1dcde168b7240b8d0014f3780c |     
  aarch64    |             libnl              | TIM | http://autobuild.buildroot.net/results/2c9241ece5116f8aca0346cd1372217136a18f98 |     
    i586     |             libnl              | TIM | http://autobuild.buildroot.net/results/ae3e682e19675964fbcdfeb810f98355b4300f2d |     
    arc      |             libnl              | TIM | http://autobuild.buildroot.net/results/cd7fcef2291547d57b05de7ded662855d89ddc12 |     
    sh4      |             libnl              | TIM | http://autobuild.buildroot.net/results/5f2b0dd51e0e18df0788f65bd80252e0e7d629a0 |     
  riscv64    |             libnl              | TIM | http://autobuild.buildroot.net/results/920264f33825bce506936ee46184908386e4b316 |     
    arm      |             libnl              | TIM | http://autobuild.buildroot.net/results/5b13bf46131a3debe35e79610db39d8e5097f689 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/7e3fc9eae90457e20d3c9a2e865f155b76ae3dcd |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/e3a93789b2858d047dad7e81d7f8177edeb08d88 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/12982c219ec192ad591d8e596a449fcee5a4d0a8 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/ea804f2ec2ada8647c2039277199947d03b1cc40 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/0399d185569f89d96f1f60f21c4e5b3bb2f1a032 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/64fcfed3afe806433d0e71f8b60b14f5be0484d8 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/31e4245ca94b62e6af2bd14abe3bf518dc48bfe3 |     
   nios2     |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/d0aaab4674be1bd68ea9c98bf9d6fab94e3c6eca |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/f2efc15376d7a578c8b25fb943f71518bdf2e2b0 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/8aacc9f82ef95ab3c1b06b016d1bdf290296882d |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/72ba7e73318732290639bab0b573a63e77393cfc |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/76cd5d04719102f93dd2f81f09b21e738c2e15a1 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/81d5f2d2eae8d0a6ed7834cc799b608b65edbc2d |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/901c3f158f0a30c4e31a6dee46f417430d61132f |     
   nios2     |     network-manager-1.20.4     | NOK | http://autobuild.buildroot.net/results/d8a58b91de9e0243bbaa8b998a47b276674b3efe | ORPH
  aarch64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/220bce577d9d4116927e844146b25070f4d2a647 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/976485ddf1588705e0520f5b481ed078be0ea235 | ORPH
    m68k     |           owfs-3.2p3           | NOK | http://autobuild.buildroot.net/results/c0255080ee4e543dad6f80db11c92f29b1a4f879 |     
  mips64el   |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/5e4bc3bfd7e3877fa857d08919d4e19fc6ed2a78 |     
microblazeel |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/2903be4ee2b927be5311bb2275ca5856854ea9c9 |     
microblazeel |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/74711406044ab8343c5485a1f618d7eb4ed0c43d |     
    m68k     |            pdbg-2.4            | NOK | http://autobuild.buildroot.net/results/aca73c3451582ebd4ab245e691d80db4c14c5471 |     
    arm      |            proftpd             | TIM | http://autobuild.buildroot.net/results/a1995786a16d87ca41970059f35e445cc557458b |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/260239028798053df6836953e17716c848e2147c |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f206601a8b603137360fb14de224d05085faec92 |     
    i686     |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/14a5cc5b5bcdd976daf10e09a10b1048d68c0c82 |     
  riscv64    |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/ce433c3222651de6cc638c7909dea8bcdf2a0fb1 |     
    arc      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/5420de9f831ed60c51c77897b58389b5cf152d16 |     
   nios2     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/6d063d7c8ae464e2e5bfe08a828f0587f56e31de |     
    arm      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/11441beafd183e2d774afa318ee5ef152f4b6279 |     
  powerpc    |         ser2net-4.1.1          | NOK | http://autobuild.buildroot.net/results/f15cf961ddaf849987afce01ede0e3d1e77a0fc0 |     
    sh4      |             sngrep             | TIM | http://autobuild.buildroot.net/results/1a44ba840ee9fbb9bc43a97a3f171cae9ee410b7 |     
    m68k     |           sox-14.4.2           | NOK | http://autobuild.buildroot.net/results/fc110c3d0507776261afbdf008c08b3b2aa3c7a9 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/69fa91284e2e6b3be3d3708f39a4e39f2d1129a9 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/841e135f0c63503513b12216dd63eec5ea092b4e | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9d0a1c8b503e50c7ebebe7bed7248da3b9906fe8 | ORPH
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/d6dfb2d731c1e33b74a111b8d790c309295425b4 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/79762eeaa08e0af6381caeb23cf03a9d51574ff7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/84ae3706442ab791466d198f4e84238aa1051f7f |     
    arm      |              vpnc              | TIM | http://autobuild.buildroot.net/results/41c3ea58a6f18042bab877261ca9c8995c08e19f |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                        gflags | 1 
           host-libselinux-2.8 | 1 
                         libnl | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |             gflags             | TIM | http://autobuild.buildroot.net/results/1c6df270da895275ecd6088803cb798c2fd748e8 |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/6da80d7e3952d4e08b4728de0cf2c3e7a2902060 |     
    arm      |             libnl              | TIM | http://autobuild.buildroot.net/results/d4a8ba87b27de7c72c72b016dc74c3012c08f2d7 |     
    i586     |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/59c958f306e5a374cb5ad7df8093e9397cf1971f |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
            host-mfgtools-0.02 | 1 
                  host-ncurses | 1 
                   mimic-1.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/0535bc9211e4ae24eb8411466088fe6cce782759 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/3e5e47a91b7697deda554b7dcc2700f1275cb121 |     
    m68k     |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/93285a615fb57b3703ed063bed6a786d9518ebcb |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/2b39e6009ab449d900ad257fde8b44a057f30556 |     



-- 
http://autobuild.buildroot.net
