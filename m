From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 22:34:27 +0200
Subject: [Buildroot] [PATCH 1/1] libiconv: add hash for license files
Message-ID: <20180430203427.15808-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiconv/libiconv.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libiconv/libiconv.hash b/package/libiconv/libiconv.hash
index 440daee51e..93ad555e15 100644
--- a/package/libiconv/libiconv.hash
+++ b/package/libiconv/libiconv.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256	ccf536620a45458d26ba83887a983b96827001e92a13847b45e4925cc8913178	libiconv-1.15.tar.gz
+
+# Hash for license files:
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256	56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d	COPYING.LIB
-- 
2.14.1
