From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 14:54:45 +0200
Subject: [Buildroot] [git commit] Config.in: fix check-package warning
Message-ID: <20180417125749.811EB8680A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e58fdc5e913105f3a0812039798292bb63e6a53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

Config.in:203: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
Config.in:204: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

https://gitlab.com/buildroot.org/buildroot/-/jobs/63334884

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index c2a1925088..62d2dc3473 100644
--- a/Config.in
+++ b/Config.in
@@ -200,9 +200,9 @@ config BR2_DL_DIR
 	  If the Linux shell environment has defined the BR2_DL_DIR
 	  environment variable, then this overrides this configuration
 	  item.
-	  The directory is organized with a subdirectory for each package.
-	  Each package has its own $(LIBFOO_DL_DIR) variable that can be used
-	  to find the correct path.
+	  The directory is organized with a subdirectory for each
+	  package. Each package has its own $(LIBFOO_DL_DIR) variable
+	  that can be used to find the correct path.
 
 	  The default is $(TOPDIR)/dl
 
