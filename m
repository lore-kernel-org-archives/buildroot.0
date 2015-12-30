From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 17:23:01 +0100
Subject: [Buildroot] [git commit] php: add missing select
	BR2_PACKAGE_LIBMCRYPT
Message-ID: <20151230162327.94CCB8274F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b7a4a4d223eaf3c2267fa7db67b7bda336aad3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/b0c/b0c9ea0d577a74549476ddbdb0d2ecd09311c765/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 5324e79..c044e45 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -67,6 +67,7 @@ config BR2_PACKAGE_PHP_EXT_HASH
 
 config BR2_PACKAGE_PHP_EXT_MCRYPT
 	bool "mcrypt"
+	select BR2_PACKAGE_LIBMCRYPT
 	help
 	  mcrypt support
 
