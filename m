From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:25 +0200
Subject: [Buildroot] [PATCH v6 24/25] package/kodi-skin-confluence: bump
 version
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-25-bernd.kuhls@t-online.de>
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
index 2dabbbd4c2..a1b7cd0b8f 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1fa8ebeec269e678111f64bec373d98e34b4ba1b32e583a505431b2562910ba0  kodi-skin-confluence-37bba429adc16d49a07add08de406682e1cc673a.tar.gz
+sha256 c01a02e12cd34d4de1c779a574470b18ab3c01196cd144a85a00998dd59bf53f  kodi-skin-confluence-7aeae2647afc8481f9c9c32fc30738c1eac7f56d.tar.gz
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index e9cdf3fbf7..790c769761 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_SKIN_CONFLUENCE_VERSION = 37bba429adc16d49a07add08de406682e1cc673a
+KODI_SKIN_CONFLUENCE_VERSION = 7aeae2647afc8481f9c9c32fc30738c1eac7f56d
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
