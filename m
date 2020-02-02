From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:01 +0100
Subject: [Buildroot] [PATCH 11/32] package/kodi*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-12-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash | 1 +
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash   | 1 +
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash | 1 +
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash | 1 +
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash | 1 +
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash   | 1 +
 .../kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash | 1 +
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash       | 1 +
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash       | 1 +
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash   | 1 +
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash         | 1 +
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 1 +
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash         | 1 +
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash   | 1 +
 .../kodi-peripheral-steamcontroller.hash                         | 1 +
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash     | 1 +
 package/kodi-platform/kodi-platform.hash                         | 1 +
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash                   | 1 +
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash                   | 1 +
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash               | 1 +
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash                     | 1 +
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash               | 1 +
 package/kodi-pvr-hts/kodi-pvr-hts.hash                           | 1 +
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash             | 1 +
 .../kodi-pvr-mediaportal-tvserver.hash                           | 1 +
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash                     | 1 +
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash                   | 1 +
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                         | 1 +
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash                         | 1 +
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash                   | 1 +
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash                         | 1 +
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash                 | 1 +
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                     | 1 +
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                           | 1 +
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash   | 1 +
 .../kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash | 1 +
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash   | 1 +
 .../kodi-screensaver-crystalmorph.hash                           | 1 +
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash   | 1 +
 .../kodi-screensaver-matrixtrails.hash                           | 1 +
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash | 1 +
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash         | 1 +
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash       | 1 +
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash     | 1 +
 .../kodi-visualisation-shadertoy.hash                            | 1 +
 45 files changed, 45 insertions(+)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index 3f5a06ceff..11542f9c91 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 2e99f1c8b28e176268644c07020aa92ad74d22e7244db1af69f31b767f8e845f  kodi-audiodecoder-modplug-2.0.2-Leia.tar.gz
