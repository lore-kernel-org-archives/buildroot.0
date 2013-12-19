From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 19 Dec 2013 14:37:57 -0600
Subject: [Buildroot] [PATCH v5 08/20] sqlite: Add host build support
In-Reply-To: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1387485489-4186-9-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v4 -> v5:
  - No changes.
Changes v3 -> v4:
  - No changes.
Changes v2 -> v3:
  - Changed order of patch to correct dependency issue (suggested by Thomas).
Changes v1 -> v2:
  - No changes
---
 package/sqlite/sqlite.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b27eb58..f4905e5 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -60,3 +60,4 @@ SQLITE_CONF_OPT += --disable-readline
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.1
