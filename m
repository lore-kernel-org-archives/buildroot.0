From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 22:27:14 +0200
Subject: [Buildroot] [git commit] uboot: improve help text of
	BR2_TARGET_UBOOT_BOARDNAME
Message-ID: <20120920205954.A9BA999670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b189c516d4fd810a95feaff34da97579783f5e5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7f3cae0..87f6561 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -9,6 +9,8 @@ config BR2_TARGET_UBOOT_BOARDNAME
 	help
 	  One of U-Boot supported boards to be built.
 	  This will be suffixed with _config to meet U-Boot standard naming.
+	  See boards.cfg in U-Boot source code for the list of available
+	  configurations.
 
 choice
 	prompt "U-Boot Version"
