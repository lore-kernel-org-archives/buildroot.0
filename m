From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 22 Dec 2015 17:37:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/Config.in: fix alphabetical order
Message-ID: <1450802263-10364-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index 7a52f67..fe6c9e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -848,8 +848,8 @@ menu "Graphics"
 	source "package/libdmtx/Config.in"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
-	source "package/libexif/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
+	source "package/libexif/Config.in"
 	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
 	source "package/libfreeglut/Config.in"
-- 
1.9.1
