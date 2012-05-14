From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 May 2012 22:57:44 +0200
Subject: [Buildroot] [git commit branch/next] libogg: remove redundant
	LIBOGG_SOURCE definition
Message-ID: <20120514210032.E6E2396C9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a3c6cfa01790e78edd229de67ee9161fc3aba5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libogg/libogg.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index c40f04e..c3d4897 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,7 +4,6 @@
 #
 #############################################################
 LIBOGG_VERSION = 1.3.0
-LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.gz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_INSTALL_STAGING = YES
 
