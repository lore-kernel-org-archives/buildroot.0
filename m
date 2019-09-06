From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 06 Sep 2019 06:17:19 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-05
Message-ID: <20190906061725.E93208732C@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 23  |  3  |  0  | 26  |
  2019.05.x  | 24  |  1  |  0  | 25  |
  2019.08.x  | 28  |  4  |  0  | 32  |
    master   | 186 | 126 |  1  | 313 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-capnproto-0.7.0 | 20
             libgpg-error-1.36 | 19
                 apache-2.4.41 | 11
            wpa_supplicant-2.9 | 11
                  luv-1.30.1-0 | 5 
             subversion-1.9.12 | 5 
                    flac-1.3.3 | 4 
glmark2-9e01aef1a786b28aca7... | 4 
                      icu-64-2 | 4 
                classpath-0.99 | 3 
                 haproxy-2.0.4 | 3 
            host-mfgtools-0.02 | 3 
                       unknown | 3 
   vdr-plugin-vnsiserver-1.8.0 | 3 
                     apr-1.7.0 | 2 
                 libdrm-2.4.99 | 2 
               libupnpp-0.17.1 | 2 
                log4cxx-0.10.0 | 2 
                    mpv-0.29.1 | 2 
               capnproto-0.7.0 | 1 
                   cups-2.2.12 | 1 
                   dav1d-0.4.0 | 1 
                  gnutls-3.6.9 | 1 
              iputils-20190709 | 1 
             libgphoto2-2.5.17 | 1 
                  libssh-0.9.0 | 1 
                       lmbench | 1 
        ltp-testsuite-20190517 | 1 
           lttng-libust-2.10.1 | 1 
             openjdk-12.0.2+10 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    qemu-3.1.1 | 1 
                qt5base-5.12.4 | 1 
                snort-2.9.14.1 | 1 
                   taskd-1.1.0 | 1 
           uboot-tools-2019.07 | 1 
                upmpdcli-1.4.2 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/0bdf0696228761f29215557f58ec316f02d4fba4 |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/ac5f8baae12fa8a487c4e0d09d33a04fd9706ed0 |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/d79c7f99ef55fb933eaf76dc91b1d200ec19f37e |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/b4898fbed70ee155f9073559224272b9ac263e54 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/c4afea21ff7e269a85998d2cfad2d0f778e47500 |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/10c4e3b1d24fec749fef4f25bc1a1ba02cdb3ae3 |     
    sh4      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/b0654171effeeb5b4809e5729a706ce7be4a0d23 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/80432ee4aef8bb49b034642e30c1ca153b6a8754 |     
  riscv32    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/a6318b400859537b0fe241039deac0acb55db2b2 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/4831dff044ddd12dc8abd59848aff156eb6a9639 |     
    sh4      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/5a8d971ab44255573914e050ff790ccaa34f5e34 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/967f0ad6821bcb6affbc880f9224225c18bbf5cc |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4a967454bff26104b8aae43538a3871a54d9fbe6 |     
    arm      |        capnproto-0.7.0         | NOK | http://autobuild.buildroot.net/results/a99f7556ca52b422a128756def1e812ec59840de |     
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/a2563f21210a870ca39e8adc354ac1261c591240 | ORPH
    i586     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/65bb828546d0a0a61360ebad11d2f182cc4ed404 | ORPH
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/d83817a0de62e430f858127e6020b4ffb8082d68 | ORPH
   x86_64    |          cups-2.2.12           | NOK | http://autobuild.buildroot.net/results/8049e65c095fc13652b71cd8f0dc83c3a0e53c4d |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/99adde7a2fc2ee340150f729d4be4c2c0855d508 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/b75d8946645a5cb1a544d23a88a118f339b325fd | ORPH
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/4c8622e7d4d641a31319876420b9f8c8ac5769e4 | ORPH
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/f8ae15f0870026fd2ad7174a028c94151d7ffe10 | ORPH
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/bc18bbb7591a7c567d3e4f5c53fa54d223e0d163 | ORPH
  mips64el   | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/545b8f7c137d4f2bb45043bed9470f51f426dfa6 |     
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/ceee582afcf26693e7ba781aef52f6c86447bd1f |     
  riscv64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/af5f83c50df19ee65b0e0646fd4d35690731a863 |     
   x86_64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/43a31691592f2b97cf4c8ae60732df9adb974607 |     
   x86_64    |          gnutls-3.6.9          | NOK | http://autobuild.buildroot.net/results/2f6021200037e84666355bd66329f77b281bfec2 |     
    m68k     |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/e528472e143a0f93e07989245df436b6e371b68f |     
    m68k     |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/becc6f1c03d8e65d4b0c4c7e5cb4d64a99d8370f |     
    m68k     |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/629279eca4b6aade463f2828159e212cf0f0fa68 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/1de49280eb3828ca139bb7a71674720e333b7e04 |     
   nios2     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/6d6f9477dc691bc8ff258494f773c4a5dfda8c34 |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/f530ea308e0d31eea3f9aa5f20629cd7c631c2be |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/25559080ab3b1ddf650c87d433ebe8b751e7577d |     
   x86_64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/31cb0c297686a586765c79e42646b6a9ec9f763c |     
    i586     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/90e0e2bde7e65f0841172c4887509b505319b8f5 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/99abfda2627867a93bfbb9d637344242b0577706 |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/77a5af8a5984bd8e5c4eb64eecb895c824a61e7f |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/afad4a292fc72c9f676d90e6f76eef38010551d5 |     
    mips     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/a43c7f1a3b13d25443b6ecd6f5047b2aa67b1de8 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/0e1d7e0e4d9e67c33e9420259325ce19f99533dd |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/dca0cbc0747a2be99c33f9897fbf18891145b0a7 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/3de355c1e8833f4fe472b7603b27117ce6e1116a |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/055bf8fb51064076fb64b835c815ae02a8898fcf |     
 powerpc64   |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/cafe5e4d81727a36a72d03c0d1e57d14015b4a60 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/eb4f48af7c0f5921dea2440cc70a6186eee2799c |     
    m68k     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/ea22eee7978f05316040571be63e88a0c5e04329 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/e1b293091a49a555e42cc537e3080456e55352c8 |     
 powerpc64   |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/240e562be4e8eb9f220f626bf7e1c96a40fabe06 |     
