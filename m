From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:48:14 +0200
Subject: [Buildroot] [git commit] package/python-soupsieve: fix Config.in
 indentation
Message-ID: <20191016194755.A703A810D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80ee1ea8585056d669c52f3f700b6f4372d6c1df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

$: ./utils/check-package package/python-soupsieve/*
package/python-soupsieve/Config.in:4: continuation line should be indented using tabs
27 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-soupsieve/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-soupsieve/Config.in b/package/python-soupsieve/Config.in
index c7571b3136..c42e975875 100644
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
 
