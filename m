From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 28 Jul 2016 11:38:39 +0100
Subject: [Buildroot] [PATCH 2/2] tcl: bump version to 8.6.6
In-Reply-To: <1469702319-59412-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1469702319-59412-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1469702319-59412-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.7.3
