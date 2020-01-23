From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:02 +0100
Subject: [Buildroot] [git commit] package/kodi-inputstream-rtmp: bump version
Message-ID: <20200122235421.1A8BF83874@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fc6d31ec8617193df13c2656db0288695026410
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Addon repo was moved to xbmc project:
https://github.com/xbmc/repo-binary-addons/commit/57b8ed5fb9b5f0368738260b762cc0bab1147172#diff-2ca1e23208f215d294c01b80edfff00a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
index 2d7a68ba3c..050f86af4c 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 75a3cc87243a7c92a0a2e3f16710a1e60d05cd8dbc8b7fd1852244fbc5da2ae8  kodi-inputstream-rtmp-1.0.4.tar.gz
+sha256 bc4cd1f4df6bc24d035c537c365977493f412acc711cf60d82179d1ef494e275  kodi-inputstream-rtmp-2.0.6-Leia.tar.gz
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 061aedf1e7..dc141659ac 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 1.0.4
-KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,v$(KODI_INPUTSTREAM_RTMP_VERSION))
+KODI_INPUTSTREAM_RTMP_VERSION = 2.0.6-Leia
+KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
 KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
