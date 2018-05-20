From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 12:30:25 +0200
Subject: [Buildroot] [git commit] libogg: add hash for license file
Message-ID: <20180520102928.CFA178123A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6c9b95ccd422f146047f3eb4d2c201009bbdb3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
