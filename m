From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 16:25:31 +0100
Subject: [Buildroot] [git commit] package/sg3_utils: add support for
 building host variant
Message-ID: <20190204153451.B16778154A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83e46260c47f5f30401224442a8906c4eb175c04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Initially used by the host build of the utp_com package.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sg3_utils/sg3_utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 0c17b30cde..b3a79d68ee 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -51,3 +51,4 @@ SG3_UTILS_POST_INSTALL_TARGET_HOOKS += SG3_UTILS_REMOVE_PROGS
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
