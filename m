From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 19:47:18 +0200
Subject: [Buildroot] [git commit] barebox: fix license information
Message-ID: <20120822174958.AF9E997251@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73b18d99701800e694604aa2cd9d384dcbee3513
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The barebox license is GPLv2, and not GPLv2+.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
