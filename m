From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 13 Dec 2013 09:01:08 +0800
Subject: [Buildroot] [PATCH v2 1/2] xl2tp: add licensing info
Message-ID: <1386896468.9372.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
v2: no change, just make version consistent in this serial
I separate "xl2tp: bump to version 1.3.2 and add licensing info" to 2 patches.
This one adds licensing info, next patch for bump version.
 package/xl2tp/xl2tp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index cf496fe..07634a0 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -7,6 +7,8 @@
 XL2TP_VERSION = v1.3.1
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
+XL2TP_LICENSE = GPLv2+
+XL2TP_LICENSE_FILES = LICENSE
 
 define XL2TP_BUILD_CMDS
 	$(SED) 's/ -O2 //' $(@D)/Makefile
-- 
1.8.1.2
