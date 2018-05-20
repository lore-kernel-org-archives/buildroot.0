From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 11:41:44 +0200
Subject: [Buildroot] [git commit branch/next] python-cython: fix
 check-package warnings
Message-ID: <20180520094104.B6CA9812EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e06c3117665c5aabe94f1bbab7fb709e2953226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

package/python-cython/Config.in.host:2: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/python-cython/Config.in.host:3: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/python-cython/Config.in.host:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/python-cython/Config.in.host:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cython/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cython/Config.in.host b/package/python-cython/Config.in.host
index b69e59b718..69d32d5ab3 100644
--- a/package/python-cython/Config.in.host
+++ b/package/python-cython/Config.in.host
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_PYTHON_CYTHON
-       bool "host python-cython"
-       help
-         The Cython compiler for writing C extensions for the Python
-         language.
+	bool "host python-cython"
+	help
+	  The Cython compiler for writing C extensions for the Python
+	  language.
 
-         http://cython.org/
+	  http://cython.org/
