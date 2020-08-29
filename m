From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 19:42:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: drop SYNC4 from comment
Message-ID: <20200829174219.2463700-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 8f5a9f597e35e6bc89dc938edbe753004d0201d1 forgot to drop SYNC4
from comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 4146824f5f..ea7614ed51 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -32,7 +32,6 @@ config BR2_PACKAGE_DOMOTICZ
 
 comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-- 
2.28.0
