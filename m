From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 17:19:36 +0100
Subject: [Buildroot] [git commit] package/Makefile.in: fix typo
Message-ID: <20160201224700.3C2D97F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3779afc112c2a9b0f6c5825b278d31d633e1c71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit dc95d50fe3ee (correct gettext handling for musl) introduced a last
minute typo, fix that.

Thanks to Thomas Petazzoni for noticing.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 96d93b0..dd595e2 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -345,7 +345,7 @@ endif
 # http://www.openwall.com/lists/musl/2015/04/16/3
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 BR2_GT_CV_FUNC_GNUGETTEXT_LIBC = \
-	gt_cv_func_gnugettext1_libc=yes
+	gt_cv_func_gnugettext1_libc=yes \
 	gt_cv_func_gnugettext2_libc=yes
 endif
 
