From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 14:52:03 +0200
Subject: [Buildroot] [PATCH 1/1] libgsasl: add hash for license files
Message-ID: <20180430125203.13667-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgsasl/libgsasl.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
index 4205927168..82bfe339c6 100644
--- a/package/libgsasl/libgsasl.hash
+++ b/package/libgsasl/libgsasl.hash
@@ -1,2 +1,7 @@
 # Locally calculated after checking pgp signature
 sha256	3adfb49f9c92a719dea855fd1840d698cde55d4648d332a69032ba8bea207720	libgsasl-1.8.0.tar.gz
+
+# Hash for license files:
+sha256	4eb54155afd4684d7e9423f6037e5cc887ae4d8818e83d3af93350ebd4a8e6eb	README
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LIB
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
-- 
2.14.1
