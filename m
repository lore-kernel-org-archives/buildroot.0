From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] tcl: remove empty host dependencies
	definition
Message-ID: <20160703082409.1FCEF81836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eee0a6414c5c4d6fe06d25acd20d95baee646743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index a1153c7..a2ac8e6 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -75,7 +75,6 @@ TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql)
-HOST_TCL_DEPENDENCIES =
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
