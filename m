From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 06:18:04 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-13
Message-ID: <20191014061814.0D193867A1@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 23  |  1  |  0  | 24  |
  2019.05.x  | 19  |  4  |  0  | 23  |
  2019.08.x  | 23  |  1  |  0  | 24  |
    master   | 130 | 88  |  2  | 220 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 14
                    bird-2.0.6 | 11
             subversion-1.9.12 | 11
                clamav-0.102.0 | 8 
                elfutils-0.176 | 6 
                 mesa3d-19.2.0 | 5 
       gst1-plugins-bad-1.16.1 | 4 
                      icu-64-2 | 4 
           libwebsockets-3.2.0 | 3 
                  ffmpeg-4.2.1 | 2 
                  flashrom-1.1 | 2 
                 host-icu-64-2 | 2 
             libopenh264-2.0.0 | 2 
                  cmocka-1.1.5 | 1 
                  exempi-2.5.1 | 1 
      gst1-plugins-good-1.16.1 | 1 
host-google-breakpad-7515ab... | 1 
           host-harfbuzz-2.5.3 | 1 
                     host-llvm | 1 
               host-qemu-3.1.1 | 1 
              iputils-20190709 | 1 
                 libdrm-2.4.99 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
                    mpv-0.29.1 | 1 
                       opencv3 | 1 
                    strace-5.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
          xlib_libXfont2-2.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/e42a8d2b6a92d9ea6b0842e7299a004cc780ab57 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c80c44c61c0896ee608b5273f7e0a87bb69898df |     
   x86_64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/7d9bb0b0561661f7b60b29993965b4d707fd6cf6 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/f4263652dd12c626d0ab56ca8bf2dd1970456c08 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/54193e37e13f2016b013fa6bbc849e0af6b9883f |     
   x86_64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/408426efe2f7fbfd241fef9cea0c70c9d3e7e038 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/a36f12e1716308cbb920caca6caa003d61eeee15 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/901e8bf8f68c9833537476e0c5ce152f4d65eda9 |     
   mipsel    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/8066a3aa75466efe5dac6ff90e6385d34774dab8 |     
    sh4      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/173780dd21d5bc6d6aeff507b99464240a55c4c0 |     
    arc      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/cd0b2fe2e35de228d4da014cf8f44b1ea3c90717 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6519940e6d0cba86537831219955925dd6c75bd3 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fc832e5fd6de9279d006715e9053bc23412bf605 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/62ab37421d330cd2499cf40b1b3a079d20760bf1 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c8617d33fad9e789c4e9564ac066afbd3179cf57 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b039cd2589badde2781607340643643a44e110eb |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5a38fd1f31dc3f1b7e943eef0e21c6035d65f060 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/33151a629332c1ddce6c34948d2531444e24266b |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/23701222e2198477eda2baebf87a86df17028698 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/baa378e451bab872b6e8d3b3e4371646b058e58a |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3e142f09a40ad62b7f8ff1ab76518bbf9dc0ec0e |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9e7b61f5a05b5ae3e4a1d695b410818384535e2b |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4134e56e02d69837fbad0fb5b29112510df05847 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e22e1acc700e092d880a03a72b399c3cac0ad18f |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/16fa6dd5cf1ef2db7548fda29a01cccfaa6e84a3 |     
  mips64el   |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/a87b8b5b8fb2305a8d3eedd2be0d7a0a9187f10c |     
  aarch64    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/e562bdddd1b74fde61f57dcf6991113c105d6269 |     
  powerpc    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/6ab45eb0e2a49e0da419fa4cffb3cecfcd1ed2d0 |     
    arm      |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/c3b89c19b3fe300b66d7cbd62ee95abf5b08baa6 |     
    i586     |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/9c9b97c6ea5accffe0da437e41f7cfc6e379ecd9 |     
  sparc64    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/cbec5c4ba262132e67914421ce9b6f16d4cee4c6 |     
  mips64el   |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/7b8e6c1663c2224f7a92c5a7802345fd44db3689 |     
    arm      |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/6ac02362ce330dd9e6813cc5bbbb0712a5c27e67 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/54eb4156060f8db783b3414a6ab8557757ab79f2 |     
   x86_64    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/92a1ce4421bcbcf90b67fe5d279b59ac38e5b8bf | ORPH
    arc      |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/9c60ad3d32cee5c2df36921c81c084e75739c778 | ORPH
    or1k     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/e936f7702106544fa65b29b075f055a1bc9f2b37 | ORPH
  powerpc    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/12850c1e759f370224f145ee22afe5b8be45b4c4 | ORPH
   xtensa    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/81608be3e2ac2e914ceaf296570783ec6eea9805 | ORPH
   mipsel    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/3f7e0d0058ec998cf01d69befc1d0c960fb03e38 | ORPH
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/283fddd3e5c1bd3e0ea843bd582491e68a47f1e9 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/c8638dd8c98ec14c1e77bf3450e0162af2bf26f4 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/7ae5ead460645960d04f9226b816955f0a517495 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/0ca42fc35d224cd850e7915ffabc03144584e6d9 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/c3d8917bb74a3897a4ebb6c4c685208d7734767e |     
  powerpc    |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/70627186e08a84ff38d515f06c6d5a24653b3a90 |     
  aarch64    |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/afdf9f22b6eb227d0f8eba1338db93d975b56f3a |     
    arc      |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/f601c4a2657780ebf4fd27e31d42104441b27651 |     
    sh4      |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/68f1c67fa956b11904a7a6bc093e572d31e58807 |     
  aarch64    |    gst1-plugins-good-1.16.1    | NOK | http://autobuild.buildroot.net/results/6b612c9b5682f3b694cedcfa6c4b6ba9e19f45e4 |     
   mipsel    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/666916386b1c3cc93687c8067007aebe1659d11e |     
   mipsel    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/60f30ede3b0504cc846fc5c0d4b49c5d35430a2f | ORPH
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/a1172a9570be144ade11ebaf53b9c72deab03486 | ORPH
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/0e4aacd26005578f45a5e49614bce96bd69f8457 | ORPH
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/333f8e8f8e39efb2e43ad3b7c3ae692f09b171de |     
    i686     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/852ee0b0f43a4860f52f3674400e4c2dc7388f21 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/2e7484093a70e730f530eca74fc7dce9519cd7d2 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/6a744d73cac0922ed72fab6256a60ef122d953e6 | ORPH
 aarch64_be  |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/40bdf5ba16dae48560c919671dc7c094ce00f0b3 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/9dd38c8b96f26e376ed5fbf771d23e9656cccc09 | ORPH
    or1k     |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/b28085a452ba0231fad8e0d70cb37c562cba44c8 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6dd76ea861a0a864c8d9147ee59d0da130e3cf72 |     
   mipsel    |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/55f888f0474f442d931e2d98cd2f592c11644c83 |     
    mips     |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/1ec0c65d523568aeb016f931316cc366228bac25 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/a6d56ac1536d350d01d4e357998f30bf20da44f8 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/d5f2b201050558df4c9b0ceb36e03085db4a1eb3 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/038187ed4de7243e5bdbe3a44483a09530a26c6b |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/471a041e5c95574cf174a3c22ab27bb8477ba827 |     
    sh4      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/a6df410ad13fd6c506bd442ea862087d8c508c4b |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/fd44a8ca24c767f8bc9cb72a89ba00038c63b26e |     
  riscv64    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/acfcee9b7738fdf7faedece956ccb0633aa5cc63 |     
    arc      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/62e62f990df8783c056f0ba05de4274a1fde6cb7 |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/8ea703a2d432ba9e23f4272bce4c697c13064419 |     
  riscv64    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/af2730cec6e12716d8f49aa427c38f390b27db0c |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a0f8ac9e200fcf9f36052fc83b75a17fd65e58f7 |     
    sh4      |            opencv3             | TIM | http://autobuild.buildroot.net/results/230e781f6ad0b47e2d0825484bc6db407c8e4c49 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/bad188a5831ed15c4ed201a60e6ef0f66bac0e36 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/46fb39e95766ce8e0df5fb72d21b8e6e5823d622 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b08b2126ba668fa61ac5c78defb320e8c379290c |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f50c0ed1e83156030d2fa3fb2209f137aab9d378 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b8dc25169da2ebbbad609ca71ead2d4944a6572a |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b7bd2a45bfa79af0e66449fc84e661e0b6b767b8 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3893f96f9074424467bd22fa68150ce434bc285d |     
 aarch64_be  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2a5d39baa2d8ed1f6f337caa8ed2f1b15e9837a5 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8ee15b979dcb45db3527181820fd2001488a1656 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f6355b31300e03ebbe1de2be96e7e34ac9c84fbd |     
