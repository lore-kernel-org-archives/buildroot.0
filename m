From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:36 +0100
Subject: [Buildroot] [PATCH 30/51] sunxi-boards: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-30-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/sunxi-boards/sunxi-boards.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.1.1
