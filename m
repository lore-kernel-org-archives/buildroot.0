From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 18 Aug 2012 10:25:37 +0100
Subject: [Buildroot] [PATCH 1/5] barebox: add license information
Message-ID: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/barebox/barebox.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index e5e2558..3641c1d 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -20,6 +20,9 @@ BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE = http://www.barebox.org/download/
 endif
 
+BAREBOX_LICENSE = GPLv2+
+BAREBOX_LICENSE_FILES = COPYING
+
 ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define BAREBOX_APPLY_CUSTOM_PATCHES
 	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \
-- 
1.7.9.5
