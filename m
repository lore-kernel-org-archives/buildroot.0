From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jun 2019 16:05:24 +0200
Subject: [Buildroot] [PATCH 30/31] package/kodi-skin-confluence: bump version
In-Reply-To: <20190630140525.6537-1-bernd.kuhls@t-online.de>
References: <20190630140525.6537-1-bernd.kuhls@t-online.de>
Message-ID: <20190630140525.6537-31-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 2dabbbd4c2..218fed3c4b 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1fa8ebeec269e678111f64bec373d98e34b4ba1b32e583a505431b2562910ba0  kodi-skin-confluence-37bba429adc16d49a07add08de406682e1cc673a.tar.gz
+sha256 fd05e7e19b0f811f0db9c12f1db30202da921eaef03d2a1b9bd7cdd8b7020c7c  kodi-skin-confluence-baaa01cc93d1fa42ebab419b0bdbf02121e6a277.tar.gz
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index e9cdf3fbf7..3cdfc8ee49 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_SKIN_CONFLUENCE_VERSION = 37bba429adc16d49a07add08de406682e1cc673a
+KODI_SKIN_CONFLUENCE_VERSION = baaa01cc93d1fa42ebab419b0bdbf02121e6a277
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
