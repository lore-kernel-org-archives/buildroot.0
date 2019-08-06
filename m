From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  6 Aug 2019 20:32:19 +0300
Subject: [Buildroot] [PATCH] package/mdadm: update website link
Message-ID: <b8326c194ec9a85816453da67c506939e483609f.1565112739.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Neil Brown no longer maintains mdadm. The old website refers to a stale
git repository. There is nothing else but this wiki page to serve as a
website.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mdadm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index 61d631cda83c..8c6bb08adc05 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_MDADM
 	help
 	  Utility for managing Linux Software RAID arrays.
 
-	  http://neil.brown.name/blog/mdadm
+	  https://raid.wiki.kernel.org/index.php/A_guide_to_mdadm
 
 comment "mdadm needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
-- 
2.20.1
