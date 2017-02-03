From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:20:14 +0100
Subject: [Buildroot] [PATCH v2 20/38] package/kodi-pvr-*: mass version bump
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-21-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash                        | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                          | 4 ++--
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash                        | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                          | 4 ++--
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash                    | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                      | 4 ++--
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash                          | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                            | 4 ++--
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash                    | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk                      | 4 ++--
 package/kodi-pvr-hts/kodi-pvr-hts.hash                                | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk                                  | 4 ++--
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash                  | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk                    | 4 ++--
 .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash  | 2 +-
 .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk    | 4 ++--
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                              | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                                | 4 ++--
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash                              | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                                | 4 ++--
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash                        | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                          | 4 ++--
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash                              | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                                | 4 ++--
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash                      | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                        | 4 ++--
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                          | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                            | 4 ++--
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                                | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                  | 4 ++--
 30 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index ef6438797..d5db668a6 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 68fab94cabbeb0fbf6fac0fcb66e8362505ee736ae3b72c4e29867cfc44b595b kodi-pvr-argustv-2aca01c6db28fe3145b57eb5bf5841895c618507.tar.gz
+sha256 4fa8280c023805e2104b9331632daa2c6493d6b11ec0611110b1e12eadb70794  kodi-pvr-argustv-2.5.4-Krypton.tar.gz
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 3c0f40a29..58aae06a3 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_ARGUSTV_VERSION = 2aca01c6db28fe3145b57eb5bf5841895c618507
+KODI_PVR_ARGUSTV_VERSION = 2.5.4-Krypton
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPLv2+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index 713aae0ec..710e894ac 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1c359c1a59c50f98910ec1d4bc332cd9360447e05d63f0d90b07a7ba22bc7ab6 kodi-pvr-dvblink-06c4e5603e4db0bda3f35e80344a308f486ae0f9.tar.gz
+sha256 0941d00524bd2374a7e281cfe3a9b263539d1120084c01c5f3a755d9fe742698  kodi-pvr-dvblink-3.3.11-Krypton.tar.gz
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 75ce6217b..44ed2b048 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBLINK_VERSION = 06c4e5603e4db0bda3f35e80344a308f486ae0f9
+KODI_PVR_DVBLINK_VERSION = 3.3.11-Krypton
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPLv2+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 785fd6c2a..7c7de41bd 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a6a6d63e4b88df0d8b5166efdc09f6410cae736e610b328aaea49c8688bfce82 kodi-pvr-dvbviewer-26286604635a170eeea68df9b7eb52fea0056cfe.tar.gz
+sha256 8b4eb77a7848c634ba3e214de85c46cc9b34d2dd411d7bc133169a04168adf5a  kodi-pvr-dvbviewer-2.4.6-Krypton.tar.gz
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index b2fae5221..95f3d2f45 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_DVBVIEWER_VERSION = 26286604635a170eeea68df9b7eb52fea0056cfe
+KODI_PVR_DVBVIEWER_VERSION = 2.4.6-Krypton
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPLv2+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index b60df9823..1d4c73f03 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4a51ba62239c96c16c569ca47bc7aac4a2e9e9ef4ae09dfc23d10be15afdee34 kodi-pvr-filmon-4b34b41999b86e675f794ec8e5a63c85b78c001e.tar.gz
+sha256 87ad3adc22ec64be15b9408c51388bb7d12b0089dd466aae73ae082d0576320c  kodi-pvr-filmon-1.4.7-Krypton.tar.gz
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 0174aa454..be1792ea3 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_FILMON_VERSION = 4b34b41999b86e675f794ec8e5a63c85b78c001e
+KODI_PVR_FILMON_VERSION = 1.4.7-Krypton
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPLv2+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index fcf046888..b9ef293d0 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 84c7dd60db6e0d0c40cc83a70ad860127d0e5c8e77c6091014055372cad5fe1f kodi-pvr-hdhomerun-aa4324eaa5f738394f21d3f54667e346eb65038e.tar.gz
+sha256 df6be23cb370bce2a6b2a8944358d27e11a8edc665deb976cbd4d2e7e1eba1c0  kodi-pvr-hdhomerun-2.4.6-Krypton.tar.gz
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 67980fba9..b2612c7ff 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HDHOMERUN_VERSION = aa4324eaa5f738394f21d3f54667e346eb65038e
+KODI_PVR_HDHOMERUN_VERSION = 2.4.6-Krypton
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPLv2+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 369e6c023..ed43574ac 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 004dee4455d5d539b5e42d663659d4886d9a8650847ad614fa2179bbaace3783 kodi-pvr-hts-3c673b5b29fc26c203c79f7df58680af50a1afa7.tar.gz
+sha256 d0ae72e619be46e3883bbfff5370a78d4197991316dcd26c51729befaadf46b1  kodi-pvr-hts-b39e4e9870d68841279cbc7d7214f3ad9b27f330.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 4ca5a318f..6b53641d2 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HTS_VERSION = 3c673b5b29fc26c203c79f7df58680af50a1afa7
+KODI_PVR_HTS_VERSION = b39e4e9870d68841279cbc7d7214f3ad9b27f330
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPLv2+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index cdf94fdb9..47eae669b 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5b5c67f70f47c52ccda673c3a98b5a81827835fb74289754bebf840133a84d56 kodi-pvr-iptvsimple-ae9bc1d94e97c5381b2fa59adac70a57146016cd.tar.gz
+sha256 58be5ff8a2f97bb4a49e473be9385ff188582b5ed2cbf8ffc5d55ba0c1fc0ffb  kodi-pvr-iptvsimple-8f725faf6b31151f91f52e8ce336ff57a905046d.tar.gz
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 85039dd96..0613f5cf1 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_IPTVSIMPLE_VERSION = ae9bc1d94e97c5381b2fa59adac70a57146016cd
+KODI_PVR_IPTVSIMPLE_VERSION = 8f725faf6b31151f91f52e8ce336ff57a905046d
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPLv2+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 74770fd3d..02d59df89 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 45590c1b8dc57f2b5921641c864e68671c32db33f55db82ca62411557e9278b9 kodi-pvr-mediaportal-tvserver-a3dd464379a56131bae61b94275c14a3abcf2869.tar.gz
+sha256 59264354c79eaf1658755cb5bc05efc8bca581ed8fb762e82665ec128453e648  kodi-pvr-mediaportal-tvserver-2.4.16-Krypton.tar.gz
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index e3a4df439..6565dda04 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = a3dd464379a56131bae61b94275c14a3abcf2869
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 2.4.16-Krypton
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPLv2+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index c6006d2a3..29fc6e6a8 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 aa5e8b471993326be3622056a26ebf7387ac4758348e8f64632c1fc6979d993e kodi-pvr-njoy-480c1591d486c6166746fb8b5efc68a7aca3d0f0.tar.gz
+sha256 4315b5f87986c17e668d0d89093059b96315b8a7908fc060e2660e5bf8216057  kodi-pvr-njoy-2.4.2-Krypton.tar.gz
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index 0f2eecd3a..e2695d6da 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NJOY_VERSION = 480c1591d486c6166746fb8b5efc68a7aca3d0f0
+KODI_PVR_NJOY_VERSION = 2.4.2-Krypton
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPLv2+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 0ff481a3e..62d9965cb 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4c045722c326dfe152ffadb8d966e8db4caa6128a7c53b2a852fce85f803bcbc kodi-pvr-pctv-0096770e96f84c46f444e159b9b737ac8b4238dc.tar.gz
+sha256 0e5a0fcbdbda0200ebde50552bd68eddd8644010bd39d1cf0038ba28182ca8bb  kodi-pvr-pctv-1.4.5-Krypton.tar.gz
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index a9824d5c0..3d30ade50 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_PCTV_VERSION = 0096770e96f84c46f444e159b9b737ac8b4238dc
+KODI_PVR_PCTV_VERSION = 1.4.5-Krypton
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPLv2+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 7af1bcb28..914ef48b8 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e16cb12bd7a78b8849f370bedb8093d3cb1deb3a766a66efe4b838fc569ab50c kodi-pvr-stalker-5e588330c453141ae0a2f4fd9c02d909ac9d199e.tar.gz
+sha256 3bdd6debd8e8085e54d665f4b870bc77a18800c08d517d837d2ac703b0984622  kodi-pvr-stalker-2.8.3-Krypton.tar.gz
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index d1fa8a0f0..9a8b2aa32 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_STALKER_VERSION = 5e588330c453141ae0a2f4fd9c02d909ac9d199e
+KODI_PVR_STALKER_VERSION = 2.8.3-Krypton
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPLv2+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index 705c0cb3e..a3d3c21dc 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8eb43fb6e2a3132324bf24787bc0545c610832648aa17c12e93676502f7fc565 kodi-pvr-vbox-15e864d160da5a051e18aef06f3a53e49808be02.tar.gz
+sha256 b04f1e3fc50d1cf230a2950349d69abdc15ccc36d08c2a7aba471cdd9f56b114  kodi-pvr-vbox-3.6.7.tar.gz
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 593c1e7cc..5b36acb57 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VBOX_VERSION = 15e864d160da5a051e18aef06f3a53e49808be02
+KODI_PVR_VBOX_VERSION = 3.6.7
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPLv2+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index ecce639d7..a21b9c61c 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1d9e70030b73f44786d54e42e46c6bfa7810af3e4c71ba0dca95c2aa1751ef9b kodi-pvr-vdr-vnsi-7e11b853637ec436e30e4ac826de6ee87c303482.tar.gz
+sha256 25753e89b86f4a91e389adecb285b7c835c139b12c41437f6b89291c092763b6  kodi-pvr-vdr-vnsi-2a90c2f9a1f3e5889336a8df5426ff99b0318b0f.tar.gz
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index f8e1e9273..f8f7818a4 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VDR_VNSI_VERSION = 7e11b853637ec436e30e4ac826de6ee87c303482
+KODI_PVR_VDR_VNSI_VERSION = 2a90c2f9a1f3e5889336a8df5426ff99b0318b0f
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPLv2+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index efdb12539..e14a2cfbb 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9684775c296dfd9b925d73ed1c21bee45afba4785d1bfb226f98b09ed235a8ee kodi-pvr-vuplus-815ea2f303dbe7dd19f87c53965dfdf2358fcdc8.tar.gz
+sha256 d3bccae1740ef24d43d30008e4c767169f1cb3d18b0dc8042679226c024267c9  kodi-pvr-vuplus-2.4.6-Krypton.tar.gz
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index e839bcce8..4a3f1ce69 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VUPLUS_VERSION = 815ea2f303dbe7dd19f87c53965dfdf2358fcdc8
+KODI_PVR_VUPLUS_VERSION = 2.4.6-Krypton
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPLv2+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 6cbdede3f..0aa996dbf 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 25963d8acbce397b6ec940d5ee1d7a69481d295ae31876daf57d3d3537b14543 kodi-pvr-wmc-949fcd162206b569af15942180e6c133ad61e336.tar.gz
+sha256 b88e7a185f2f88ce8fa683a263702e2621efef14abd343414fedf900d163baa5  kodi-pvr-wmc-1.4.7-Krypton.tar.gz
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 194bd1f2b..7f72ebfc6 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_WMC_VERSION = 949fcd162206b569af15942180e6c133ad61e336
+KODI_PVR_WMC_VERSION = 1.4.7-Krypton
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPLv2+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
-- 
2.11.0
