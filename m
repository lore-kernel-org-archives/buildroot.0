From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 11 Sep 2013 16:59:37 -0500
Subject: [Buildroot] [PATCH v2 17/17] sqlite: Add host build support
In-Reply-To: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378936777-28308-18-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v1 -> v2:
  - No changes

 package/sqlite/sqlite.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index d474619..4d93172 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -68,3 +68,4 @@ define SQLITE_UNINSTALL_STAGING_CMDS
 endef
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
\ No newline at end of file
-- 
1.7.1
