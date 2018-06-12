From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Jun 2018 20:40:48 +0300
Subject: [Buildroot] [PATCH 1/3] f2fs-tools: update homepage link
Message-ID: <e2de174cc828db7318acd88ebc64f751411e8458.1528825250.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noted in the sourceforge page, the project is not using sourceforge
anymore. Use the gitweb summary page instead.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/f2fs-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
index f0630e99c6d3..e373096380be 100644
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_F2FS_TOOLS
 	help
 	  Tools for Flash-Friendly File System (F2FS)
 
-	  http://sourceforge.net/projects/f2fs-tools/
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 
 comment "f2fs-tools needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
-- 
2.17.1
