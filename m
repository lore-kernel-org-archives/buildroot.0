From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Sep 2019 22:38:18 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/mdadm: update
 website link
Message-ID: <20190901203657.0726A88E4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f13153a8ff33c5d85a27d98751a3e62cb3beb40b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Neil Brown no longer maintains mdadm. The old website refers to a stale
git repository. There is nothing else but this wiki page to serve as a
website.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 036dee02cdc27b7eb750f2e665937d294e4fbe5a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
