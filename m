From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 22:57:02 +0200
Subject: [Buildroot] [git commit] sunxi-boards: bump version
Message-ID: <20140420210331.705089C910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5090657f6136553d6761fb74536a90275c103a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brian Beattie <beattie@beattie-home.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-boards/sunxi-boards.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
index 932b625..c65d00f 100644
--- a/package/sunxi-boards/sunxi-boards.mk
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_BOARDS_VERSION = 25a868189dbaa40872b2ac7d8a941dd73972eb08
+SUNXI_BOARDS_VERSION = 4016ad7fb6c249c0bd6b6d804c706f9a7a165cc6
 SUNXI_BOARDS_SITE = $(call github,linux-sunxi,sunxi-boards,$(SUNXI_BOARDS_VERSION))
 SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
 SUNXI_BOARDS_INSTALL_IMAGES = YES
