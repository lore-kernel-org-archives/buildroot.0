From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 25 Sep 2013 12:12:42 +0200
Subject: [Buildroot] [PATCH 1/1] trivial: tcl: fix TCL_SITE variable
Message-ID: <1380103962-19647-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/tcl/tcl.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index f1193d3..3291c1b 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -8,7 +8,7 @@ TCL_VERSION_MAJOR = 8.4
 TCL_VERSION_MINOR = 19
 TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
-TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
+TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = tcl license
 TCL_LICENSE_FILES = license.terms
 TCL_SUBDIR = unix
-- 
1.7.9.5
