From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 20:05:27 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/domoticz: drop
 SYNC4 from comment
Message-ID: <20200829182229.64F6381934@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=658826e13d79bf78eeb22575241a82f83099d852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Commit 8f5a9f597e35e6bc89dc938edbe753004d0201d1 forgot to drop SYNC4
from comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c0126c38d6e7ade4aaae68f029697698479988c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/domoticz/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 42244524d2..642d394828 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -30,7 +30,6 @@ config BR2_PACKAGE_DOMOTICZ
 
 comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
