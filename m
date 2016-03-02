From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 23:54:54 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-*: mass version bump,
	add hashes
Message-ID: <20160302225546.02AFA80089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a07c026404ad575c745408e13bea8e3afec69daf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-addon-xvdr/kodi-addon-xvdr.hash                          | 2 ++
 package/kodi-addon-xvdr/kodi-addon-xvdr.mk                            | 4 ++--
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash                        | 2 ++
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                          | 4 +++-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash                        | 2 ++
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                          | 4 +++-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash                    | 2 ++
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                      | 4 +++-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash                          | 2 ++
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                            | 4 +++-
 package/kodi-pvr-hts/kodi-pvr-hts.hash                                | 2 ++
 package/kodi-pvr-hts/kodi-pvr-hts.mk                                  | 4 +++-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash                  | 2 ++
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk                    | 4 +++-
 .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash  | 2 ++
 .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk    | 4 +++-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash                          | 2 ++
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk                            | 4 +++-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash                        | 2 ++
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                          | 4 +++-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                              | 2 ++
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                                | 4 +++-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash                              | 2 ++
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                                | 4 +++-
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash                        | 2 ++
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                          | 4 +++-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash                              | 2 ++
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                                | 4 +++-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash                      | 2 ++
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                        | 4 +++-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                          | 2 ++
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                            | 4 +++-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                                | 2 ++
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                  | 4 +++-
 34 files changed, 84 insertions(+), 18 deletions(-)

diff --git a/package/kodi-addon-xvdr/kodi-addon-xvdr.hash b/package/kodi-addon-xvdr/kodi-addon-xvdr.hash
new file mode 100644
index 0000000..933c7b8
--- /dev/null
+++ b/package/kodi-addon-xvdr/kodi-addon-xvdr.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	783796eccc19c639c59b7a05cad1df705d557993b15cc7e29f7dbbd8388d698b	kodi-addon-xvdr-ae66610bc2e1a3efe49f4fa0db55ff3a7808a247.tar.gz
diff --git a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
index eff053e..ac7f3cb 100644
--- a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
+++ b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This cset is on master. When a Isengard branch is made, we should
+# This cset is on master. When a Jarvis branch is made, we should
 # follow it, as incompatible changes in the plugins API can happen
 # on the master branch.
