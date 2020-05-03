From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 03 May 2020 06:26:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-02
Message-ID: <20200503062654.4716B86FD5@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-02
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 24  |  2  |  0  | 26  |
    master   | 143 | 87  |  0  | 230 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     python-argon2-cffi-19.2.0 | 11
              exfatprogs-1.0.2 | 8 
                    atk-2.33.3 | 7 
              ibm-sw-tpm2-1563 | 7 
                    brltty-6.1 | 4 
                   gssdp-1.2.2 | 3 
         host-exfatprogs-1.0.2 | 3 
                qt5base-5.14.2 | 3 
                       unknown | 3 
                  assimp-5.0.1 | 2 
          gstreamer1-mm-1.10.0 | 2 
               log4cplus-2.0.5 | 2 
                  ndisc6-1.0.4 | 2 
                 openal-1.19.1 | 2 
             paho-mqtt-c-1.3.2 | 2 
                      tio-1.32 | 2 
               apparmor-2.13.4 | 1 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                  c-icap-0.5.6 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
                      fio-3.19 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 gnutls-3.6.13 | 1 
      gst1-plugins-base-1.16.2 | 1 
              host-grpc-1.25.0 | 1 
             kismet-2016-07-R1 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-20.0.6 | 1 
                    mpv-0.29.1 | 1 
                openblas-0.3.9 | 1 
              python-pyqt5-5.7 | 1 
                 qt5svg-5.14.2 | 1 
             qt5wayland-5.14.2 | 1 
                    rtty-7.1.3 | 1 
                  rygel-0.38.3 | 1 
                thermald-1.9.1 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 
  xdriver_xf86-video-mga-2.0.0 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/d8b6f465b1e1dd6155e7f622b2f1c3363fce82df |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/52f3c83a00f3e4b25ddd6c7a6d5df1fb3d1a69fb |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/27beeec57361f0fc529f22155374e46a65d81327 |     
  riscv64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/758ba9b93388775d5d90d0978c086e69fd95aa38 | ORPH
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/434c5a04abb3e7317b5ddd90e6fbf5f73bf02d8b | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/c79aeb1000994be692a28da3d79dde38ccffdd1e | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/90a422419030f9e4408f2783d9e0e5c1f8922b66 | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/d104b98b5b3c840077e78bdb65b590284db01d1f | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/fb5edc214e2aafdeaa97e360eeb8ef28544699e4 | ORPH
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/faa5f80d8850d4b4143a07984bb72e730d585844 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/a1ddd75895ea045e776b0a5da7fae2e6c2e45e06 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/50381e08273885f752f48a9eef8a60d316dc2d81 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/8146244a4784a2af400ef19fdd1c5ac42ab6c64e |     
microblazeel |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/faebfb8f72e8c7a15de8b81a483d8238f92d2fd9 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/f8af18f8da1cf08d745713e890fa988b1dedc271 |     
    m68k     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/f814e0b4ffa47dc92d71c7ed896ed13ac359beaa |     
   x86_64    |          c-icap-0.5.6          | NOK | http://autobuild.buildroot.net/results/e6aefc543d723599cc0b350413195841a8c63fdf |     
  aarch64    |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/e6de9d6ab7eb04248e5c642bf85715fdf6972f6a |     
 aarch64_be  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/fef34d171ee8570fe4002a7e4d2eed5633f89291 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/115a63f2454e0a0c0e74a29f85f996e7882af4cc |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/a4fc5076a014a6693f85f93a634cdcfca2327ef9 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/67b3a52bc047200f9c203dc28eac2d6230edd287 |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/1bfa76261816e587d6e66098a0fe862176d2e8f3 |     
 powerpc64   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2d1239c751d22b567390fd80483d74c3ec6613f9 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/abd095491c5579f94a1653ca6b13dec48974d989 |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/c672290b37e7c4a43e66c5816d17c818d1c67890 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/8f88b23805b789a5e14b778faeb5b99ae3a5f23f |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/da05cc15ea03391b605eff8087fd367945c5bf79 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/15f01b2a0772a355481e6affdf084fc18eab92f6 |     
  riscv64    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/4b306418c1f24be7ddb792caf9967e62ec47417b |     
  riscv64    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/2f3f0e2622b52ed775a08b2e7dd8d85c4a1d0981 |     
   mipsel    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/102cd0ccdf7d2661f5d12c45cb40db002e961e50 |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/e361ad9848f5a03a20818a965d43e95be91ae1c4 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d2b511dfac162fa089e401ccc114125864ea9eb8 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/647fe3be2f2c5b3f3c7d44afb3f024f41cd919ae |     
 aarch64_be  |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/d878e26807eb86901d52a839b1394e444bdc2e53 |     
  powerpc    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/e094877642fc0f02b82d2e0562decd768c298061 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/e9e47fdecd1a81559dfbf8c43f464a686768cacc |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0c6f37a2179e35e1200dcca2cf398a84b31ebded |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f5b74e136b75e8f0d22609a7bacbc0c14f22bbf9 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fe3affdcdd85a87a4847f3d7979d821b30353570 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9088b2661f20f64c317b2e75878a6635ea1d6c8e |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e9b793ff99dc0772e70de7ee675cd3ea52219c64 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3b72035bd21604d4ff7c5e9cc3230a1a73961247 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/90eb777c879dc39f8a494fe73ac3358082e54ff2 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b296666d55758d37964b8581ecea2d41779d4f16 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/a085095e14136bf8fd7149203ce5b8fd67a19613 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/3982aadae8ad55781697c38897504111ec6423ce |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/dea6789985bcc6e532c90b81e5fb13af65f39ac2 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/2e01608482a6bb5437fd44f498d40b582b5f5178 |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/f7aa81616e2306b585d9fc9b1d0515df79c75db5 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9b78b372dcfc46f404f367355d939ecda3774736 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d918786184ac7d37d24282ed2c967d8819e3680f | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/056255eb80d36b3daa68d868282947b9bae1464d | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/be23585fed2cb2ddb5e888e63314295fe7f8faa5 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/d6a1e6eadd76fbeff37d01856a1fe7dd42df9f98 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/557f96136a8b56fa66abb94046149b7a981366ee | ORPH
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/0113db6c81013242925d17c22757c10f372aceac |     
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/6af45203dd0a65cd695b01a560e00c0e2d21f165 |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/c8c4c5771b7717e66296462272ca9583d0a1ceaa |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/31681b9a0d92a67d4d133ed9aee32a6713fd75fa |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/7c658f2583c9f00c50cc3edd9f9c9ebc294f02d4 |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/2005e489e08dde4e39a669a8701330f996498231 |     
    m68k     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/71866bdb501572e82ad725c503816c525de5f431 |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a52881fd77ee878a8bdc502d5cd19d6a53170085 |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/9687bb3070da4be0febf503a1cefc7e85023fc71 |     
 aarch64_be  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/642a04dd3625d6a73f3c2b07aa677c588d1f9d0b |     
  sparc64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/7c2151c31e1d4446a138ee64cebfa6960e76c60a |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/81e76036f877ae84ecdbcaab5cc1377c68c6b60c |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b56bde9450cc1f9fc41a485a6c4d6e7b45356951 |     
  mips64el   |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/f90421fa27ab3bd485d7f958c164eb1a42b05ebf |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/bcc1cb612afaf22f96a1744de9872db4854da6ac |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/0fda4015884246a27d5e1b4f1c5c44fb61b0ae6f |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/471504e8e62a13a36e261ce3e640e2b7527a8dc5 |     
    i686     |         qt5svg-5.14.2          | NOK | http://autobuild.buildroot.net/results/b36c74ccd96ef3f06ae58ff3e1b486747be13a26 |     
    arm      |       qt5wayland-5.14.2        | NOK | http://autobuild.buildroot.net/results/c04d829ca2bc4ed9a5b2b4ce9138b44bd2ddd460 |     
