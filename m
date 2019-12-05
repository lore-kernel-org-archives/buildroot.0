From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 05 Dec 2019 07:18:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-04
Message-ID: <20191205071848.3168886F3C@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  1  |  0  | 16  |
  2019.08.x  | 17  |  5  |  0  | 22  |
    master   | 139 | 87  |  0  | 226 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              alsa-utils-1.2.1 | 16
                    libffi-3.3 | 12
       alsamixergui-0.9.0rc2-1 | 4 
                snort-2.9.14.1 | 4 
                   grpc-1.23.0 | 3 
              host-grpc-1.23.0 | 3 
toolchain-external-codesour... | 3 
                 uclibc-1.0.32 | 3 
          gstreamer1-mm-1.10.0 | 2 
                 libv4l-1.18.0 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
   openvmtools-10.3.5-10430147 | 2 
               protobuf-3.10.1 | 2 
                 samba4-4.11.2 | 2 
                       unknown | 2 
                 acsccid-1.1.7 | 1 
                    czmq-4.2.0 | 1 
                  flashrom-1.1 | 1 
                  gmpc-11.8.16 | 1 
                     gzip-1.10 | 1 
              host-erlang-21.0 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
host-google-breakpad-7515ab... | 1 
                host-m4-1.4.18 | 1 
                   i2pd-2.24.0 | 1 
            libargon2-20171227 | 1 
                libgdiplus-5.6 | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
               mongodb-r4.0.12 | 1 
                oprofile-1.3.0 | 1 
              python-pyqt5-5.7 | 1 
          python-wsaccel-0.6.2 | 1 
                qt5base-5.12.5 | 1 
             qt5wayland-5.12.5 | 1 
                 ripgrep-0.8.1 | 1 
                    strace-5.3 | 1 
                 systemd-243.4 | 1 
                    xen-4.12.1 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/700d6245bf0f5f9c804334a16d7b97fcb44622b7 |     
    or1k     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/c3faeb4b59e61be9e1febdd659037e389c25997a |     
  powerpc    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/953c5c58cffd49bb48c204c8ff9383f6676ffb1e |     
    arc      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/93cdada536ed4f48e7220b781123af9f226e43f7 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/3f2c9cdcc95f8e77a54a034de078d95eeda07002 |     
 aarch64_be  |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/5bfdfb54fc107110a439ac0147502fcb27fe7580 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/448e96fdf1af571bffa46c9524155d2a6646caba |     
    sh4      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/bab338d5f097672e7ed4bd1bd6aa1ea895e1c2f3 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/c5ecf0cde69f9ea9b069f42e018c4d35f71b7778 |     
   x86_64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/f74a38e4888a485d5c7946596b6716627ca26dd8 |     
  mips64el   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/bcfd3e1ede9c4363d86f3cc12ede874f558bf7f9 |     
  aarch64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/d71bc5f1acbab57ce470e53b7e4c36703dee6466 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/0c74720bb91c4ac92bd47dfc653810a144d8a5e3 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/284278b3652e4c9d6b52ea26cad449c4525b05f3 |     
  riscv64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/8b7a20daa8a23f361af0d07e4031d610cdc40f53 |     
  riscv64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/b49b42a1f5612a9b5f06ef165220dc8d6d84b830 |     
  aarch64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/10dbf1134473850c437f146aa6f8f27953867799 |     
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/f3de91b751dcb99659affa69a967bbc4e0f87198 | ORPH
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/640941793760720f49c795ae41c9760396dd765b | ORPH
microblazeel |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/564c1561e83e0c064f3859d25e68dec96640e060 | ORPH
   xtensa    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/f8b1b827e94f016787f57f12f3dfd65641214071 | ORPH
   sparc     |           czmq-4.2.0           | NOK | http://autobuild.buildroot.net/results/97f8e7a5d517ca3161a290646d99bd26135ff2f0 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/976939d0b72a0a01e9714c157520214bced06b82 |     
   nios2     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/23bf79ffe7d9f3a4ed740de9914fa054a852ec37 | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/4df15073b1f674cc9a9636aa325daaf63648b327 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/cd90201d90289255d5ace6ad2c1e5926e6ce97f5 |     
   sparc     |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/37a550525271cb18ef0aca1a043948e6069a8141 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6bb88bab19299d42995b136cc0945d841558ed17 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/49233157ca00578b79de971995d32daadbca4553 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/272915b58306269e98952ef3a0d636975494dc80 | ORPH
   mipsel    |        host-erlang-21.0        | NOK | http://autobuild.buildroot.net/results/248c5206655617d74a2c50ec75880cda43a8d4f6 |     
 powerpc64   | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/cd87788ffea5ae6c90f4302b21ecb928b69cf334 |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/b7debbed26ee13d48780a4f642e80b996d52b541 |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/2aa79c9715619c89eb0f7370a0730e6537da7e1a |     
   sparc     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/7e322953c8284c5c1a2da60caeef2b8479e70be1 |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/06decb411549946a63f362d5ad50ae7a55b85b0a |     
    arm      |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/8b23e962ab9e75b4274b766c5972a16bf64ce74b | ORPH
  riscv64    |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/4b80adb532c6d2d1fb17c54d17923987c5c10ec7 |     
    arm      |       libargon2-20171227       | NOK | http://autobuild.buildroot.net/results/72412a68da44d7ecc87656436a17542cafcf1f95 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e6bcdf2ca4bc31b5e70e67cf564caf13d32bfd5c |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/351c229c7d9386fd64f4e1099d6a7151285c3a4e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/210c03fce00739ab10814b0f1bb44537f1f3ff20 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d3f9ebb5a7da884dbed3fb3ea9482de0354c936a |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/baaa61ab9752e357d1c394e2f19071920e2ee5d9 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/3ea4eaabf7ace7c9881bd913079cc34577c86d5a |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a12919bc2a409873f370aa195b716696d3d618bc |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a72be0f5bae8272436fee0225d06ca2663a12a51 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/da753159ea4c54341792f1ac3449fbb78a5314ce |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d53073af6183fd9a9aa0f5233d4a17fd9ea2cb4d |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b445c8d52b480303179435b76c851983af961b00 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/28c95440ed89df6e1a316a42463868c72266064d |     
