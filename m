From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jun 2017 15:20:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/hdparm: bump version to 9.52,
	add myself to DEVELOPERS
Message-ID: <20170604132040.32501-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                 | 1 +
 package/hdparm/hdparm.hash | 6 ++++--
 package/hdparm/hdparm.mk   | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 303743c2a..eb4a48d9c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -183,6 +183,7 @@ F:	package/ffmpeg/
 F:	package/ghostscript/
 F:	package/giflib/
 F:	package/glmark2/
+F:	package/hdparm/
 F:	package/jsoncpp/
 F:	package/kodi*
 F:	package/lame/
diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index 14021691c..f7462e253 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/hdparm/files/hdparm/
-md5	8fe0a71db02f7ffc602d14a69f766cff	hdparm-9.51.tar.gz
-sha1	cc9dc4cbaa00f7534988c37111be8e2c6e81cf73	hdparm-9.51.tar.gz
+md5 410539d0bf3cc247181594581edbfb53  hdparm-9.52.tar.gz
+sha1 c641429c5b5d0513acfc86dc31c6b3b35c070a70  hdparm-9.52.tar.gz
+# Locally computed
+sha256 c3429cd423e271fa565bf584598fd751dd2e773bb7199a592b06b5a61cec4fb6  hdparm-9.52.tar.gz
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 4a53e9396..727220222 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.51
+HDPARM_VERSION = 9.52
 HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
-- 
2.11.0
