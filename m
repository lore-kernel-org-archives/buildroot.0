From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 21:15:40 +0200
Subject: [Buildroot] [PATCH 1/1] libfreeglut: add hash for license file
Message-ID: <20180429191540.27468-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfreeglut/libfreeglut.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libfreeglut/libfreeglut.hash b/package/libfreeglut/libfreeglut.hash
index a69a0b41d1..cc7a286616 100644
--- a/package/libfreeglut/libfreeglut.hash
+++ b/package/libfreeglut/libfreeglut.hash
@@ -1,2 +1,5 @@
 # From http://sourceforge.net/projects/freeglut/files/freeglut/3.0.0/
 sha1	fca52242f9344627a30f11487ee42002e6b0dacd	freeglut-3.0.0.tar.gz
+
+# Hash for license file:
+sha256	b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275	COPYING
-- 
2.14.1
