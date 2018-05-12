From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 11 May 2018 23:22:10 -0300
Subject: [Buildroot] [PATCH 1/1] package/python-cython: fix indentation
Message-ID: <20180512022210.14933-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/67844444

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
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
-- 
2.17.0
