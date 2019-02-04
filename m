From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  4 Feb 2019 07:10:22 -0600
Subject: [Buildroot] [PATCH v4 1/2] package/sg3_utils: add host build
Message-ID: <1549285823-41193-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Initially used by the host build of the utp_com package

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes

v4
[Thomas
 - Moved to be the first patch in the series

v3
 - New patch
---
 package/sg3_utils/sg3_utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 0c17b30..b3a79d6 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -51,3 +51,4 @@ SG3_UTILS_POST_INSTALL_TARGET_HOOKS += SG3_UTILS_REMOVE_PROGS
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
