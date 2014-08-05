From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Aug 2014 18:22:16 -0300
Subject: [Buildroot] [PATCH] busybox: enable ash getopts
Message-ID: <1407273736-30467-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's increasingly used by scripts like some in the btrfs-progs package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 7b6d9b7..05ef676 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -975,7 +975,7 @@ CONFIG_ASH_BASH_COMPAT=y
 CONFIG_ASH_IDLE_TIMEOUT=y
 CONFIG_ASH_JOB_CONTROL=y
 CONFIG_ASH_ALIAS=y
-# CONFIG_ASH_GETOPTS is not set
+CONFIG_ASH_GETOPTS=y
 CONFIG_ASH_BUILTIN_ECHO=y
 CONFIG_ASH_BUILTIN_PRINTF=y
 CONFIG_ASH_BUILTIN_TEST=y
-- 
1.8.5.5
