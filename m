From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 13 Feb 2020 19:36:35 +0200
Subject: [Buildroot] [PATCH] package/squashfs: update homepage link
Message-ID: <06ad4a90ea60a0813cea84b9be67c25777b6aacb.1581615395.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Development moved to github.com.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/squashfs/Config.in      | 2 +-
 package/squashfs/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index f5ae5d9bec85..60b243d98975 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_SQUASHFS
 	help
 	  Tools to generate SquashFS filesystems.
 
-	  http://squashfs.sourceforge.net/
+	  https://github.com/plougher/squashfs-tools
 
 if BR2_PACKAGE_SQUASHFS
 
diff --git a/package/squashfs/Config.in.host b/package/squashfs/Config.in.host
index b353374dd0c7..aa25b37658c5 100644
--- a/package/squashfs/Config.in.host
+++ b/package/squashfs/Config.in.host
@@ -3,4 +3,4 @@ config BR2_PACKAGE_HOST_SQUASHFS
 	help
 	  Tools to generate SquashFS filesystems.
 
-	  http://squashfs.sourceforge.net/
+	  https://github.com/plougher/squashfs-tools
-- 
2.25.0
