From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:29:34 +0100
Subject: [Buildroot] [git commit] python-id3: correct indentation of
	Config.in file
Message-ID: <20131225113133.BF8779C1C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=545f3a3b3259a74dc3b618790cd06886dfdeb432
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tab instead of four spaces.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-id3/Config.in |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-id3/Config.in b/package/python-id3/Config.in
index 829a657..6ddfd54 100644
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
