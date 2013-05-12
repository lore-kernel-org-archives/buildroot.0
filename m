From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 21:28:30 +0200
Subject: [Buildroot] [git commit] f2fs-tools: fix version
Message-ID: <20130512193211.124549A094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd234bebae9bd1aa2bf78eb1734a5c0af6a32023
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit e3eadd doesn't (no longer?) exists in the upstream git, so
replace it with the latest commit to date.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/f2fs-tools/f2fs-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
