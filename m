From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 16 Dec 2013 08:35:11 +0000
Subject: [Buildroot] [PATCH] neard: bump version to 0.14
Message-ID: <1387182911-22846-1-git-send-email-spdawson@gmail.com>
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
index 3b17c6a..54b8703 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.13
+NEARD_VERSION = 0.14
 NEARD_SOURCE = neard-$(NEARD_VERSION).tar.xz
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
-- 
1.8.3.2
