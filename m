From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 28 Jun 2013 10:36:11 +0100
Subject: [Buildroot] [PATCH] neard: bump version to 0.12
Message-ID: <1372412171-3500-1-git-send-email-spdawson@gmail.com>
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
index 0fa30ea..56730b2 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.11
+NEARD_VERSION = 0.12
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
 NEARD_LICENSE_FILES = COPYING
-- 
1.8.1.2
