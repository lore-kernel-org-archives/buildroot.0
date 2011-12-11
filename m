From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 23:20:35 +0100
Subject: [Buildroot] [git commit] libeXosip2: bump version
Message-ID: <20111211222422.E40B18F8CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=792b018b3712effe16da39787c8f75629fde8362
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libeXosip2/libeXosip2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 69fdca3..4a00a2b 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -3,7 +3,7 @@
 # libeXosip2
 #
 #############################################################
-LIBEXOSIP2_VERSION = 3.3.0
+LIBEXOSIP2_VERSION = 3.5.0
 LIBEXOSIP2_SOURCE = libexosip2_$(LIBEXOSIP2_VERSION).orig.tar.gz
 LIBEXOSIP2_PATCH = libexosip2_$(LIBEXOSIP2_VERSION)-1.diff.gz
 LIBEXOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libe/libexosip2