microblazeel |           rtty-7.1.3           | NOK | http://autobuild.buildroot.net/results/61de143cdde1f0a9e734f46e9c68ce3504989890 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/fb9c4a9c503b02125e6f3f13bfc46d5e0c3d7746 |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/192b853383319491a7a6703f4694d78a5d6f7c31 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/dab88268d62e5d8a5b4e3403289ea9762e6925fb |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a9b969c96935eb753438cd9cb6c67410f9cf96c8 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/9de33990ce7b12e0ff626b695766c3c8f5d3c2ee |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/b29f5b20d3a3d83ed58961d9e5d1ff4a08a50809 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/faa057b36758d0a44b6121a54e08352882a4d35f |     
   xtensa    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/d57095e475432b572f8bea92ec91592578127dd3 |     
    arc      |  xdriver_xf86-video-mga-2.0.0  | NOK | http://autobuild.buildroot.net/results/fe8919ed9d5c2617489dc1aa48ac95a489e1bdfd |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/5a8ba8a15f4e8b4ad7b2d93f335a8acc8e8b3690 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054355  |      
                      beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054357  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054468  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054466  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054523  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054588  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054590  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054620  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054757  | ORPH 




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 1 
             libopenssl-1.1.1f | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/aef0c5dbafea9746b130d56593f8642154f688c9 |     
    m68k     |       libopenssl-1.1.1f        | NOK | http://autobuild.buildroot.net/results/ea778b6b6aa914d575475ee8d92a49a38e05f2a2 |     



-- 
http://autobuild.buildroot.net
