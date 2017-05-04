From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:14:01 +0200
Subject: [Buildroot] [git commit] python-simplegeneric: fix description
Message-ID: <20170504201521.3E8C88179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=811cdea0834810bf2b67358f8a6e9c28916556aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the description from https://pypi.python.org/pypi/simplegeneric.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-simplegeneric/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-simplegeneric/Config.in b/package/python-simplegeneric/Config.in
index b5ebfec..623b1ae 100644
--- a/package/python-simplegeneric/Config.in
+++ b/package/python-simplegeneric/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_SIMPLEGENERIC
 	bool "python-simplegeneric"
 	help
-	  A configuration system for Python applications.
+	  Simple generic functions (similar to Python's own len(),
+	  pickle.dump(), etc.)
 
 	  https://pypi.python.org/pypi/simplegeneric
