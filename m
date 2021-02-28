From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Feb 2021 08:13:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-27
Message-ID: <20210228081332.2487A83F28@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  2  |  0  | 21  |
  2020.11.x  | 14  |  0  |  0  | 14  |
    master   | 119 | 53  |  0  | 172 |
     next    | 28  | 19  |  0  | 47  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 8 
             libopenssl-1.1.1j | 6 
                       unknown | 4 
                 pixman-0.40.0 | 3 
                 openmpi-4.0.0 | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.4.8 | 1 
                  bustle-0.8.0 | 1 
               capnproto-0.8.0 | 1 
                  dhcpcd-9.4.0 | 1 
docker-proxy-55685ba49593e6... | 1 
            erlang-jiffy-1.0.6 | 1 
                       gdb-9.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 haproxy-2.2.8 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
                 libgeos-3.9.0 | 1 
            libodb-mysql-2.4.0 | 1 
                 mesa3d-20.3.4 | 1 
              micropython-1.13 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.20.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
           python-pybind-2.6.1 | 1 
            qt5location-5.15.2 | 1 
                  quagga-1.2.4 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
                   sdl2-2.0.14 | 1 
toolchain-external-linaro-a... | 1 
             tpm2-pkcs11-1.5.0 | 1 
                    vlc-3.0.12 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6a44030eebcdc228c1a78010e1ef222ad86a5219 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/5e0c03b2ae13045af3695b2546fb1d38ac169e4e |     
   sparc     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/76871b87047b5689a80fc44eaef8deccde2b8b8f | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/190288845f6aeaa682c585d72ed222e82d036c79 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/ab3e15905c317045489ef6f6068ee18065753d88 |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/d0ce691fc782dda37d6c529470b4e2769071a437 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0868578d95a9606a874b7deef75b80644f9256f8 |     
  powerpc    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/5d91f5155b3d7116e12dbcfa4e13a3a8df692060 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/72074f8f056b962025b7e1f75fb8461e5e3ec02a | ORPH
    sh4      |         haproxy-2.2.8          | NOK | http://autobuild.buildroot.net/results/54a9560ddd78f07a268bbcf94a0807033cd21482 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/219b26757f98cff6815b62ceb9838dff82ae0c24 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/41198954a83ca865e82180e86e3def4ac476c890 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/61c6ba2d1487c0bfba6b70dfd7f12f903954e5e6 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9210d523e24a84a68896e6536fa91406b622c317 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e17b1a5aa2c7ee0bf521232044313cdfd113807e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/000598ee8be9e5e891d5bc172ad2167f95ed757d |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ef24007c33edef6e056d992827a7e46a2719a33a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/47fbf04e57791fb752902c8a9eb422edcec16a8f |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | http://autobuild.buildroot.net/results/0c23a41a7417f33fa09e8ab512edeeec77771e0b |     
   nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/ae790a8328ec2affa7ee9b4b9bcac0c0dca4e50e | ORPH
 aarch64_be  |       libodb-mysql-2.4.0       | NOK | http://autobuild.buildroot.net/results/241b604952ccec74b01ea2dbe05dfcba9b923717 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/2151eabb6d662eed8c5f62fa32c8ea3b7b171f9e |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/9c89b522987c541f6b0c377b737132833424d7ae |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/af76e523dbb8b6a3c2b973bd77cc5172658981b0 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/81651a733a6bdc86a744e06ad9765a27fb0d0e49 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/da527f14113cc7dfe633d76c08c7775f0ffb8159 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/cd8821286ae78356717fc722d0b6d48301f5ee26 |     
    m68k     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/fa0b0ac1f9b6ec7a9735272545ce2bdd8fb3a848 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/cb7cd717ff446f76c99d45c673b4898e5d8e945c |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/ff402ca8679984857841528de6adf008bfc5b1cd | ORPH
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/262f1dc619e05558aac7231feb4044439faaacf9 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a2ab09c4d3d468891a1bb1b76377a1b12db23ef3 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c053b9e191b31f0b1f8f8c902b602e187f714dc0 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/5b222382d9c690dbeefa2813e48ecf54dc96af62 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/71b7bc2f13bef198105a33f30c16e40c0d7015e1 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d7833665445503f17c5312643d547e5a031a0fa0 |     
    i586     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/db5b4d6c5f90f254e7ad409f59f77257b6467649 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/228b49805268749ab38791e44d2b008282bb32f2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/079faca3614f32d9ac0fcd6480d608d63c949650 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2a15616b779fd86f6351072d127ba97fe1245ab4 |     
   sparc     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/07f4db8eaaae0e37edc8aa73635a4fa218bc1fa2 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/37392a98a75db50e16d29dc0b658c3ad2ab84923 |     
  riscv64    |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/b75f3f6c459ba1c72f6b05a4982f7d5852c02e9c | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/ea0736efe56a741e2d65ebd013871c998689c79c |     
   x86_64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/a38fa4725e85fd34d62de65707378de96f2b6798 |     
  powerpc    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/72a5ada71e52b89ac2accc880e3d322754c3e0f3 |     
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/736ee56ced7029140d6bb0bbe1ce2842bbb88f7b | ORPH
    arm      |       tpm2-pkcs11-1.5.0        | NOK | http://autobuild.buildroot.net/results/8218776da34cc4a20663ae6737ad7727b12d8cd2 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/b41c63844f41c3c2635fc8b71c8ee7568beb8bdb |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/0209a0d1cac3b2d72b7ab39dc2322021ab091f56 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/31f83666cd1c32db109f7c9aae82124e35644fa8 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/dd42ed38f1014874b5d06a874eaa61d01bfb8135 |     
   nios2     |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/3c08b9bfabdb47f4f435e729ea5add3a92bfda44 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               libtheora-1.1.1 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/371ab4db78b2de26deba129334c06e614c950047 | ORPH
    m68k     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/c48ee84c056d2a1334ed9c1ed5d526a2c1ff61ad |     


