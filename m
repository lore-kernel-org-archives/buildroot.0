From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 21:39:31 +0200
Subject: [Buildroot] [PATCH 08 of 13] manual/user guide/customization:
 rename section 'Customizing packages'
In-Reply-To: <patchbomb.1411069163@localhost>
References: <patchbomb.1411069163@localhost>
Message-ID: <bafb5924f054ce0362d2.1411069171@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small patch renames the section 'Customizing packages' to 'Adding
project-specific patches'. Additionally, a minor change is done to the
introduction of this section.
To better reflect the contents, the source file is renamed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/customize-patches.txt |  11 ++++++-----
 docs/manual/customize.txt         |   2 +-
 docs/manual/patch-policy.txt      |   2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-patches.txt
rename from docs/manual/customize-packages.txt
rename to docs/manual/customize-patches.txt
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
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -53,6 +53,6 @@
 
 include::customize-post-image.txt[]
 
-include::customize-packages.txt[]
+include::customize-patches.txt[]
 
 include::customize-store.txt[]
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -46,7 +46,7 @@
 
 The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
 used to specify a space separated list of one or more directories
-containing global package patches. See xref:packages-custom[] for
+containing global package patches. See xref:customize-patches[] for
 details.
 
 [[patch-apply-order]]
