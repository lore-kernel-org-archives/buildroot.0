From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 22 Aug 2012 13:47:33 +0100
Subject: [Buildroot] [PATCH] barebox: fix license information
Message-ID: <1345639653-17544-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The barebox license is GPLv2, and not GPLv2+.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/barebox/barebox.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 3641c1d..9550cdc 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -20,7 +20,7 @@ BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE = http://www.barebox.org/download/
 endif
 
-BAREBOX_LICENSE = GPLv2+
+BAREBOX_LICENSE = GPLv2
 BAREBOX_LICENSE_FILES = COPYING
 
 ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
-- 
1.7.9.5
