From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 22:02:42 +0100
Subject: [Buildroot] [git commit] package/squashfs: update homepage link
Message-ID: <20200213205632.86BDF8DFBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b656b4ecfc95f27c7b3a53d58372a80ae992b2a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Development moved to github.com.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/Config.in      | 2 +-
 package/squashfs/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index f5ae5d9bec..60b243d989 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_SQUASHFS
 	help
 	  Tools to generate SquashFS filesystems.
 
-	  http://squashfs.sourceforge.net/
+	  https://github.com/plougher/squashfs-tools
 
 if BR2_PACKAGE_SQUASHFS
 
diff --git a/package/squashfs/Config.in.host b/package/squashfs/Config.in.host
index b353374dd0..aa25b37658 100644
--- a/package/squashfs/Config.in.host
+++ b/package/squashfs/Config.in.host
@@ -3,4 +3,4 @@ config BR2_PACKAGE_HOST_SQUASHFS
 	help
 	  Tools to generate SquashFS filesystems.
 
-	  http://squashfs.sourceforge.net/
+	  https://github.com/plougher/squashfs-tools
