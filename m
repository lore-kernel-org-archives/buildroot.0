From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 22:19:32 +0200
Subject: [Buildroot] [PATCH 1/1] libfuse: add hash for license files
Message-ID: <20180429201932.30382-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfuse/libfuse.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index 60bdf63990..f02c78418e 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256	832432d1ad4f833c20e13b57cf40ce5277a9d33e483205fc63c78111b3358874	fuse-2.9.7.tar.gz
+
+# Hash for license files:
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LIB
-- 
2.14.1
