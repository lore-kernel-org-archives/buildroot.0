From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 19 Dec 2015 11:36:36 -0300
Subject: [Buildroot] [PATCH] xfont_encodings: add missing xutil_util-macros
	select
Message-ID: <1450535796-21922-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xfont_encodings/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xfont_encodings/Config.in b/package/x11r7/xfont_encodings/Config.in
index af40da1..d771ffb 100644
--- a/package/x11r7/xfont_encodings/Config.in
+++ b/package/x11r7/xfont_encodings/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_ENCODINGS
 	bool "encodings"
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  No description available
-- 
2.4.10