-KODI_ADDON_XVDR_VERSION = 88265b86896513a219acb8d5f0c0f77956fae939
+KODI_ADDON_XVDR_VERSION = ae66610bc2e1a3efe49f4fa0db55ff3a7808a247
 KODI_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(KODI_ADDON_XVDR_VERSION))
 KODI_ADDON_XVDR_LICENSE = GPLv2+
 KODI_ADDON_XVDR_LICENSE_FILES = COPYING
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
new file mode 100644
index 0000000..210ef42
--- /dev/null
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 02c644605b48f9b06b12317134389fe73f25b1f10b357959f81cb30695265c4b kodi-pvr-argustv-ebce517b04e184adc13c4780cc3e76487448b79b.tar.gz
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 0ce333a..406249f 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 32f03271cc3fb1b50edfacd2793d5ac70a98dd20
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_ARGUSTV_VERSION = ebce517b04e184adc13c4780cc3e76487448b79b
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPLv2+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
new file mode 100644
index 0000000..79d03c5
--- /dev/null
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b5c602205de4398ccef8fb366769e0a753259b62bcf494a06d26d1106efe1d6a kodi-pvr-dvblink-a3a4077dddedfd692b86608e9805541f151f973c.tar.gz
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 88e90c1..088fc8b 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_DVBLINK_VERSION = b87e8a79a329c2f808a5d5abffe05259e365d7e6
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_DVBLINK_VERSION = a3a4077dddedfd692b86608e9805541f151f973c
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPLv2+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
new file mode 100644
index 0000000..b64de03
--- /dev/null
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 32837d5012b3bf82274df10638e4b6232160cb91fc6acac9080e7c21d0fc63fb kodi-pvr-dvbviewer-a6d9b84588a91ca7e4ad5dd65b135753880991fe.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index 49fc5fc..acd41fe 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_DVBVIEWER_VERSION = cbfd4552a4381d289bcfb8eda33699ecfd156bd7
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_DVBVIEWER_VERSION = a6d9b84588a91ca7e4ad5dd65b135753880991fe
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPLv2+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
new file mode 100644
index 0000000..0d8ea45
--- /dev/null
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 37e40a4134172faa9c1a7439b8a70de17456d0ba1fc0d0203fec0bea47b90c8a kodi-pvr-filmon-205a6ef8881271d6b9526b558f8c1f27a034694f.tar.gz
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 7e49268..7bfdbeb 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 67abb5696798aa954b38de2cc7b4a74e6554d627
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_FILMON_VERSION = 205a6ef8881271d6b9526b558f8c1f27a034694f
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPLv2+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
new file mode 100644
index 0000000..56ff4ab
--- /dev/null
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 5f2996839d9ec3b5e0d6619e56df2d3bcf1741f07e4cfa467b1d690425047199 kodi-pvr-hts-7f75b70527922aef953123ff97ebaa22d9fb7cb4.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index f8b0359..0709197 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 016b0b3251d6d5bffaf68baf59010e4347759c4a
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_HTS_VERSION = 7f75b70527922aef953123ff97ebaa22d9fb7cb4
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPLv2+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
new file mode 100644
index 0000000..f92a8e0
--- /dev/null
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 895e8119874ac8d74b69a6441f037465eb70050474d03a345000f147671a310f kodi-pvr-iptvsimple-824c6056b10c89913e1310d0c334206d32f5e1cf.tar.gz
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 4d5b9e9..3059425 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 23defebace9a596d549a688c1d017900aeaf7761
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_IPTVSIMPLE_VERSION = 824c6056b10c89913e1310d0c334206d32f5e1cf
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPLv2+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
new file mode 100644
index 0000000..6d32b2c
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 ba680abc2200915fb5815ce93dad8d635da2c1e15c2ff4acce9d0f2399e6b830 kodi-pvr-mediaportal-tvserver-29e84f8c3a91681cc7bca504c0ba54aa060d5f86.tar.gz
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index bff00c7..6243d5f 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 29809d10010a21b08b9e652e36bc51dac2171690
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 29e84f8c3a91681cc7bca504c0ba54aa060d5f86
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPLv2+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
new file mode 100644
index 0000000..cf82050
--- /dev/null
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 32abbcea7cec9e74488dd39443251ec624f152288bf9df409aed162272195003 kodi-pvr-mythtv-f278f65fd7593e031ab8fd36f9ace29d8c6f0263.tar.gz
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 76235ea..3885ab2 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 8cb158cebc016f1c2a17014bb21873201ed8957e
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_MYTHTV_VERSION = f278f65fd7593e031ab8fd36f9ace29d8c6f0263
 KODI_PVR_MYTHTV_SITE = $(call github,kodi-pvr,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPLv2+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
new file mode 100644
index 0000000..c63162e
--- /dev/null
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 36aac207385810e807321ab4558e888ecae5eea18484af00cf78c3130895ea4c kodi-pvr-nextpvr-288d238a7d59e5957b87fe60775dfaaaed104007.tar.gz
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 4ec0d80..34cfbd3 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 3a205e49b50baba605d3235f6613fdd36c1d3234
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_NEXTPVR_VERSION = 288d238a7d59e5957b87fe60775dfaaaed104007
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPLv2+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
new file mode 100644
index 0000000..c6006d2
--- /dev/null
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 aa5e8b471993326be3622056a26ebf7387ac4758348e8f64632c1fc6979d993e kodi-pvr-njoy-480c1591d486c6166746fb8b5efc68a7aca3d0f0.tar.gz
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index cbc04d5..0f2eecd 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_NJOY_VERSION = 4f88a097cb62b4604ffb0ac293a5dc8f40885e79
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_NJOY_VERSION = 480c1591d486c6166746fb8b5efc68a7aca3d0f0
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPLv2+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
new file mode 100644
index 0000000..b604eb7
--- /dev/null
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 55febfb72348e87c496cf4843cbf0f95793a5b3cdee5a10808455a68a483a4fa kodi-pvr-pctv-8b3ad52f63cd0abff4f4e39c1a5b96b868a8d817.tar.gz
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 0cda85a..73d71d8 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = bca81657a2879a1ab76404e5b5441e2491f35350
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_PCTV_VERSION = 8b3ad52f63cd0abff4f4e39c1a5b96b868a8d817
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPLv2+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
new file mode 100644
index 0000000..5cf8d19
--- /dev/null
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b3ab41b2f45a0ad36504471d034e46f7d1db1591000af00fdbe4af6a028ea23f kodi-pvr-stalker-e31351527b712c85b669eb876eb12f5809e400d7.tar.gz
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 979a421..db417be 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = a89afb8a2f5e01e3d11f6887ba1f7c81aebd7515
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_STALKER_VERSION = e31351527b712c85b669eb876eb12f5809e400d7
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPLv2+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
new file mode 100644
index 0000000..d19669a
--- /dev/null
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0a7974edcbf79de671eefde2ac0e52b10ece337a889eb855fe8fd62277c74c50 kodi-pvr-vbox-a846f6e85d894123986c39226564f9cc11c6f924.tar.gz
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 6bb7769..28ce67a 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 0b1d571f0259583671c9654febf2bf45a8e9920c
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_VBOX_VERSION = a846f6e85d894123986c39226564f9cc11c6f924
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPLv2+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
new file mode 100644
index 0000000..a05c10d
--- /dev/null
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 682618e343df7c3dea80317c48fdc3e827b9294476963252d0fbba4b1a38cec1 kodi-pvr-vdr-vnsi-0b90a42df48b953562fab4958134219f96b244c3.tar.gz
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index bc482eb..295d5bb 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_VDR_VNSI_VERSION = 550a4a2e093b4418394cdbe6f72cd7c76f0327b7
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_VDR_VNSI_VERSION = 0b90a42df48b953562fab4958134219f96b244c3
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPLv2+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
new file mode 100644
index 0000000..1a728df
--- /dev/null
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 036d2d316247f0c4b7d598a27a387f6653683ea686ef62d3bf3b3b0edae69d13 kodi-pvr-vuplus-84ee66d16479dd8c9a65868af427670d9e9d02aa.tar.gz
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 82569fd..f22ca35 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 96115e9b8898ed6bde36874b43b2fba531cfef5c
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_VUPLUS_VERSION = 84ee66d16479dd8c9a65868af427670d9e9d02aa
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPLv2+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
new file mode 100644
index 0000000..ec301da
--- /dev/null
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 47ab2cc0a3ed5f2dcd759b0d3d0f7cc3320bca44b6cd3569a751639eb5f12cfa kodi-pvr-wmc-829b5d2ec717a78ac3a5c4f92fbc3379feb80154.tar.gz
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index fc385f9..fced331 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = e19c3e99c87e81d406bac0bc4e8edeb47df66dcc
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_WMC_VERSION = 829b5d2ec717a78ac3a5c4f92fbc3379feb80154
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPLv2+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
