From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:48:04 +0200
Subject: [Buildroot] [git commit] package/python-jaraco-functools: fix
 Config.in indentation
Message-ID: <20191016194755.9D870810D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96f0d8e3c042a6e3d3a31e82a4c6733d0463339e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

$: ./utils/check-package package/python-jaraco-functools/*
package/python-jaraco-functools/Config.in:5: continuation line should be indented using tabs
30 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-functools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-jaraco-functools/Config.in b/package/python-jaraco-functools/Config.in
index e07c3131ff..62669dba6f 100644
--- a/package/python-jaraco-functools/Config.in
+++ b/package/python-jaraco-functools/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS
 	bool "python-jaraco-functools"
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
-               if BR2_PACKAGE_PYTHON # runtime
+	       if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Additional functools in the spirit of stdlib???s
 	  functools.
