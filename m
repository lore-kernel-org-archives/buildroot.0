From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jun 2019 16:05:13 +0200
Subject: [Buildroot] [PATCH 19/31] package/kodi-inputstream-rtmp: bump
 version
In-Reply-To: <20190630140525.6537-1-bernd.kuhls@t-online.de>
References: <20190630140525.6537-1-bernd.kuhls@t-online.de>
Message-ID: <20190630140525.6537-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Addon repo was moved to xbmc project:
https://github.com/xbmc/repo-binary-addons/commit/57b8ed5fb9b5f0368738260b762cc0bab1147172#diff-2ca1e23208f215d294c01b80edfff00a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-rtmp/Config.in                  | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-inputstream-rtmp/Config.in b/package/kodi-inputstream-rtmp/Config.in
index c40bff2d7e..fa83926301 100644
--- a/package/kodi-inputstream-rtmp/Config.in
+++ b/package/kodi-inputstream-rtmp/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_RTMP
 	help
 	  RTMP input stream add-on for Kodi
 
-	  https://github.com/notspiff/inputstream.rtmp
+	  https://github.com/xbmc/inputstream.rtmp
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index 2d7a68ba3c..ad256ad12d 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 75a3cc87243a7c92a0a2e3f16710a1e60d05cd8dbc8b7fd1852244fbc5da2ae8  kodi-inputstream-rtmp-1.0.4.tar.gz
+sha256 ff332894fbaee3829ecaa2f227cb6a4f8f1229dde0d6f0ffbe3c341a1f7f24d2  kodi-inputstream-rtmp-c4080dcee94f92daa0932ac8ecf3de3412b7fbaa.tar.gz
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 061aedf1e7..8e819625d7 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 1.0.4
-KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,v$(KODI_INPUTSTREAM_RTMP_VERSION))
+KODI_INPUTSTREAM_RTMP_VERSION = c4080dcee94f92daa0932ac8ecf3de3412b7fbaa
+KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
 KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
-- 
2.20.1
