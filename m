From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Mar 2015 18:30:07 -0300
Subject: [Buildroot] [PATCH] e2tools/host: remove hyphen
Message-ID: <1427405407-6338-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All the other host packages that have a menu entry use a space, so make
it consistent.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/e2tools/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2tools/Config.in.host b/package/e2tools/Config.in.host
index 772262a..859c47b 100644
--- a/package/e2tools/Config.in.host
+++ b/package/e2tools/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_E2TOOLS
-	bool "host-e2tools"
+	bool "host e2tools"
 	select BR2_PACKAGE_HOST_E2FSPROGS
 	help
 	  E2tools is a simple set of GPL'ed utilities to read, write,
-- 
2.0.5