Classification of failures by reason for next
---------------------------------------------

                     mc-4.8.26 | 3 
                  perl-gd-2.73 | 3 
                libshout-2.4.5 | 2 
              netopeer2-1.1.53 | 2 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                  janet-1.15.0 | 1 
             libopenssl-1.1.1i | 1 
                    mpd-0.22.3 | 1 
                 pixman-0.40.0 | 1 
                 python3-3.9.1 | 1 
                    qemu-5.2.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/8bfa818363703add6c92d1baed6eb38427aeb8f4 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eaf0f3548684f40bdcb4ddce91bfb599c094fec0 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/933189c502aa7cfa64fee1b66d37f701b0c2bf49 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/f318596cb85e7d4f9cc8a9eed78c82142decdaa1 |     
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/cde57868ceaa9e3b56443a12d73086e531c9a821 | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/0eddb957a6266c94e0ed9588ee192bac4d8a0ba2 | ORPH
  riscv64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/6ed75c5206db226820f929e300528e1c5330745f |     
    i686     |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/32e8e27294768139c01e8831dfaec766281566e2 |     
  riscv64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/f135b868aaec784bf81458adaa6ec0470762ef6e |     
microblazeel |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/98e8aaafa0d0b95265f0f5210db63574a8e05765 |     
  riscv64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/edbdb402ec5227cd4c11dbe394f6c5bd93ec9272 |     
 powerpc64   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/d452c450dbce4e532932fda02a8ea431c04395e6 |     
microblazeel |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/5128719c367a949a563ab63b4aefa4c464dfe401 |     
  powerpc    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/f5466e6cff3f1cbdc1474f2b256fe8b4ebe8ef28 |     
   xtensa    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/8e559e281a3b514bf9571a011e26a1763b644708 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3a2a9504e1f91892478220a5c9fd179a1586e3dc |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/8929346010d49fb0149ab7d89f39b0ec347619fb |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/5d1988452f8f4a9193a5f96d25b5dfe660b020eb |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/acd90a578ae5915902cbe8e729a9db9bdbffcf0c |     



-- 
http://autobuild.buildroot.net
