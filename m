From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Dec 2013 10:51:29 +0100
Subject: [Buildroot] [PATCH] python-id3: correct indentation of Config.in
	file
Message-ID: <d80cea9b8e4da82cdc4a.1387965089@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tab instead of four spaces.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/python-id3/Config.in |  14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-id3/Config.in b/package/python-id3/Config.in
--- a/package/python-id3/Config.in
+++ b/package/python-id3/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PYTHON_ID3
-    bool "python-id3"
-    depends on BR2_PACKAGE_PYTHON
-    help
-      This module allows one to read and manipulate so-called ID3
-      informational tags on MP3 files through an object-oriented
-      Python interface.
+	bool "python-id3"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  This module allows one to read and manipulate so-called ID3
+	  informational tags on MP3 files through an object-oriented
+	  Python interface.
 
-      http://id3-py.sourceforge.net/
+	  http://id3-py.sourceforge.net/
