From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 16:58:27 +0200
Subject: [Buildroot] [PATCH 1/1] libenca: add hash for license file
Message-ID: <20180429145827.5646-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libenca/libenca.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libenca/libenca.hash b/package/libenca/libenca.hash
index 1a03c8fa46..6c874b16a5 100644
--- a/package/libenca/libenca.hash
+++ b/package/libenca/libenca.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 3a487eca40b41021e2e4b7a6440b97d822e6532db5464471f572ecf77295e8b8  enca-1.19.tar.xz
+sha256 87f1bd4a52b4029476b684fcdd51fed3c6b2540e462d3c2d3bfc9be4558b2825  COPYING
-- 
2.14.1
