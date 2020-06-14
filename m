From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 10:31:05 +0200
Subject: [Buildroot] [git commit] package/kodi*: mass reformatting of hash
 files
Message-ID: <20200614083039.A800882B95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=001671aa044a2a4170ee19a9622941ab3bc063ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: fix nextpvr mismatch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash |  4 ++--
 .../kodi-audiodecoder-nosefart.hash                          |  4 ++--
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash |  4 ++--
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash |  4 ++--
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash |  4 ++--
 .../kodi-audiodecoder-timidity.hash                          |  4 ++--
 .../kodi-audiodecoder-vgmstream.hash                         |  4 ++--
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash   |  4 ++--
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash   |  4 ++--
 .../kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash   |  4 ++--
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash     |  4 ++--
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash |  4 ++--
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash     |  4 ++--
 .../kodi-peripheral-joystick/kodi-peripheral-joystick.hash   |  4 ++--
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash |  4 ++--
 package/kodi-platform/kodi-platform.hash                     |  4 ++--
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash               |  4 ++--
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash               |  4 ++--
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash           |  4 ++--
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash                 |  4 ++--
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash           |  4 ++--
 package/kodi-pvr-hts/kodi-pvr-hts.hash                       |  4 ++--
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash         |  4 ++--
 .../kodi-pvr-mediaportal-tvserver.hash                       |  4 ++--
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash                 |  4 ++--
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash               |  4 ++--
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                     |  4 ++--
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash                     |  4 ++--
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash               |  4 ++--
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash                     |  4 ++--
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash             |  4 ++--
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                 |  4 ++--
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                       |  4 ++--
 .../kodi-screensaver-asteroids.hash                          |  4 ++--
 .../kodi-screensaver-asterwave.hash                          |  4 ++--
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash   |  4 ++--
 .../kodi-screensaver-crystalmorph.hash                       |  4 ++--
 .../kodi-screensaver-greynetic.hash                          |  4 ++--
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash |  4 ++--
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash     |  4 ++--
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash     |  4 ++--
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash   |  4 ++--
 package/kodi-skin-confluence/kodi-skin-confluence.hash       |  4 ++--
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash                     |  4 ++--
 .../kodi-visualisation-fishbmc.hash                          |  4 ++--
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash |  4 ++--
 .../kodi-visualisation-shadertoy.hash                        |  4 ++--
 .../kodi-visualisation-spectrum.hash                         |  4 ++--
 .../kodi-visualisation-starburst.hash                        |  4 ++--
 .../kodi-visualisation-waveform.hash                         |  4 ++--
 package/kodi/kodi.hash                                       | 12 ++++++------
 51 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index 6bc7bc9acf..ecc6f2b778 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6827f1ebefa5f281ace52bdf83b5ab95789c77b88a344524ead1b346668d57e7  kodi-audiodecoder-modplug-2.0.3-Leia.tar.gz
