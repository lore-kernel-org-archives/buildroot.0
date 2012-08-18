From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 18 Aug 2012 10:25:38 +0100
Subject: [Buildroot] [PATCH 2/5] grub: add license information
In-Reply-To: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
References: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
Message-ID: <1345281941-6722-2-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/grub/grub.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index e8d66f1..4a094bc 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -9,6 +9,9 @@ GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
 GRUB_PATCH  = grub_$(GRUB_VERSION)-35.diff.gz
 GRUB_SITE   = http://snapshot.debian.org/archive/debian/20080329T000000Z/pool/main/g/grub/
 
+GRUB_LICENSE = GPLv2+
+GRUB_LICENSE_FILES = COPYING
+
 GRUB_CFLAGS=-DSUPPORT_LOOPDEV
 ifeq ($(BR2_LARGEFILE),)
 GRUB_CFLAGS+=-U_FILE_OFFSET_BITS
-- 
1.7.9.5
