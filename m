From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 Mar 2011 15:23:13 +0200
Subject: [Buildroot] [git commit master 1/1] midori: bump to version 0.3.2
Message-ID: <20110331132414.5483781D67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f5626851ab1a1e51cdcc6153b5913ba19dac79d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/midori/midori.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index af227d4..5f6315f 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-MIDORI_VERSION = 0.2.9
+MIDORI_VERSION = 0.3.2
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
-MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.2/
+MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.3/
 MIDORI_INSTALL_TARGET = YES
 
 MIDORI_DEPENDENCIES = host-pkg-config host-intltool webkit libsexy libgtk2
-- 
1.7.3.4
