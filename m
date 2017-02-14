From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 20:38:46 +0100
Subject: [Buildroot] [git commit] libasplib: add url to gcc bug report
Message-ID: <20170214193921.EB6C07FED3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e6368044162af4b8f9f50e5a2237a53dc1d7c12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add comment to bug report.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
