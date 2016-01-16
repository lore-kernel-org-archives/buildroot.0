From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:12 +0100
Subject: [Buildroot] [PATCH 80/80 v1] boot/at91bootstrap: choices must have
	a type
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <9cc34f973a4ae3d610dfa15de50d23df7f1cc365.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/at91bootstrap/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 57fdeda..d131a6a 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -26,7 +26,7 @@ config BR2_TARGET_AT91BOOTSTRAP_BOARD
 	  This is used to do a make <board>_config
 
 choice
-	prompt "Boot Memory"
+	bool "Boot Memory"
 	default BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
 	help
 	  Select Chip for which AT91 bootstrap should be built
-- 
1.9.1
