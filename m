From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:09:20 +0200
Subject: [Buildroot] [git commit] grub: add license information
Message-ID: <20120821110311.D213697206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6643351d0b0feac205341ab9b121c0c74c70c125
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
