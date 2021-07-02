From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 02 Jul 2021 05:53:02 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-01
Message-ID: <20210702055308.7CA2260668@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 14  |  5  |  0  | 19  |
  2021.05.x  | 21  |  3  |  0  | 24  |
    master   | 56  | 94  |  0  | 150 |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 14
                  exiv2-0.27.4 | 7 
                   seatd-0.5.0 | 7 
casync-4ad9bcb94bc83ff36cfc... | 6 
                   libqb-2.0.2 | 5 
             libsndfile-1.0.31 | 5 
             safeclib-08112019 | 5 
          sane-backends-1.0.32 | 5 
                harfbuzz-2.8.1 | 3 
         host-gcc-final-11.1.0 | 3 
                qt5base-5.15.2 | 3 
         host-gcc-final-10.3.0 | 2 
              keepalived-2.1.4 | 2 
                libsoup-2.72.0 | 2 
               memcached-1.6.9 | 2 
                  ndisc6-1.0.4 | 2 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
                    zstd-1.5.0 | 2 
            docker-cli-20.10.7 | 1 
            erlang-jiffy-1.0.6 | 1 
                   gconf-3.2.6 | 1 
                librsvg-2.50.5 | 1 
make: *** wait: No child pr... | 1 
                mono-6.12.0.90 | 1 
                 openmpi-4.0.0 | 1 
                openocd-0.11.0 | 1 
                    php-7.4.20 | 1 
               pipewire-0.3.27 | 1 
                    qemu-6.0.0 | 1 
                      tar-1.34 | 1 
             terminology-1.9.0 | 1 
                   tor-0.4.6.5 | 1 
             xscreensaver-5.45 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/804f7c53c65837ba27e9eadf2e0a9824be2225d7 |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/ae47b17798e18cec8749b5fb90d50313fc564cf5 |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/42c3da1fe3babe8952c2c9240a66765eeb451333 |     
 powerpc64   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/1787cd8c379671e017c05c734f3ebf8238472469 |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b564d3f17954d90f40a8045d385110a696faf58f |     
  riscv64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/dad9f8c9d5cd9c6c9f85d0d84f701fe6ca2f0982 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/59736eb5b27e3d9a1308b5c65649d55eedc7d2b3 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/3202df0a68083367285436e348959d7d6b53b0ea |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a50906f57b0142caf9c6594655f0891641572dec |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d79076a18a0d23f28b0498a2e0bcbb2cdac83ca6 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/93adc97f5324657555a7c02209324a4ab7dc3dc1 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6e5dd99ccecfac2ca121c4084c79746945afd621 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/20650843178500f977eda5c470eba8a44fddbdc8 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d54f4a817163762692a683f8bf764e7f2c88e1f4 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ba524c79c485d7420c97067c4bd77bb640c40116 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/635d1042dc87c50eeb4a1e2eaa3f9b26e43c4912 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b3b02cc7154f723476bafb37b17ef390df4e2635 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1bf1834fd4e97f8bd2173c734a1c00a90c651dfc |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f37dfd68a2ecfa797fe1798c9369076367927cb9 |     
    i586     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/3ec487132c85cf0ba89b76fbca6ed9d4a9dcd311 |     
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/d37b9eb32a791a8a1af037db0eb5daa369a9f92e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5ccc71c6b6938c039a12b2642f4e5fd2b6231685 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/db09c03256d3cc8d195c994942e1b9325b974c89 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ce4a0033b539cd6cd506bed52cd1d73097f3a720 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/695afd0e1e68dad15131cb49e47b36f64cb275c6 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f770b3cd4d0c117ab173ae15b49cfb351eae333f |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ae4635899124c602c70d2b342a76f95c34aa4a3d |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cf0a3e4fddae00d640199f868184627aa47cbcc0 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a466bd27cf11271e09a43c383253b3f2b3a2b066 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/45f5af73c84c9e40bde0b240a2530b5687842357 |     
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/a1a09815e2ce22b2e58207f75d1e6a14b4810dc2 | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/5e39217a4a21957bb0c4fd6d9b6ea9250fb6ba04 | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/a41de40943b37edb110396810453f255a1d394ed | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/52c41c5b8a6afd618f0aee8e78ba7738a4198d85 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/37f24ce0ef6ab8de6446141a00c8ef70a443e13d |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/a0f4628ccd0270f10eceefc9c701c236d6013713 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/1741f2413022f26296e6a1d1fcc0bc1f30beae0f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/be839edf1a7811e328ecb95d1d21fc8287ea97b9 |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/9375f6cb25265a32aede6d2b617423da5f8ad809 |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/9a93d7d76b0a4319c29fbf7b5986bcc78539ae8b |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/488ffd743012a0342144d155f38df5b8e1bf870b |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/28ebe868ff904cf284ef6378199bfa5ff999ce08 |     
   xtensa    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/222aaca4673c79b3c93ddf492c5b7976ae48ccb9 |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/54a245caf516e12d5e12dceff787c0343658c8c5 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/87effe9fd9bb2cc2a7f8ee60b44aed52cb706e92 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/95b40457e6a9338a99d492c6ca321fbfa905d960 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/4496967db4aa7dd86e5fecc9092836edc91e1a6e |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/cf167258bc4a9c3eed6b5ff504783d05f5af9635 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/069fcdbeed8c9ffd2c28255ba0b0bab819bc1d73 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/61e8113aa0ff520ee09a5878a4a1a54d15f3274a |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/4616dee13e6d050a675589930c6492d77165b3cf |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/f616c804b53bbb8589b254748621a22af9832569 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/56b9cb987e25b99d6fed16c537552f47c3376f21 |     
  nds32le    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/4023c2073949ca5abd8c6c25febae672948aabda |     
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/45144a2541c6718cab7569ba895820d1f8bb02e4 | ORPH
  powerpc    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/3b92d1b2b7f7486c0714d0d39fbeca80bed73391 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/8b29bf156e9d3c3e0a9ee152db648e4673af7a43 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3ac9b0a6ee98ee85bb7a90afd6bee5fb673c0aa2 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ac659944b2302ed58f873528fd6732e4314158b1 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/95e8cf1778a02d1e5ad22212afec6e21c377d63c | ORPH
    arm      |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/530bfe22ff509cf4ebfdf99a183312a1053f505f | ORPH
    arm      |           php-7.4.20           | NOK | http://autobuild.buildroot.net/results/c10800fde50b123809557ed50e0a86acb59404a4 |     
    arm      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/fd05c275c9082e8fdb6f221d28094adb8546de25 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/21c0195144d9058dc4cad26ed44f443f5ee65b00 |     
