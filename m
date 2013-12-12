From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 12 Dec 2013 09:19:07 +0800
Subject: [Buildroot] [PATCH] xl2tp: bump to version 1.3.2 and add licensing
	info
Message-ID: <1386811147.8675.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/xl2tp/xl2tp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index cf496fe..1df245f 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-XL2TP_VERSION = v1.3.1
+XL2TP_VERSION = v1.3.2
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
+XL2TP_LICENSE = GPLv2+
+XL2TP_LICENSE_FILES = LICENSE
 
 define XL2TP_BUILD_CMDS
 	$(SED) 's/ -O2 //' $(@D)/Makefile
-- 
1.8.1.2
