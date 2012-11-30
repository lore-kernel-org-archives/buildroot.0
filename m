From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Nov 2012 23:14:41 -0800
Subject: [Buildroot] [git commit] libroxml: bump version to 2.2.1
Message-ID: <20121203145713.B878199808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b17c7963890354d2cffdda2f16eeeaf4c1288e99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ml-2.2.0-werror.patch => libroxml-werror.patch} |    6 +++---
 package/libroxml/libroxml.mk                       |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libroxml/libroxml-2.2.0-werror.patch b/package/libroxml/libroxml-werror.patch
similarity index 86%
rename from package/libroxml/libroxml-2.2.0-werror.patch
rename to package/libroxml/libroxml-werror.patch
index a72f2a7..a99962f 100644
--- a/package/libroxml/libroxml-2.2.0-werror.patch
+++ b/package/libroxml/libroxml-werror.patch
@@ -7,10 +7,10 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
  Makefile |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: libroxml-2.1.0/Makefile
+Index: a/Makefile
 ===================================================================
---- libroxml-2.1.0.orig/Makefile
-+++ libroxml-2.1.0/Makefile
+--- a/Makefile
++++ b/Makefile
 @@ -41,7 +41,7 @@
  
  # options
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 457a28a..d7ef6a4 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -2,7 +2,7 @@
 # libroxml
 #
 
-LIBROXML_VERSION = 2.2.0
+LIBROXML_VERSION = 2.2.1
 LIBROXML_SITE = http://libroxml.googlecode.com/files
 LIBROXML_INSTALL_STAGING = YES
 
