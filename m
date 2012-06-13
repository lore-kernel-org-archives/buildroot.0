From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jun 2012 15:19:22 +0200
Subject: [Buildroot] [git commit] libroxml: bump version to 2.2.0
Message-ID: <20120613131942.D55EB96F15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9156bbc947f03ef149df527e768c920846aa7a33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....2-werror.patch => libroxml-2.2.0-werror.patch} |    0
 package/libroxml/libroxml.mk                       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libroxml/libroxml-2.1.2-werror.patch b/package/libroxml/libroxml-2.2.0-werror.patch
similarity index 100%
rename from package/libroxml/libroxml-2.1.2-werror.patch
rename to package/libroxml/libroxml-2.2.0-werror.patch
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 5c0bf01..228a0df 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -2,7 +2,7 @@
 # libroxml
 #
 
-LIBROXML_VERSION = 2.1.2
+LIBROXML_VERSION = 2.2.0
 LIBROXML_SITE = http://libroxml.googlecode.com/files
 LIBROXML_INSTALL_STAGING = YES
 
