From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:20:04 +0200
Subject: [Buildroot] [git commit] tcl: install the libtcl into staging
Message-ID: <20130728142001.269C39AB40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b59411c759c8fe97e4edf78a7cd489d5c86ad66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tcl package contains a lib, so it should go into staging.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 564d5bc..cc0565c 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -12,6 +12,7 @@ TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION_MAJOR)
 TCL_LICENSE = tcl license
 TCL_LICENSE_FILES = license.terms
 TCL_SUBDIR = unix
+TCL_INSTALL_STAGING = YES
 TCL_CONF_OPT = \
 		--disable-symbols \
 		--disable-langinfo \
