From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 18:54:06 +0200
Subject: [Buildroot] [git commit] Config.in: indentation cleanup
Message-ID: <20160702165424.B03B381D64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a446ab74493dff57b1151ccb99a30424bdf36884
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
