From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Apr 2017 21:50:03 +0200
Subject: [Buildroot] [git commit] package/python-versiontools: remove
	Python2 dependency
Message-ID: <20170425195024.BF895827D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce98cea8fb1e1ef0f2453b17447a00af6e25e03f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-versiontools supports Python 3, so there's no reason to limit
it to Python 2 only.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Matthew Carruth <carruthm@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
 
