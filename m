From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 22 Jun 2016 08:07:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/Config.in: fix alphabetical order
Message-ID: <1466575624-4876-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index 171f4ad..a2a02a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1390,8 +1390,8 @@ menu "Networking applications"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
 	source "package/c-icap-modules/Config.in"
-	source "package/cannelloni/Config.in"
 	source "package/can-utils/Config.in"
+	source "package/cannelloni/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/connman/Config.in"
-- 
1.9.1
