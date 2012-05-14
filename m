From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 May 2012 22:58:12 +0200
Subject: [Buildroot] [git commit branch/next] libeXosip2: remove redundant
	LIBOSIP2_SOURCE definition
Message-ID: <20120514210033.594F596CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d73f7784191984995314d7bb6c983089d31e1abe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libeXosip2/libeXosip2.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 4b778a9..24ca7ce 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -5,7 +5,6 @@
 #############################################################
 
 LIBEXOSIP2_VERSION = 3.6.0
-LIBEXOSIP2_SOURCE = libeXosip2-$(LIBEXOSIP2_VERSION).tar.gz
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip/
 LIBEXOSIP2_INSTALL_STAGING = YES
 
