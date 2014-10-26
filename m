From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:37 +0100
Subject: [Buildroot] [PATCH 31/51] sunxi-mali: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-31-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/sunxi-mali/sunxi-mali.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index c6900c8..5e2e78c 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_VERSION = c2491fe952354ba44538064e534ed7c731cedb1e
+SUNXI_MALI_VERSION = d343311efc8db166d8371b28494f0f27b6a58724
 SUNXI_MALI_SITE = $(call github,linux-sunxi,sunxi-mali,$(SUNXI_MALI_VERSION))
 
 SUNXI_MALI_INSTALL_STAGING = YES
-- 
2.1.1
