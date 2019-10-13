From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Oct 2019 06:17:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-12
Message-ID: <20191013061740.E5EB120499@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-12
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  2  |  0  | 21  |
  2019.05.x  | 11  |  0  |  0  | 11  |
  2019.08.x  |  9  |  2  |  0  | 11  |
    master   | 101 | 79  |  1  | 181 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 13
                elfutils-0.176 | 10
             subversion-1.9.12 | 9 
                    bird-2.0.6 | 7 
                clamav-0.102.0 | 7 
       gst1-plugins-bad-1.16.1 | 6 
                 uclibc-1.0.31 | 5 
                  flashrom-1.1 | 2 
             libopenh264-2.0.0 | 2 
                 mesa3d-19.2.0 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
          xlib_libXfont2-2.0.4 | 2 
glmark2-9e01aef1a786b28aca7... | 1 
                   grpc-1.23.0 | 1 
host-google-breakpad-7515ab... | 1 
                     host-llvm | 1 
               host-qemu-3.1.1 | 1 
                 libdrm-2.4.99 | 1 
                libgdiplus-5.6 | 1 
           libwebsockets-3.2.0 | 1 
               mongodb-r4.0.12 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    strace-5.3 | 1 
               target-finalize | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/b0156fdecacc0e3f0ecade130bf38efef2ffad74 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/8f50eb2c53fa7910aa1766d765ea6742a49c7e70 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/95eaa59cf16859e518fb06d7d2a2a68d7d788113 |     
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/87565eac9efb63f48815e6d1a3690d74e04b2e5e |     
  powerpc    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/f4cd2ce263e3ca4df47262511a7b7e0d9fd6ec47 |     
    arc      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/670162a51f4d451b5c4efce705d4aa2ce863de04 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/7ae645a11d9d6d2dbd6c79cf7c3a559d12e8d654 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9dbac473ed1cc691d6831dc08bd2ae7d7bad7600 |     
    i586     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8b06513183bc44cafb17caa424281c0772741125 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7f1cfe0b6c8f9b5b85df8bbeabcaa8609c61175d |     
powerpc64le  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5ef951723fe7285a0168ee700684d150138a7552 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5e927105ac0cf3a7f3b68a10d989e078e46736f2 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/eb0510ff8fd19fd058892afe92efe809e4949ba2 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8eead02b80010ea79b8fae962afb34aa9f19e706 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d383ac3ed57ac6adae6282b7760f355553cb4241 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/db3272ddbc23acf0b3a242565fb67a6949949f44 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ead8642ed30eeed708a105e707f8067fdbf72fef |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/408f72627100ca9b638dcd678fd8ad2ac099d6c2 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/518504d4984c3d7889d1fd6649e12d8232101f2d |     
powerpc64le  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1f3ef4898049c8d254ca6dd56a5ab685407a3113 |     
  mips64el   |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/cbf4ce221aa0fc72db17256a212a9af7b88ee937 |     
    arm      |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/f49ea9157936504635a7905d53146d805e620416 |     
  mips64el   |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/8ce09a60a4865345c62e82ef68c520f13e188d82 |     
   xtensa    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/564ae62495b44020261bf77a69b0e00d2e3dc89e |     
   mipsel    |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/c0a8ca6d927206bd6a014a8816730f1d7d0b9c80 |     
    arc      |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/49973b2283c65de5155deaf633cd6569a37af375 |     
    arm      |         clamav-0.102.0         | NOK | http://autobuild.buildroot.net/results/8f0d45202c9a7dbb4d0c7431040384990f04008b |     
   sparc     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/86ea454ca8c4f5922cbaff065f112b19e6caa087 | ORPH
  powerpc    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/8e7cfd0778fa216048491d180c9ae6cc21f946c8 | ORPH
    or1k     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/3f20ae917fde9d95eb061b779a5992db91355a57 | ORPH
   sparc     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/5f2d29bc8de69410d31ff3045c251171d8491a9b | ORPH
   xtensa    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/b5fcbe468a5557f5d2789534fb81dca661c83033 | ORPH
    m68k     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/3526a55cc43a6a62ee8f56f537d9942b96034dc1 | ORPH
    or1k     |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/c8284e261bf28529b67f235aa4ec9a6cfb35216a | ORPH
   x86_64    |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/6ce0c7919ec41e2cb2316114ece95d6d78315a07 | ORPH
  mips64el   |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/2b6eca11b5e3108afe96c0121c30ab8f354e255b | ORPH
    arc      |         elfutils-0.176         | NOK | http://autobuild.buildroot.net/results/0d97ce11dd434d6f47b95d26f23272ddb9ec5a5d | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/11ad934a66ea170724d6381a45dca030d6b3fb01 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/c39c310b409452aab676e29c3cbd45853828470f |     
  riscv32    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/46459d5a8607af1a2f962ef23d9807fb08797927 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/6b6ac67888e7bfbb052a9dbe70d7b4656aea5644 |     
    arc      |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/9d54bf2ff8d557f98afdcb03f38053bcebf72e48 |     
