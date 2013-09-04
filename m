From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:56 -0500
Subject: [Buildroot] [PATCH 17/17] sqlite: Add host build support
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-18-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
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
