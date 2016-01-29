From: Cam Hutchison <camh@xdna.net>
Date: Sat, 30 Jan 2016 08:06:04 +1100
Subject: [Buildroot] [PATCH 1/1] bonnie: Expand description in config help
	text.
Message-ID: <1454101564-19545-1-git-send-email-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The description "Filesystem tester" is rather unhelpful. Take the
description from the referenced web site to make it a bit clearer what
bonnie++ actually is.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 package/bonnie/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
index 6dbd06d..26c88e9 100644
--- a/package/bonnie/Config.in
+++ b/package/bonnie/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_BONNIE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	help
-	  Filesystem tester
+	  A benchmark suite that is aimed at performing a number of simple tests of
+	  hard drive and file system performance.
 
 	  http://www.coker.com.au/bonnie++/
 
-- 
2.1.4
