From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:54:22 -0600
Subject: [Buildroot] [PATCH 30/30] readline: host support for host-sqlite
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-31-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
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