+sha256 785e25c61cbc691e7cebcd1d084ca3e5f7a20d5e99ea89ddd2ce7aed6c94c27d  src/ModplugCodec.cpp
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index 20bd7ebd92..756d85e80d 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 0c17f407d90dd08368aead5df8bacf7589b97bf1c0d1ea45c60cc7d0da26844c  kodi-audiodecoder-nosefart-2.0.1-Leia.tar.gz
+sha256 8ff36ab79bfc1960b47d01bb33ef106e8eca495a85b206192d8a26bbf8055821  src/NSFCodec.cpp
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 2cd4fbabd0..7255319aa4 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 0dbff020e1988261680f2329fb6a29a034fede467885158ee63bae7e763d8e87  kodi-audiodecoder-sidplay-1.2.1-Leia.tar.gz
+sha256 0a9cf3c7f8aaa2bbbe4cbf80307513eb99595ebb8179e8bc549159184bbdca3a  src/SIDCodec.cpp
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index c6ef3752e7..1a4c9a0e72 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 db39f1f4a892fede45a5bffadd760962b5f02ab62e095a35dc37298cf548013d  kodi-audiodecoder-snesapu-2.0.1-Leia.tar.gz
+sha256 44d53bc17eb40ff1bdce9418be001334a99af9f41cf36e917f766e44604f63f8  src/SPCCodec.cpp
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 0d33d38566..e5a96bdba6 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 75e219bf9abac3949dd3dd3fe908bc2b6e6b85654594e5494335e7e2f14dd1f1  kodi-audiodecoder-stsound-2.0.1-Leia.tar.gz
+sha256 dea29ec20a9d23f0f85cd863a2ecf38fad8b9267e2f298f22a4b1adb0a2a853e  src/YMCodec.cpp
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 70a05acd94..0a8bdb279c 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 bc6dea6dca0949571a3123e26f27dc73c78b8a876362fc8e95649280f2557bc0  kodi-audiodecoder-timidity-2.0.3-Leia.tar.gz
+sha256 d1b64dcec44f6dfa0168a93bf1e1497e233cf3a6a475f60ca7e0a813510d6aba  src/TimidityCodec.cpp
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 26415717cf..c4a3cdf23d 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 6f1940d2a0607342cba8cffc0beb7c78caae5995c2d554a6079f4849997da7ba  kodi-audiodecoder-vgmstream-1.1.4-Leia.tar.gz
+sha256 976ef407b9b30a6c30dab03a8fbb32d0e7e45713b2121d9b378bfb15dc1dfc09  src/VGMCodec.cpp
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index 7599ed9218..4f410b4848 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 e6b8ad024c171eb463339a1f136f3ee9465267ef7fd3b80a5f0007b0180f36e5  kodi-audioencoder-flac-2.0.5-Leia.tar.gz
+sha256 ce7b890ad56521f1628569be22eff040ef2870213b89098e491d57f729e0d7b6  src/EncoderFlac.cpp
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index e25df69e79..d66ab591ac 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 c9c0e700012e2763eb6d9ffcc80ccd87faf991e5cf58b30cabd51b435fd48614  kodi-audioencoder-lame-2.0.3-Leia.tar.gz
+sha256 12d9ad0578d7a09ebb1bdb53d71798b81eed5072866b8bcfae5dff0c34a00b42  src/EncoderLame.cpp
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 7ba473e5f7..951a2861fb 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 f6f220fad74a64d29a4375fbc24560ee528d0dbf1e195f17015381fcd67c8acc  kodi-audioencoder-vorbis-2.0.2-Leia.tar.gz
+sha256 8d54c70bb5d821adfc035e6aa76a3de228ad17b750203e9165e05af0c94cea05  src/EncoderVorbis.cpp
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index 06e724a969..a1bff2e00c 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 eb6939551fa7da01a7f333702af1959771e7db46437647d32eb2b002b142c9a0  kodi-audioencoder-wav-2.0.2-Leia.tar.gz
+sha256 20c587f004bcc79f3faee1000af6567fdf8676965130af51e733338b81b27be1  src/EncoderWav.cpp
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 94a001c4e7..5704976e3c 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 e47263240ac9276546ead439ba14ee26c3f3b45f2882351a9081e5502e296329  kodi-inputstream-adaptive-2.4.2-Leia.tar.gz
+sha256 9070a4ff46077f9358b079445c5cf2109f1711e05f4b9cb283d89ecac7aad161  src/main.cpp
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index 050f86af4c..d47de14f7a 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 bc4cd1f4df6bc24d035c537c365977493f412acc711cf60d82179d1ef494e275  kodi-inputstream-rtmp-2.0.6-Leia.tar.gz
+sha256 8aabbb74959bcadd8b2f0c08844c287142bd3e4d386ccb2c3502a98f60cd31c1  src/RTMPStream.cpp
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 84f847f309..af55dc03ec 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 b6ddefed73582a3dc9bc36a9d40f8309139802ef9cfc130933bd0fe6e569d933  kodi-peripheral-joystick-1.4.8-Leia.tar.gz
+sha256 5f5ee7add3f2c451b387c5a9f39edf33e1cee920871a4863e795d00d27546c33  src/addon.cpp
diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
index 5966ee8908..8a44ccfdba 100644
--- a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
+++ b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 26edbe8778d9267cb35f18e44b7e9cbd3d3c193710edc9e586b20eed5f4ff0f8  kodi-peripheral-steamcontroller-0347e66dc8464184d636aea2cfe10491d6fcda96.tar.gz
+sha256 e91f65473335a700e38f88138f7a9413ce0cb878cfc5810c7b9b3ecc87f8ec41  src/addon.cpp
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index ec01bfdf76..8067d495ca 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 c1d755230b0f2fe943cf7297a6d187371088f39391944d422d2bf5969c8863c1  kodi-peripheral-xarcade-51e1a4550a6c7d7feeb01760a731af17bea6c524.tar.gz
+sha256 6d79d409e34af80656244d38643cfb60c715b19a266d82fb27c4ec8caf46bb5b  src/addon.cpp
diff --git a/package/kodi-platform/kodi-platform.hash b/package/kodi-platform/kodi-platform.hash
index 0b2ab6b147..3c4da93afb 100644
--- a/package/kodi-platform/kodi-platform.hash
+++ b/package/kodi-platform/kodi-platform.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 d5b9b61c1c22b471d948b2c8de50f77ccadbd908869b13b5d98c42f447268d56  kodi-platform-915da086fa7b4ea72796052a04ed6de95501b95c.tar.gz
+sha256 0c4ce7041d4a3059389fb8b6d85e417447072adbc149a55664e02cad6995b434  src/util/XMLUtils.h
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index 2eae694354..1568f4b083 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 2d0fae3721715a17e1c1454dd7029eb8d18e7f761ed65e00f8c488c7c08433e8  kodi-pvr-argustv-3.5.4-Leia.tar.gz
+sha256 9a5b69143f47289e5d649a78a0f0aaf21a75fa8866bd2b8c6c559e57cd221295  src/client.h
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index d49a267b0f..4bec77ddc5 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 ad7586abfe7b3f9dd67b3a2225c442fc8d2a442e48bd7df75b11652286392c2f  kodi-pvr-dvblink-4.7.2-Leia.tar.gz
+sha256 2a643b774c0b5238ff2d284bad43ec69c2ad4b848b6c58a73dbabffa55d62bfe  src/client.h
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 726def6dfe..f63f907145 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 8a3d167e652574caf30ba0ce9c22d278715e0237774b817e37826f1b2d647bff  kodi-pvr-dvbviewer-3.7.11-Leia.tar.gz
+sha256 d60190aad6c2e704c7ef51693afec2530a54e357ed217313570004cc59c9a4d8  src/client.h
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 8f15870dbc..ad777e5388 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 763500fb4a7210569f05dba8307d400e532dd0e72b24f1a1d2cd516695145190  kodi-pvr-filmon-2.4.4-Leia.tar.gz
+sha256 8300bc67ff10aad7f271e96f867ad024fcdfc114caca04fefa437231945e6315  src/client.h
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 86a512dc0f..1bc71c06f7 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 815ba3dfbe6e1318226d41879057f0b8a4f0ac960d12ebc5d69f0a1ac28cfa09  kodi-pvr-hdhomerun-3.5.0-Leia.tar.gz
+sha256 b184cd8a52f77f6c02c1da89dfc17dff989c50c400acab10148ab77f02723d84  src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index dc45e829ea..ffbe368637 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 fcf2df3566b196addf99d8166fa5a8b77635ac905214c36071d9e778cc42978e  kodi-pvr-hts-4.4.20-Leia.tar.gz
+sha256 a6cd848443278bf312680e08d13fa898e4242fd76de8c86aea5f09a51826885c  src/client.h
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 1b79b57049..38e8571380 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 25eff252ad748e0cf166cd01b0f08e8fb3977c98a1b04cad9ef6509ea30c5fa9  kodi-pvr-iptvsimple-3.8.8-Leia.tar.gz
+sha256 f5890f1869491e6e6674029355d40b1f4cf57f065da4f37d5b1b3d2dd41ba092  src/client.h
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index d34635fd3e..ce24491ec6 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 9c05578566f7448dc3a7677587c804596aa314afd493cb9c62cc65ea883645aa  kodi-pvr-mediaportal-tvserver-3.5.18-Leia.tar.gz
+sha256 b9966d774c89672efb8d6501d636038a77888c044d15e68af604e9366c1b1a0a  src/client.h
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 4de1fda3fa..a8aaef631c 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 36d9142e0e19b904e1c4a6d8cd67063d291e63971f80a98a6f24b7f4554bb2e3  kodi-pvr-mythtv-5.10.15-Leia.tar.gz
+sha256 ca8fee175b3a02d106870b991ed29b07dfc5024ce3992bbb872d0654467f132b  src/client.h
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 86e77b3281..28bad5fcae 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 f7b6ea2e79e469fc265d008d3ba8ebb7e286e789a8b4bc809681a254ff225775  kodi-pvr-nextpvr-3.3.18-Leia.tar.gz
+sha256 71c90cfb2792702a6bc13dd10e34c2f181b5e923ab4ae2b1b0674c5b8867b2ad  src/client.h
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index 00aa98d9b6..472dc78624 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 8c42a3c3754d7a07de9682504c4883a584eb21a92b9af70f0129ffc2707c1554  kodi-pvr-njoy-3.4.2-Leia.tar.gz
+sha256 69e4681abe815ce2f3ec2c9f34c2292e95e56424d9403fe91a91baeb23e91ec0  src/client.h
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index bcf920aabf..850ca7ac77 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 a9f1c5596786cf4cfa279d0b4477839ef7f5bb7267c65152dbcf7ae0bda56679  kodi-pvr-pctv-2.4.5-Leia.tar.gz
+sha256 03798669132b75111ef5731f6f9c5e519faf088fe4ef3233289bc140e26d2845  src/client.h
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index d3cd685fd2..4db4f79745 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 03eb428f21d6b8526b6671278b60ac6dc5a761a515af27172d8ac5c814cc3f65  kodi-pvr-stalker-3.4.10-Leia.tar.gz
+sha256 31d746afd12ac7ebcbc2a4b525de77d31d10bc4f7a0a45830d6f899a2953bc95  src/client.h
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index 92ebd9ee0f..42fee0b5ae 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 98aadcf3d0109a7dc5f85b4e5473d595039b59c46b0686a2fbda88ff7631ee0c  kodi-pvr-vbox-4.7.0-Leia.tar.gz
+sha256 d50cada312480496eeb901e1809cfadaea256f82359d2cb01ae44f28e2191b33  src/client.h
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index 8d03a823ee..c0e1d90bfa 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 6afaf1f3f1e0670edb9dc01581a0d6c3f57502c791e19283eb63807e8936a768  kodi-pvr-vdr-vnsi-3.6.3-Leia.tar.gz
+sha256 4da4a184b215913b33f48ee26990b34daa7a15e00cc23e60975d391b7168597b  src/client.h
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index eb0408db8a..a8f81244f2 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 d7dd890e4491e211ff3781cdc043347ab7a4ef6e00619ac1b4641ed81b0c3626  kodi-pvr-vuplus-3.28.9-Leia.tar.gz
+sha256 21f5b12ef73285dbf9709fd42b719b719285a7e8a6741913664b58b8e08374c8  src/client.h
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 0707ce5839..643549ea73 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 4cb81f29cba23172d042e50bbab00cd64cd5670ad7350fd9d25301f63178e5f7  kodi-pvr-wmc-2.4.5-Leia.tar.gz
+sha256 1a2f68003a1149b6f6480f4cc749089aed8cbf16529300cc8458c5c7925ce917  src/client.h
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index b01580a62e..e4c37ba7ba 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 fa7671a1c88b75e6d26a172fdffdad4fdbd78f000f54632c47e38c17cd0da460  kodi-screensaver-asteroids-2.3.1-Leia.tar.gz
+sha256 f4f073e8ac29971d33cc7e16ed57452e04f2365bee331de291da65e44ede081e  src/main.cpp
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index c0e03d2375..ffc6ec36af 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 1d1edff918d2a94ba0efd329a45294be47e73eef65f700d62b311eb750d0fef7  kodi-screensaver-biogenesis-2.2.2-Leia.tar.gz
+sha256 36809bee046ea4ce33f58b3733693d00d8b5511f20394f92220eb1f14dfcd6b5  src/Life.cpp
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index 88fdca45c8..eca5d805e6 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 6d7a0036a118778117d1d1ebeca96903e66f49a166848a1c884aaf3ed65fdd46  kodi-screensaver-cpblobs-e65b34fb75ac258a8563169b9c00ebf739dbc7ca.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
index 6442b4d5bc..407093f196 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 d8ed548222f1118964104fefc8ac3056dfe6c9d2ee35cd7c8355c9ea9fcaffc5  kodi-screensaver-crystalmorph-4439c84c38abf889e19a1863e745942c0d7f8203.tar.gz
+sha256 febce1924ed772f22ec3fabec646b1401aad4f4a81a7f1baeb858f27ae4f5241  src/Fractal.cpp
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 28c669d831..71734ee6e3 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 d95bc93d022b12fbfcbaedf1128292b40dd16276b65a3ffecb90707055e1d55f  kodi-screensaver-greynetic-2.2.1-Leia.tar.gz
+sha256 f3e1fc9e8f86842be8af2500e9b2a50ab8597ad997908228a00c3c8a4abb9426  src/GreyNetic.cpp
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 737c522715..54c39ebe10 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 2d2c795853c5a72184bb6720247d79c48b1d9fbc97e9c2913003a707d612e3ac  kodi-screensaver-matrixtrails-v2.2.1-Leia.tar.gz
+sha256 c101468347a80d24bda4331792638c13dbb28d803ff0f91b871dde57f5a813de  src/matrixtrails.cpp
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 0a6ab63954..b4e22420ac 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 d4e09509bf036b7d5c381cd4ecac926a59396fb481347a4056d843ae68d3a20d  kodi-screensaver-pingpong-2.1.1-Leia.tar.gz
+sha256 47ff769788026a338740772250197acd0a84f26b57dda49e5b14d63f2f2937ee  src/readme.txt
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index 8e8dee0ade..b8b796975d 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 55f867b703e5cf409f8e0a8a2c34373f896feb990004b5901b4efaee905d42e5  kodi-screensaver-pyro-3.0.0-Leia.tar.gz
+sha256 191a241bccc6464341ce5883e9118f03b3d046cad7900f6c4bb01333c66f7063  src/Pyro.cpp
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index e3e0ca933a..9a8246e9d5 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 dca39e68d803cca3c1d9524df17feb3e12fc7eeae4166c6311a97dc68c29f523  kodi-screensaver-stars-2.1.3-Leia.tar.gz
+sha256 962bb1e8e5da407e871adcdb6868371fdb2ca0c01e8ffb4bb01a8e87b1eafe88  src/StarField.cpp
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index 37d203224a..4439240d7b 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 49f193d32a14b26a39d6572fcbdd8b69a9e559f453bca017086336e985bf6b2c  kodi-visualisation-goom-2.1.0-Leia.tar.gz
+sha256 e5776a7262955801be2e19a84024cf4d0589253c8d77dd09a1db01bf5ed07683  src/Main.cpp
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index cf3e06daa7..fd29651b60 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 7b09de334ed3c96d2e2552e0594b8f76c11e36edfc10efd725851140132a4d4f  kodi-visualisation-shadertoy-1.2.3-Leia.tar.gz
+sha256 bf8d322650b3d36c6781a9d14c6194530d5677c14291d51e2a3992c6550a62da  src/main.cpp
-- 
2.20.1
