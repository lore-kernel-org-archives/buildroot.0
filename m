From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 May 2021 05:44:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-18
Message-ID: <20210519054456.870C883CCF@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 25  |  6  |  0  | 31  |
    master   | 93  | 28  |  0  | 121 |
     next    |  2  | 36  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
        host-sentry-cli-1.57.0 | 3 
               pipewire-0.3.26 | 3 
                    ffmpeg-4.4 | 2 
                  lvm2-2.03.12 | 2 
                    mpd-0.22.6 | 2 
android-tools-4.2.2+git2013... | 1 
                 dc3dd-7.2.641 | 1 
                 gerbera-1.8.1 | 1 
  gobject-introspection-1.64.1 | 1 
             host-lvm2-2.03.12 | 1 
               host-qemu-5.2.0 | 1 
                   hostapd-2.9 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
                rocksdb-6.13.3 | 1 
                      tar-1.34 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/34e7aa9ebb41bdde97ed81b7dfcff411a96b68d1 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b75fee2d6862925b736cf5e3656af47f585a6455 | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/375692f3c1f2311392d1348118e642eb3024f809 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/02974540a24b03870e9e83bb2351613095d51de0 |     
  riscv32    |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/9a0cdbe4f566df6f3017e05949df349b93afd432 |     
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d4cf4a6a4fc2b460768111d0c1d3f35b2c824631 | ORPH
    m68k     |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/a5840a71f15827c990abf80cfe62a8ba14256605 | ORPH
  mips64el   |        host-qemu-5.2.0         | NOK | http://autobuild.buildroot.net/results/80633327eb86937a7dd47f72a5c5d4624b78a576 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0cf08d6c4a2ffddf20b2bd808d44333294bcdb23 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1d2e59b3c385083c64b5bb03c56392f52c8d615e |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9d6904fe299648a258c57f112a71ba2705d8aba7 |     
 aarch64_be  |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/8f56cf556efbf447633ce873a21635f5adbc3cd2 |     
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/4999d1a0d45c4e3b5be5c49101efbe9c4ec3f9cc | ORPH
    i686     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/30ad0c13f946259c7a9c540421e9470152251c68 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f9b3ff2373abea82fd4e759e6f0445ef435130f5 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/a32a48c67e3551b7103058f14b65c1a70abd52d8 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c07a5b64b89ef73084db377cbb657e45bf81e747 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d2c1a19390bb5f5463a9f96f9a8c58874437c4d6 |     
  mips64el   |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/f4e0fd0bf70a838c88e29457ce09a8670abe5540 |     
microblazeel |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/7988e9ff8e976b07d14833d6b84dfe0e69caece3 |     
microblazeel |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/278ad8c37e6815a967cec44f7ee32a6008ad42f6 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/3add1b3945e8f72d1171c99b89722994a1480e21 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/fcec6a867804db15e688510608cb0b054899acdd | ORPH
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/96ef5e470c9752ce59c1e68f713db63445a618b0 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/dac0e3805b099fa071f22ebce0f0c640e49d26c4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/67fe006efda6ec9837349d30d340b1149b2fe70d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/440203a65fd4f1f46c0598e856e58846d8f13654 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/aac78e1d05ba3a1e3d731fa978e6d63d0ea6bc6a |     


