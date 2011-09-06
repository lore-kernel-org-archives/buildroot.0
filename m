From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 06 Sep 2011 11:46:21 +0200
Subject: [Buildroot] [PATCH] lzop : bump to 1.03
Message-ID: <4E65EBED.3090009@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/lzop/lzop.mk |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

Index: b/package/lzop/lzop.mk
===================================================================
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -3,10 +3,10 @@
 # lzop
 #
 #############################################################
-LZOP_VERSION:=1.02rc1
-LZOP_SOURCE:=lzop-$(LZOP_VERSION).tar.gz
-LZOP_SITE:=http://www.lzop.org/download/
-LZOP_CONF_OPT:=--program-prefix=""
-LZOP_DEPENDENCIES:=lzo
+LZOP_VERSION = 1.03
+LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
+LZOP_SITE = http://www.lzop.org/download/
+LZOP_CONF_OPT = --program-prefix=""
+LZOP_DEPENDENCIES = lzo
 
 $(eval $(call AUTOTARGETS,package,lzop))
