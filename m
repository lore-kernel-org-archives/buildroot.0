From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu,  6 Oct 2016 09:20:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/Config.in: fix alphabetical order
Message-ID: <1475738411-5173-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 51d7349..94154bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1461,8 +1461,8 @@ menu "Networking applications"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
-	source "package/gupnp-tools/Config.in"
 	source "package/gesftpserver/Config.in"
+	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
 	source "package/hiawatha/Config.in"
-- 
1.9.1