-sha256 317f732723eb58745a9b22c234861dbd2d98972039543f6b549c7cb26eb2cb08  debian/copyright
+sha256  6827f1ebefa5f281ace52bdf83b5ab95789c77b88a344524ead1b346668d57e7  kodi-audiodecoder-modplug-2.0.3-Leia.tar.gz
+sha256  317f732723eb58745a9b22c234861dbd2d98972039543f6b549c7cb26eb2cb08  debian/copyright
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index ae6931ae63..8f04dc5302 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 66305c9d654aed0b9efcf44b90acac0ab8db321dff57523d13faf67606cd78ce  kodi-audiodecoder-nosefart-2.0.2-Leia.tar.gz
-sha256 01a3f135925df23a5d8679ff633fe3d5021125224c9349acd2c35dd0cf3ea762  debian/copyright
+sha256  66305c9d654aed0b9efcf44b90acac0ab8db321dff57523d13faf67606cd78ce  kodi-audiodecoder-nosefart-2.0.2-Leia.tar.gz
+sha256  01a3f135925df23a5d8679ff633fe3d5021125224c9349acd2c35dd0cf3ea762  debian/copyright
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 5c6a644ff3..308f2b6fe1 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 271e513a3094b163f986eb5bb5cbc70c7a602f5764cef255cc161cc5094e5648  kodi-audiodecoder-sidplay-1.2.2-Leia.tar.gz
-sha256 dc915100daec3589f59b47f3438e8ec5ccc11ec25ccb3d0e7e66639764f31584  debian/copyright
+sha256  271e513a3094b163f986eb5bb5cbc70c7a602f5764cef255cc161cc5094e5648  kodi-audiodecoder-sidplay-1.2.2-Leia.tar.gz
+sha256  dc915100daec3589f59b47f3438e8ec5ccc11ec25ccb3d0e7e66639764f31584  debian/copyright
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index ad3bf9be90..c1c2eee2bc 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e059f84b04b8e92e5ecc2989303f6a736f37d6e3bda939ac765499e616c91580  kodi-audiodecoder-snesapu-2.0.2-Leia.tar.gz
-sha256 b7e8b234fc40687d647d929fc554b91cdaa4011e5e656e68c5c6ee8c4cdf81d2  debian/copyright
+sha256  e059f84b04b8e92e5ecc2989303f6a736f37d6e3bda939ac765499e616c91580  kodi-audiodecoder-snesapu-2.0.2-Leia.tar.gz
+sha256  b7e8b234fc40687d647d929fc554b91cdaa4011e5e656e68c5c6ee8c4cdf81d2  debian/copyright
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index ae1c82e2d0..24b764061b 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3e14a7da3822002a90bf7d31a9f98541ae9ec2137c764dc94ca5b4de4ac8de82  kodi-audiodecoder-stsound-2.0.2-Leia.tar.gz
-sha256 417ded3464139990f7898ac17c9eacde85dc0fafd3b3ca0c497d945b1bd93af5  debian/copyright
+sha256  3e14a7da3822002a90bf7d31a9f98541ae9ec2137c764dc94ca5b4de4ac8de82  kodi-audiodecoder-stsound-2.0.2-Leia.tar.gz
+sha256  417ded3464139990f7898ac17c9eacde85dc0fafd3b3ca0c497d945b1bd93af5  debian/copyright
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index b4c9c36045..ea56c38f6c 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b20a3a23056aaf76c216c755f36dff03e943d7c086d3e3fca4c920b93113e073  kodi-audiodecoder-timidity-2.0.5-Leia.tar.gz
-sha256 310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
+sha256  b20a3a23056aaf76c216c755f36dff03e943d7c086d3e3fca4c920b93113e073  kodi-audiodecoder-timidity-2.0.5-Leia.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 05d641b158..3ee9ebbfcb 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 28876be1e1317b3ec5c3a4fe415f20d92a4c5868912656c5e8ab9cdd7e3f32d8  kodi-audiodecoder-vgmstream-1.1.5-Leia.tar.gz
-sha256 fc7c7ab8774d94fb2eccdf47e3b8052a3906e4b5ec8554191da321020c965d8e  debian/copyright
+sha256  28876be1e1317b3ec5c3a4fe415f20d92a4c5868912656c5e8ab9cdd7e3f32d8  kodi-audiodecoder-vgmstream-1.1.5-Leia.tar.gz
+sha256  fc7c7ab8774d94fb2eccdf47e3b8052a3906e4b5ec8554191da321020c965d8e  debian/copyright
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index 187a038eed..9f33d6c63a 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 42e18fc2477ce5abc3efd89851a4bacc6b9436889a607a15f8232ef68b297f93  kodi-audioencoder-flac-2.0.6-Leia.tar.gz
-sha256 21dc3eb9c75f1ed6367a4cf3f3999b299bc6c172da3730184edd2a5dd4d090aa  debian/copyright
+sha256  42e18fc2477ce5abc3efd89851a4bacc6b9436889a607a15f8232ef68b297f93  kodi-audioencoder-flac-2.0.6-Leia.tar.gz
+sha256  21dc3eb9c75f1ed6367a4cf3f3999b299bc6c172da3730184edd2a5dd4d090aa  debian/copyright
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index ef86f90eaa..cd3351e2b7 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9df54cf5c5ae3882a2d89d745c1d1f8b749e71a7f9305a1b059ecfd356995a36  kodi-audioencoder-lame-2.0.4-Leia.tar.gz
-sha256 68a06632cc80eea941b07e27777788dcd4f7c5ba9c006e24f467a9d4bf4d3582  debian/copyright
+sha256  9df54cf5c5ae3882a2d89d745c1d1f8b749e71a7f9305a1b059ecfd356995a36  kodi-audioencoder-lame-2.0.4-Leia.tar.gz
+sha256  68a06632cc80eea941b07e27777788dcd4f7c5ba9c006e24f467a9d4bf4d3582  debian/copyright
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 567b2d6f38..0b9463feb8 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b4b2b1b7ae8bda35514f20ad0275b434f2b60fc93b1e17ca6e654ae145852b1f  kodi-audioencoder-vorbis-2.0.4-Leia.tar.gz
-sha256 706e890fc5c0496b72d3c36284abcc85f9c83b3f2b21db53a68439c538122a59  debian/copyright
+sha256  b4b2b1b7ae8bda35514f20ad0275b434f2b60fc93b1e17ca6e654ae145852b1f  kodi-audioencoder-vorbis-2.0.4-Leia.tar.gz
+sha256  706e890fc5c0496b72d3c36284abcc85f9c83b3f2b21db53a68439c538122a59  debian/copyright
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index e779768812..9b9add2161 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 03cb2810b2aa335fd308a5e2b6580d21ac840334c55fc891acc310633c3c49b4  kodi-audioencoder-wav-2.0.3-Leia.tar.gz
-sha256 341a6317428fbc7c9d5b971d1c6162ea34be64649caa650ee0a05c06ae53a872  debian/copyright
+sha256  03cb2810b2aa335fd308a5e2b6580d21ac840334c55fc891acc310633c3c49b4  kodi-audioencoder-wav-2.0.3-Leia.tar.gz
+sha256  341a6317428fbc7c9d5b971d1c6162ea34be64649caa650ee0a05c06ae53a872  debian/copyright
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 561d94f37c..81dc1c6548 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 14389878598f34c9eb931ee9c7b431ddd4ee19df7368fc718c34b8bf4b56b0a1  kodi-inputstream-adaptive-2.4.5-Leia.tar.gz
-sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
+sha256  14389878598f34c9eb931ee9c7b431ddd4ee19df7368fc718c34b8bf4b56b0a1  kodi-inputstream-adaptive-2.4.5-Leia.tar.gz
+sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index ba6ae0d91d..d472b89ba9 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 56dac63262fa736620863900d903616d4827d735992e6d8beda84e377a5599e5  kodi-inputstream-rtmp-2.0.9-Leia.tar.gz
-sha256 ddba7d22c2586f13de40786c21f3b87c6913c9937f4862dc828d33cfff0395eb  debian/copyright
+sha256  56dac63262fa736620863900d903616d4827d735992e6d8beda84e377a5599e5  kodi-inputstream-rtmp-2.0.9-Leia.tar.gz
+sha256  ddba7d22c2586f13de40786c21f3b87c6913c9937f4862dc828d33cfff0395eb  debian/copyright
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 15397c05cd..d0cac8e4bb 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e83c32380a51ea74bd5f0af74afc747ff5de99167934e2644bc2b3438cd998d0  kodi-peripheral-joystick-1.4.9-Leia.tar.gz
-sha256 2bb807179053b1a7795f9952539a394664847f561a9ffa4ccc36d7bb3cddadf9  debian/copyright
+sha256  e83c32380a51ea74bd5f0af74afc747ff5de99167934e2644bc2b3438cd998d0  kodi-peripheral-joystick-1.4.9-Leia.tar.gz
+sha256  2bb807179053b1a7795f9952539a394664847f561a9ffa4ccc36d7bb3cddadf9  debian/copyright
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 6ff1edf8b9..7443ac65d8 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c1d755230b0f2fe943cf7297a6d187371088f39391944d422d2bf5969c8863c1  kodi-peripheral-xarcade-51e1a4550a6c7d7feeb01760a731af17bea6c524.tar.gz
-sha256 848ad4f3a480c953b556467fb9a315dd352ec1d267e012144c46adc571e39efb  debian/copyright
+sha256  c1d755230b0f2fe943cf7297a6d187371088f39391944d422d2bf5969c8863c1  kodi-peripheral-xarcade-51e1a4550a6c7d7feeb01760a731af17bea6c524.tar.gz
+sha256  848ad4f3a480c953b556467fb9a315dd352ec1d267e012144c46adc571e39efb  debian/copyright
diff --git a/package/kodi-platform/kodi-platform.hash b/package/kodi-platform/kodi-platform.hash
index 2f1164cfb5..28363888e5 100644
--- a/package/kodi-platform/kodi-platform.hash
+++ b/package/kodi-platform/kodi-platform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d5b9b61c1c22b471d948b2c8de50f77ccadbd908869b13b5d98c42f447268d56  kodi-platform-915da086fa7b4ea72796052a04ed6de95501b95c.tar.gz
-sha256 2f4bc4c1244b679121749378ff1a2b4b4e318897dac3d346a236432948ebeea7  debian/copyright
+sha256  d5b9b61c1c22b471d948b2c8de50f77ccadbd908869b13b5d98c42f447268d56  kodi-platform-915da086fa7b4ea72796052a04ed6de95501b95c.tar.gz
+sha256  2f4bc4c1244b679121749378ff1a2b4b4e318897dac3d346a236432948ebeea7  debian/copyright
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index 5610418f7d..5c47dd30b2 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 7bfedb27b2aec4015b2594df18b76fe42e97ec10f4b5cb9c6987b1a7a264c844  kodi-pvr-argustv-3.5.6-Leia.tar.gz
-sha256 17bc5450fff10fc46484886690adbf20c369f5baff021435feab1187b9943834  debian/copyright
+sha256  7bfedb27b2aec4015b2594df18b76fe42e97ec10f4b5cb9c6987b1a7a264c844  kodi-pvr-argustv-3.5.6-Leia.tar.gz
+sha256  17bc5450fff10fc46484886690adbf20c369f5baff021435feab1187b9943834  debian/copyright
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index c07f227809..c2121df025 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ad7586abfe7b3f9dd67b3a2225c442fc8d2a442e48bd7df75b11652286392c2f  kodi-pvr-dvblink-4.7.2-Leia.tar.gz
-sha256 4200fb35edb052f04dc43d267a1ad59468cb899e7b4931756b5830039b82716d  debian/copyright
+sha256  ad7586abfe7b3f9dd67b3a2225c442fc8d2a442e48bd7df75b11652286392c2f  kodi-pvr-dvblink-4.7.2-Leia.tar.gz
+sha256  4200fb35edb052f04dc43d267a1ad59468cb899e7b4931756b5830039b82716d  debian/copyright
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 642f93f71c..ec2013412f 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 8a3d167e652574caf30ba0ce9c22d278715e0237774b817e37826f1b2d647bff  kodi-pvr-dvbviewer-3.7.11-Leia.tar.gz
-sha256 5757dbd6a8731e9395508cd7ab9ca0ea0c2863a7aac7136299d40549c88c9c2c  debian/copyright
+sha256  8a3d167e652574caf30ba0ce9c22d278715e0237774b817e37826f1b2d647bff  kodi-pvr-dvbviewer-3.7.11-Leia.tar.gz
+sha256  5757dbd6a8731e9395508cd7ab9ca0ea0c2863a7aac7136299d40549c88c9c2c  debian/copyright
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 8f181a2420..e89ce6359b 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 90988e4833c0f84ab08e08be3cd08b84e4ba2baf2ebc1545c62e5dbd6708d749  kodi-pvr-filmon-2.4.6-Leia.tar.gz
-sha256 081907693b03f27cb1b17e0a440ae05fd8c8b4631be6fe6fdba4e18a5d40fdc5  debian/copyright
+sha256  90988e4833c0f84ab08e08be3cd08b84e4ba2baf2ebc1545c62e5dbd6708d749  kodi-pvr-filmon-2.4.6-Leia.tar.gz
+sha256  081907693b03f27cb1b17e0a440ae05fd8c8b4631be6fe6fdba4e18a5d40fdc5  debian/copyright
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 3e76af00ed..1762289f0c 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 815ba3dfbe6e1318226d41879057f0b8a4f0ac960d12ebc5d69f0a1ac28cfa09  kodi-pvr-hdhomerun-3.5.0-Leia.tar.gz
-sha256 9e76c8ce9e201f75c50c755982b9e2f15821280dedc5e953f685086912e1e39d  debian/copyright
+sha256  815ba3dfbe6e1318226d41879057f0b8a4f0ac960d12ebc5d69f0a1ac28cfa09  kodi-pvr-hdhomerun-3.5.0-Leia.tar.gz
+sha256  9e76c8ce9e201f75c50c755982b9e2f15821280dedc5e953f685086912e1e39d  debian/copyright
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index d5899f5119..c9724404b5 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6958b91ca616554e4c068bc303c66388e9a2c3a68b5979d8918b4e0d7b6bb95c  kodi-pvr-hts-4.4.21-Leia.tar.gz
-sha256 6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
+sha256  6958b91ca616554e4c068bc303c66388e9a2c3a68b5979d8918b4e0d7b6bb95c  kodi-pvr-hts-4.4.21-Leia.tar.gz
+sha256  6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index bd8caca76a..2de9a4a15b 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0812e359a943f4ffb763b47fc0440768a8aa09f12172ef8dff4440b0a48f9c96  kodi-pvr-iptvsimple-3.9.8-Leia.tar.gz
-sha256 50e33ec3cddb75e6c5c5eb1b3d38cc0adee7dec71d7244925106d4a2c4d5e31d  debian/copyright
+sha256  0812e359a943f4ffb763b47fc0440768a8aa09f12172ef8dff4440b0a48f9c96  kodi-pvr-iptvsimple-3.9.8-Leia.tar.gz
+sha256  50e33ec3cddb75e6c5c5eb1b3d38cc0adee7dec71d7244925106d4a2c4d5e31d  debian/copyright
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 84526b7461..53d4316d06 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9c05578566f7448dc3a7677587c804596aa314afd493cb9c62cc65ea883645aa  kodi-pvr-mediaportal-tvserver-3.5.18-Leia.tar.gz
-sha256 f9df5b0c11a23b2d5ca84828c67412ecd8752df46527285aeff48f4d7988d367  debian/copyright
+sha256  9c05578566f7448dc3a7677587c804596aa314afd493cb9c62cc65ea883645aa  kodi-pvr-mediaportal-tvserver-3.5.18-Leia.tar.gz
+sha256  f9df5b0c11a23b2d5ca84828c67412ecd8752df46527285aeff48f4d7988d367  debian/copyright
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 4faeb1f04d..c03afbb8e3 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 fef27e73009f095a22e4843e48455a343a4fe095ae9692b9fa96ffac7fb0844c  kodi-pvr-mythtv-5.10.16-Leia.tar.gz
-sha256 0efb11009d447b39ec35d77dc265db3d1c3d261730bbc33b267587254d973ec8  debian/copyright
+sha256  fef27e73009f095a22e4843e48455a343a4fe095ae9692b9fa96ffac7fb0844c  kodi-pvr-mythtv-5.10.16-Leia.tar.gz
+sha256  0efb11009d447b39ec35d77dc265db3d1c3d261730bbc33b267587254d973ec8  debian/copyright
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 4d730deb85..e305265a9d 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 5f1b7fa00d7248fa840a0e7574bb7714867bff4ad81ceb8ed33cb3aa6d5ccbe9  kodi-pvr-nextpvr-3.3.19-Leia.tar.gz
-sha256 0bd576badce05c6b4315c415dabd77d80c871e72026c399f7a7bb8582e0911fe  debian/copyright
+sha256  5f1b7fa00d7248fa840a0e7574bb7714867bff4ad81ceb8ed33cb3aa6d5ccbe9  kodi-pvr-nextpvr-3.3.19-Leia.tar.gz
+sha256  0bd576badce05c6b4315c415dabd77d80c871e72026c399f7a7bb8582e0911fe  debian/copyright
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index cf23a3abaa..3071dfac67 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 8c42a3c3754d7a07de9682504c4883a584eb21a92b9af70f0129ffc2707c1554  kodi-pvr-njoy-3.4.2-Leia.tar.gz
-sha256 9d42154eabd84ae131cc6384a3ea0fc622c3551595564bec7a6bec8df4a57fbd  debian/copyright
+sha256  8c42a3c3754d7a07de9682504c4883a584eb21a92b9af70f0129ffc2707c1554  kodi-pvr-njoy-3.4.2-Leia.tar.gz
+sha256  9d42154eabd84ae131cc6384a3ea0fc622c3551595564bec7a6bec8df4a57fbd  debian/copyright
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 206c4f3dea..30fb81a906 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 10124e5444c6cfb0c77bad1d1122f6ba5fc233248d6b33066ba799f4dedceeee  kodi-pvr-pctv-2.4.7-Leia.tar.gz
-sha256 43376e70ae80133530c8ce71a3b0dcde8529a8162d3b3956009eb8fc0f5c559c  debian/copyright
+sha256  10124e5444c6cfb0c77bad1d1122f6ba5fc233248d6b33066ba799f4dedceeee  kodi-pvr-pctv-2.4.7-Leia.tar.gz
+sha256  43376e70ae80133530c8ce71a3b0dcde8529a8162d3b3956009eb8fc0f5c559c  debian/copyright
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 720689dc43..cc129d90ec 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 03eb428f21d6b8526b6671278b60ac6dc5a761a515af27172d8ac5c814cc3f65  kodi-pvr-stalker-3.4.10-Leia.tar.gz
-sha256 f9fa34b2caa07376a7a976c1f0b1b9761b37449afd4ceb1e7afa283492054237  debian/copyright
+sha256  03eb428f21d6b8526b6671278b60ac6dc5a761a515af27172d8ac5c814cc3f65  kodi-pvr-stalker-3.4.10-Leia.tar.gz
+sha256  f9fa34b2caa07376a7a976c1f0b1b9761b37449afd4ceb1e7afa283492054237  debian/copyright
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index a3c624526e..b753b994a1 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 98aadcf3d0109a7dc5f85b4e5473d595039b59c46b0686a2fbda88ff7631ee0c  kodi-pvr-vbox-4.7.0-Leia.tar.gz
-sha256 f535b79e33bdf4d270f8aed3fdcb92f807981f808d7f5e3c053c088e5ccf553b  debian/copyright
+sha256  98aadcf3d0109a7dc5f85b4e5473d595039b59c46b0686a2fbda88ff7631ee0c  kodi-pvr-vbox-4.7.0-Leia.tar.gz
+sha256  f535b79e33bdf4d270f8aed3fdcb92f807981f808d7f5e3c053c088e5ccf553b  debian/copyright
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index d70a5c30b3..f7043b58a0 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f0ea8907e77ca014429bbe73d07c3410cc7be25a6db0df157863b87d2684affb  kodi-pvr-vdr-vnsi-3.6.4-Leia.tar.gz
-sha256 28266596fdf4162d4f15985e0108cd9ddb42531ddad2297011649c1af49f7fe2  debian/copyright
+sha256  f0ea8907e77ca014429bbe73d07c3410cc7be25a6db0df157863b87d2684affb  kodi-pvr-vdr-vnsi-3.6.4-Leia.tar.gz
+sha256  28266596fdf4162d4f15985e0108cd9ddb42531ddad2297011649c1af49f7fe2  debian/copyright
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index bd7f865486..e80e51bc78 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d7dd890e4491e211ff3781cdc043347ab7a4ef6e00619ac1b4641ed81b0c3626  kodi-pvr-vuplus-3.28.9-Leia.tar.gz
-sha256 e98518889de8d38eaa6ddcb086b6e3b86efed98b501a5c666b9cf48f79e6df5d  debian/copyright
+sha256  d7dd890e4491e211ff3781cdc043347ab7a4ef6e00619ac1b4641ed81b0c3626  kodi-pvr-vuplus-3.28.9-Leia.tar.gz
+sha256  e98518889de8d38eaa6ddcb086b6e3b86efed98b501a5c666b9cf48f79e6df5d  debian/copyright
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 21e7414d0e..d5387e8534 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 7fb150ba3b8b41cf164425b56ae5dda3a5fb2f64cdea7229900113965d492fee  kodi-pvr-wmc-2.4.6-Leia.tar.gz
-sha256 6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
+sha256  7fb150ba3b8b41cf164425b56ae5dda3a5fb2f64cdea7229900113965d492fee  kodi-pvr-wmc-2.4.6-Leia.tar.gz
+sha256  6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index 00d40413b6..3cf6f1ccc2 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c359f8bb6a2e9b42dcfb063cdf965ce0b3fc95761816d98160000aea33894241  kodi-screensaver-asteroids-2.3.2-Leia.tar.gz
-sha256 297a1d34e6000f1b1a924f5ab75c16c2270968bfa47357dd8fa3799c9dfc47d8  debian/copyright
+sha256  c359f8bb6a2e9b42dcfb063cdf965ce0b3fc95761816d98160000aea33894241  kodi-screensaver-asteroids-2.3.2-Leia.tar.gz
+sha256  297a1d34e6000f1b1a924f5ab75c16c2270968bfa47357dd8fa3799c9dfc47d8  debian/copyright
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index c320215e54..29242f26ab 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 44fb4189afefec6ab5cff04d205425bed26b127c02625ae176b409cb67207e5f  kodi-screensaver-asterwave-3.0.4-Leia.tar.gz
-sha256 a0268e081014f3a555be39f7eb0fff759424963324915ad2ea56bf26668685e7  debian/copyright
+sha256  44fb4189afefec6ab5cff04d205425bed26b127c02625ae176b409cb67207e5f  kodi-screensaver-asterwave-3.0.4-Leia.tar.gz
+sha256  a0268e081014f3a555be39f7eb0fff759424963324915ad2ea56bf26668685e7  debian/copyright
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index f73932d269..12e52a6747 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 8234240670c8cd0feb61536e08058a1ec2122dc638dcc4bf328fad8d70b3d4c6  kodi-screensaver-cpblobs-3.0.4-Leia.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  8234240670c8cd0feb61536e08058a1ec2122dc638dcc4bf328fad8d70b3d4c6  kodi-screensaver-cpblobs-3.0.4-Leia.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
index 407093f196..59e0703255 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d8ed548222f1118964104fefc8ac3056dfe6c9d2ee35cd7c8355c9ea9fcaffc5  kodi-screensaver-crystalmorph-4439c84c38abf889e19a1863e745942c0d7f8203.tar.gz
-sha256 febce1924ed772f22ec3fabec646b1401aad4f4a81a7f1baeb858f27ae4f5241  src/Fractal.cpp
+sha256  d8ed548222f1118964104fefc8ac3056dfe6c9d2ee35cd7c8355c9ea9fcaffc5  kodi-screensaver-crystalmorph-4439c84c38abf889e19a1863e745942c0d7f8203.tar.gz
+sha256  febce1924ed772f22ec3fabec646b1401aad4f4a81a7f1baeb858f27ae4f5241  src/Fractal.cpp
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 814d139689..eac9e1022c 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 02114c9c7467cba26ce93090ee66c015dd74fc1f0d74b46e609e53d1fd8fd218  kodi-screensaver-greynetic-2.2.2-Leia.tar.gz
-sha256 2905fdee5c68dc4944c42711d45f47794e8fb881bd67d66d0875d10f9a2156a0  debian/copyright
+sha256  02114c9c7467cba26ce93090ee66c015dd74fc1f0d74b46e609e53d1fd8fd218  kodi-screensaver-greynetic-2.2.2-Leia.tar.gz
+sha256  2905fdee5c68dc4944c42711d45f47794e8fb881bd67d66d0875d10f9a2156a0  debian/copyright
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 6374f3aff1..d9cc7f6ce5 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 618a7dfc85961c803b6292cea9004bdb71566e10a32aec2870cd29775681a808  kodi-screensaver-pingpong-2.1.2-Leia.tar.gz
-sha256 96e9b817ea6384e3d2c5241c8a0504df11d6f8bd0a2f58f25df7152da64f263c  debian/copyright
+sha256  618a7dfc85961c803b6292cea9004bdb71566e10a32aec2870cd29775681a808  kodi-screensaver-pingpong-2.1.2-Leia.tar.gz
+sha256  96e9b817ea6384e3d2c5241c8a0504df11d6f8bd0a2f58f25df7152da64f263c  debian/copyright
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index f35a62a08d..fd51a7c1d3 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 cf9ed582b70460682175366641e6a00eaea085a1d3477a02710ba8398a1d17bd  kodi-screensaver-pyro-3.0.1-Leia.tar.gz
-sha256 24354cf1e6058ba0a95c7652eab9f1be2224c835ce36d14e82c0f401f65a53b7  debian/copyright
+sha256  cf9ed582b70460682175366641e6a00eaea085a1d3477a02710ba8398a1d17bd  kodi-screensaver-pyro-3.0.1-Leia.tar.gz
+sha256  24354cf1e6058ba0a95c7652eab9f1be2224c835ce36d14e82c0f401f65a53b7  debian/copyright
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 8f34b349e7..f4987a44cd 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 22ff3f0ca9679c59ce1a90b98d918dd10a8012b789729b2e44c04d4ce8c86ad8  kodi-screensaver-rsxs-7cb648507440d87948dec10d5bfdab3b722d37fe.tar.gz
-sha256 fa0ff8b6a6267b9477be7d505aa384056633b4be17e0b9d308df9bd70d1c99f6  debian/copyright
+sha256  22ff3f0ca9679c59ce1a90b98d918dd10a8012b789729b2e44c04d4ce8c86ad8  kodi-screensaver-rsxs-7cb648507440d87948dec10d5bfdab3b722d37fe.tar.gz
+sha256  fa0ff8b6a6267b9477be7d505aa384056633b4be17e0b9d308df9bd70d1c99f6  debian/copyright
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 9d6ce8aaf9..b658517300 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 98972a9af45015d902ade50db822dbded52d4473acde6bc4b01a5ab8c4af4269  kodi-screensaver-stars-2.1.4-Leia.tar.gz
-sha256 310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
+sha256  98972a9af45015d902ade50db822dbded52d4473acde6bc4b01a5ab8c4af4269  kodi-screensaver-stars-2.1.4-Leia.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 113548bf64..fdd4e828f6 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 dc4a0abf05db50caf8e70e4904b8c2c445008ec3d6d23381c9c31dedaf6109de  kodi-skin-confluence-cffcb8320003e6048abe4b26316e5d5f3d50eac9.tar.gz
-sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
+sha256  dc4a0abf05db50caf8e70e4904b8c2c445008ec3d6d23381c9c31dedaf6109de  kodi-skin-confluence-cffcb8320003e6048abe4b26316e5d5f3d50eac9.tar.gz
+sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index bc861627d3..a17c2d32c6 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 dc3db18b6cef90cd518b741e5c9bc7b3f4412774ee60bf70b451a8d2fc88a091  kodi-vfs-sftp-1.0.6-Leia.tar.gz
-sha256 310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
+sha256  dc3db18b6cef90cd518b741e5c9bc7b3f4412774ee60bf70b451a8d2fc88a091  kodi-vfs-sftp-1.0.6-Leia.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index e8b5c6cb59..390b4be8fc 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 8142fe4a32c0c113945c5fc9745e54639ca73308371d292e3422730bfad1d064  kodi-visualisation-fishbmc-5.1.2-Leia.tar.gz
-sha256 684792cea796ea39d086ffd6cf5cb7c70ab8188dcf493707ba90d081d28f787e  visualization.fishbmc/LICENSE
+sha256  8142fe4a32c0c113945c5fc9745e54639ca73308371d292e3422730bfad1d064  kodi-visualisation-fishbmc-5.1.2-Leia.tar.gz
+sha256  684792cea796ea39d086ffd6cf5cb7c70ab8188dcf493707ba90d081d28f787e  visualization.fishbmc/LICENSE
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index a6f4e41796..f12b0ec7c2 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a02dfd844cfd5ff24f735e614a2a4727771112ce15642957a2511061f724392a  kodi-visualisation-goom-2.2.1-Leia.tar.gz
-sha256 a6b36f495079206146ae0b11624a8db49a538f421ffe1341f8651c9e6b06f0b0  debian/copyright
+sha256  a02dfd844cfd5ff24f735e614a2a4727771112ce15642957a2511061f724392a  kodi-visualisation-goom-2.2.1-Leia.tar.gz
+sha256  a6b36f495079206146ae0b11624a8db49a538f421ffe1341f8651c9e6b06f0b0  debian/copyright
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index c0a04759f9..6585467ef8 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 7b09de334ed3c96d2e2552e0594b8f76c11e36edfc10efd725851140132a4d4f  kodi-visualisation-shadertoy-1.2.3-Leia.tar.gz
-sha256 e33ac3ac6ca1bdd4a4a411481d43579d855622e7ecc207809b5f49ea617db480  debian/copyright
+sha256  7b09de334ed3c96d2e2552e0594b8f76c11e36edfc10efd725851140132a4d4f  kodi-visualisation-shadertoy-1.2.3-Leia.tar.gz
+sha256  e33ac3ac6ca1bdd4a4a411481d43579d855622e7ecc207809b5f49ea617db480  debian/copyright
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 4064184a75..ae78fbd355 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ec88defbb90fdb03f075abdba39c436906a8fbad8f034da3e3b31f75842206cc  kodi-visualisation-spectrum-3.0.2-Leia.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  ec88defbb90fdb03f075abdba39c436906a8fbad8f034da3e3b31f75842206cc  kodi-visualisation-spectrum-3.0.2-Leia.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index 354ff80cb0..a0c820eea3 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 8e2ee8b39fe1c0daa24b11a9c4a175a85fdbdf7dc1bc48a1ab4876edeb6f676f  kodi-visualisation-starburst-2.0.2-Leia.tar.gz
-sha256 2e668b3da2f061a6d6ecc3cb96bdfb0f8fc9cc98c9e9f95454bc45b88708690f  debian/copyright
+sha256  8e2ee8b39fe1c0daa24b11a9c4a175a85fdbdf7dc1bc48a1ab4876edeb6f676f  kodi-visualisation-starburst-2.0.2-Leia.tar.gz
+sha256  2e668b3da2f061a6d6ecc3cb96bdfb0f8fc9cc98c9e9f95454bc45b88708690f  debian/copyright
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 80808663c1..282a2dab0f 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c5fbf48c2251b61d9abfcd679a750199f5efc78e63fded9a1482cfd9b41d0b5b  kodi-visualisation-waveform-3.1.1-Leia.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  c5fbf48c2251b61d9abfcd679a750199f5efc78e63fded9a1482cfd9b41d0b5b  kodi-visualisation-waveform-3.1.1-Leia.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 1617b25979..16ba5455e8 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha256 5cfec391bcd168bbd4f9d38a6c8ec93e42e040cf82cf6ebf23db5e86753816fb  kodi-18.7.1-Leia.tar.gz
-sha256 e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  kodi-ffmpeg-4.0.4-Leia-18.4.tar.gz
-sha256 38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
-sha256 071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
-sha256 a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
-sha256 9d2396ef3e091d3b82bc84143e070700412984e8589513570f54e0675d1e8851  LICENSE.md
+sha256  5cfec391bcd168bbd4f9d38a6c8ec93e42e040cf82cf6ebf23db5e86753816fb  kodi-18.7.1-Leia.tar.gz
+sha256  e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  kodi-ffmpeg-4.0.4-Leia-18.4.tar.gz
+sha256  38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
+sha256  071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
+sha256  a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
+sha256  9d2396ef3e091d3b82bc84143e070700412984e8589513570f54e0675d1e8851  LICENSE.md
