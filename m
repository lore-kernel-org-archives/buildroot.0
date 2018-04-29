From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 21:12:35 +0200
Subject: [Buildroot] [PATCH 1/1] libfreefare: add hash for license file
Message-ID: <20180429191235.26482-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfreefare/libfreefare.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libfreefare/libfreefare.hash b/package/libfreefare/libfreefare.hash
index 4d231368b4..ed982c9dd7 100644
--- a/package/libfreefare/libfreefare.hash
+++ b/package/libfreefare/libfreefare.hash
@@ -1,2 +1,5 @@
 # From https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-0.4.0/libfreefare-0.4.0.tar.bz2
 sha256 bfa31d14a99a1247f5ed49195d6373de512e3eb75bf1627658b40cf7f876bc64  libfreefare-0.4.0.tar.bz2
+
+# Hash for license file:
+sha256 be6209dfd763a0ba77fbe990cfd2512804441d8b5f0cad927baa3341b50fcade  COPYING
-- 
2.14.1
