From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed, 22 Jul 2020 09:44:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/setools: update the project
 location in the Kconfig help
In-Reply-To: <20200722074430.2150934-1-antoine.tenart@bootlin.com>
References: <20200722074430.2150934-1-antoine.tenart@bootlin.com>
Message-ID: <20200722074430.2150934-2-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

setools is no longer hosted on https://github.com/TresysTechnology/setools/.
Updated the Kconfig help to point to its new home,
https://github.com/SELinuxProject/setools/.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/setools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 46b3d4525bc5..3ab7f559489b 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_SETOOLS
 	   * seinfoflow - information flow analysis for SELinux
 	   * sesearch - Search rules (allow, type_transition, etc.)
 
-	  https://github.com/TresysTechnology/setools
+	  https://github.com/SELinuxProject/setools/
 
 comment "setools needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
-- 
2.26.2
