From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 20:44:02 +0200
Subject: [Buildroot] [git commit] CHANGES: document external-deps /
	legal-info / source / source-checks changes
Message-ID: <20150504184627.356E681952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c3ad2354f99df134a8ec4eb61206e23a0c82a1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And fixup indentation for version/patch dependencies section.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3dd7a9f..975fa1b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -26,9 +26,9 @@
 	been added. Missing hashes now stop the build unless
 	explicitly disabled.
 
-	Spaces and colons (:) are now supported in
-	package versions. Dependencies can now be listed for the patch
-	step (<PKG>_PATCH_DEPENDENCIES). Kconfig and Linux kernel
+	Spaces and colons (:) are now supported in package
+	versions. Dependencies can now be listed for the patch step
+	(<PKG>_PATCH_DEPENDENCIES). Kconfig and Linux kernel
 	extensions infrastructure has been added.
 
 	Makedevs now has a recursive (r) option.
@@ -36,6 +36,11 @@
 	The variable containing the list of packages to build has been
 	renamed from TARGETS to PACKAGES.
 
+	Make external-deps / legal-info / source / source-check have
+	been reimplemented using the package infrastructure, so their
+	output/behaviour may differ from earlier (some packages were
+	not included in the past).
+
 	The old insecure DES password encoding is no longer supported.
 
 	U-Boot patch option now support direct references to patch
