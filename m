From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] directfb: remove --program-prefix
Message-ID: <20110912052636.41BD28D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3bb80363351a101373d598c0e44ba97b9b386ea1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index c32fcdb..aa57845 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -12,7 +12,6 @@ DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
 	--disable-explicit-deps \
-	--program-prefix='' \
 	--enable-zlib \
 	--enable-freetype \
 	--enable-fbdev \
-- 
1.7.3.4
