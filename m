From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  2 Sep 2013 10:18:50 +0200
Subject: [Buildroot] [PATCH 2/2] qemu: bump to version 1.6.0
In-Reply-To: <1378109930-4204-1-git-send-email-francois.perrad@gadz.org>
References: <1378109930-4204-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1378109930-4204-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/qemu/qemu.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index f177fd5..a89bf7d 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 1.3.1
+QEMU_VERSION = 1.6.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
-- 
1.7.9.5
