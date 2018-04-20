From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 20 Apr 2018 10:28:59 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/tcl: update license to SPDX
 format
Message-ID: <1524212941-5792-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While at it add the license file hash.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/tcl/tcl.hash | 1 +
 package/tcl/tcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index b344d26..359b543 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 a265409781e4b3edcc4ef822533071b34c3dc6790b893963809b9fe221befe07  tcl8.6.6-src.tar.gz
+sha256 c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index ffef9cf..b9fb7af 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -8,7 +8,7 @@ TCL_VERSION_MAJOR = 8.6
 TCL_VERSION = $(TCL_VERSION_MAJOR).6
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
-TCL_LICENSE = tcl license
+TCL_LICENSE = TCL
 TCL_LICENSE_FILES = license.terms
 TCL_SUBDIR = unix
 TCL_INSTALL_STAGING = YES
-- 
2.7.4