microblazeel |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/c83937157028c938c0c0f10f5cf367f5c585dfa6 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/656f0a6cd627147ab06161ef7cda92c594c92f5a |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/93276663b127f470cc09869b1ae896b445b682ea |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/e52e0b605473f81a6301f61e3a01366a8e2d910c |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/635ba40fb1e520c224c096ae08073488007710ee | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/572f81eb5b3d795951d04f0fcf69dc4c09897c68 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/db024c0bdbb9d3b6886a16216d49d9300d413dd3 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/a4516546f0960b8a0c5f754baf39c7c0f242f34c | ORPH
   xtensa    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/50b4d40197bae929f25a4a8a971f50ce315424f9 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/197f62554065184857ff2df1e70f556a210a5376 |     
   sparc     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/b93653ef21a9031526bc3e7ec5ca7af40883495d |     
   nios2     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/c0bab42f3f8635ac61c129ec40dba2739bc1d51b | ORPH
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/b3d3cffc17c5b20f2a3f1b3753f68dc60a503e4f | ORPH
   mipsel    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/f4081050622824ba42b6adeb3f8f271b15f87874 | ORPH
  riscv32    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/d0b9ab291281e83fc45424c2cd37a0f5c189bcb4 | ORPH
  riscv64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/29d60dffe066f78bf31a9964f13340eb10faa4cc | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/4103b38bf93743ef2acefccdbfb15283b89f76a1 | ORPH
  riscv64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/cf12f23e355715516bf08916ea9ffbb9aca5a32f | ORPH
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/5835df0a0e9ed74e588c61d56a9bd1ddc84b8636 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/99d0faf9a8000189ba4be2ef2d465ec994270acd | ORPH
  riscv64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/258fc814f1d77bb6f899f32d1df8f3adda89d752 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/1fb49c72898bdb6c81d0f969339ffe51669672d7 | ORPH
    m68k     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/acd2fd5cf6f3d59a9804384bd1d3e568665161f4 | ORPH
    i686     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/6ac01c2fa947e8a315efb4a211efc983479f1c1b | ORPH
   sparc     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/b230d54ce5e009cf1a99645e75a33b340b06fbf1 | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/005579393c633142d10ad9ddcab607b168bbd8af | ORPH
    m68k     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/3dddca3be1ef200e1dbbb076d3767b70ece9db47 | ORPH
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/9e88a79f9ec1fcda0bddd7e727dbd8f658364caf | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/fbf37c7fe1a246e79b79664602493b77b80439d2 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/468e20efb471f9ef860780cba920e40f0dda9171 | ORPH
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/8ea3acb72fa086ed1171956abcfb6da5c533c8fd |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/e7c046ad2d0b3de1ec761f089d89315bd7a7fb93 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/5ea8e9a5df6822cf04ec7dab4a04701add1a2b67 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/9c81af47e9ce7508924056aa28366f564f9df443 |     
  riscv32    |            lmbench             | TIM | http://autobuild.buildroot.net/results/ee96b0afcec0e3819301f76d8b0cf76fd60f75c3 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/143238685e5e65d8eeaa4c9d2078399962eba7c8 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/7920dd3c3cea4a817867a8cd9eab4913c94e50f3 |     
    arm      |     ltp-testsuite-20190517     | NOK | http://autobuild.buildroot.net/results/67c9c57aa8d46a88c8b6662dc74c1de6951e4e6e |     
    arm      |      lttng-libust-2.10.1       | NOK | http://autobuild.buildroot.net/results/899805fae5acdfec9a379a60833801de0b6caa7c |     
