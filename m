From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 24 Sep 2013 12:36:35 +0100
Subject: [Buildroot] [PATCH] neard: bump version to 0.13
Message-ID: <1380022595-10788-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/neard/neard.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 6dbbbe0..0f954b8 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.12
+NEARD_VERSION = 0.13
 NEARD_SOURCE = neard-$(NEARD_VERSION).tar.xz
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
-- 
1.8.1.2
