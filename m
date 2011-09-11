From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] libreplaygain: bump to r475
Message-ID: <20110912052627.E69368D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=90866f2705ccf2c74956525af0ec1549d902a76e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libreplaygain/libreplaygain.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libreplaygain/libreplaygain.mk b/package/multimedia/libreplaygain/libreplaygain.mk
index c941092..cc023a0 100644
--- a/package/multimedia/libreplaygain/libreplaygain.mk
+++ b/package/multimedia/libreplaygain/libreplaygain.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBREPLAYGAIN_VERSION =  r453
+LIBREPLAYGAIN_VERSION =  r475
 LIBREPLAYGAIN_SITE = http://files.musepack.net/source
 LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 # upstream doesn't ship configure
-- 
1.7.3.4
