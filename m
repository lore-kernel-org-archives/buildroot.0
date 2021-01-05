From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Jan 2021 08:19:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-04
Message-ID: <20210105082005.ED9F9867D2@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  2  |  1  | 19  |
  2020.11.x  | 10  |  2  |  0  | 12  |
    master   | 132 | 49  |  0  | 181 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 9 
                 uclibc-1.0.37 | 6 
                       unknown | 4 
                 mesa3d-20.3.2 | 3 
                rocksdb-6.13.3 | 3 
                   mimic-1.1.0 | 2 
                 rt-tests-1.10 | 2 
             timescaledb-1.7.4 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
                  zeromq-4.3.3 | 2 
                coreutils-8.32 | 1 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
          fuse-overlayfs-1.2.0 | 1 
  gobject-introspection-1.64.1 | 1 
                    htop-3.0.3 | 1 
             kismet-2020-12-R3 | 1 
              micropython-1.13 | 1 
                mono-6.12.0.90 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
                    qemu-5.2.0 | 1 
         s6-linux-init-1.0.3.1 | 1 
         xkeyboard-config-2.31 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/e794f489eb38d529ed7b527bc9d9001b0272da55 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8bdb217db7e917b567ad6085f4b9ea103feb824d | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1a92a96dc3920773ec6b2ec87a846ca9a23c0749 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/c71fc7a7945f2f4cc28fb7188f23550a6706fa70 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7afaa85d70a6e3aa998d42f3353e941bdc781cfd | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/404c4df3b18abeffa32b5053ccc97ee7b9cda6be |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/21cb57b48ab17bce61a8c634757d10f23ce7508c |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2134ef8d38b270e4bcc31d6217d4bff4c5e45e80 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/067e4516219e0f0b4f207a452ca5ba92c9b2c171 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d2ec379b65f15d0c4c382ef645cfc1d8ffe28e22 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3af76a1665e02cab1fab687ac10d5465e21fe60a |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fe4f2cdbd779d85f563a7db59f9259d8a726ddbf |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8f1520a951a09f0679c38223f5469c439e54b1a9 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1a30b9b63ac1777db2a8a685bcc10c9645979809 |     
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/a604ff70c6b7896fbb9b3bd8586e772c18ceed41 | ORPH
  riscv64    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/10d9838f4656bee76b0b180ccd5a8ae0eb7167c2 | ORPH
    arm      |         mesa3d-20.3.2          | NOK | http://autobuild.buildroot.net/results/ebca5efaecea7e0a98f18f814844f454e2fbc747 |     
    arm      |         mesa3d-20.3.2          | NOK | http://autobuild.buildroot.net/results/21f676fc4bedc42a203673484bce05f75591774f |     
    arm      |         mesa3d-20.3.2          | NOK | http://autobuild.buildroot.net/results/670f656a8d069a0373614d3ae882e78d489486f9 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/1e62e1f6aab2959e2570c06f471b9d9fe274e7e1 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/fce8fda0133e025d028df81728a3e1255dea4499 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/747e876873ce0798ac39b613eaebb8a7a8f25dcb |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/880de08d9876e3ebb7ee0a1c85f153187e98a3e5 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/84c44aa6b85ec60afeb700a54a9105e3607923c4 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2423b8f8d0f8c23bd454417397b925cba7094d7c | ORPH
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/c78efba26c1a66f7c5a96599c8f7e4462a562ada | ORPH
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/b949fcaf74bab589200d37998a56b374ec87fa25 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/df2ca0fd14b8b347a1499e6fca46b65a9278d2a0 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/916931809b6dc721da86eab6752f60867e1c96d6 |     
   mipsel    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/663d69e8b5e06e69f24852aabe1db66169ccc0f1 |     
   mipsel    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/28a41906722459a62707db0e0b046625e422eacf |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/7ffb6358fdd26ea24abe6064d61c07c1a3fe00cc |     
    arc      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/10d1653ea51cb85b17996a72111f845365a31242 |     
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/d62f46676a318f6d082fd13c6946a7db70c1919e |     
    arc      |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/6b6d1997aecb809c3611fd569a1dc07c1c6be44b |     
  riscv64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/85ba0718f51eea348472dba89c566c136314a61e |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/646eb3a535fc1afec272c245145a07bc0a28f275 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/89e2e7d8a3632c4d24824f9c17d4e4a37b009075 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6c852177b93dd6d7404d058570cbca27e05fb91e |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/163ab1bef0bf359d78e7247f27a5ec08ce7167f8 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/a078eeab36e03b62459b289310ca9d3491db30d6 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/ebd7cd990eb41894ccbff32e1cb9eb7ef1f50e9f |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/e91eee99754ce97c5e7859549b1d04e4c82be2f7 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/cf2656af77765b72f333cf9d8c83b9d83168154a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/1f495c6021afb69106b8ee8bca21df7a4c0e0fc5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ec023be5354e171e64cde381fb9502ac43b5a0ce |     
   s390x     |     xkeyboard-config-2.31      | NOK | http://autobuild.buildroot.net/results/183015bee6158ef67a8054bdb1096106498912d9 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/73f80d451490c0df48b1572b46ec4bcf4ca1e212 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/41cad913aaa1d95f99772ce060cee16e9539acea |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              tinydtls-0.9-rc1 | 1 
                 uclibc-1.0.32 | 1 
                       vmtouch | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ca4572404f571d9f3cd8b16f9cd161d19f793f6e |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/10efa33e593b9c535ae663b301ca5545183d3d6a |     
    or1k     |            vmtouch             | TIM | http://autobuild.buildroot.net/results/107c45ee437ca33842b550ecb0ffc129299850c4 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                xenomai-3.0.10 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6ebabec01a7f04e57775be4f05395a168d45ab91 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/55cd704d7da61dcd3c62f3c2637cda5a13ddba71 |     


Gitlab CI results for 2021-01-04
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/941876274  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/941876472  | ORPH 



-- 
http://autobuild.buildroot.net
