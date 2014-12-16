From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:53:58 -0600
Subject: [Buildroot] [PATCH 06/30] sqlite: Add host build support
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-7-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/sqlite/sqlite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index f010ee3..43902e8 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -57,3 +57,4 @@ SQLITE_CONF_OPTS += --disable-readline
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