powerpc64le  |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/74aa89eec9fd77225f6ba989af142ac9c2d387e4 |     
powerpc64le  |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/ae0f513ef90531012612a896ed4df5d65154a765 |     
    arm      |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/ae41b19ebccbaa653b0d2f5e52d5146d96cc00b6 |     
    sh4      |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/3208d4f097b2f765e40347e1b933b379ae7a5108 |     
  aarch64    |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/bb3f978564541f2c8b29fd644e67e28c54035772 |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/1e0ffdcb8f2f40e0bbbe98102e30d84d09196041 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/b54b51cf4b8bc5befd2f20497b2bbb7c9e39d9ce |     
  riscv64    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/1c3c437e83669d39c3c3845a76f2286b088da769 | ORPH
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/ffdabda518486d01501f4d4ab989c3fee9d3d698 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/a0f5e943a4a34d5a307fcdf5578206540f0ec785 |     
   mipsel    |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/bd94f13803a8d6027e46dbc780c3420cf9171380 |     
    mips     |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/30a9c5b36068aab18865c768d40c9b833feff88f |     
    sh4      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/294aae6d77c7bd3d49f345c1dafcc7ee8e5c9153 |     
  aarch64    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/399786669555e47cda4bd2a5a39e861b7690be3a |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/cbd629449316de483f44572ecd60b842e8483c85 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/0a171720348943332e957f78afb88607eed3c564 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/65437fa382b47e17fd911d5e3e7b7de47e1879ea |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3af41f85debd09bc480bc1c8a28987822dc6bf91 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/80d24a4e4f2f2ed9209d5fb542a943f597cd5001 |     
 powerpc64   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a8d9181064509f0c37fe584fa1f7d96a6bce825a |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6685402edeffa741113f809722f2725a8f945023 |     
  sparc64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d020eaeadea835fd20483ef2823e295081ce723c |     
    mips     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/507b6c3255a943ab074373f26de7ebad160106c0 |     
    m68k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ee237fe471fc1e1c3a50428e8e3e9b8c41505833 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/309041dabbd8b76a875c27c61cc48e4005165ed9 |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2e1bb190183d5f0837aa8a9c72a87fc7ecf00eef |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f836792ecbcc5dc46d43958932ce8adbaa014212 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/467b55761d847a1216853980c94645c13176f318 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2999d8de19ed7bf7a5ce148da4b1b98f144bad9b |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/65ec53aebc0dec081bb1f317e203e17b182bf0b4 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/6acce14735a948be4b9e85e0d97026ed6283f4cb |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/dce7732a294d820f236fc474f40a590a323283c1 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/070eb364c32c75d0012d37cb6050dce3383bbebb |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/dfc5ff07cf2987a5595762bcf616adcc7bb0e760 |     
   nios2     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/ce3ea49c2bdf9f55b735da7f8102e38002a75e13 |     
 aarch64_be  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/a0b40845e86a2e4578e2eb14d71b3eed94b6d8d4 |     
    arm      |      xlib_libXfont2-2.0.4      | NOK | http://autobuild.buildroot.net/results/f772cd6cb1a4af03cab55120cc87fc8b44e4be5e |     
  aarch64    |      xlib_libXfont2-2.0.4      | NOK | http://autobuild.buildroot.net/results/53bf4d085aad3b2f48498816557d517330f6d7b1 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/71d247c6e98018435017ffb42167fc43334f35ee |     
   xtensa    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/303164ea94a4cb7290abd685075b2721feebe73b |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                   mimic-1.1.0 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e9186ef0dc5a92429fc04a6ce520f0cc4235fb71 |     
    arc      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/26bede8f35623c009cb1f045c809be32608301d9 |     



-- 
http://autobuild.buildroot.net
