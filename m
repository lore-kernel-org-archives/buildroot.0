From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  2 Jul 2015 14:50:54 +0300
Subject: [Buildroot] [PATCH 2/2] cryptsetup: update homepage link
In-Reply-To: <ebe4bbc5879916055ba594a8db7a47c19f21e80a.1435837854.git.baruch@tkos.co.il>
References: <ebe4bbc5879916055ba594a8db7a47c19f21e80a.1435837854.git.baruch@tkos.co.il>
Message-ID: <2bb0b248c2bad9e95e98695a4f7571db3418840d.1435837854.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/cryptsetup/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 3d3c47d40c69..13b0184cffd6 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
 
-	  https://code.google.com/p/cryptsetup/
+	  https://gitlab.com/cryptsetup/cryptsetup
 
 comment "cryptsetup needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-- 
2.1.4
