From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Dec 2012 15:04:13 +0100
Subject: [Buildroot] [PATCH] util-linux: fix typo in configuration option
	label
Message-ID: <1355234653-19266-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 43a8444..5eab956 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -62,7 +62,7 @@ config BR2_PACKAGE_UTIL_LINUX_RENAME
 	bool "build \"rename\""
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
-	bool "build \"chrt, ionice, teskset\""
+	bool "build \"chrt, ionice, taskset\""
 
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "build \"wall\""
-- 
1.7.9.5
