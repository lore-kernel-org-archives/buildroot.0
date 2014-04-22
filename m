From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 22 Apr 2014 23:47:17 +0200
Subject: [Buildroot] [PATCH] evemu: bump version to 1.2.0
Message-ID: <1398203237-11976-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/evemu/evemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 38b792d..df9aea1 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 1.0.10
+EVEMU_VERSION = 1.2.0
 EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
 EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
-- 
1.8.1.4
