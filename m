From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 May 2012 22:57:59 +0200
Subject: [Buildroot] [git commit branch/next] libosip2: remove redundant
	LIBOSIP2_SOURCE definition
Message-ID: <20120514210033.3946F96CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=674d4db3e68578a567e2e0ddc99be371bc9ea5ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libosip2/libosip2.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 1d53f76..2cde27f 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -5,7 +5,6 @@
 #############################################################
 
 LIBOSIP2_VERSION = 3.6.0
-LIBOSIP2_SOURCE = libosip2-$(LIBOSIP2_VERSION).tar.gz
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 
