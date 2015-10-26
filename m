From: Rodrigo Rebello <rprebello@gmail.com>
Date: Mon, 26 Oct 2015 15:12:58 -0200
Subject: [Buildroot] [PATCH v3 3/3] doom-wad: add BR2_PACKAGE_CHOCOLATE_DOOM
	as alternate dependency
In-Reply-To: <1445879578-404-1-git-send-email-rprebello@gmail.com>
References: <1445879578-404-1-git-send-email-rprebello@gmail.com>
Message-ID: <1445879578-404-3-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The shareware WAD file is also supported by Chocolate Doom.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
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
 
-- 
2.1.4
