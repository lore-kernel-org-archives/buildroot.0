From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Mon, 30 Oct 2017 08:26:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/Config.in: fix alphabetical order
Message-ID: <1509348400-3173-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d7321b2..83ff25d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1088,8 +1088,8 @@ menu "Graphics"
 	source "package/gtksourceview/Config.in"
 	source "package/harfbuzz/Config.in"
 	source "package/ijs/Config.in"
-	source "package/irrlicht/Config.in"
 	source "package/imlib2/Config.in"
+	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
 	source "package/kmsxx/Config.in"
@@ -1862,8 +1862,8 @@ comment "Utilities"
 	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
-	source "package/file/Config.in"
 	source "package/easy-rsa/Config.in"
+	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
 	source "package/gnupg2/Config.in"
 	source "package/inotify-tools/Config.in"
-- 
1.9.1