microblazeel |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/4b95bf0e1bf18b7eeb9c2192482d5699cbe44cc2 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/eb3fcd3be8d24fa64786d7967c934b8607f80b4c |     
   x86_64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/ebc806c26f24006eeb50ceabc163533b5a333a9c |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/4042f0044599a3e031a9457268368c0c59bdff6e |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/0a0cff241ceddabaaeb6b40c918f25ceec074444 |     
   nios2     | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/36113cb6f09bf0e0726e72641e7b69095798cb23 |     
    arm      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/fc1f14047f66a7636b18433443ff31767f8bc984 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/c0a30a7e02a5fcbf745c963aa2c07dbeb469cb3f |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f2cde02b8db4ab2d6a361358dbabe33243cbf2fd |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d31b4f44513eff137b872ba5e0f9396b50e28bd4 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/52dcd3559c8ca8ca10409c4c00715ee0aefa43ec |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/968590f2a71d10aede663c02bb15e984e593ca13 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/fce397f073ba7973cfd42b5a4252511cfaa49b42 |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/fa1a4d6ee1dab475774433805a41264b774a3d1a |     
   x86_64    |      python-wsaccel-0.6.2      | NOK | http://autobuild.buildroot.net/results/62a5e9422bacbff0621977ce2c45a60bbe8d1e9d |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/67b9dc66445e4d3337b987c84c0af40eea67846e |     
    arm      |       qt5wayland-5.12.5        | NOK | http://autobuild.buildroot.net/results/ad877348b9848a54ca6f757040aad88c124d1bc7 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/dd55cbfafa31260b04950e196bd5b35e4b6a5286 |     
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/c7c872eda4b1b6ffc96e5bc957bb6b53f373650f |     
    arm      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/602d50097ea2be3c6cd03d95ccdfb294aeb55a7b |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/eb7e0ed10f216ab85c2ec4f98d4bf61bdc3b3153 |     
   mipsel    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/b7a131f1bbb31b421fd5c5e35e9c23de9a0a308d |     
    mips     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/119c9752b2a5bc2eca7e76c2f03a7fe1af8705a1 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/2830e42203654aadd958551cf4d9b61615c2eed8 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/5c35d0caa4d75d77cad7c159541a0c32b9a671f9 |     
  riscv32    |         systemd-243.4          | NOK | http://autobuild.buildroot.net/results/a9a285e482285d062892bab0d1a2e2f89928c92d |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3d22ca9f866a823bf0c0e0abb3d2f711fb52d8e5 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/eda0c79f4ba0bfd3e655a502ccbe0932b5aa8839 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9c6a420eb35691649ba0fe83f84d7638c2b62f50 | ORPH
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/23d09d5c75401cde0699f08a0fa313864fff3c07 |     
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/784fe6f36459edb0fe4d5553eb7b56e776a8ca5f |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/f0c10267a4eb3d5d8a74b0f916b1efd36c25163b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/66baba0a56da23714dfbdf73421c7f3956b8542b |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c0ced63702b4ce45a70e79fb3f772938ee69de8b |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/2920e632795c1ce20497d7c2a97d7575baa5089c |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/b3a4d16666eb60d98de1cbca6fe3e75b81c1d727 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               asterisk-16.6.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/378d16cfea1800a3c1559372cdeefeac22f367f7 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                haproxy-1.9.13 | 1 
host-google-breakpad-7515ab... | 1 
         host-ti-cgt-pru-2.2.1 | 1 
                 uclibc-1.0.31 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         haproxy-1.9.13         | NOK | http://autobuild.buildroot.net/results/00ad05d137f53fa8f2da99e6a85b897684f363ca |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/07a4beb3c486e06f565ca570a9315e73d7ecffa6 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/12240bd27f4fd8821e3dbfad8d7a6bec9e1a0601 |     
    arm      |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/597e51b5b5d69ac90ecd0cce1fed847f77055c57 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/63c0e5911cb33803fe8a3f9835977492f242fbd5 |     



-- 
http://autobuild.buildroot.net
