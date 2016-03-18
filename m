From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 21:31:02 +0100
Subject: [Buildroot] [git commit] tcl: bump version to 8.6.5
Message-ID: <20160318205619.0B12880497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b51964584bb1577f51db505cf1b56822849c1cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcl/tcl.hash | 2 +-
 package/tcl/tcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index 2d4e995..dd64637 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6ce0778de0d50daaa9c345d7c1fd1288fb658f674028812e7eeee992e3051005  tcl8.6.3-src.tar.gz
+sha256 ce26d5b9c7504fc25d2f10ef0b82b14cf117315445b5afa9e673ed331830fb53 tcl8.6.5-src.tar.gz
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 1ebba1e..9fd1195 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).3
+TCL_VERSION = $(TCL_VERSION_MAJOR).5
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = tcl license
