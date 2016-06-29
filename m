From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:30 +0200
Subject: [Buildroot] [PATCH 23/24] sqlite: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-24-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/sqlite/sqlite.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 0dadd76516aa..ef009727d663 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -56,4 +56,3 @@ SQLITE_CONF_OPTS += --disable-editline --disable-readline
 endif
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
