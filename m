From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 10:00:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr-plugin-vnsiserver: bump to
 version 1.8.0
Message-ID: <20190407080048.9040-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash | 3 ++-
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
index 97cb4b42aa..595b1dc8cb 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 f8170b4d6f983e7b5b5110e0432ff46355998e170f66459588170cc320717f7f  vdr-plugin-vnsiserver-v1.5.2.tar.gz
+sha256 d5989461541a91fe4de4ca9c396d4e7b2f4a8663fc9d6155d0830d2b143fce4d  vdr-plugin-vnsiserver-v1.8.0.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
index f41ad701d3..20644d3f6b 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_PLUGIN_VNSISERVER_VERSION = v1.5.2
+VDR_PLUGIN_VNSISERVER_VERSION = v1.8.0
 VDR_PLUGIN_VNSISERVER_SITE = $(call github,FernetMenta,vdr-plugin-vnsiserver,$(VDR_PLUGIN_VNSISERVER_VERSION))
 VDR_PLUGIN_VNSISERVER_LICENSE = GPL-2.0+
 VDR_PLUGIN_VNSISERVER_LICENSE_FILES = COPYING
-- 
2.20.1
