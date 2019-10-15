From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 15 Oct 2019 20:04:46 +0200
Subject: [Buildroot] [PATCH] package/python-cheroot: fix Config.in
 indentation
Message-ID: <1571162686-8201-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

$: ./utils/check-package package/python-cheroot/*
package/python-cheroot/Config.in:7: continuation line should be indented using tabs
32 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-cheroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cheroot/Config.in b/package/python-cheroot/Config.in
index 1185e81..0b732f8 100644
--- a/package/python-cheroot/Config.in
+++ b/package/python-cheroot/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_CHEROOT
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
-               if BR2_PACKAGE_PYTHON # runtime
+	       if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Cheroot is the high-performance, pure-Python
 	  HTTP server used by CherryPy.
-- 
2.7.4
