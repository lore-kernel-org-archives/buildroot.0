From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:47 -0300
Subject: [Buildroot] [PATCH 08/45] qemu: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 94e1bcf..7accc1e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -7,7 +7,7 @@
 QEMU_VERSION = 2.4.0.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
-QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
+QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #?NOTE: there is no top-level license file for non-(L)GPL licenses;
 #       the non-(L)GPL license texts are specified in the affected
-- 
2.4.10
