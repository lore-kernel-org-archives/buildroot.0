From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 10:50:31 -0300
Subject: [Buildroot] [PATCH 1/6] gpsd: switch homepage now that berlios is
	gone
Message-ID: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gpsd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index fbbf7a9..6623900 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_GPSD
 
 	  The D-Bus interface is included if dbus-glib is enabled.
 
-	  http://gpsd.berlios.de/
+	  http://www.catb.org/gpsd/
 
 if BR2_PACKAGE_GPSD
 
-- 
1.8.5.5
