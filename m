From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 13 Dec 2017 00:13:24 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Add license hashes
Message-ID: <20171212221324.8265-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 669bb1cc62..9e207c541b 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -2,3 +2,7 @@
 md5 264a22d7467deae606e42b6eb5dd65af webkitgtk-2.18.3.tar.xz
 sha1 164cad34281ef597a3d4ad214e8037c3ddef4d17 webkitgtk-2.18.3.tar.xz
 sha256 e15420e1616a6f70f321541d467af5ca285bff66b1e0fa68a01df3ccf1b18f9e webkitgtk-2.18.3.tar.xz
+
+# Hashes for license files:
+sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
+sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce Source/WebCore/LICENSE-LGPL-2.1
-- 
2.15.1
