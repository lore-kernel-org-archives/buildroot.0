From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun,  7 Feb 2016 15:39:02 +0100
Subject: [Buildroot] [PATCH] python-twisted: enable Python 3 support
Message-ID: <1454855942-28728-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

setup3.py will be automatically invoked from setup.py,
if executing on Python 3 platform.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-twisted/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index b302101..1221fc2 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_TWISTED
 	bool "python-twisted"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	help
 	  Twisted is an event-driven networking engine written in Python.
-- 
2.5.0
