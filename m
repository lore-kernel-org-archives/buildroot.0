From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 May 2013 21:23:57 +0200
Subject: [Buildroot] [PATCH] f2fs-tools: fix version
Message-ID: <1368386637-31727-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The commit e3eadd doesn't (no longer?) exists in the upstream git, so
replace it with the latest commit to date.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/f2fs-tools/f2fs-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index f217bf4..aa0c103 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-F2FS_TOOLS_VERSION = e3eadd686ed1da1828f32977a36b694bc0090f4e
+F2FS_TOOLS_VERSION = fef98ebdf3a7728017cb3d0ae4ffedc5405e531d
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
-- 
1.8.2.1
