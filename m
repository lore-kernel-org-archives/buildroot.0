From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 08:09:41 +0200
Subject: [Buildroot] [git commit] libargtable2: fix source tarball name
Message-ID: <20110713061023.76A618A593@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa0c4d4e48c615b1eab0b10296680b4a047c500e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Last minute brown paper bag bug.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libargtable2/libargtable2.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index 57eb629..5f388f9 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -5,6 +5,7 @@
 #############################################################
 
 LIBARGTABLE2_VERSION = 13
+LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
 LIBARGTABLE2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/argtable/
 
 LIBARGTABLE2_INSTALL_STAGING = YES
-- 
1.7.3.4
