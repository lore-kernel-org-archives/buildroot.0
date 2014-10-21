From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Oct 2014 15:27:36 -0300
Subject: [Buildroot] [PATCH] libnl: need->needs for toolchain comment
Message-ID: <1413916056-18244-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index 74a2e79..af045e7 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_LIBNL_TOOLS
 	help
 	  Install binary tools.
 
-comment "libnl tools need a toolchain w/ dynamic library"
+comment "libnl tools needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
 endif
 
-- 
2.0.4
