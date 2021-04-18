From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Apr 2021 22:06:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: drop docutils
 dependency
Message-ID: <20210418200601.3474244-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

docutils is not a dependency since version 1.18.0 and
https://github.com/boto/botocore/commit/dd24dd1b2ee8654ae0cf6aebce4a2f50ea7d75f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-botocore/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-botocore/Config.in b/package/python-botocore/Config.in
index a552900b6c..f34d774f95 100644
--- a/package/python-botocore/Config.in
+++ b/package/python-botocore/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTOCORE
 	bool "python-botocore"
 	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
-	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	help
-- 
2.30.2
