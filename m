From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Nov 2012 17:35:26 +0100
Subject: [Buildroot] [PATCH 3/3] qemu: needs libglib2
In-Reply-To: <1352046926-10804-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1352046926-10804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1352046926-10804-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build error message is:
  glib-2.12 required to compile QEMU

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/qemu.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 67d5ab2..d40d7c9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -8,7 +8,7 @@ QEMU_VERSION = 1.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 
-QEMU_DEPENDENCIES = host-pkgconf zlib
+QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
 
 #       BR ARCH         qemu
 #       -------         ----
-- 
1.7.9.5