powerpc64le  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/0738c094997f007f986d2232dad9a8d996d260c7 |     
    mips     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/26581962daa2a53b5a4c3224b9f68532bf337e07 |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/74b58f8644117b7366df7a2e5934345e3aa0941c |     
  riscv32    |      xlib_libXfont2-2.0.4      | NOK | http://autobuild.buildroot.net/results/52e9c7760e733d0a13dabf58c3dc0b22d916f19c |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/a7d2636eeb6f6e55e325625b17ebdb4839589667 | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.18.0 | 1 
               host-qemu-3.1.1 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       host-grpc-v1.18.0        | NOK | http://autobuild.buildroot.net/results/2d6949121d78ab21e63295ff3f4a318f09903858 |     
    arm      |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/c97232fdd0ec7f7840c124fa4d2a4d64a37fa82a | ORPH
    mips     |  vdr-plugin-vnsiserver-v1.8.0  | NOK | http://autobuild.buildroot.net/results/92b76557d951e61513fa461c84fe6448bbe8d88e |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/910df7b1a027481ddffc42d560f6adceede9a30c |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

               log4cplus-2.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/e02e3a44beaa0de7d816f83cdba0ec6c87c58dc0 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20190703     | 20190816     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.4        | 1.1.7        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.0       |     
                       aespipe |  DISTRO  | https://release-monitoring.org/project/21320 | 2.4e         | 2.4f         | ORPH
                       alljoyn |  DISTRO  | https://release-monitoring.org/project/21665 | 16.04.00a    | 16.10.02     |     
                   alljoyn-tcl |  DISTRO  | https://release-monitoring.org/project/21666 | 16.04.00a    | 16.10.02     |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r5    |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.800.1      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 5.0.0        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.5.1       | 16.6.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.34.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                        autofs |  DISTRO  | https://release-monitoring.org/project/00140 | 5.1.5        | 5.1.6        |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2019-10-07   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 0.6.0        | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.10      | 9.15.4       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.31.1       | 2.33.1       |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.1        | 3.4.2        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.19.0rc1    |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.1.0        | 4.3.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.11.0       | 2.12.0       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.2.2        | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 1.1.3        | 2.0.1        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.111        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.39.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.39.0       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.30       | 1.4.31       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20190315     |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.8.2        | 3.15.4       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                       cppunit |  DISTRO  | https://release-monitoring.org/project/09543 | 1.13.2       | 1.14.0       | ORPH
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.1        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.25.6       | 1.25.11      |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                         dav1d |  DISTRO  | https://release-monitoring.org/project/18920 | 0.4.0        | 0.5.0        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.8        | 1.2.12       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9          | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.1.0        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20170509 | 1.3-20190808 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 18.09.9      | 19.03.3      |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.20.1       | 1.25.0-rc2   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.6        | 1.3.0        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 18.09.9      | 19.03.3      |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.7.2      | 2.3.8        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.7.2      | 0.5.8        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.14       | 1.8.16       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.2.0        | 9.10.0       |     
                         dstat |  DISTRO  | https://release-monitoring.org/project/00630 | 0.7.3        | 0.7.4        | ORPH
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | v18.32       | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/16911 | 1.5.0        | 1.5.1        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.1       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.09        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.176        | 0.177        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.20         | 0.24         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.1.3       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.8        | 1.0.12       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.4.2        | 3.8.0        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.16       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.3        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.26       | 1.0.30       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.14       | 1.0.17       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.25       | 1.0.29       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.0.25       | 1.1.2        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.13       | 1.0.16       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.34       | 1.1.37       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.2        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.21       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.2          | 5.3          |     
                         expat |  DISTRO  | https://release-monitoring.org/project/00770 | 2.2.8        | 2.2.9        |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/14689 | 1.12.0       | 1.13.0       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                       fdk-aac |  DISTRO  | https://release-monitoring.org/project/16208 | 2.0.0        | 2.0.1        |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | v0.5.5       | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 3.2.10       | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 5.3.0        | 6.0.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.11.2       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.3.2        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.28.1       | 3.33.4       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/08735 | 2.2.0        | 2.2.2        |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.22.0       | 2.23.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.63.1       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.6      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.3.5        | 0.4.0        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.9        | 3.0.10       |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.7        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.7.13.3     | 3.8.0.0      |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.9        | 3.6.10       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.11.4       | 2.11.5       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.5        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.23.0       | 1.24.2       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
               gst-plugins-bad |  GUESS   | https://release-monitoring.org/project/21849 | 0.10.23      | 1.16.1       | ORPH
              gst-plugins-base |  GUESS   | https://release-monitoring.org/project/21850 | 0.10.36      | 1.16.1       | ORPH
              gst-plugins-good |  GUESS   | https://release-monitoring.org/project/21852 | 0.10.31      | 1.16.1       | ORPH
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.1       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/21854 | v0.6.0       | 0.6.1        |     
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.1       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.8.0        | 1.10.0       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.4.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.43.1       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.0.5        | 2.0.7        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.2        | ORPH
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.6        | 1.9.8c       |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.8       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.328        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.7       | 2.1.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.24.0       | 2.28.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 64-2         | 65-1         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.8-68     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 18.4.1       | 19.3.2       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 18.4.0       | 19.3.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 18.4.0       | 19.3.0       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20190618     | 20190918     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_487        | 3.487        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.2          | 7.3          | ORPH
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.5.0        | 1.6.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.18         | 0.21         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.18         | 0.22         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.12       | 1.9.13       |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.10         | 0.11         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.7.3        | 0.7.4        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.2        | 2.0.3        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.18       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.63         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-09-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.4-Leia    |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.3.4        | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 2.5.6-Kry... | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 3.4.5v2-K... | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 2.4.14-Kr... | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 1.4.8-Kry... | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 2.4.7-Kry... | 4.1.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 2.4.14-Kr... | 4.6.1-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 2.4.19v2-... | 4.2.0-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 2.4.13-Kr... | 4.2.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 2.4.3-Kry... | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 1.4.7-Kry... | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 2.8.6-Kry... | 4.1.1-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 3.6.10-Kr... | 5.2.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 2.4.12-Kr... | 4.9.1-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 1.4.9v2-K... | 3.2.1-Matrix |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 1.3.0        | 1.4.0        |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                       leveldb |  DISTRO  | https://release-monitoring.org/project/09338 | 1.20         | 1.22         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                        libcgi |  DISTRO  | https://release-monitoring.org/project/21164 | 1.1          | 1.3.0        | ORPH
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                     libdvdnav |  DISTRO  | https://release-monitoring.org/project/05615 | 6.0.0        | 6.0.1        |     
                    libdvdread |  DISTRO  | https://release-monitoring.org/project/05614 | 6.0.1        | 6.0.2        |     
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.0        | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20190324-3.1 |     
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.7.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.0       | 2.63.0       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.22.30      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 232          | 233          |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.6        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.14.0       | 1.14.1       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.18.2       | 1.20.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.3        | 1.1.4        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.22.6       | 1.24.0       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.46.1       |     
                      librsync |  DISTRO  | https://release-monitoring.org/project/06309 | 2.1.0        | 2.2.0        |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.0        | 2.4.1        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.19.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20190315     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20190315     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.68.2       |     
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/15633 | 0.9.2        | 0.9.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.8.4        |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.16.6       | 1.18.0       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.5.0        | 2.6.0.pre1   |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.5.0        | 2.6.0.pre1   |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.4.0        | 1.4.0.1      |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/03531 | 2.44         | 2.46         |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.04      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
             linuxconsoletools |  DISTRO  | https://release-monitoring.org/project/01827 | 1.6.1        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2019.10.11   | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                        luajit |  DISTRO  | https://release-monitoring.org/project/06444 | 2.0.5        | 2.1.0-beta3  |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.30.1-0     | 1.30.1-1     |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.183     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.1.0        | 3.2.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.18      | 10.4.8       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.20       | 4.8.23       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | v153         | 164          |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.12       | 1.5.19       | ORPH
                       memtool |  DISTRO  | https://release-monitoring.org/project/21747 | 2016.10.0    | 2018.03.0    |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.51.2       | 0.52.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.34.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.0.1        | 5.1.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.0.1        | 5.1.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.8.2        | 2.9.0        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2019.03      | 2019.07.1    |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190116     | 20190618     | ORPH
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.10.4       | 1.10.6       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.3.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.4.0.198    |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.14      | 0.21.15      |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.1        | 2.4.2        |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.1.1        | 3.2.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.4        | 1.1.5        |     
                          musl |  DISTRO  | https://release-monitoring.org/project/11688 | 1.1.23       | 1.1.24       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.4          | 4.5          | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.14         | 1.14.1       |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20191012 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.3        | 1.0.4        | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.203        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.2       | 1.21.2-dev   | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.20      | 0.52.21      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.0        | 0.9.2        |     
                         nginx |  GUESS   | https://release-monitoring.org/project/05413 | 1.16.1       | 1.17.4       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                         ngrep |  DISTRO  | https://release-monitoring.org/project/02084 | 1_47         | 1.47         |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 10.16.3      | 12.12.0      |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                 nss-pam-ldapd |  DISTRO  | https://release-monitoring.org/project/21868 | 0.9.8        | 0.9.11       |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.12       | 2.0.13       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.129      |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          olsr |  DISTRO  | https://release-monitoring.org/project/21543 | 0.9.6.1      | 0.9.8        | ORPH
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.2.2        | 4.2.3        |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.2        | ORPH
                       openpgm |  DISTRO  | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
                       opensbi |  DISTRO  | https://release-monitoring.org/project/21804 | 0.4          | 0.5          |     
                       openssh |  DISTRO  | https://release-monitoring.org/project/02565 | 8.0p1        | 8.1p1        | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.0       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.5.0        | 3.7.0-rc1    |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.5.0        | 3.7.0-rc1    |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.5.0        | 3.6.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.5.0        | 3.7.0-rc1    |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.17       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.29       | 0.4.30       |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.18.1    | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/21376 | 1.0.1        | 1.1          |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.40.14      | 1.44.6       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.2          | 3.3          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.28.2       | 5.31.4       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.01         | 6.06         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.55         | 0.57         |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.22         | 8.25         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/10665 | 2.000008     | 2.001003     |     
                perl-sub-quote |  DISTRO  | https://release-monitoring.org/project/12678 | 2.006003     | 2.006006     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0201       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.4        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.4        |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20190315     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.77.0       | 0.81.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6        | 1.3.7rc1     |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.2       | 0.11.3       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | v5.1.0       | 5.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.9          | 1.10         |     
                        python |  DISTRO  | https://release-monitoring.org/project/13255 | 2.7.16       | 2.7.17       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.5.4        | 4.0.0a1      |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.0.1        | 1.1.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.5.3        | 4.8.1        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 5.10.0       | 8.1.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.3.0       |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 19.10.1      |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.29.1       | 0.43.1       |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.0.1        | 3.4.0        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 2.2.4        | 3.0a1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 3.5.1        | 4.1.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.0.2        | 1.1.1        |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 0.11.1       | 0.12.2       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 3.0.3        | 3.0.8        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.0        | 2.4.1        |     
                   python-flup |  DISTRO  | https://release-monitoring.org/project/03872 | 1.0.3.dev... | 1.0.3        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
                python-ibmiotf |  DISTRO  | https://release-monitoring.org/project/21699 | 0.2.8        | 0.4.0        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/20876 | 0.3.1        | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.4.0        | 7.8.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.10.1       | 2.10.3       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.1.1        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 19.2.0       |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.1.1        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 1.0.2        | 2.0.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4rc1       |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.17.2       |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-pathlib2 |  DISTRO  | https://release-monitoring.org/project/12723 | 2.3.3        | 2.3.5        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 10.5         | 12.0.1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 1.8          | 2.5          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.9        | 2.0.10       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.2.4        | 0.2.7        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev4   |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.3.1        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 1.4.0        | 2.3.0rc1     |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.2       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.13.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.77         |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.27       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.15.0       | 0.26.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.27.1       | 0.46.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.21.0       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                 python-pyyaml |  DISTRO  | https://release-monitoring.org/project/04123 | 4.2b4        | 5.1.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 18.0.2       | 18.1.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.3.8        | 3.3.11       |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 1.1          | 2019.9       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                python-scapy3k |  DISTRO  | https://release-monitoring.org/project/21599 | v0.18        | 0.32         |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 2.3.1        | 3.1.1        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.7.10       | 0.12.3       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 17.0.0       | 18.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.4.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.2.0        | 3.3.3        |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.15.0       | 0.45.2       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.0.2        | 4.3.1        |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/21612 | 3.2          | 3.4          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.8        | 1.3.10       |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 0.0.5        | 0.9.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.7          | 1.14.1       |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 0.9.1        | 1.6.2        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.9.3        | 0.11.0       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 17.8.0       | 18.6.0       |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 19.2.1       | 19.7.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.0.0       | 19.1.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.0        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.0        | 2.5.2        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 1.3.1        | 2.0.1        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.39         | 0.40         |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.3.0        | 1.4.0a11     |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.7.4        | 3.8.0        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.4.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 3.1.1        | 4.1.0        | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.2.0        | 7.3.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 8.4.0        | 9.0.2        |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.13.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.13.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.1-beta.1 |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0        | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190201   | 2.20190609   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20190315     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.8        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.9.1        | 1.10.4       | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 11.0.2       |     
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 5            | 6.7          |     
                  rpi-firmware |  DISTRO  | https://release-monitoring.org/project/21744 | 1.20190819   | 1.20190925   |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.22.0       | 8.1910.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.6.5        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc8    | 1.0.0-rc9    |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.38.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.1       |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 03032018     | 30122018     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.10.8       | 4.11.0       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/16338 | 1.3          | 1.4          | ORPH
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.0.5        | 3.1.1        |     
                        screen |  DISTRO  | https://release-monitoring.org/project/04772 | 4.6.2        | 4.7.0        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 3.5          | 4.0          |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.2.4        | 3.3.1        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.14         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.1          | 4.2          |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.14.1     | 2.9.15       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | v4.28-966... | 4.30-9700... |     
                       solarus |  DISTRO  | https://release-monitoring.org/project/21319 | 1.6.0        | 1.6.2        |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                        spdlog |  DISTRO  | https://release-monitoring.org/project/15599 | 1.4.1        | 1.4.2        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.5.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.0.1        | 6.0.2        |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.1        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.9.12       | 1.12.2       |     
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 3.1.4        | 4.0.4        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.0-rc1    |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.4       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.23.1       | 3.24.1       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.1.7       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 241          | 243          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.90         | 2.96         |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                           tar |  DISTRO  | https://release-monitoring.org/project/04939 | 1.29         | 1.32         | ORPH
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                       tcpdump |  DISTRO  | https://release-monitoring.org/project/04947 | 4.9.2        | 4.9.3        |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.0          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.0.3        | 2.2.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 3.1.4        | 4.0          |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.1.2        | 0.2.0_rc0    |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.1        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                       twolame |  DISTRO  | https://release-monitoring.org/project/12524 | 0.3.13       | 0.4.0        | ORPH
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2019.07      | 2019.10      |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.11      |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.46.3       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.1          | 0.2          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.1929     | 8.1.2144     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.59.0       | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.1       | 2.27.1       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 6.0.1        | 7.0.0        |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.0        | 5.5.2        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.2        | 4.17         |     
                     wireguard |  DISTRO  | https://release-monitoring.org/project/13481 | 0.0.20190913 | 0.0.20191012 | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.0.5        | 3.1.0        | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.1       | 2.27.1       |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191013-... |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.12       | 1.4.13       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.4          | 3.5          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.9        | 0.2.11       |     
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.1        | 0.7.2        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.1       |     

-- 
http://autobuild.buildroot.net
