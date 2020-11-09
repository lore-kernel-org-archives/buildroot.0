From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 11:01:05 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/davfs2: fix indent
Message-ID: <20201109095111.57230834E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=371df00b28d8366ea2a3762f3b8feae86325c530
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix the following check-package warning added by commit
a2b98a6add92e38dbcd4ca9fda25454a38c719e3:

package/davfs2/davfs2.mk:22: expected indent with tabs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 62bb541d99e24177ad0119d347040da00131b510)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/davfs2/davfs2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 741baacc87..d3f09018b8 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -19,7 +19,7 @@ DAVFS2_CONF_ENV += \
 	LIBS=$(TARGET_NLS_LIBS)
 
 define DAVFS2_USERS
-        davfs2 -1 davfs2 -1 * - - - davfs user
+	davfs2 -1 davfs2 -1 * - - - davfs user
 endef
 
 $(eval $(autotools-package))
