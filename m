From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 10:50:34 -0300
Subject: [Buildroot] [PATCH 4/6] openocd: switch homepage now that berlios
	is gone
In-Reply-To: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1402926636-3556-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openocd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index fc13977..7f96ef8 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENOCD
 	help
 	  OpenOCD - Open On-Chip Debugger
 
-	  http://openocd.berlios.de/web/
+	  http://openocd.sourceforge.net/
 
 if BR2_PACKAGE_OPENOCD
 
-- 
1.8.5.5
