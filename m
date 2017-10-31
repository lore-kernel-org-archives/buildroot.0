From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Oct 2017 19:55:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/vdr-plugin-vnsiserver: bump version
	to 1.5.2
Message-ID: <20171031185543.26342-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash | 2 +-
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
index cf403f50c8..97cb4b42aa 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 fd00fb6d833cad6a32a0d8259bb125abdf1716680650ba24b34bca2201745877  vdr-plugin-vnsiserver-v1.5.0.tar.gz
+sha256 f8170b4d6f983e7b5b5110e0432ff46355998e170f66459588170cc320717f7f  vdr-plugin-vnsiserver-v1.5.2.tar.gz
diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
index 9a02e4482c..a25a99dfa8 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_PLUGIN_VNSISERVER_VERSION = v1.5.0
+VDR_PLUGIN_VNSISERVER_VERSION = v1.5.2
 VDR_PLUGIN_VNSISERVER_SITE = $(call github,FernetMenta,vdr-plugin-vnsiserver,$(VDR_PLUGIN_VNSISERVER_VERSION))
 VDR_PLUGIN_VNSISERVER_LICENSE = GPL-2.0+
 VDR_PLUGIN_VNSISERVER_LICENSE_FILES = COPYING
-- 
2.11.0
