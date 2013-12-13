From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2013 09:30:14 +0100
Subject: [Buildroot] [git commit] xl2tp: add licensing info
Message-ID: <20131213083508.C76B99C004@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=884ba34b572dbcbe0746cdb5d0754ae6979dfeeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: make license GPLv2 only]
Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xl2tp/xl2tp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index cf496fe..56b1150 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -7,6 +7,8 @@
 XL2TP_VERSION = v1.3.1
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
+XL2TP_LICENSE = GPLv2
+XL2TP_LICENSE_FILES = LICENSE
 
 define XL2TP_BUILD_CMDS
 	$(SED) 's/ -O2 //' $(@D)/Makefile
