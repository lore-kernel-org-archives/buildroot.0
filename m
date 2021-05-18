From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 08:39:31 +0200
Subject: [Buildroot] [git commit] Config.in.lgeacy: fix udisks lvm2 help
Message-ID: <20210518061051.F07C280FA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a2942afae8e096a38421798c2082c34f9535d0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove spurious "was removed"

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7bd2eb1429..a0c1a6898f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,7 +152,7 @@ config BR2_PACKAGE_UDISKS_LVM2
 	help
 	  The lvm2 support was removed because udisks < 2.7.0 still
 	  depends on lvm2 application library, which was removed
-	  in was removed lvm2.
+	  in lvm2.
 
 config BR2_PACKAGE_LVM2_APP_LIBRARY
 	bool "lvm2 application library removed"
