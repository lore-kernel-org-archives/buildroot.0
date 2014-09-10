From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 10 Sep 2014 11:24:09 +0300
Subject: [Buildroot] [PATCH] file: mention the browser friendly homepage
Message-ID: <0320daf4f5f0c521e096cd6c3e94b412a99f3565.1410337449.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/file/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/file/Config.in b/package/file/Config.in
index dede331e492f..13934b223958 100644
--- a/package/file/Config.in
+++ b/package/file/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_FILE
 	  Program to identify a file's format by scanning binary data
 	  for known patterns.
 
-	  ftp://ftp.astron.com/pub/file/
+	  http://www.darwinsys.com/file/
-- 
2.1.0
