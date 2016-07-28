From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 22:00:52 +0200
Subject: [Buildroot] [git commit] tcl: bump version to 8.6.6
Message-ID: <20160728201546.8E18F7FDA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c338bd70094f78681ba13e2895f46450a218fc37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcl/tcl.hash | 2 +-
 package/tcl/tcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index dd64637..b344d26 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ce26d5b9c7504fc25d2f10ef0b82b14cf117315445b5afa9e673ed331830fb53 tcl8.6.5-src.tar.gz
+sha256 a265409781e4b3edcc4ef822533071b34c3dc6790b893963809b9fe221befe07  tcl8.6.6-src.tar.gz
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index a2ac8e6..ffef9cf 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).5
+TCL_VERSION = $(TCL_VERSION_MAJOR).6
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = tcl license
