From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  7 Jan 2015 11:11:02 -0600
Subject: [Buildroot] [PATCH v2 27/28] readline: host support for host-sqlite
In-Reply-To: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420650663-49350-28-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/readline/readline.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index d670a71..2dc04a1 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -19,4 +19,5 @@ endef
 
 READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES
 
+$(eval $(host-autotools-package))
 $(eval $(autotools-package))
-- 
1.9.1
