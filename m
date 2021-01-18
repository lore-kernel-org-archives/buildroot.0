From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:23:25 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: fix typo
Message-ID: <20210118210418.0BBA286370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af6cbe07e45ca2a7895b60d2dc2db395d618fe8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

oriq-rcw -> qoriq-rcw

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7c87f3de38..ee2d0e97a4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -163,7 +163,7 @@ config BR2_GDB_VERSION_8_2
 	  version such as 8.3 or more recent.
 
 config BR2_PACKAGE_HOST_RCW
-	bool "rcw package was renamed to oriq-rcw"
+	bool "rcw package was renamed to qoriq-rcw"
 	select BR2_PACKAGE_HOST_QORIQ_RCW
 	select BR2_LEGACY
 	help
