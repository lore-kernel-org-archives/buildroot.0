From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:20 -0500
Subject: [Buildroot] [PATCH 05/14] mtdev2tuio: fix github tarball to use
	commit id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370537249-15682-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/mtdev2tuio/mtdev2tuio.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index 9306946..6b61e2a 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 MTDEV2TUIO_VERSION = e1e7378
-MTDEV2TUIO_SITE = http://github.com/olivopaolo/mtdev2tuio/tarball/master
+MTDEV2TUIO_SITE = http://github.com/olivopaolo/mtdev2tuio/tarball/$(MTDEV2TUIO_VERSION)
 MTDEV2TUIO_DEPENDENCIES = mtdev liblo
 MTDEV2TUIO_LICENSE = GPLv3+
 MTDEV2TUIO_LICENSE_FILES = COPYING
-- 
1.7.9.5
