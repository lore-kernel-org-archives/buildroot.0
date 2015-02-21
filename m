From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 21 Feb 2015 10:48:01 -0300
Subject: [Buildroot] [PATCH] util-linux: ul also requires ncurses
Message-ID: <1424526481-13007-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Found via auditing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index b416a34..e1d6ce5 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -234,6 +234,7 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 
 config BR2_PACKAGE_UTIL_LINUX_UL
 	bool "ul"
+	select BR2_PACKAGE_NCURSES
 	help
 	  Do underlining
 
-- 
2.0.5
