From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  7 Jan 2015 11:10:38 -0600
Subject: [Buildroot] [PATCH v2 03/28] sqlite: Add host build support
In-Reply-To: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420650663-49350-4-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/sqlite/sqlite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a4920eb..8713dfa 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -57,3 +57,4 @@ SQLITE_CONF_OPTS += --disable-readline
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
