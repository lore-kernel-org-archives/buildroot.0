From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Nov 2020 08:11:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-17
Message-ID: <20201118081142.1B56886700@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  1  |  0  | 13  |
  2020.08.x  | 15  |  1  |  0  | 16  |
    master   | 95  | 19  |  1  | 115 |
     next    | 17  | 19  |  0  | 36  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  boost-1.74.0 | 2 
                  uhd-3.15.0.0 | 2 
                       unknown | 2 
                xenomai-3.0.10 | 2 
                        bustle | 1 
               capnproto-0.8.0 | 1 
                   gvfs-1.44.1 | 1 
             kismet-2020-09-R4 | 1 
                openblas-0.3.9 | 1 
            qt5location-5.15.1 | 1 
                rocksdb-6.10.1 | 1 
                    rpm-4.16.0 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/b2ddaf9c4addfd981cf764ce1c355ad530880c16 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/3fa0b788a0e4cadd6b38f428a4e571142ee8c0d7 |     
   s390x     |             bustle             | TIM | http://autobuild.buildroot.net/results/eb69ec8ba0af72dd820bf9ce5026a75be7695a19 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/38e833eef1b95fad8982282915e4f3d4ef0936c1 |     
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/d297053e8a8c836d561b38f7a1e2e4069d83d9b5 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4a0dfdc92f659f5f7ddf9589ecb0d0b657ca36b4 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/77d442a9c518dee5486639dbf4bd6988d20ce21e |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3bddd61dbfde542f8a679fcf4fb25244108eba99 |     
  powerpc    |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/2d24813e7e18e8366e34430f654a85b5c4cdbd63 | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/403e0d5ad5b84749468bcc016a96ed69fdad913c | ORPH
   mipsel    |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/39aa023df9a3971f3862b27c056516836f0f0723 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/504be81644029c787ba73116053a698e5f2bfb7a |     
    mips     |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/03c33e77c67bb68487abac7aa00e652246907349 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/4e324ff3e4f62dd283960d15c1d055b4c601916e |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0ea7c7d27806c5a857f91c51875f00d26d3156da |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/bc006682053e30cdde637c0b49cd0739f3c89b52 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e28b2fa85dd1d8241351b95ebdab7e38f45b1860 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1655f0c243f807f4b0a93d80a3b2550658cf54d8 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c112a47363142fddc475b9e15b2827970d407bc0 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/fb74ef610b908f233496ed0484ddcb8516611da4 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libnetconf2-1.1.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/57c2fb9057ffa06c6cafc6c26a19058378e44432 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

       shadowsocks-libev-3.3.4 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/5e0c21e6d0d9e5725c7e4b1a2607984f8dbe5998 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 8 
                   rhash-1.4.0 | 2 
                clamav-0.103.0 | 1 
                   httping-2.5 | 1 
              libostree-2020.6 | 1 
                lmbench-3.0-a9 | 1 
          modem-manager-1.14.6 | 1 
           python-pybind-2.6.0 | 1 
                rocksdb-6.13.3 | 1 
                xfsprogs-5.8.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/461533a8c4c6dd426c4e83f8af8bff8cbccff369 | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8d3826ec1d9cba1d1bc476a18655a33fd779554a | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/97f2da0116574ccabc7b477d832db519152b36ea | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/beb08e1351655ab7ec8fc9b4c0aef9188f58f11f | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b4f310d69e33bbab724f7037d3597023d1268509 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/00f99ca07df2b8453b84f2b5381f0cb8466adae2 | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3469e275a1b69cd20e3014884f348ccf3ff63232 | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4fba89f59cd284111b89278a4c6ab9547e9ec401 | ORPH
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/60f95e38e00c6ac21a28f0a4917dbe088f1aeb39 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/f0ebc76bf70bc41d3ff39d7b7c6384b4e5922ba3 |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/a01046b6c2a2eea1b675452fee25480ea40e194d |     
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/0a527806448bddeb7d1a03fd5cb1e18a28966ca1 | ORPH
  riscv64    |      modem-manager-1.14.6      | NOK | http://autobuild.buildroot.net/results/3a5df93b7fc9525b620c8ba51fe7bf939a1dba8c |     
  powerpc    |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/8e5f8e38b02fc93ec711b5cc82061c079c2bcef6 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/7e6835fbac6d7f3e0cd1bc282df497f254e5bf88 | ORPH
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/7cd6c1bb3ab6520ef2f12220b5aaf45756ba183c | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/8c910d412bed1e48ff38f1aa3e77ef4c6018f3e1 |     
    arc      |         xfsprogs-5.8.0         | NOK | http://autobuild.buildroot.net/results/d341c5eb880daa929aa056dce2c2a0e2c731b2c0 | ORPH
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/e25d5bec02466a23f5628cd0e712c396c011bc30 |     


Gitlab CI results for 2020-11-17
================================

Detail of defconfig failures for 2020.02.8
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/852960415  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/852960465  | ORPH 



-- 
http://autobuild.buildroot.net
