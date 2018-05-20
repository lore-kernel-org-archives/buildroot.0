From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 12:21:11 +0200
Subject: [Buildroot] [PATCH 1/1] libogg: add hash for license file
Message-ID: <20180520102111.25327-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libogg/libogg.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libogg/libogg.hash b/package/libogg/libogg.hash
index 0c65b8e1a9..d6962a55ed 100644
--- a/package/libogg/libogg.hash
+++ b/package/libogg/libogg.hash
@@ -1,2 +1,5 @@
 # From: http://www.xiph.org/downloads/
 sha256 4f3fc6178a533d392064f14776b23c397ed4b9f48f5de297aba73b643f955c08 libogg-1.3.3.tar.xz
+
+# Hash for license file:
+sha256 d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814 COPYING
-- 
2.14.1
