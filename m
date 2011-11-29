From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Nov 2011 21:02:29 +0100
Subject: [Buildroot] [git commit branch/next] libroxml: bump version to 2.1.2
Message-ID: <20111130232437.D1E9F8F71A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3c6b3853ef054efe3ab9800392aec7aa7656dd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix some xpath bugs

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....1-werror.patch => libroxml-2.1.2-werror.patch} |    0
 package/libroxml/libroxml.mk                       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libroxml/libroxml-2.1.1-werror.patch b/package/libroxml/libroxml-2.1.2-werror.patch
similarity index 100%
rename from package/libroxml/libroxml-2.1.1-werror.patch
rename to package/libroxml/libroxml-2.1.2-werror.patch
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index f494348..5c0bf01 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -2,7 +2,7 @@
 # libroxml
 #
 
-LIBROXML_VERSION = 2.1.1
+LIBROXML_VERSION = 2.1.2
 LIBROXML_SITE = http://libroxml.googlecode.com/files
 LIBROXML_INSTALL_STAGING = YES
 
