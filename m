From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:41:49 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-*: mass
	version bump
Message-ID: <20170531204154.365238189B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebe5962220665c8b1e0e64ea60a061dd20f62854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit brings our package versions in-line with upstream repo:
https://github.com/xbmc/repo-binary-addons/tree/Krypton

after this commit:
https://github.com/xbmc/repo-binary-addons/commit/a6621cbdc6ae2ef35b4188d909ca7f37a38a41f0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash                          | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                            | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash                          | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                            | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash                      | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                        | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash                            | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                              | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash                      | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk                        | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.hash                                  | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk                                    | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash                    | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk                      | 2 +-
 .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash    | 2 +-
 package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk  | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash                          | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                            | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                                | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                                  | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash                                | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                                  | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash                          | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                            | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash                                | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                                  | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                            | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                              | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                                  | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                    | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index fa1785a..138efa1 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d890af9db0b69c50d2e0f55d19ea9d678c335543c9f21287e98cb872c008d2bc  kodi-pvr-argustv-9040b1447bd622bcbae3f8944e7b84d933037644.tar.gz
+sha256 ba9e4d76b9e6d2d879e95eeda0d919ca5eabc0d6f59037f173cd9294b2ce8e4a  kodi-pvr-argustv-2.5.6-Krypton.tar.gz
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 5a610aa..2cf4d75 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_ARGUSTV_VERSION = 9040b1447bd622bcbae3f8944e7b84d933037644
+KODI_PVR_ARGUSTV_VERSION = 2.5.6-Krypton
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index b4c5eb7..e9b8673 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ac26d449915157a1d2833902c53dcb7fb341097bf984a7510c80f31a700bcba2  kodi-pvr-dvblink-17d12632b22efad4d3c4e73b8e48f58a6b13de01.tar.gz
+sha256 a45fff0c1fe6d91fd957e2a4e62e9c72a5c36d796c41caa6b1e5a4814f82a503  kodi-pvr-dvblink-3.4.5v2-Krypton.tar.gz
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 5f4b9e7..9860b63 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBLINK_VERSION = 17d12632b22efad4d3c4e73b8e48f58a6b13de01
+KODI_PVR_DVBLINK_VERSION = 3.4.5v2-Krypton
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 620606f..ccb4521 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 6a6f0dc33d347d84233e22efa5da4033f9477fe6a9e8bb0a58d0b3f3152df384  kodi-pvr-dvbviewer-602042c9a7aa0035d799c6296e6ea06b5d5c3c4f.tar.gz
+sha256 4332fa50172409271909c90a8f923eb336ff93b0a7d61b183ce84d6975fa622e  kodi-pvr-dvbviewer-2.4.11-Krypton.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index d950b36..0c62c5a 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBVIEWER_VERSION = 602042c9a7aa0035d799c6296e6ea06b5d5c3c4f
+KODI_PVR_DVBVIEWER_VERSION = 2.4.11-Krypton
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 74882d3..7417b26 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d59c4c5906411aff0c0160a8a478cdbee6559bd9a842b172cc24888da9abee25  kodi-pvr-filmon-ab9b5198feb7eb2ff94ea495414ff214c09c9391.tar.gz
+sha256 0384db9cbcd8ab2e7b8b0eb8c22e8913e734e436234c43d357718c5273058605  kodi-pvr-filmon-1.4.8-Krypton.tar.gz
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index ff1d115..daa3e39 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_FILMON_VERSION = ab9b5198feb7eb2ff94ea495414ff214c09c9391
+KODI_PVR_FILMON_VERSION = 1.4.8-Krypton
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index c2af4c7..8262f4e 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8de6dff4853a6dab886e41dcd01bd017e9ee35fecdb0f6cfdec739bfe9214ad6  kodi-pvr-hdhomerun-60d89d16dd953d38947e8a6da2f8bb84a0f764ef.tar.gz
+sha256 3c000b3ebab2b12f5635451f6a71ad01c4f4d7043623cfeebfe6b7c662e026d9  kodi-pvr-hdhomerun-2.4.7-Krypton.tar.gz
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index ab14f06..75fa487 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HDHOMERUN_VERSION = 60d89d16dd953d38947e8a6da2f8bb84a0f764ef
+KODI_PVR_HDHOMERUN_VERSION = 2.4.7-Krypton
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 790667f..5656e8e 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f3458e36811da1fcca88e0c0cd41b326845e1d45198d78b3c6e635b03f3bd40e  kodi-pvr-hts-4e2a8334d4e62e63720a33a18c3e3c7ff4b4ad0b.tar.gz
+sha256 29867bd1fad4c4d69ec0d25ea1bb1507fd4543442aef890a2124f63f67318d92  kodi-pvr-hts-3.4.24-Krypton.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index a167295..fb5873b 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HTS_VERSION = 4e2a8334d4e62e63720a33a18c3e3c7ff4b4ad0b
+KODI_PVR_HTS_VERSION = 3.4.24-Krypton
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 12026d5..906cbb5 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 789f6b83565de5607dc444ee7e1cf11b7568caea5373f9b994d68effcb98c62a  kodi-pvr-iptvsimple-d7828163f26a0ccb175058faa9d87b1fcdc89220.tar.gz
+sha256 0a006e275cddba02d5d3fd22a95cec6411a765719509a9bc8fcc93dfa247bd4c  kodi-pvr-iptvsimple-2.4.11-Krypton.tar.gz
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index e6796e6..5ea0a45 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_IPTVSIMPLE_VERSION = d7828163f26a0ccb175058faa9d87b1fcdc89220
+KODI_PVR_IPTVSIMPLE_VERSION = 2.4.11-Krypton
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 5abc082..6eb0abf 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0b5b1ba387fa2f7c2374bc501bbb5a77aa95c016ac1b34a3b3933a89a21b0038  kodi-pvr-mediaportal-tvserver-d261c83a4ab40441be32c1202138fc6409a22974.tar.gz
+sha256 3f5c022f83636b3739f26c1a07166b498eac82e8081ed7551980f4bb27c6b56e  kodi-pvr-mediaportal-tvserver-2.4.19v2-Krypton.tar.gz
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index 6520e4f..99a3189 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = d261c83a4ab40441be32c1202138fc6409a22974
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 2.4.19v2-Krypton
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 9c53888..3d10b5b 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 039bf21f42032235056aeb9fc8800c41d5c4c842bbc1a0fb340a33cd04049587  kodi-pvr-nextpvr-dd03d62adab4f07c1354652033dffa6da25ba9b7.tar.gz
+sha256 b126943a6d48ea4d2df38951505f385c2a499e399201eccd798a34076d3c5842  kodi-pvr-nextpvr-2.4.13-Krypton.tar.gz
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 6776d14..d0a0499 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NEXTPVR_VERSION = dd03d62adab4f07c1354652033dffa6da25ba9b7
+KODI_PVR_NEXTPVR_VERSION = 2.4.13-Krypton
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index c201a73..261558e 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 6dc95a7fc0faeab30fb5e09ef3bc341f44bfa96500daaf3c169ae4e539745f71  kodi-pvr-njoy-ce66c1d40819cb42b3e70a3b616a7755099b2f3d.tar.gz
+sha256 e4e0a6bb1bf0c6f8ae011eba58c5f0ae19a6574bb35fc6a7fbdbb99d20242a2c  kodi-pvr-njoy-2.4.3-Krypton.tar.gz
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index 1c7c4dd..e946e67 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NJOY_VERSION = ce66c1d40819cb42b3e70a3b616a7755099b2f3d
+KODI_PVR_NJOY_VERSION = 2.4.3-Krypton
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index a1e650b..5044806 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c348eb924d2a2842de919fd9561f2efd07586dfdef18cdb6b55a331e1ed3f11f  kodi-pvr-pctv-85d6eae79876af8a6db2413e3884296520271768.tar.gz
+sha256 95f95f39739baf6013bb6c9188743f842f6ba3e1fa541907067f795e1a3c66a1  kodi-pvr-pctv-1.4.7-Krypton.tar.gz
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index e3ff8b2..6c7a030 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_PCTV_VERSION = 85d6eae79876af8a6db2413e3884296520271768
+KODI_PVR_PCTV_VERSION = 1.4.7-Krypton
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 4027d2b..07c768f 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4156e9e1bf35621a5ef35ad4e944380ba3725789bc51694d397a831341ab517d  kodi-pvr-stalker-df111a0d0a67669b732d8986e5473f3ffd9d7d9c.tar.gz
+sha256 466cb3869927cdd245a746a32d92250e198befe577f7a847884eab1fd8eeb139  kodi-pvr-stalker-2.8.6-Krypton.tar.gz
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 51dffb4..ee61171 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_STALKER_VERSION = df111a0d0a67669b732d8986e5473f3ffd9d7d9c
+KODI_PVR_STALKER_VERSION = 2.8.6-Krypton
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index 5472be8..5f2c78f 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f8e6cb967a175450bfc74225ae0b06b9a5e6fb91458f5123359191b4831c5921  kodi-pvr-vbox-adc6c346cc3570a232d336fcebfb0905eaaa9b96.tar.gz
+sha256 78065a46b95b3988b1e49fe05da249a1896f54a2c30116a9446f7c4f55db743b  kodi-pvr-vbox-3.6.10-Krypton.tar.gz
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index e786cbf..2c54e14 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VBOX_VERSION = adc6c346cc3570a232d336fcebfb0905eaaa9b96
+KODI_PVR_VBOX_VERSION = 3.6.10-Krypton
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index 70c564e..7c91e36 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0c17505be16c581d4fad2912350b96f8efbf776657467f67becfd499950bd82d  kodi-pvr-vuplus-25c4883e7c73c71d77fd32c8e33284ed5f081287.tar.gz
+sha256 79cd3ea79957ae2bca67c9a1cefe3546f27a6d4e88adb4973bb08228425be2fe  kodi-pvr-vuplus-2.4.10-Krypton.tar.gz
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 1ea0d94..e99f226 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VUPLUS_VERSION = 25c4883e7c73c71d77fd32c8e33284ed5f081287
+KODI_PVR_VUPLUS_VERSION = 2.4.10-Krypton
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 21fdd71..4c050fb 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 77eecab002e178ebdaa78c45ba43c836da002813e8c17769f6752dc91a8fef42  kodi-pvr-wmc-ed67cfedc1dad168c167d86d20fe4d0934504633.tar.gz
+sha256 7f5dfb88f54d511d575b7aabd94e1a862afb7e8a0b89fa957db6a135c31846eb  kodi-pvr-wmc-1.4.9v2-Krypton.tar.gz
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index c2969b8..b6e3d43 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_WMC_VERSION = ed67cfedc1dad168c167d86d20fe4d0934504633
+KODI_PVR_WMC_VERSION = 1.4.9v2-Krypton
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
