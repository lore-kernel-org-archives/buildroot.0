From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:41:12 +0200
Subject: [Buildroot] [git commit] manual/user guide/customization: rename
	section 'Customizing packages'
Message-ID: <20140921174201.6A4319D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69a5343bfb8369c88d2c70b18c635318065d7075
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This small patch renames the section 'Customizing packages' to 'Adding
project-specific patches'. Additionally, a minor change is done to the
introduction of this section.
To better reflect the contents, the source file is renamed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ustomize-packages.txt => customize-patches.txt} |   11 ++++++-----
 docs/manual/customize.txt                          |    2 +-
 docs/manual/patch-policy.txt                       |    2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-patches.txt
similarity index 92%
rename from docs/manual/customize-packages.txt
rename to docs/manual/customize-patches.txt
index b4ed0b5..279d079 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-patches.txt
@@ -1,11 +1,12 @@
 // -*- mode:doc -*- ;
 
-[[packages-custom]]
-=== Customizing packages
+[[customize-patches]]
+=== Adding project-specific patches
 
-It is sometimes useful to apply 'extra' patches to packages - over and
-above those provided in Buildroot. This might be used to support custom
-features in a project, for example, or when working on a new architecture.
+It is sometimes useful to apply 'extra' patches to packages - on top of
+those provided in Buildroot. This might be used to support custom
+features in a project, for example, or when working on a new
+architecture.
 
 The +BR2_GLOBAL_PATCH_DIR+ configuration option can be used to specify
 a space separated list of one or more directories containing package
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 0a73988..b389d7f 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -53,6 +53,6 @@ include::customize-users-tables.txt[]
 
 include::customize-post-image.txt[]
 
-include::customize-packages.txt[]
+include::customize-patches.txt[]
 
 include::customize-store.txt[]
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index cb39821..745f58d 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -46,7 +46,7 @@ reference in their filename.
 
 The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
 used to specify a space separated list of one or more directories
-containing global package patches. See xref:packages-custom[] for
+containing global package patches. See xref:customize-patches[] for
 details.
 
 [[patch-apply-order]]
