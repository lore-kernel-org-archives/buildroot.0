From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 14:10:37 +0100
Subject: [Buildroot] [git commit] package/python-pycups: needs python3
Message-ID: <20201227130124.4A4CB82AB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=039dd5b8633625a400807a10e4f04c03be6e3343
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated in README:

Python 3 or later is required since Python 2 is unsupported since
2020-01-01.

Fixes:
 - http://autobuild.buildroot.org/results/3c8db83a2d1ae094fc718947a508e35e940121ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pycups/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pycups/Config.in b/package/python-pycups/Config.in
index eeaf70c9e6..61c2ba21d1 100644
--- a/package/python-pycups/Config.in
+++ b/package/python-pycups/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYCUPS
 	bool "python-pycups"
 	depends on BR2_PACKAGE_CUPS
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Python bindings for libcups.
 
