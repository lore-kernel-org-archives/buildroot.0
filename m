From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat,  2 Jul 2016 17:06:18 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: indentation cleanup
Message-ID: <1467471978-18813-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 Config.in | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Config.in b/Config.in
index bbe2bc3..7bb2a01 100644
--- a/Config.in
+++ b/Config.in
@@ -730,14 +730,14 @@ endmenu
 
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
-        help
-          This option will remove all sources of non-reproducibility
-          from the build process. For a given Buildroot configuration,
-          this allows to generate exactly identical binaries from one
-          build to the other, including on different machines.
-
-          This is labeled as an experimental feature, as not all
-          packages behave properly to ensure reproducibility.
+	help
+	  This option will remove all sources of non-reproducibility
+	  from the build process. For a given Buildroot configuration,
+	  this allows to generate exactly identical binaries from one
+	  build to the other, including on different machines.
+
+	  This is labeled as an experimental feature, as not all
+	  packages behave properly to ensure reproducibility.
 
 endmenu
 
-- 
1.9.1
