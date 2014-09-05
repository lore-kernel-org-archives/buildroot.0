From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 5 Sep 2014 16:46:05 +0100
Subject: [Buildroot] [PATCH] tcl: bump version to 8.6.2
Message-ID: <1409931965-13622-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcl/tcl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index efb2ec8..62a5ede 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).1
+TCL_VERSION = $(TCL_VERSION_MAJOR).2
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = tcl license
-- 
1.7.1
