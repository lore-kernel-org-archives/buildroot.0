From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Oct 2012 11:38:55 +0200
Subject: [Buildroot] [git commit] barebox: fix license information
Message-ID: <20121009094541.3D89A9980E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=805ba041c02e2eccfdc86cc43ef30c3c3240fc72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The barebox license should be "GPLv2 with exceptions", and not GPLv2.

Signed-off-by: Simon Dawson <simond@trainfx.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 9550cdc..ee84831 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -20,7 +20,7 @@ BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE = http://www.barebox.org/download/
 endif
 
-BAREBOX_LICENSE = GPLv2
+BAREBOX_LICENSE = GPLv2 with exceptions
 BAREBOX_LICENSE_FILES = COPYING
 
 ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
