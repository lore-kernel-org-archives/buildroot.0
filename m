From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 27 Apr 2017 16:40:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/live555: bump version to 2017.04.26
Message-ID: <20170427144041.19425-1-bernd.kuhls@t-online.de>
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
index 16f7077440..c06e13b12e 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,4 +1,4 @@
 # From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5	df4ad1d60c2f5ae8155fb077bb011ab3	live.2016.03.16.tar.gz
+md5 7155e2d7313ef92929a8268856f0551c live.2017.04.26.tar.gz
 # Locally generated
-sha256	6f98a96d4cf6e986c7711f0a2431c02cb807a8107d6715eb491a6ed9d0446cf6	live.2016.03.16.tar.gz
+sha256 a97372c84d49520dbaa595b65c39800fbd7813e717b5df9cd6c70308ce1a6033  live.2017.04.26.tar.gz
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index a6dd13c06d..e51b588082 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2016.03.16
+LIVE555_VERSION = 2017.04.26
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPL-2.1+
-- 
2.11.0
