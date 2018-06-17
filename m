From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:37:04 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] f2fs-tools: update
 homepage link
Message-ID: <20180617155627.1933F826A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b1232002c0dd16a4ce43fc93a257c1dc9fe9c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

As noted in the sourceforge page, the project is not using sourceforge
anymore. Use the gitweb summary page instead.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a74a41d834042ec1f2651cfd4adc23e21c8a8a22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/f2fs-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
index f0630e99c6..e373096380 100644
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_F2FS_TOOLS
 	help
 	  Tools for Flash-Friendly File System (F2FS)
 
-	  http://sourceforge.net/projects/f2fs-tools/
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 
 comment "f2fs-tools needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
