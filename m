From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:33:04 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] webkitgtk: Add license
 hashes
Message-ID: <20171227223843.B6B618376E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2d03f1172f3f99cca3cd0c27f1967fdd6fa65d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e7f82694cfe98f659ff08b5834e32f8996ca55c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 669bb1c..9e207c5 100644
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
