From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:08:58 +0200
Subject: [Buildroot] [git commit] sunxi-boards: fix github tarball to use
	commit id
Message-ID: <20130606211258.CBAF99A9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ad0ab6e16e67a1d1269aec7ddc1b70d10d86e82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sunxi-boards/sunxi-boards.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
index 8ad99cb..6c28e42 100644
--- a/package/sunxi-boards/sunxi-boards.mk
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUNXI_BOARDS_VERSION = 88d663db44f65b73ef65c4148a28c6fa3665d2b6
-SUNXI_BOARDS_SITE = https://github.com/linux-sunxi/sunxi-boards/tarball/master
+SUNXI_BOARDS_SITE = https://github.com/linux-sunxi/sunxi-boards/tarball/$(SUNXI_BOARDS_VERSION)
 SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
 SUNXI_BOARDS_INSTALL_IMAGES = YES
 SUNXI_BOARDS_INSTALL_TARGET = NO
