From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 25 Apr 2017 11:48:06 -0700
Subject: [Buildroot] [PATCH] package/python-versiontools: Remove Python2
	dependency
Message-ID: <20170425184806.11368-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python-versiontools supports Python3, so there's no reason to limit it
to Python2 only.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Matthew Carruth <carruthm@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

This is a follow up on patch [1]. Matthew is a colleague of mine and I
am picking up where he left off.

[1] http://lists.busybox.net/pipermail/buildroot/2017-April/189874.html

 package/python-versiontools/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-versiontools/Config.in b/package/python-versiontools/Config.in
index cb260c1..d15de1f 100644
--- a/package/python-versiontools/Config.in
+++ b/package/python-versiontools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_VERSIONTOOLS
 	bool "python-versiontools"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Smart replacement for plain tuple used in __version__.
 
-- 
2.9.3
