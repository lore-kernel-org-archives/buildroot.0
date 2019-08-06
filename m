From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:15:12 +0200
Subject: [Buildroot] [git commit] package/mdadm: update website link
Message-ID: <20190806201233.05FB98E4BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=036dee02cdc27b7eb750f2e665937d294e4fbe5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Neil Brown no longer maintains mdadm. The old website refers to a stale
git repository. There is nothing else but this wiki page to serve as a
website.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mdadm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index 61d631cda8..8c6bb08adc 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_MDADM
 	help
 	  Utility for managing Linux Software RAID arrays.
 
-	  http://neil.brown.name/blog/mdadm
+	  https://raid.wiki.kernel.org/index.php/A_guide_to_mdadm
 
 comment "mdadm needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
