From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jan 2020 12:07:29 +0100
Subject: [Buildroot] [PATCH v9 17/23] package/kodi-skin-confluence: bump
 version
In-Reply-To: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
References: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
Message-ID: <20200119110735.1104443-18-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 3 ++-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 4 +---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 2dabbbd4c2..113548bf64 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 1fa8ebeec269e678111f64bec373d98e34b4ba1b32e583a505431b2562910ba0  kodi-skin-confluence-37bba429adc16d49a07add08de406682e1cc673a.tar.gz
+sha256 dc4a0abf05db50caf8e70e4904b8c2c445008ec3d6d23381c9c31dedaf6109de  kodi-skin-confluence-cffcb8320003e6048abe4b26316e5d5f3d50eac9.tar.gz
+sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index e9cdf3fbf7..d9bd10bdfa 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_SKIN_CONFLUENCE_VERSION = 37bba429adc16d49a07add08de406682e1cc673a
+KODI_SKIN_CONFLUENCE_VERSION = cffcb8320003e6048abe4b26316e5d5f3d50eac9
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
