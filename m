From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 13:50:02 +0200
Subject: [Buildroot] [PATCH 1/1] libglfw: add hash for license file
Message-ID: <20180430115002.22843-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglfw/libglfw.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index c0ad2af1c0..39d6c26139 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 e10f0de1384d75e6fc210c53e91843f6110d6c4f3afbfb588130713c2f9d8fe8  libglfw-3.2.1.tar.gz
+sha256 8d85c2fc8de8f3b8c0906e317a2d6423268ef4291a3682d94ac910f65389a441  COPYING.txt
-- 
2.14.1
