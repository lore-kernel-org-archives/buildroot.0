From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:39:17 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-*: mass
	version bump
Message-ID: <20170511213926.A1C88817E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=579665eaf5ce64169354576fa82471d804a5541a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bumps contain mostly translation updates:

package/kodi-pvr-argustv: bump version to 2.5.6
package/kodi-pvr-dvblink: bump version to 3.4.5
package/kodi-pvr-dvbviewer: bump version to 2.4.11
package/kodi-pvr-filmon: bump version to 1.4.9
package/kodi-pvr-hdhomerun: bump version to 2.4.7
package/kodi-pvr-hts: bump version to 3.4.24
package/kodi-pvr-iptvsimple: bump version to 2.4.11
package/kodi-pvr-mediaportal-tvserver: bump version to 2.4.19
package/kodi-pvr-nextpvr: bump version to 2.4.13
package/kodi-pvr-njoy: bump version to 2.4.3
package/kodi-pvr-pctv: bump version to 1.4.7
package/kodi-pvr-stalker: bump version to 2.8.6
package/kodi-pvr-vbox: bump version to 3.6.10
package/kodi-pvr-vdr-vnsi: bump version to 2.6.21
package/kodi-pvr-vuplus: bump version to 2.4.10
package/kodi-pvr-wmc: bump version to 1.4.9

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
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash                        | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                          | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                            | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                              | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                                  | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                    | 2 +-
 32 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index d5db668..fa1785a 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4fa8280c023805e2104b9331632daa2c6493d6b11ec0611110b1e12eadb70794  kodi-pvr-argustv-2.5.4-Krypton.tar.gz
