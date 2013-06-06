From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 17:25:20 +0200
Subject: [Buildroot] [git commit] x-loader: remove useless comment
Message-ID: <20130606153924.D2B8D9A99B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=911a2081a3d2a0decd75ad46bdae3d22694a4a98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/xloader/xloader.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index b15d9b9..bb99259 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -24,11 +24,6 @@ endef
 
 $(eval $(generic-package))
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
 ifeq ($(BR2_TARGET_XLOADER),y)
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
