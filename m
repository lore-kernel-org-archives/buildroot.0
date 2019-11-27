From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Nov 2019 07:17:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-26
Message-ID: <20191127071752.4DB1D21541@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  2  |  0  | 14  |
  2019.08.x  | 16  |  4  |  0  | 20  |
    master   | 112 | 38  |  0  | 150 |
     next    |  5  |  6  |  0  | 11  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 5 
                libselinux-2.9 | 4 
                 acsccid-1.1.7 | 2 
am33x-cm3-11107db2f1e9e58ee... | 2 
                snort-2.9.14.1 | 2 
                    xen-4.12.1 | 2 
               asterisk-16.6.2 | 1 
                  flashrom-1.1 | 1 
                  gmpc-11.8.16 | 1 
                   grpc-1.23.0 | 1 
       gst1-plugins-bad-1.16.1 | 1 
                      icu-64-2 | 1 
          imagemagick-7.0.8-59 | 1 
              jpeg-turbo-2.0.3 | 1 
                libcurl-7.66.0 | 1 
                libdrm-2.4.100 | 1 
                 libv4l-1.18.0 | 1 
                 mesa3d-19.2.6 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                    mpv-0.29.1 | 1 
             openjdk-12.0.2+10 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.5 | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/4a9b0e4c3adf7ce295e727658716020b02eee0b8 |     
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/b7035d87ab240e718027bc3b9797679d5e528685 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/be021f7a6023eff5f1408ea0dc2f3bba5363718f | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7521652c6eefd226a59686d7313ba8c2e20367c2 | ORPH
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/5036d2bd03df589f51f791510f35a0ce4bfa636e |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/dc09f2d722feb53c80d0cabdc6f768656c685f14 |     
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/552ce6212a74cfb6600f62cd8f6b4d1bb4b645e3 | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/0ec0fda0b0ba644adcf3af5eb3b605504ff3c0e0 |     
  riscv64    |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/46b624a41514772ce1473d356a812196a6d98c3f |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/02e9a3d55636a3ea1b4e80b7ff55748f3607a2ad |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/6fb55c3bb0f8d2a24c4f108905722725b1dd7d9d |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/d9d8b50b1aad7797e029f8e618752e3d57f65bbd |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/85741adfb7e36f47c49ffe56a3fcf239f7bcf5de |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/890b616fa4e430759614b1f5fdf08c6e8e343bb0 |     
   x86_64    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/34e9b4ed41c429a13846fdb04ad616f816b43872 | ORPH
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/b06592b863e972c522641844520196cec53810ac | ORPH
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/162bcda04a541e8afe2d7b835669f57f114de2f0 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/85dd0a2c2b78d01a3e2d5abd35def5e601178849 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/b9a491cb9932a6fdad1f704225cdf068cac29cb4 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/02eeb959e2d8489413708109c00cc2c3d49af949 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/385ff1fd4dc56ee71638782dd04db88c2ac6d9b2 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ae5382e31b2282f8b02d413d63373b8746ba2c94 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6ffc7b5e3d3a102209f9b8058487c6bde050e6b0 |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/3d6fef7f9b7b8b33cb0343513a7f0c4d977fb233 |     
    mips     |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/befe43e6d4ff4d84d44a22c14350ad444260c1a1 |     
    mips     | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/4946222932905860f3e0b7c7793a0337ea18b3db |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3b1453f2aed1aa14245f9552a7c8211f7191fde2 |     
powerpc64le  |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/be8e785e92859c04d2ba5022da27a2d1de60fddb |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/6d7de5ac81e90e06ab56fb817a728e28cb9d10ee |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/13227060dcb22130860cf061c67607f80c4af796 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/28b36858f43f9c91c784d551218bd165948890b3 | ORPH
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/79b4bef7e75df065980fba53508805dbd7c86c20 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/1690c9a4a3b7b8bb421610404b4257ba9c13488b |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/4795cab0b5b99a4b495a729fc2226ab0c36c2203 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/37411c8a5278e5a4ed9406645f83ed436be7b045 |     
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/24870a8aedeb4c6a9fa6875e1399dc7fadfce35d | ORPH
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/de4e75bcdbba59fd010b9cf75cf95f82baf1e1f5 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/19fb5b44b3c50e2da417c670274400a3915bab6f |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                      gzip-1.9 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            gzip-1.9            | NOK | http://autobuild.buildroot.net/results/0471263b57f33bfccc2681b34fc8e97eb30f2c24 | ORPH
   x86_64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/d3d28b1b18d219e53b39e7c6c792bf4f1a39dcec |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
                 libdrm-2.4.99 | 1 
             openjdk-12.0.2+10 | 1 
             safeclib-03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/26d7bc276de40022300c55b19f769c3d75245033 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/bf9913c27d014e7d3f4fe3c0ead52cf1672e960a |     
    arm      |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/f7263df5a99ee7b11427ef64b2177e348cd188c6 |     
   x86_64    |       safeclib-03032018        | NOK | http://autobuild.buildroot.net/results/056076b8f3015af25c208a22f9e0f76832b1ac28 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

toolchain-external-codesour... | 2 
                  cmocka-1.1.5 | 1 
               protobuf-3.10.1 | 1 
              sigrok-cli-0.7.0 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/a733839da95cadb26620fda6c8195e134552fbc6 |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/7d1341e7de480ce7f825c666456fb4cc3b124c49 |     
    sh4      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/c2be82193a3c17102c9951d7d31d3e2dd26223df |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/30433d1e30285d4276e42faa021fa9ddbf896848 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9fe4576a701f085fb0a6900effdb67930416f8ac | ORPH
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/860bcf90a45230fdb2167a56394e38decb33a275 |     



-- 
http://autobuild.buildroot.net