Classification of failures by reason for next
---------------------------------------------

             libopenssl-1.1.1k | 30
                libcurl-7.76.1 | 3 
                   netsnmp-5.9 | 1 
               postgresql-13.2 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         libcurl-7.76.1         | NOK | http://autobuild.buildroot.net/results/e143c75bccd7bcd4216954b76099404a38cf9bc1 |     
    m68k     |         libcurl-7.76.1         | NOK | http://autobuild.buildroot.net/results/f159195adf05c375d7d314a270afd3a55d43ebdd |     
  riscv64    |         libcurl-7.76.1         | NOK | http://autobuild.buildroot.net/results/4a1f3919e8a60562a127aa90567b6a6e9b4da8de |     
  aarch64    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/9d79c9f313ff989449e9b47c1ff0afd3a167fd2d |     
    arc      |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/06b2f07732e1dea9c4e4e0a32cf1134c11f7ed26 |     
 powerpc64   |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/8c9da10c9b8ea54bb4067deaf9cc45ae17baaa42 |     
    or1k     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/69a7f2e83ca4f9142bfbba1671463d10605b48f5 |     
    arm      |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/901382827dfb1f35d4506add77015295f972725c |     
   nios2     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/699c82d825cdd0fb7830198fc4d67e110d893694 |     
   x86_64    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/c4604baf0c27fb4de1a85d6286f4f4ce38f940ee |     
    m68k     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/3ef8020277911259951a27092e7d61db6b2dd86f |     
    arm      |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/af0c0019614f804993f1d924dc82b85bb49fe009 |     
    i686     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/3383cbde9e5013a6bb0cbf12054cc813ff90ae2e |     
  riscv64    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/bdcb5852ae8633cbd691f9dfa8e16b0baa911c40 |     
  aarch64    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/5141d49822c6f19f1987310b435e7bf0f8b95a68 |     
    arm      |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/1ecc15bd0b828a2abe62deddeaaedbc278aae4ce |     
    m68k     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/6a67eba7d4f790786e6b3235cf51040d1b359b04 |     
    mips     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/9ef50bd526d1aa7426323abfbd5f7e4bf9ba7a48 |     
  powerpc    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/addfc43d070a597c1e42bc4f387d1e7a4ba3c3e2 |     
    arc      |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/a4c4b9581a30e0c2ba802616e8770f1b9c3672f6 |     
   mipsel    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/9f0cb5a459453e89fdf5cc6d6b8419751c212336 |     
microblazeel |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/5b76cd0c93737cf43623bc182c3ae83cf2de2aae |     
    or1k     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/6d2518d02960e1723490d96ce03f35156ae86698 |     
  mips64el   |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/e6b5b2c80327ec475d3f36417994145af21f0985 |     
   s390x     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/4f5b66f84f3f84a2c116c83277ec0f1c3f15df15 |     
  aarch64    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/71ab482220cd3902aa8064c819de5400e3681242 |     
    sh4      |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/49ae24adf876d73abe79bf0437d9358330cb9b9f |     
  mips64el   |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/0f55d321a6ff828acfcc496f45dac4dfab46f71b |     
  mips64el   |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/d15ca15450b8228af9f564cbeeb8c80ff9c3fe31 |     
  powerpc    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/c51634c9fbb62523ddc0952f84296d9ab7af6eee |     
   x86_64    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/cf490eddccc9ab2766918983aa06adcddff0acd2 |     
  mips64el   |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/d0c3a365cc08bfe3d3c9773988eabca8ebfb8af4 |     
  riscv64    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/c6720f057244806f98fbd3deaa937e4fb7be5689 |     
  powerpc    |          netsnmp-5.9           | NOK | http://autobuild.buildroot.net/results/f3ad19fabff7b9dd8b5985d2d6e7027a2fefc6bc | ORPH
    arm      |        postgresql-13.2         | NOK | http://autobuild.buildroot.net/results/7fdcaa337a7369673ac4580ff7a2bbccc895dca2 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/c95d0ba90774f55638ec5e611e9419dd88764b86 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                    vlc-3.0.14 | 2 
               capnproto-0.8.0 | 1 
               luasyslog-2.2.0 | 1 
                mono-6.12.0.90 | 1 
             util-linux-2.36.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1b4998d19aad31d92421368bff33adf9f750a94d |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/6f91b2eed646aed5c61c666623c24c6909343796 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/5076455a058457667e3eed1532832f557d04503c |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/cc31c4bef967cd5b8c49d714e2daaa0ac7694364 | ORPH
   mipsel    |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/eeb5f4c239a957495e1fc66e073f485bd725a943 |     
   mipsel    |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/1a7ae18bc2cc5721ee6838ffcc112659bffd946e |     



-- 
http://autobuild.buildroot.net
