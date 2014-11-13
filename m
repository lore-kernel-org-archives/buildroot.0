From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 13 Nov 2014 16:45:48 +0000
Subject: [Buildroot] [PATCH] tcl: bump version to 8.6.3
Message-ID: <1415897148-59149-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcl/tcl.hash |    2 +-
 package/tcl/tcl.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index e1b3389..2d4e995 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	86f7ae5f581dd0904d04415637ab3aef5a50986c1b6d04c340e2b1b0258da9c4	tcl8.6.2-src.tar.gz
+sha256  6ce0778de0d50daaa9c345d7c1fd1288fb658f674028812e7eeee992e3051005  tcl8.6.3-src.tar.gz
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 2440772..ef0983b 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).2
+TCL_VERSION = $(TCL_VERSION_MAJOR).3
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = tcl license
-- 
1.7.1
