From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Aug 2014 10:59:10 +0200
Subject: [Buildroot] [PATCH 2/2] qemu: bump to version 2.1.0
In-Reply-To: <1408179550-24764-1-git-send-email-francois.perrad@gadz.org>
References: <1408179550-24764-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1408179550-24764-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 093ae64..be56c45 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 1.6.0
+QEMU_VERSION = 2.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
-- 
1.9.1
