From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 May 2018 08:59:39 +0200
Subject: [Buildroot] [git commit] package/python-cython: fix indentation
Message-ID: <20180512065906.1D7EE8C564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8158331ae3fe942a8d31469e7909924c8ea3cef6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/67844444

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
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
