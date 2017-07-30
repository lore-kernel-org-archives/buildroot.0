From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jul 2017 18:21:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/live555: bump version to 2017.07.18
Message-ID: <20170730162155.7651-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index c06e13b12..67500fb2b 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,4 +1,4 @@
 # From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5 7155e2d7313ef92929a8268856f0551c live.2017.04.26.tar.gz
+md5 890ee3a3ea7a1df5843df9f9429170d7 live.2017.07.18.tar.gz
 # Locally generated
-sha256 a97372c84d49520dbaa595b65c39800fbd7813e717b5df9cd6c70308ce1a6033  live.2017.04.26.tar.gz
+sha256 b2e857e47a9bac09958cbf313f160265067555f66f9282f10c6419d63c620ab6  live.2017.07.18.tar.gz
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index e51b58808..dcd8a955f 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2017.04.26
+LIVE555_VERSION = 2017.07.18
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPL-2.1+
-- 
2.11.0
