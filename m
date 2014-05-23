From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 May 2014 19:20:12 +0200
Subject: [Buildroot] [PATCH] config: kernel.org is now https-only
Message-ID: <1400865612-4104-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Every requests on kernel.org gets redirected to https.
So just set our kernel.org settings straight to begin with.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index d402c93..0799cb7 100644
--- a/Config.in
+++ b/Config.in
@@ -186,7 +186,7 @@ config BR2_BACKUP_SITE
 
 config BR2_KERNEL_MIRROR
 	string "Kernel.org mirror"
-	default "http://www.kernel.org/pub"
+	default "https://www.kernel.org/pub"
 	help
 	  kernel.org is mirrored on a number of servers around the world.
 	  The following allows you to select your preferred mirror.
-- 
1.8.3.2
