From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:38 +0100
Subject: [Buildroot] [PATCH v2 43/54] package/kodi-skin-confluence: bump
 version
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-44-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index fdd4e828f6..e3d1ff73f4 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dc4a0abf05db50caf8e70e4904b8c2c445008ec3d6d23381c9c31dedaf6109de  kodi-skin-confluence-cffcb8320003e6048abe4b26316e5d5f3d50eac9.tar.gz
+sha256  49ba4dcf4b512ac0a97bd1a4ebf14685d294d89a7a07c26ddda0fe730c8aa047  kodi-skin-confluence-37a196cdb58c0da87b5b22b047a5d44dc447f1ae.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index d9bd10bdfa..fcae506d1e 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = cffcb8320003e6048abe4b26316e5d5f3d50eac9
+KODI_SKIN_CONFLUENCE_VERSION = 37a196cdb58c0da87b5b22b047a5d44dc447f1ae
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.29.2
