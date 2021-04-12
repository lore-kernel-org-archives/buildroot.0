From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Apr 2021 11:44:05 -0500
Subject: [Buildroot] [PATCH] package/python-flup: update dependency to
 python3
Message-ID: <20210412164405.16890-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

Dependency incorrectly calls out python, should be python3

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/python-flup/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-flup/Config.in b/package/python-flup/Config.in
index 2c21323515..f40f250163 100644
--- a/package/python-flup/Config.in
+++ b/package/python-flup/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLUP
 	bool "python-flup"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  flup provides of a collection of WSGI modules for Python.
 	  It allows a webserver to use scgi-mod and fastcgi-mod
-- 
2.17.1
