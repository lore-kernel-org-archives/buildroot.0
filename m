From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:23:46 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/qemu: replace
 utf-8 space by ascii character
Message-ID: <20190526072357.8E4187FF0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bce546275f4f95e7567566ec882e8d553a2250a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5dd15ad1dba6f1aaeac896b8b8d8771bd892d4a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 30cd5972ef..b858efe3f7 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -9,7 +9,7 @@ QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
-#??NOTE: there is no top-level license file for non-(L)GPL licenses;
+# NOTE: there is no top-level license file for non-(L)GPL licenses;
 #       the non-(L)GPL license texts are specified in the affected
 #       individual source files.
 
