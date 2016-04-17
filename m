From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Apr 2016 12:16:04 +0300
Subject: [Buildroot] [PATCH] gstreamer1: fix help text typos
Message-ID: <5fcaa83b3fff75fea73f21c0c52932547b73b4f6.1460884564.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gstreamer1/gstreamer1/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index c13f04191344..274171b63921 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_GSTREAMER1_PARSE
 	bool "enable command-line parser"
 	default y
 	help
-	  Enable command line parser for gstreamer. This may incrase the CPu
+	  Enable command line parser for gstreamer. This may increase the CPU
 	  overhead by a small amount.
 
 config BR2_PACKAGE_GSTREAMER1_TRACE
-- 
2.8.0.rc3
