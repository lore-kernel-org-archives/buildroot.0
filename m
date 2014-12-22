From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Dec 2014 20:19:42 +0200
Subject: [Buildroot] [PATCH 1/2] uemacs: fix "homepage" link
Message-ID: <f4c1a8792a5a65dff7140e427fe1ed9fbca76c5c.1419272383.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest version is only available from git.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uemacs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uemacs/Config.in b/package/uemacs/Config.in
index f093218fb5b3..cfe9805946c2 100644
--- a/package/uemacs/Config.in
+++ b/package/uemacs/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_UEMACS
 	help
 	  A small emacs.
 
-	  ftp://ftp.kernel.org/pub/software/editors/uemacs/
+	  https://git.kernel.org/cgit/editors/uemacs/uemacs.git/
-- 
2.1.3
