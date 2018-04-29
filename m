From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Apr 2018 10:00:16 +0200
Subject: [Buildroot] [git commit] python-daemonize: fix check-package
 warnings
Message-ID: <20180429080041.1D24088D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32b4b2f0f1f46cd4ad20e1774cc62f8f3ec64cd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/python-daemonize/Config.in:2: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/python-daemonize/Config.in:3: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/python-daemonize/Config.in:4: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/python-daemonize/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/python-daemonize/Config.in:6: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-daemonize/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-daemonize/Config.in b/package/python-daemonize/Config.in
index 3fa5ed3688..d34e35c41c 100644
--- a/package/python-daemonize/Config.in
+++ b/package/python-daemonize/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_DAEMONIZE
-       bool "python-daemonize"
-       select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-       help
-         Library to enable your code run as a daemon process on Unix-like
-         systems.
+	bool "python-daemonize"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	help
+	  Library to enable your code run as a daemon process on
+	  Unix-like systems.
 
-         https://pypi.python.org/pypi/daemonize
+	  https://pypi.python.org/pypi/daemonize
