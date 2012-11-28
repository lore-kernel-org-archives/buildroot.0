From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:21 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_22/51=5D_package/qemu=3A_add_licen?=
	=?utf-8?q?se_information?=
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-23-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QEMU is such a snakes-nest of licenses... :-/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index d40d7c9..790d34f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -7,6 +7,11 @@
 QEMU_VERSION = 1.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
+QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
+QEMU_LICENSE_FILES = COPYING COPYING.LIB
+#?NOTE: there is no top-level license file for non-(L)GPL licenses;
+#       the non-(L)GPL license texts are specified in the affected
+#       individual source files.
 
 QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
 
-- 
1.7.2.5
