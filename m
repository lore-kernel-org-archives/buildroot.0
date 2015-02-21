From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 17:09:04 +0100
Subject: [Buildroot] [git commit branch/next] package/python: change
	BR2_PACKAGE_PYTHON_PYEXPAT description
Message-ID: <20150221164241.D8883803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c22da1a2da42793364eb96bd80b8e10c4013ff02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch changes BR2_PACKAGE_PYTHON_PYEXPAT description and
help text to underline that all the xml libraries will be
included in python.
It also reorders alphabetically the affected option.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index 87defad..8d71dc9 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -65,12 +65,6 @@ config BR2_PACKAGE_PYTHON_OSSAUDIODEV
 	help
 	  ossaudiodev module for Python.
 
-config BR2_PACKAGE_PYTHON_PYEXPAT
-	select BR2_PACKAGE_EXPAT
-	bool "pyexpat"
-	help
-	  pyexpat module for Python.
-
 config BR2_PACKAGE_PYTHON_READLINE
 	select BR2_PACKAGE_READLINE
 	bool "readline"
@@ -114,6 +108,12 @@ config BR2_PACKAGE_PYTHON_SQLITE
 	help
 	  SQLite database support
 
+config BR2_PACKAGE_PYTHON_PYEXPAT
+	select BR2_PACKAGE_EXPAT
+	bool "xml module"
+	help
+	  pyexpat and xml libraries for Python
+
 config BR2_PACKAGE_PYTHON_ZLIB
 	bool "zlib module"
 	select BR2_PACKAGE_ZLIB