powerpc64le  |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/a67ee2bcf165086307c94490142a6c0a1994b3b6 |     
    arm      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/84bbdf8310f19f5502f11479c21784a2372ab4b7 |     
    arm      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/1206c5f36e0b2e768d9eac73530aa3484350db77 |     
   xtensa    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/c1d9f5060812afde387c3cb6b7b30041f036ccb3 |     
 aarch64_be  |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/03fdc214de81054f6196672852c50f901fd76bd6 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3c4eb4d45eea118db174c977804edce214d2e745 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d2e340d39e7af5cb492b1fc65fb36a750948a5fb |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/1f90ca2d284d36a38140925cc15b6da69c5475ac |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/15dd89fd6a13dea4e493d2f462e4590dfea9b8f7 |     
    arm      |           qemu-3.1.1           | NOK | http://autobuild.buildroot.net/results/a1d5a9889334386fdcd4fd4c4dbbdbc2830ca412 | ORPH
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/4593642afe72806528d52204784af91d54b345d3 |     
   sparc     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/6aa69ec430d49539b978a7ce5208ecd9736426e8 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5289641a4ba248347b8d80cfd3133a1ad1b48306 |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/30a8e7a7e55277213976f447d1a1b297b003be6b |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ec9475763fe70290e37be72b47aeb32a48acc351 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/c0a3eabc903bb9748d1d24702542fae84a3f2297 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d2842d6e728f136d4608311879968919265569bf |     
   x86_64    |          taskd-1.1.0           | NOK | http://autobuild.buildroot.net/results/4e80492bd137f1ff33a2016616c7a53acdf584f9 |     
    arm      |      uboot-tools-2019.07       | NOK | http://autobuild.buildroot.net/results/f77aa808ea632cc472dac7169b6cd5088871dbd2 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/a27e971a5744158d3be6e0dfd1c5af4d4ce0bb2a |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/bb9f300c228ed813d6e86ea437f0f68098d05686 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c46c6f2e070a10fea9a59fa8b904d96cf8107196 |     
    arc      |         upmpdcli-1.4.2         | NOK | http://autobuild.buildroot.net/results/0c61f3e2794191111e0ab10819b41759853fee00 |     
powerpc64le  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/005efe8165438680eb76edd43e0ae54386170234 |     
    arm      |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/0c567c1942f752245793f86794a609f68f2b194a |     
  riscv64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/c26b7b44a2ee9e53288b7731c61b0b0f661e6622 |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c93c1f78429d022fd0f7b6db91eb860cc3d4d95b |     
  sparc64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/3dd72a4791002b03028272cd295bb5e03499fed4 |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/561b473a4bb25840940fdaf42ca42dd8c8adb3fd |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d0e5ad004518f1aa2d55fd3e26a0c2a91e7314fc |     
    i686     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/27ec30ef71b62bad15decf90d57c891b72dde169 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/f55dd73e26c508d9422e265c281d4491de378d98 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/4a4ffce461fb38f3ac81c8c0e0002c0c15dfe0c1 |     
    sh4      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/89e47eacf10d1011c3ee092287cb4055f26adf56 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ed43f2459cf9c073305e061d197cf1c5379b933f |     
 powerpc64   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/2066570f84c8a3e30bed6def0e29b5195de3649d |     
  riscv32    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/da2f5842e0f7e6f69ac983891c858096cdb1d331 |     
   x86_64    |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/b237dcd892e6e29e318d992d5725d0ef25992f6e |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 1 
           host-mfgtools-v0.02 | 1 
             libgpg-error-1.33 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/691c64f38ece9923db698b485d3e8d3c1615f918 | ORPH
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/0114615df09924693a0496c1a0b5d65eb26a19b2 |     
   mipsel    |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/4b96d90db375aec1ae2bc0d4d206b58fac8d7e08 | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.35 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/a068f32918d426847a78f58e0da87aac9facb1c2 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 2 
                  flashrom-1.1 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/c9bffbd5d7f430a8eb311467273f244a11be706d |     
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/312b7c10a3be7b750fab0d4e05eb0d6e2b217e83 | ORPH
   mipsel    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/9e17c246972240dc73d9386d8855ca06675f7bb9 | ORPH
    arc      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/80be96625f309200c36d3e091ed96ec574d6ac26 |     



-- 
http://autobuild.buildroot.net