powerpc64le  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/2628d8b12d6fa7a7b03228013a4050b4a8836749 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/73ddffc52e3ed03de1ebd361c907ed949cbf29ad |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/426cae6bac045ac6eb1c042445843ee24270a070 |     
   sparc     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/6038b8682e4c39d6d6b4c2a19bb27d37cdb87885 |     
  mips64el   |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/ce39d6663c955d0b79b0e8be76126e8164fe8447 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/636bb9d22831eead265ad529a717e71aeb64d3d0 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/11882f69a3e4eafbf548fe516f39ff361c73ba8d |     
   nios2     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/c6d0fe42679bb4d68f50e0f2250beec9d98bbbe6 |     
    m68k     |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/b7e73c9f3fe0cd07bac2bb90dc8cd77cac936980 |     
  mips64el   |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/c1c14c213d145fd7c156ecb6256a414251ad9df8 |     
  powerpc    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/e5530bbb0cd30f751a673e8dac15513d893b9024 |     
    mips     |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/e00fa9229cabad5872c3f308f725f2d5b3311392 |     
   x86_64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/0fa65a12af71d237c3bbecdc3a5df58a430d21d2 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/32bcf77ef68900c6b60c3e4375d743678b39cde6 |     
  aarch64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/ed8109a051fa19f542853ac4658b37040cb3ac29 |     
   sparc     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/d8bfdb05eafda2603fb385ff57976cca5bfe54cc |     
   x86_64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/0e51d471edc81992dc79adee147a38245f2d3065 |     
    arc      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/61d1f51509e145d6ef2d97239ab1f93a1af49b7d |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/96743ba2946af75e63e632bd1c300885510bdc91 |     
   x86_64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/8ccc79430e2548d31c79e381e4b52e5b471759fe |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/8c238600de4004df99b5f031782d73d9d59c13c8 | ORPH
  powerpc    |       terminology-1.9.0        | NOK | http://autobuild.buildroot.net/results/8f5ec77b945140618fd351b32f9f3ad2d4577d1f |     
  aarch64    |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/b9633a8fe45d2e424c01c3c4bf78c8aceb26088c |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4f8ae6be34c82b113fda5d493430cfaba2e4a031 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f63259fe7023d3934cfa2318cd08354de1500ecf |     
  riscv64    |       xscreensaver-5.45        | NOK | http://autobuild.buildroot.net/results/8f835472fd5f96e546071a33eda25da8ac8444c5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ad1c420bcbb7134282cacd93af09b4e714a32275 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fa3bdded0d5b223ba708df3e8f4b079551298c12 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/e609601a0fc91c44d88a12c35b29ce937381462f |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/667b5ede85f50600cac58db10a6ee7a6e58afd8d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 2 
               capnproto-0.8.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                mono-6.12.0.90 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e464e54a2af42cea4170397569fca02b1f00b014 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4f5eb425a595baf30d5f03aede11cbec787672fb |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/03143e14adfcadf0a8a8d4d237f67806b710d602 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ba13e6cb7140ed50efa14153aef7b58902428a11 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7b6994bfe3a674b076c26d4479ea8e1786c8fe54 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
             fontconfig-2.13.1 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0a69aa0235c9187d256f247cbb952002b5d87813 | ORPH
  aarch64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/15fd5e70473c0b598a316a2577ddbe11b12c0a3e | ORPH
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/30209c1ba2901a3629eca5ebd865bd88acb5aa43 |     



-- 
http://autobuild.buildroot.net
