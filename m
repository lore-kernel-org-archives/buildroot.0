From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Dec 2020 08:15:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-23
Message-ID: <20201224081553.73D12864DA@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  5  |  0  | 18  |
  2020.08.x  | 12  |  1  |  0  | 13  |
  2020.11.x  |  6  |  2  |  0  |  8  |
    master   | 57  | 51  |  0  | 108 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 16
                   rhash-1.4.0 | 8 
        host-sentry-cli-1.57.0 | 4 
            quickjs-2020-11-08 | 3 
              fetchmail-6.4.14 | 2 
            host-libusb-1.0.24 | 2 
                  bind-9.11.25 | 1 
                clamav-0.103.0 | 1 
                coreutils-8.32 | 1 
      gst1-plugins-base-1.18.2 | 1 
                 host-rauc-1.5 | 1 
                    htop-3.0.3 | 1 
                      iwd-1.10 | 1 
                 libiconv-1.15 | 1 
               mosquitto-2.0.2 | 1 
                      rauc-1.5 | 1 
                rocksdb-6.13.3 | 1 
                    rpm-4.16.0 | 1 
             timescaledb-1.7.4 | 1 
                       unknown | 1 
                upmpdcli-1.5.5 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/87097be1c15391a26cf0422b1a6b86cd8778cb8b | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/158a506105c144e3e9b836ebf92e9c30600093c0 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8f7b5330b140faebdbc9974d0b98884817554644 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e6e34925593b7450e06b1b1c677f83d0e4dc5b8d | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/46ff5908d859e10e9ad4435f0e4a09518d1dee31 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/29a7ab70bd4ff0ca0684dc384b2f1b6b905256cd | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6303d9c0c1144dbbf19085218c759867fdf87197 | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1aae7f595808cdf5a498f2506da4adee71c15235 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a30ca9b3c0b87c166d2d44f27df9450337b9b03e | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/de86453acc8d825adb24fdc244ddc32774b0df9d | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c5bd1f52932b3417d8ba4b2c8f1affd5effb277f | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6a4518f036bb8fc737f9f457eeb274592f57c3ce | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/cfc8699eec21ea0e48aa40c7a98bbbc64b8355d6 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/218b04ae12ae0cad11aa9fed5721a8d5961cdfb4 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/fdb527c0417e9c22d8c0ef77631bf782cd646b02 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5590f7d18267e41902f7adafb9d52b94e6b0a7e8 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/37d87f3e0b3a48ad6f4d61ea6d2903ba99fe59cd | ORPH
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/fd466479efbc445bd99d062409dcbff8a52cf942 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/acb58a76642c6ffd8f0b752349a6e754fc011e86 | ORPH
    arm      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/8f23a838b60e1aceb3b890c44f182d4c742396f3 |     
  aarch64    |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/afd86f512da378ee2113bad2cb5a887a264c863e |     
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/84687ab6bcbb563f348cc1b0d091fcc36a1d7a81 | ORPH
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/2dc51fe115aa6695498cf09aa55ee1ee5ea29a72 |     
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/c886fc9161af562ebd46844f07e79346def70124 |     
    arm      |         host-rauc-1.5          | NOK | http://autobuild.buildroot.net/results/2b18e2de5560832a2ea101e6124439fa4c20f4c8 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/237fec4137baa65ed8ddb91befb7e5111e74ee6d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/db8a0f7cd381476c44af660352692ab3c963efde |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1c641ac0f1fbb8b2dace2fc3caef65f7b5375393 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/97c67084a090f27535a3ced06c6d78a94a023f01 |     
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/63cc5e15070c3ce1b6fcb3f6004c3b541e65b72d | ORPH
  powerpc    |            iwd-1.10            | NOK | http://autobuild.buildroot.net/results/5d2c2f67a99bac83d2a091137be1867f60612a70 |     
microblazeel |         libiconv-1.15          | NOK | http://autobuild.buildroot.net/results/ca906e7a61e2ef7a70796edde02adad787b4d8fd | ORPH
microblazeel |        mosquitto-2.0.2         | NOK | http://autobuild.buildroot.net/results/98e0bccf3e1a964bb6a52265bd6f11a681ec220d |     
   mipsel    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/5797b158ad5e20aa26896dc539cec6256b8dd070 |     
 powerpc64   |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/a3a37e8156a77b488a1192df4be30821724867a8 |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/e82aa6077b18a4207304478ca3573977c652c5ee |     
    arc      |            rauc-1.5            | NOK | http://autobuild.buildroot.net/results/2aab3b3561ecda1f5b89967bb8c55b460df89ab3 |     
   x86_64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/e9e540d259542db860d21c27cfa58180c3354454 | ORPH
 powerpc64   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/b8f2ccf6adfbe90ab3d3f82e50cc3f9d2afa683c | ORPH
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/473e1c82dcd727a706182bd2da2f180c74cc54c2 | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/8135a558cd32a3218876c6471fb626609dc33bfc | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/9a6d23e1ff564d0932d72c6cea98d400b4aa4f7b | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/0038c1de7e8f8d8d3c051a7af813b1b61f785513 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/043dff041384be207d0c582fd564080511f2e471 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/c87c66e0a6efc7634e0645d1146bed23f616f6c8 | ORPH
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/757da3cb60f6dea0e61551752ea1c8c4688374e6 |     
    mips     |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/7c6f562863bab5b6e3ca3a2d0c70d4d8743838e7 |     
  riscv64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/3695a377430b219dbd9dd7e9ac7dfa900fc32f3e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/48634913d3a8f9a1de5bc5bf35922f74f1a66a93 |     
    i686     |         upmpdcli-1.5.5         | NOK | http://autobuild.buildroot.net/results/235bb983a6525a175ce1360f62f0967891463b38 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/aba11c815924723c501b4ee4ad9dd6934824b158 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               protobuf-3.11.0 | 2 
                    php-7.4.13 | 1 
               qt5webkit-5.9.1 | 1 
                    squid-4.13 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/a3dc2aab170064f6d674cd0613600b8a41b16bfa | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/a20c1a601f2d9cc6b3a87673579b239be5083a08 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/5ef9e41081a32ed97a2d8ce1a163562781a4422b |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/f52b976f362e7df6166a220be0f521d7bcef71d9 |     
    or1k     |           squid-4.13           | NOK | http://autobuild.buildroot.net/results/df9a12af1ca6cc320c0382b55b5068dae12dc1a8 | ORPH


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                rocksdb-6.10.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/6f5279f7f11c23443bb3da0194ad9eb1af266fe9 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                      rauc-1.5 | 1 
                       unknown | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            rauc-1.5            | NOK | http://autobuild.buildroot.net/results/1483a0f0b1f448253453f17ef15053e1db4ab634 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/282796edb788f53cddd27b000ca7de22b6e8536b |     



-- 
http://autobuild.buildroot.net
