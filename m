From: Simon Marchi <simon.marchi@polymtl.ca>
Date: Thu, 20 Nov 2014 10:32:10 -0500
Subject: [Buildroot] [PATCH] python-netifaces: allow depending on Python 3
Message-ID: <1416497530-3035-1-git-send-email-simon.marchi@polymtl.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.10.4 is compatible with python 3.

Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
---
 package/python-netifaces/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
index 29f9fc3..b660fdb 100644
--- a/package/python-netifaces/Config.in
+++ b/package/python-netifaces/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_NETIFACES
 	bool "python-netifaces"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Portable access to network interfaces from Python.
 
-- 
2.1.3
