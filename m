From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:49:31 +0200
Subject: [Buildroot] [git commit] python3: move "select" after "bool" in
	Config.in
Message-ID: <20161009204943.A8FD880295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01b8d67c50f7adcc78d8afd1b30547812326dd0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index bf2cd7c..35f57e6 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -40,8 +40,8 @@ menu "core python3 modules"
 comment "The following modules are unusual or require extra libraries"
 
 config BR2_PACKAGE_PYTHON3_BZIP2
-	select BR2_PACKAGE_BZIP2
 	bool "bz2 module"
+	select BR2_PACKAGE_BZIP2
 	help
 	  bzip2 module for Python3
 
@@ -51,14 +51,14 @@ config BR2_PACKAGE_PYTHON3_CODECSCJK
 	  Chinese/Japanese/Korean codecs module for Python (large).
 
 config BR2_PACKAGE_PYTHON3_CURSES
-	select BR2_PACKAGE_NCURSES
 	bool "curses module"
+	select BR2_PACKAGE_NCURSES
 	help
 	  curses module for Python3.
 
 config BR2_PACKAGE_PYTHON3_DECIMAL
-	select BR2_PACKAGE_MPDECIMAL
 	bool "decimal module"
+	select BR2_PACKAGE_MPDECIMAL
 	help
 	  decimal module for Python3.
 
@@ -68,15 +68,15 @@ config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
 	  ossaudiodev module for Python3.
 
 config BR2_PACKAGE_PYTHON3_READLINE
-	select BR2_PACKAGE_READLINE
 	bool "readline"
+	select BR2_PACKAGE_READLINE
 	help
 	  readline module for Python3 (required for command-line
 	  editing in the Python shell).
 
 config BR2_PACKAGE_PYTHON3_SSL
-	select BR2_PACKAGE_OPENSSL
 	bool "ssl"
+	select BR2_PACKAGE_OPENSSL
 	help
 	  _ssl module for Python3 (required for https in urllib etc).
 
@@ -93,8 +93,8 @@ config BR2_PACKAGE_PYTHON3_SQLITE
 	  SQLite database support
 
 config BR2_PACKAGE_PYTHON3_PYEXPAT
-	select BR2_PACKAGE_EXPAT
 	bool "xml module"
+	select BR2_PACKAGE_EXPAT
 	help
 	  pyexpat and xml libraries for Python3.
 
