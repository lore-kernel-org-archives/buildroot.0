From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Jan 2012 12:03:10 +0100
Subject: [Buildroot] [git commit] yajl: bump version
Message-ID: <20120125112029.A439090391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01e5bee40f7ae083a5d62c99667bb9709d266f16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-math-link.patch => yajl-2.0.4-math-link.patch} |    0
 package/yajl/yajl.mk                               |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/yajl/yajl-2.0.2-math-link.patch b/package/yajl/yajl-2.0.4-math-link.patch
similarity index 100%
rename from package/yajl/yajl-2.0.2-math-link.patch
rename to package/yajl/yajl-2.0.4-math-link.patch
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 723cce4..1c0df38 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YAJL_VERSION = 2.0.2
+YAJL_VERSION = 2.0.4
 YAJL_SITE = git://github.com/lloyd/yajl.git
 YAJL_INSTALL_STAGING = YES
 
