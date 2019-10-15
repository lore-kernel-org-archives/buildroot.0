From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 15 Oct 2019 20:05:55 +0200
Subject: [Buildroot] [PATCH] package/python-soupsieve: Fix fix Config.in
 indentation
Message-ID: <1571162755-8594-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

$: ./utils/check-package package/python-soupsieve/*
package/python-soupsieve/Config.in:4: continuation line should be indented using tabs
27 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-soupsieve/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-soupsieve/Config.in b/package/python-soupsieve/Config.in
index c7571b3..c42e975 100644
--- a/package/python-soupsieve/Config.in
+++ b/package/python-soupsieve/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_SOUPSIEVE
 	bool "python-soupsieve"
 	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
-               if BR2_PACKAGE_PYTHON # runtime
+	       if BR2_PACKAGE_PYTHON # runtime
 	help
 	  A modern CSS selector implementation for Beautiful Soup.
 
-- 
2.7.4
