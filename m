From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun,  6 Oct 2013 20:36:12 +0200
Subject: [Buildroot] [PATCH 2/2] lockfile-progs: bump to version 0.1.17
In-Reply-To: <1381084572-628-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1381084572-628-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1381084572-628-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/lockfile-progs/lockfile-progs.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 35bb881..25f8134 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOCKFILE_PROGS_VERSION = 0.1.15
+LOCKFILE_PROGS_VERSION = 0.1.17
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
-- 
1.7.9.5
