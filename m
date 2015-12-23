From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 23:32:39 +0100
Subject: [Buildroot] [git commit] doom-wad: add BR2_PACKAGE_CHOCOLATE_DOOM
	as alternate dependency
Message-ID: <20151223223303.653427FB7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc20c1578401e0c619cf0c334d35d97c83500baa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The shareware WAD file is also supported by Chocolate Doom.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/doom-wad/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/doom-wad/Config.in b/package/doom-wad/Config.in
index aa1d029..edd299b 100644
--- a/package/doom-wad/Config.in
+++ b/package/doom-wad/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DOOM_WAD
 	bool "shareware Doom WAD file"
-	depends on BR2_PACKAGE_PRBOOM
+	depends on BR2_PACKAGE_CHOCOLATE_DOOM || BR2_PACKAGE_PRBOOM
 	help
 	  This will install the shareware wad data file for the doom game.
 
