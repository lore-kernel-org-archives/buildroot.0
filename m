From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 16:28:17 +0200
Subject: [Buildroot] [git commit] package/setools: update the project
 location in the Kconfig help
Message-ID: <20200723142349.4C30886D80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1647d2c5e80d489a0f0f6ebb3d92597dbf714da2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

setools is no longer hosted on https://github.com/TresysTechnology/setools/.
Updated the Kconfig help to point to its new home,
https://github.com/SELinuxProject/setools/.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/setools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 46b3d4525b..3ab7f55948 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_SETOOLS
 	   * seinfoflow - information flow analysis for SELinux
 	   * sesearch - Search rules (allow, type_transition, etc.)
 
-	  https://github.com/TresysTechnology/setools
+	  https://github.com/SELinuxProject/setools/
 
 comment "setools needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
