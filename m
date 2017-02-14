From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 14 Feb 2017 15:09:27 +0100
Subject: [Buildroot] [PATCH] libasplib: add url to gcc bug report
Message-ID: <20170214140927.GA12181@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add comment to bug report.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libasplib/libasplib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libasplib/libasplib.mk b/package/libasplib/libasplib.mk
index b3b1fdb..558d173 100644
--- a/package/libasplib/libasplib.mk
+++ b/package/libasplib/libasplib.mk
@@ -19,6 +19,7 @@ LIBASPLIB_CONF_OPTS = \
 	-DBUILD_TIMER=ON
 
 # Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
 ifeq ($(BR2_m68k_cf),y)
 LIBASPLIB_CXXFLAGS += -fno-dwarf2-cfi-asm
 endif
-- 
2.1.4
