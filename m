From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:25 +0200
Subject: [Buildroot] [PATCH v1 05/28] package/qemu: replace utf-8 space by
 ascii character
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 19bcafa62f..025c322b98 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -9,7 +9,7 @@ QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
-#?NOTE: there is no top-level license file for non-(L)GPL licenses;
+# NOTE: there is no top-level license file for non-(L)GPL licenses;
 #       the non-(L)GPL license texts are specified in the affected
 #       individual source files.

--
2.21.0
