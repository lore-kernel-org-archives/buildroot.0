From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 May 2018 21:22:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/Config.in: fix alphabetical order
Message-ID: <1525548158-6571-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index b527769..85bb3ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -493,10 +493,10 @@ endmenu
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtl8188eu/Config.in"
+	source "package/rtl8189fs/Config.in"
 	source "package/rtl8723bs/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8821au/Config.in"
-	source "package/rtl8189fs/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/setserial/Config.in"
-- 
1.9.1
