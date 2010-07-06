From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 6 Jul 2010 11:25:58 -0700
Subject: [Buildroot] [PATCH] e2fsprogs: bump version
Message-ID: <201007061125.58262.hartleys@visionengravers.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 1.41.12 was released May 18, 2010.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index af3c3ed..78bf21c 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -3,7 +3,7 @@
 # e2fsprogs
 #
 #############################################################
-E2FSPROGS_VERSION:=1.41.11
+E2FSPROGS_VERSION:=1.41.12
 E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VERSION).tar.gz
 E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 
