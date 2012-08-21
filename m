From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:09:16 +0200
Subject: [Buildroot] [git commit] barebox: add license information
Message-ID: <20120821110311.C2CDB9724C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de2ac17e461ba233167985499846a4ae1e9961b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
