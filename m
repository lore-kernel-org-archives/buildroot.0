From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 17:09:31 +0100
Subject: [Buildroot] [git commit branch/next] package/python3: change
	BR2_PACKAGE_PYTHON_PYEXPAT description
Message-ID: <20150221164241.E138280447@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2df8cf5af74d91db519a32a8f3165a0d255606cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch changes BR2_PACKAGE_PYTHON3_PYEXPAT description and
help text to underline that all the xml libraries will be
included in python.
It also reorders alphabetically the affected option.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index c3118c8..e2f9077 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -66,12 +66,6 @@ config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
 	help
 	  ossaudiodev module for Python3.
 
-config BR2_PACKAGE_PYTHON3_PYEXPAT
-	select BR2_PACKAGE_EXPAT
-	bool "pyexpat"
-	help
-	  pyexpat module for Python3.
-
 config BR2_PACKAGE_PYTHON3_READLINE
 	select BR2_PACKAGE_READLINE
 	bool "readline"
@@ -97,6 +91,12 @@ config BR2_PACKAGE_PYTHON3_SQLITE
 	help
 	  SQLite database support
 
+config BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_EXPAT
+	bool "xml module"
+	help
+	  pyexpat and xml libraries for Python3.
+
 config BR2_PACKAGE_PYTHON3_ZLIB
 	bool "zlib module"
 	select BR2_PACKAGE_ZLIB
