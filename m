From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 04 Sep 2019 06:16:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-03
Message-ID: <20190904061629.37E888783C@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-03
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  3  |  0  | 18  |
  2019.05.x  | 22  |  5  |  0  | 27  |
  2019.08.x  |  5  |  5  |  0  | 10  |
    master   | 130 | 64  |  0  | 194 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.35 | 2 
               host-qemu-3.1.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                p11-kit-0.23.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/2707ef7e1a10b20fe4f1b0730ba0a3df10e288fd | ORPH
    arm      |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/a037a783806b0b8eeb1ab6b89b3a8c0f9e68edd0 | ORPH
  riscv32    |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/0d8e7454c17900872a3d40a7a3b5b93c9a8f75ac | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/37863bda55beae19348e73845683bbaad8900544 |     
microblazeel |         p11-kit-0.23.2         | NOK | http://autobuild.buildroot.net/results/9391b6a4e768d97cd991338985fcb2fc7762755d | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 15
                  giflib-5.2.1 | 8 
          host-capnproto-0.7.0 | 6 
               host-qemu-3.1.1 | 5 
              micropython-1.11 | 5 
                 apache-2.4.41 | 2 
                    flac-1.3.3 | 2 
                  flashrom-1.1 | 2 
                      icu-64-2 | 2 
                 libdrm-2.4.99 | 2 
                    mpv-0.29.1 | 2 
                       unknown | 2 
                  cmocka-1.1.5 | 1 
                    ffmpeg-4.2 | 1 
              host-cmake-3.8.2 | 1 
              host-gperf-3.0.4 | 1 
              jquery-ui-1.10.4 | 1 
               libupnpp-0.17.1 | 1 
                qt5base-5.12.4 | 1 
          qt5multimedia-5.12.4 | 1 
                suricata-4.1.3 | 1 
                    wampcc-1.6 | 1 
            wpa_supplicant-2.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/97ea5b275054c504546bdd0af25463c1d20ab89d |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/a712b6117aa4bb66372a0934fcd539a9bb467087 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/c3751675c4164dc08efaac174a9de7f54b91627a |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/4cc6aa6cea2cd8ce46f0d19f147c02c2b8694242 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/e7b94ce474a4f4db1756eb5fb6d166a03ffaa7a1 | ORPH
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/b94b8cfe347862969318b1746580e7f77e6ec393 | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/d84b4c3b1667fa53fe442743aaeb5921ab06765f |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/32d4e8f6c7b755ab8a939ad8138288b8307db913 |     
    arm      |          giflib-5.2.1          | NOK | http://autobuild.buildroot.net/results/a558f21cb1d9ad8618a1c64464e0cf1ccba7608b |     
    arm      |          giflib-5.2.1          | NOK | http://autobuild.buildroot.net/results/ea3ad83fcf7e87a2c5081d5380aae3da9e7610a4 |     
   sparc     |          giflib-5.2.1          | NOK | http://autobuild.buildroot.net/results/7b58bd574ff93e822e3dad193c11aa487080a7b9 |     
    m68k     |          giflib-5.2.1          | NOK | http://autobuild.buildroot.net/results/241f5e1b390ca3d4e810533b11d99288825eec09 |     
  powerpc    |          giflib-5.2.1          | NOK | http://autobuild.buildroot.net/results/47fb9aee24f0fe28d5080e0e4b240716abe2b760 |     
   sparc     |          giflib-5.2.1          | NOK | http://autobuild.buildroot.net/results/18085aceee8064a1aa0ec9977c3c07c5184f7c30 |     
    arm      |          giflib-5.2.1          | NOK | http://autobuild.buildroot.net/results/a13f4e997e4caf4120761025ab5b53c99b4ef783 |     
 aarch64_be  |          giflib-5.2.1          | NOK | http://autobuild.buildroot.net/results/b9c84769cba3114b291b9605b25a489aa1615396 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/a1eab7565b6a0960b5ba3efab5857cc7acf2a787 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/dce76394555ff176314b524ea64649eac1630206 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/2eec9410a70b9596915ea5c9136191419d47ba6f |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/f0936388e4f76d8de77c3c2e7919ada0ec5374b6 |     
  riscv64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/136455968b4c063b46ef5e4ffc95f8ce53baab2d |     
   x86_64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/b588e36a074ef1c1a8af448e8c6e12ac7000c760 |     
 aarch64_be  |        host-cmake-3.8.2        | NOK | http://autobuild.buildroot.net/results/17d5cbf664486557aa6f8a16f28484063640b3cb |     
   xtensa    |        host-gperf-3.0.4        | NOK | http://autobuild.buildroot.net/results/3f68d07639f8fb804151717be15eb742bfd3d1f6 | ORPH
  riscv64    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/cb7229aab3033c23e9ea560c569d29d85987ebc0 | ORPH
  sparc64    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/32c8d4820ce0af86815672af4c5dfdbb82d0c8fa | ORPH
    arm      |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/1d037a98bdebd5de244f7ab0b273d4c4f7619a40 | ORPH
   mipsel    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/6d8100512c16643b4da6e190cd710b165a101b2c | ORPH
  riscv64    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/1ca537dcd4a11905977bbf69e70bd4a96731b0ac | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7496336dbd7571f97063f93ccc7c16e493976c14 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e9957bfef937eeabb818198ebeeb69303d30c0d7 | ORPH
  aarch64    |        jquery-ui-1.10.4        | NOK | http://autobuild.buildroot.net/results/b4e81d048386e04fbf934316a9ddf6ab72efa4f3 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/179c2bdfd963ba836ca8381fe6589a4c018e558e |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7a8d001e44760ac9bcb864860f85875c73177546 |     
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/471cfa2d29a15e24f3dde65b76ba5e8df2e19904 | ORPH
 powerpc64   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/4ce3db9e6cbd52f2756774630f0163ce2c97610b | ORPH
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/aa32d81085b1e7505fb044ecbc18051375465491 | ORPH
   mipsel    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/e20c6702223bf70cb2e53dc06e84c906ab8fddf0 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/2b7f2ee3460b28a5583f5e2fef08cf4463d7f919 | ORPH
 powerpc64   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/b7e350485fa7a6970ac28267d0de2c378943e79d | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/05b69bc9c26dda9fe58be249ab06bf6da04bcc50 | ORPH
    i586     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/4b4dc3dd77dd24a2e62151bb4b8b10c2b2aab86c | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/c3994c10ea16b17ab70748236cb3992a1f023138 | ORPH
 powerpc64   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/3971b903720323ed3c852b90806799613aa31389 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/035f3c66b8ffc804410dbb39c99538bdc54b6e16 | ORPH
   x86_64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/cba2d809aeb4b846c0604e9f3473cc43805320a4 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/bb8fc67058a4ba028086d55376cbac1692fe6f45 | ORPH
   x86_64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/cebbff76cc10d27beb3dc6680cb6091591c3fe55 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/dc7ae50885fa911df98cd5b7398a66aa2392521f | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/822ba2aef9983511e00d38cfa495372a63044751 |     
  mips64el   |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/5fe3290d20615464a8dc8f96c7eb8d67940c3f2d |     
  sparc64    |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/01da2ad39ea01c522fc5b431c4544bd91f58ac4a |     
    arm      |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/88ad0a37bff875784c70ab1dac79c971c1ab7a34 |     
   nios2     |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/af5afc4b22734bafa879ba3fe149f1d8361b30ee |     
 powerpc64   |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/36c8948d5ca15f78c75f282377c2e459fc16dfef |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b86a026200294a49c2aedc4671a5e89775d4f913 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3cf5e5e1142867abb20c419f9abc3bb2b2049c01 |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/b0c2daa6c71aa33dc905dc6b68d1012d0abb15de |     
  mips64el   |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/8a0940fde45797305efbdb0c4bbee9400ec1e3ba |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/ab0a02d386669ccbfb2dc038e237df933ed7ca24 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b34cc7fd45a97d3392806130127b53330519b3ff |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/51b6fce589b5597301ac69dd653b5e9128663ed3 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/23675079610ac62d668af138fbc1e479a996b385 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/39994b465be7361580d0422f7cac655517cc68b6 |     

Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 2 
                    ffmpeg-4.2 | 1 
                      icu-64-2 | 1 
      intel-mediadriver-18.4.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/648ca443c3ad9c539fbb0da430f77ec34ccbcad4 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f746673b33ee87e820875546f49726dd5622075c | ORPH
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/a86591959b3b0bec9fc69152ae919388ccd6aba4 |     
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/561f1108d807155320b4e6127f01bf3863f92ca3 | ORPH
 powerpc64   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/cfc9bb7d9051141fe433d06aa2bd0bea55214d1a | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.33 | 1 
                    qemu-3.1.1 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/1d90abdaeb61cc1fa7c7f86b53b7a167f318ba99 | ORPH
  aarch64    |           qemu-3.1.1           | NOK | http://autobuild.buildroot.net/results/2c807a20b80773a7fe266d91805d982ff182553c | ORPH
  riscv32    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/6433b31fd9fe3219d7293a22ae20b58b9545f4b8 |     



-- 
http://autobuild.buildroot.net
