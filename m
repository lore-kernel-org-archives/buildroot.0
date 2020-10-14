From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 09:54:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-13
Message-ID: <20201014095420.4C84487C27@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  1  |  0  | 15  |
  2020.08.x  | 16  |  5  |  0  | 21  |
    master   | 132 | 46  |  0  | 178 |

Classification of failures by reason for master
-----------------------------------------------

                  pango-1.46.2 | 4 
                apparmor-3.0.0 | 3 
              asterisk-16.13.0 | 3 
                  boost-1.74.0 | 3 
        host-sentry-cli-1.57.0 | 3 
             libapparmor-3.0.0 | 3 
                  uhd-3.15.0.0 | 3 
                       unknown | 3 
              host-guile-3.0.4 | 2 
                  ndisc6-1.0.4 | 2 
        python-m2crypto-0.36.0 | 2 
                  botan-2.16.0 | 1 
               capnproto-0.8.0 | 1 
                   eigen-3.3.7 | 1 
          fuse-overlayfs-1.1.2 | 1 
glmark2-c493520253fbfe3676c... | 1 
          gstreamer1-mm-1.10.0 | 1 
                   guile-3.0.4 | 1 
             kismet-2016-07-R1 | 1 
                   libcap-2.43 | 1 
               log4cplus-2.0.5 | 1 
              micropython-1.13 | 1 
                minidlna-1.2.1 | 1 
                rocksdb-6.10.1 | 1 
                  waffle-1.6.1 | 1 
               wireshark-3.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/480ecb599014b30366ba8024c5147d5297491993 |     
    arc      |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/ee9427cc76e2358591efefb499af4de46a8a0bb9 |     
    arc      |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/819cdcef7e05414fba73f765e1478dd6c8a7bade |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/4ba5c74c762e917e877a7b98de51ac52aa9b7055 |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/ceb6fa154380af75b019768d60eb69226c26e4ca |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/625a879e045b2c1a417671548d24ff00eb40f394 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/28663643756f24828aeacf2c3e193c88696d6b8b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/febd1e5e90d997627e80779371c29e0c7ed5cad1 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/9603ee06b417b99986c979329145a53fde9f1f41 |     
 aarch64_be  |          botan-2.16.0          | NOK | http://autobuild.buildroot.net/results/69ebf03c59b2af4140a39bc26f17d0396b6ec15d | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3b3757073360e2337c7be54d37e16038833dc1e9 |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/fe8a52d7f982e9a87cc197bda72b8ba69332a283 |     
  riscv64    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/656821e8f4f10ded0a817c871b27e8180f1b603b |     
  aarch64    | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/d4207b59a77f356e8de9bce55900b6a7cf4e4e7f |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/dddc428241bbe4b41b646e0dcf9e8c2d37fe8821 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/49eb9c2262c1d61cc32e5dbb293c6f2e64c5f0a2 | ORPH
    mips     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/bf95dab11c894a38bc7a56390b7f19e3cf44e863 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/9cbab24f937c2ab395c954328c9855e1e0e7814a | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/708b49a458c58187186286d7a6621315266376c8 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e26635600913b4b26d41a7ba7a39f243c9fa165f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/121fd98338e0e042e5bc52143956cd087b69f5a7 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/405edc8c9bfa61a57bdb6a18a7c76ec6eb2e6776 | ORPH
   x86_64    |       libapparmor-3.0.0        | NOK | http://autobuild.buildroot.net/results/c74a88f755e871f184c4ebe069b2623bc8b9b804 |     
    arm      |       libapparmor-3.0.0        | NOK | http://autobuild.buildroot.net/results/1eeda5acb1c42841b0f12364636511a4eb4a1148 |     
   x86_64    |       libapparmor-3.0.0        | NOK | http://autobuild.buildroot.net/results/9c8db5485153f98e7f7c908e9bb0696853a60918 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/f5b817e2f4883cbc60228e8370ec937352b5c3da |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/40fd9a1653c8bddd04a3c06be2fc7f9a9f6058f4 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/ac7004261d9fa9aa8bc836a0303da2e43720a955 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/bf7a57f418aeaf653c92f5022f625c86c259b143 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/adfc3e60e36ab56dc89bf92a3eac6bbe94072472 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4921fd602c99b2a10294717d26ea0ad2e91503bd | ORPH
 powerpc64   |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/5c6815c0db980979462602888180683ffb22fdeb | ORPH
  aarch64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/5678cd9fa795fc27d8a947f2f9a4465ae9efc3e7 | ORPH
  aarch64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/d6b93f765d3275fd8e1f3d3d917d4a880e99345b | ORPH
  riscv64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/7d0b04743b8bef5b683c5c728bcab6d94b48993e | ORPH
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/644d807f0ad119b7fe816ad1da7b43ef03301cb8 |     
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/e434ce65e6347f20884e1397c285c7d26aff4554 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/4da8210d14ae8e7a1dd09ff71ff6671c8601b523 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/20091d67c8a2db4038bc00514c73af6ae7fac366 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/75a2a0ebdaaed9cdd929455d952c39944317febf |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/6309646538cd2890d12cf932a85dd3ab2a80aa8b |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/b3cc86c3e80e80a8291ebc9800003962271bc8d7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7ccd6d9724e5753c8fe0e708252b92dc9110c2a2 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/c020f252018b18224de35a9b2e917f50cef82c71 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/7916de9944fbf0a87120241e984504940063624b |     
  powerpc    |        wireshark-3.2.7         | NOK | http://autobuild.buildroot.net/results/11ffb83951f9dd18262eddac3cb9e43ec8b6bc33 | ORPH


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 rocksdb-6.6.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/470873d0c0f8cae9758c0e096dd4aaeef6b1535c |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

              host-grpc-1.30.2 | 2 
              gnuradio-3.8.1.0 | 1 
               log4cplus-2.0.5 | 1 
                    qemu-5.0.0 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/d06dccaad33b3de2204521333c7cb357f63d39d9 |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/2c5b116da38c3a8ff074b1bffb16b817de356082 |     
   mipsel    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/38d1ee1381b0e100464acc97179e32a12a78816f |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/b5100aec48b373d4a44405ad6591c12b617b74cc |     
    arm      |           qemu-5.0.0           | NOK | http://autobuild.buildroot.net/results/b37a6bcf9f90a4357cd413d47b091423187bf73b | ORPH


Gitlab CI results for 2020-10-13
================================

Detail of defconfig failures for 2020.05.3
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/786589900  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/786589959  |      



-- 
http://autobuild.buildroot.net
