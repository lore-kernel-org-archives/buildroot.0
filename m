From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Jul 2016 00:20:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: update project URL
Message-ID: <1467498029-16496-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgpg-error/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 8287f98..114e2b7 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBGPG_ERROR
 	  Libgpg-error is a small library with error codes and
 	  descriptions shared by most GnuPG related software.
 
-	  ftp://gd.tuwien.ac.at/privacy/gnupg/libgpg-error
+	  https://www.gnupg.org/related_software/libgpg-error
-- 
2.8.1
