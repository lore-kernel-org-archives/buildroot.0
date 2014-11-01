From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 23:28:06 +0100
Subject: [Buildroot] [git commit] sunxi-boards: bump version
Message-ID: <20141101222918.82153AC2EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0b5052e9dec110903e1887e17bca314df228bb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-boards/sunxi-boards.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
index c65d00f..1a2bb4c 100644
--- a/package/sunxi-boards/sunxi-boards.mk
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_BOARDS_VERSION = 4016ad7fb6c249c0bd6b6d804c706f9a7a165cc6
+SUNXI_BOARDS_VERSION = 68acb3b1610a44b9402560623f7e35b7882585e9
 SUNXI_BOARDS_SITE = $(call github,linux-sunxi,sunxi-boards,$(SUNXI_BOARDS_VERSION))
 SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
 SUNXI_BOARDS_INSTALL_IMAGES = YES
