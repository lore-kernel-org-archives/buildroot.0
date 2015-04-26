From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 11:48:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot: Fix broken logic for
	comment display
Message-ID: <1430041700-2057-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 9c242fc..3baae6e 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -55,4 +55,4 @@ endif # BR2_PACKAGE_DOVECOT
 
 comment "dovecot needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS
-- 
1.7.10.4
