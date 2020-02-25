From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Feb 2020 09:27:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-24
Message-ID: <20200225092724.2EAA5844D6@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-24
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  8  |  0  |  0  |  8  |
  2019.11.x  |  8  |  3  |  0  | 11  |
    master   | 60  | 16  |  0  | 76  |
     next    | 29  | 12  |  0  | 41  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 opencv3-3.4.9 | 3 
                      bash-5.0 | 2 
               libglib2-2.62.4 | 2 
                    brltty-6.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
               host-llvm-9.0.1 | 1 
           host-nodejs-12.16.0 | 1 
                   libnss-3.50 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.4 | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/053645efda6e7540e4532b99d91ae3351bd02910 | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/0fc448859975047968ac080ce3e1e9f4c5af90cf | ORPH
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6e594aa624d6e46075c17bc0b9c3d1e5573d14e0 |     
  mips64el   |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/65693ff8720e9093385c78a063c527d246a15a52 |     
  riscv32    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/3c0f27e953fa41bd973003a4b42b768b1636c91a |     
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/fa6799f49a7f34ce9455c5fd0c41e30bf1d51946 |     
   xtensa    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/95e2b9665959fe2035a3cf6e9797706f38391139 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/c792e021e611890b8e6d62c90e66ceb29dd5e428 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/94bfa3e89a1c647806cf6f3a634d6b3b28e16324 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/3761769aa87c39de1722171d7187df45bdb099ed |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/cecb3119857891dda79208969415d7f9ba484c99 | ORPH
   mipsel    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/80f984f3d12c410b910021f67257c72c0323083f |     
   xtensa    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/f41015424e713eaadd8dbbfb846c91e5e16f8aab |     
  riscv32    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/b179bd6d5297ce3e9e377378770cadf3b13e64ba |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/c95a1c6a63bf837594aa431d7662c563873b8eec |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ef9d66bf0e1fa6a76850cf5f1dc751ea672a314a |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 2 
               libglib2-2.62.4 | 2 
                linphone-3.6.1 | 2 
                     avahi-0.8 | 1 
              bitcoin-0.19.0.1 | 1 
                   erlang-22.2 | 1 
host-sdbusplus-4212292bcf13... | 1 
                   mimic-1.1.0 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/cefc2696e4ef7f11f9aa686d23c9dc194cb23c64 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a9ded1b66bbf9932c5c0e123818ea786b8b2fbcd |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/38e648154a4dcb11675fd052751ece589b916c9e |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4d37bc4016e371d2b6e303873e08e20dba3990ca |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/36da36a3249c83b926856c7ae4733d11edd5b509 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/c7319ba16c1749285f004e65f5124b0fb805e1a8 |     
microblazeel |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/1c228c0a67ea7d2bb7edd6896374122c655d43f6 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/892e91b8090d64646df9f0ceebf9c804265607c9 |     
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/aea6b94fcc8dfd139f1156d7e796fb73e70ca563 | ORPH
  riscv64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/c9c53b9c1efa7580c74f002d007b074145b8012a | ORPH
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/65d879ba1983f435da46f48c68ea4ab460c22ccf |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/5d9d0fde60b13dba7599289004a578de3bf94739 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
              host-grpc-1.23.0 | 1 
                libcurl-7.66.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/d60f291d19dc5204e5c018555ae5b16cc6141a01 |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/8e4c3cf068ddeb5832572d47d822d84f116c6d61 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/545f07a30a75faec2c495c440ce2744ea628bb4e |     



-- 
http://autobuild.buildroot.net
