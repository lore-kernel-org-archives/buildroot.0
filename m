From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 15:55:59 +0200
Subject: [Buildroot] [git commit] tcl: cleanup: use TCL_VERSION in TCL_SITE
Message-ID: <20130926144208.BC0089B879@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9731bff1400cf43b7d979c6e44ca65933e0e3bce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcl/tcl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
