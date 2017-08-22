From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 22 Aug 2017 22:15:26 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/kodi-pvr-*: mass version bump
In-Reply-To: <20170822201526.3285-1-bernd.kuhls@t-online.de>
References: <20170822201526.3285-1-bernd.kuhls@t-online.de>
Message-ID: <20170822201526.3285-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash               | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk                 | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 5656e8e3b..bf0a7361b 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 29867bd1fad4c4d69ec0d25ea1bb1507fd4543442aef890a2124f63f67318d92  kodi-pvr-hts-3.4.24-Krypton.tar.gz
+sha256 4fb24496622762ea8c894368bdababd2104c5f70978b901b983974ef389b83e1  kodi-pvr-hts-3.4.27.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index fb5873bff..182fd4b0d 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HTS_VERSION = 3.4.24-Krypton
+KODI_PVR_HTS_VERSION = 3.4.27
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 906cbb575..0b0406feb 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0a006e275cddba02d5d3fd22a95cec6411a765719509a9bc8fcc93dfa247bd4c  kodi-pvr-iptvsimple-2.4.11-Krypton.tar.gz
+sha256 329bd71e5c786d7b037bf5fd103ee4abff892afc6e5186a5d0a797194a8c4c7c  kodi-pvr-iptvsimple-2.4.14-Krypton.tar.gz
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 5ea0a454f..0df509ea6 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_IPTVSIMPLE_VERSION = 2.4.11-Krypton
+KODI_PVR_IPTVSIMPLE_VERSION = 2.4.14-Krypton
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
-- 
2.11.0
