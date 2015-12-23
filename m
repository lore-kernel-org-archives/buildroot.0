From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 23 Dec 2015 18:19:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/Config.in: correct capitalization
	of menu item
Message-ID: <1450891143-28003-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
I noticed it too late.

 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index de0ad5e..5892c43 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -949,7 +949,7 @@ menu "Javascript"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
 if BR2_PACKAGE_JQUERY
-menu "external jQuery plugins"
+menu "External jQuery plugins"
 	source "package/jquery-datetimepicker/Config.in"
 	source "package/jquery-keyboard/Config.in"
 	source "package/jquery-mobile/Config.in"
-- 
1.9.1
