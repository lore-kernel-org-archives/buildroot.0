From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] lighttpd: remove --program-prefix
Message-ID: <20110912052634.B22038D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=390b552f09451cf2bad9aa67fbcbf7b380cfa57d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lighttpd/lighttpd.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 45941eb..ba5f5cf 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -11,7 +11,6 @@ LIGHTTPD_CONF_OPT = \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib \
 	--localstatedir=/var \
-	--program-prefix="" \
 	$(if $(BR2_LARGEFILE),,--disable-lfs)
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
-- 
1.7.3.4
