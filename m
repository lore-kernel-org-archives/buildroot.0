From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Aug 2016 19:19:46 +0200
Subject: [Buildroot] [PATCH] core: move reproducible option to advanced
	sub-menu
Message-ID: <1472145586-23544-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The reproducible build is only in its infancy; it is far from being
complete.

As such, move it to the "advanced" build sub-menu, where it belong for
now...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 741a7ce..ed92c56 100644
--- a/Config.in
+++ b/Config.in
@@ -726,8 +726,6 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  toolchain (through the toolchain wrapper and binutils patches)
 	  and external toolchain backends (through the toolchain wrapper).
 
-endmenu
-
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	help
@@ -741,6 +739,8 @@ config BR2_REPRODUCIBLE
 
 endmenu
 
+endmenu
+
 source "toolchain/Config.in"
 
 source "system/Config.in"
-- 
2.7.4