+sha256 d890af9db0b69c50d2e0f55d19ea9d678c335543c9f21287e98cb872c008d2bc  kodi-pvr-argustv-9040b1447bd622bcbae3f8944e7b84d933037644.tar.gz
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 06bdba9..5a610aa 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_ARGUSTV_VERSION = 2.5.4-Krypton
+KODI_PVR_ARGUSTV_VERSION = 9040b1447bd622bcbae3f8944e7b84d933037644
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index 1d377b3..b4c5eb7 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d31c00a8b3b09fa0f552de732fee4ff46e90673e03551bed67b3e3a1e2815281  kodi-pvr-dvblink-3.4.3-Krypton.tar.gz
+sha256 ac26d449915157a1d2833902c53dcb7fb341097bf984a7510c80f31a700bcba2  kodi-pvr-dvblink-17d12632b22efad4d3c4e73b8e48f58a6b13de01.tar.gz
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 7d98267..5f4b9e7 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBLINK_VERSION = 3.4.3-Krypton
+KODI_PVR_DVBLINK_VERSION = 17d12632b22efad4d3c4e73b8e48f58a6b13de01
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 8ec0e60..620606f 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 91479e7c0201563f83c5cf75b520b2ef4405dc80fb7c3f4c81fa72be6a64169d  kodi-pvr-dvbviewer-2.4.7.tar.gz
+sha256 6a6f0dc33d347d84233e22efa5da4033f9477fe6a9e8bb0a58d0b3f3152df384  kodi-pvr-dvbviewer-602042c9a7aa0035d799c6296e6ea06b5d5c3c4f.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index 0203987..d950b36 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBVIEWER_VERSION = 2.4.7
+KODI_PVR_DVBVIEWER_VERSION = 602042c9a7aa0035d799c6296e6ea06b5d5c3c4f
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 1d4c73f..74882d3 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 87ad3adc22ec64be15b9408c51388bb7d12b0089dd466aae73ae082d0576320c  kodi-pvr-filmon-1.4.7-Krypton.tar.gz
+sha256 d59c4c5906411aff0c0160a8a478cdbee6559bd9a842b172cc24888da9abee25  kodi-pvr-filmon-ab9b5198feb7eb2ff94ea495414ff214c09c9391.tar.gz
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index af0fe64..ff1d115 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_FILMON_VERSION = 1.4.7-Krypton
+KODI_PVR_FILMON_VERSION = ab9b5198feb7eb2ff94ea495414ff214c09c9391
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index b9ef293..c2af4c7 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 df6be23cb370bce2a6b2a8944358d27e11a8edc665deb976cbd4d2e7e1eba1c0  kodi-pvr-hdhomerun-2.4.6-Krypton.tar.gz
+sha256 8de6dff4853a6dab886e41dcd01bd017e9ee35fecdb0f6cfdec739bfe9214ad6  kodi-pvr-hdhomerun-60d89d16dd953d38947e8a6da2f8bb84a0f764ef.tar.gz
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index aaecc7f..ab14f06 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HDHOMERUN_VERSION = 2.4.6-Krypton
+KODI_PVR_HDHOMERUN_VERSION = 60d89d16dd953d38947e8a6da2f8bb84a0f764ef
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 13f250a..790667f 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c66d8a6b2499d31947aa532629ccabf82cec94bff866ef30f64ec0a752b77407  kodi-pvr-hts-3.4.17.tar.gz
+sha256 f3458e36811da1fcca88e0c0cd41b326845e1d45198d78b3c6e635b03f3bd40e  kodi-pvr-hts-4e2a8334d4e62e63720a33a18c3e3c7ff4b4ad0b.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 90f05fb..a167295 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HTS_VERSION = 3.4.17
+KODI_PVR_HTS_VERSION = 4e2a8334d4e62e63720a33a18c3e3c7ff4b4ad0b
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 47eae66..12026d5 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 58be5ff8a2f97bb4a49e473be9385ff188582b5ed2cbf8ffc5d55ba0c1fc0ffb  kodi-pvr-iptvsimple-8f725faf6b31151f91f52e8ce336ff57a905046d.tar.gz
+sha256 789f6b83565de5607dc444ee7e1cf11b7568caea5373f9b994d68effcb98c62a  kodi-pvr-iptvsimple-d7828163f26a0ccb175058faa9d87b1fcdc89220.tar.gz
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 99045a1..e6796e6 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_IPTVSIMPLE_VERSION = 8f725faf6b31151f91f52e8ce336ff57a905046d
+KODI_PVR_IPTVSIMPLE_VERSION = d7828163f26a0ccb175058faa9d87b1fcdc89220
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 02d59df..5abc082 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 59264354c79eaf1658755cb5bc05efc8bca581ed8fb762e82665ec128453e648  kodi-pvr-mediaportal-tvserver-2.4.16-Krypton.tar.gz
+sha256 0b5b1ba387fa2f7c2374bc501bbb5a77aa95c016ac1b34a3b3933a89a21b0038  kodi-pvr-mediaportal-tvserver-d261c83a4ab40441be32c1202138fc6409a22974.tar.gz
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index 02ef48c..6520e4f 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 2.4.16-Krypton
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = d261c83a4ab40441be32c1202138fc6409a22974
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 4deb220..9c53888 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5b0839141c9bdd1150442ef06974755bccb381b2998ddffa584eb234a83b7af5  kodi-pvr-nextpvr-2.4.11-Krypton.tar.gz
+sha256 039bf21f42032235056aeb9fc8800c41d5c4c842bbc1a0fb340a33cd04049587  kodi-pvr-nextpvr-dd03d62adab4f07c1354652033dffa6da25ba9b7.tar.gz
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 8f06f32..6776d14 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NEXTPVR_VERSION = 2.4.11-Krypton
+KODI_PVR_NEXTPVR_VERSION = dd03d62adab4f07c1354652033dffa6da25ba9b7
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index 29fc6e6..c201a73 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4315b5f87986c17e668d0d89093059b96315b8a7908fc060e2660e5bf8216057  kodi-pvr-njoy-2.4.2-Krypton.tar.gz
+sha256 6dc95a7fc0faeab30fb5e09ef3bc341f44bfa96500daaf3c169ae4e539745f71  kodi-pvr-njoy-ce66c1d40819cb42b3e70a3b616a7755099b2f3d.tar.gz
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index 0106585..1c7c4dd 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NJOY_VERSION = 2.4.2-Krypton
+KODI_PVR_NJOY_VERSION = ce66c1d40819cb42b3e70a3b616a7755099b2f3d
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 62d9965..a1e650b 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0e5a0fcbdbda0200ebde50552bd68eddd8644010bd39d1cf0038ba28182ca8bb  kodi-pvr-pctv-1.4.5-Krypton.tar.gz
+sha256 c348eb924d2a2842de919fd9561f2efd07586dfdef18cdb6b55a331e1ed3f11f  kodi-pvr-pctv-85d6eae79876af8a6db2413e3884296520271768.tar.gz
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 881dbe0..e3ff8b2 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_PCTV_VERSION = 1.4.5-Krypton
+KODI_PVR_PCTV_VERSION = 85d6eae79876af8a6db2413e3884296520271768
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 914ef48..4027d2b 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 3bdd6debd8e8085e54d665f4b870bc77a18800c08d517d837d2ac703b0984622  kodi-pvr-stalker-2.8.3-Krypton.tar.gz
+sha256 4156e9e1bf35621a5ef35ad4e944380ba3725789bc51694d397a831341ab517d  kodi-pvr-stalker-df111a0d0a67669b732d8986e5473f3ffd9d7d9c.tar.gz
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index eeadc03..51dffb4 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_STALKER_VERSION = 2.8.3-Krypton
+KODI_PVR_STALKER_VERSION = df111a0d0a67669b732d8986e5473f3ffd9d7d9c
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index a3d3c21..5472be8 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b04f1e3fc50d1cf230a2950349d69abdc15ccc36d08c2a7aba471cdd9f56b114  kodi-pvr-vbox-3.6.7.tar.gz
+sha256 f8e6cb967a175450bfc74225ae0b06b9a5e6fb91458f5123359191b4831c5921  kodi-pvr-vbox-adc6c346cc3570a232d336fcebfb0905eaaa9b96.tar.gz
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 40d6dc1..e786cbf 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VBOX_VERSION = 3.6.7
+KODI_PVR_VBOX_VERSION = adc6c346cc3570a232d336fcebfb0905eaaa9b96
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index a21b9c6..6d42583 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 25753e89b86f4a91e389adecb285b7c835c139b12c41437f6b89291c092763b6  kodi-pvr-vdr-vnsi-2a90c2f9a1f3e5889336a8df5426ff99b0318b0f.tar.gz
+sha256 b65acb7ade6eaac395ea357158a4aae5ccd141612acfd834b72fbdf8db4e8b0e  kodi-pvr-vdr-vnsi-4ed7d602924dbfcdd2770c0e13423092e829460d.tar.gz
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index 87ca850..e068641 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VDR_VNSI_VERSION = 2a90c2f9a1f3e5889336a8df5426ff99b0318b0f
+KODI_PVR_VDR_VNSI_VERSION = 4ed7d602924dbfcdd2770c0e13423092e829460d
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index e14a2cf..70c564e 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d3bccae1740ef24d43d30008e4c767169f1cb3d18b0dc8042679226c024267c9  kodi-pvr-vuplus-2.4.6-Krypton.tar.gz
+sha256 0c17505be16c581d4fad2912350b96f8efbf776657467f67becfd499950bd82d  kodi-pvr-vuplus-25c4883e7c73c71d77fd32c8e33284ed5f081287.tar.gz
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index f5c15b0..1ea0d94 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VUPLUS_VERSION = 2.4.6-Krypton
+KODI_PVR_VUPLUS_VERSION = 25c4883e7c73c71d77fd32c8e33284ed5f081287
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 0aa996d..21fdd71 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b88e7a185f2f88ce8fa683a263702e2621efef14abd343414fedf900d163baa5  kodi-pvr-wmc-1.4.7-Krypton.tar.gz
+sha256 77eecab002e178ebdaa78c45ba43c836da002813e8c17769f6752dc91a8fef42  kodi-pvr-wmc-ed67cfedc1dad168c167d86d20fe4d0934504633.tar.gz
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 1339adb..c2969b8 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_WMC_VERSION = 1.4.7-Krypton
+KODI_PVR_WMC_VERSION = ed67cfedc1dad168c167d86d20fe4d0934504633
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
