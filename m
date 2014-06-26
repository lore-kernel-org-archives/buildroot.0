From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:53 -0300
Subject: [Buildroot] [PATCH 25/53] libargtable2: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-25-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libargtable2/libargtable2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index cdd6236..48c70cb 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -7,11 +7,12 @@
 LIBARGTABLE2_VERSION = 13
 LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
 LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
-
 LIBARGTABLE2_INSTALL_STAGING = YES
 LIBARGTABLE2_CONF_OPT = --disable-example \
 		--disable-kernel-module \
 		--enable-lib \
 		--enable-util
+LIBARGTABLE2_LICENSE = LGPLv2+
+LIBARGTABLE2_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
