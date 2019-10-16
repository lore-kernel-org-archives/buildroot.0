From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:48:00 +0200
Subject: [Buildroot] [git commit] package/python-cheroot: fix Config.in
 indentation
Message-ID: <20191016194755.9497C810D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adfef8b5bb5dd97964575668bac0b4e686e8e3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

$: ./utils/check-package package/python-cheroot/*
package/python-cheroot/Config.in:7: continuation line should be indented using tabs
32 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cheroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cheroot/Config.in b/package/python-cheroot/Config.in
index 1185e816ec..0b732f8c0b 100644
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
