From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  9 Mar 2016 22:30:29 +0100
Subject: [Buildroot] [PATCH 2/5] setserial: indentation cleanup
In-Reply-To: <1457559032-3384-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1457559032-3384-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1457559032-3384-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/setserial/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setserial/Config.in b/package/setserial/Config.in
index cffe50e..88f3058 100644
--- a/package/setserial/Config.in
+++ b/package/setserial/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_SETSERIAL
 	# Uses fork()
 	depends on BR2_USE_MMU
 	help
-	     Setserial : configuration of serial ports
+	  Setserial : configuration of serial ports
-- 
1.9.1
