From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 29 Jan 2016 21:51:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/live555: bump version to 2016.01.29
Message-ID: <1454100672-17356-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch also fixes the broken download of the current package
version because upstream removed the previous version.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index e6d9f53..813a5b4 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,4 +1,4 @@
 # From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5 7c13d58c020efa42369b5f23a839be0c live.2015.06.25.tar.gz
+md5	6275484ab763673ad3144648bf1015cb	live.2016.01.29.tar.gz
 # Locally generated
-sha256 c769542f930840ac246155558e163cd94b119f4f6b9e102b6b5b063f9f055875 live.2015.06.25.tar.gz
+sha256	44243a962adae64703c00264dd2333cfee15d7edbd79de4e5b47fd486df9ecd1	live.2016.01.29.tar.gz
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index ab80fb1..d40cbaa 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2015.06.25
+LIVE555_VERSION = 2016.01.29
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPLv2.1+
-- 
2.7.0.rc3
