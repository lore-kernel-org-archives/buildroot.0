From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] libargtable2: remove --program-prefix
Message-ID: <20110912052635.57F408D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e127003af528678ea4b6c9eaca9af5647c25bfc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libargtable2/libargtable2.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index 5f388f9..4241e73 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -9,8 +9,7 @@ LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
 LIBARGTABLE2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/argtable/
 
 LIBARGTABLE2_INSTALL_STAGING = YES
-LIBARGTABLE2_CONF_OPT= --program-prefix="" \
-		--disable-example \
+LIBARGTABLE2_CONF_OPT= --disable-example \
 		--disable-kernel-module \
 		--enable-lib \
 		--enable-util
-- 
1.7.3.4
