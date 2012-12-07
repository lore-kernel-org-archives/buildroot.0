From: Davide Viti <zinosat@tiscali.it>
Date: Fri,  7 Dec 2012 22:15:01 +0100
Subject: [Buildroot] [PATCH] tcl: add license information
In-Reply-To: <1354914901-4480-1-git-send-email-zinosat@tiscali.it>
References: <1354914901-4480-1-git-send-email-zinosat@tiscali.it>
Message-ID: <1354914901-4480-2-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/tcl/tcl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 606042e..ec089ee 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -8,6 +8,8 @@ TCL_VERSION_MINOR = 19
 TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
+TCL_LICENSE = tcl license
+TCL_LICENSE_FILE = license.terms
 TCL_SUBDIR = unix
 TCL_CONF_OPT = \
 		--disable-symbols \
-- 
1.7.2.5
