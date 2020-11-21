From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Nov 2020 22:12:41 +0100
Subject: [Buildroot] [PATCH v1 14/31] package/qt5script: format hash file
 according to two spaces guideline
In-Reply-To: <20201121211258.12068-1-ps.report@gmx.net>
References: <20201121211258.12068-1-ps.report@gmx.net>
Message-ID: <20201121211258.12068-14-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt5/qt5script/qt5script.hash | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 52258facde..783598047b 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -2,9 +2,9 @@
 sha256  a299715369afbd1caa4d7fa2875d442eab91adcaacafce54a36922442624673e  qtscript-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 5094ecb9c9dcd0eadc34f3c11511d9b5535063032bc150164ecd1a5d5a445547 src/3rdparty/javascriptcore/JavaScriptCore/COPYING.LIB
-sha256 43b007cd3ac7b7ea5284b13e9580334028e6f42e859059605d57558f39374197 src/3rdparty/javascriptcore/JavaScriptCore/pcre/COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+sha256  5094ecb9c9dcd0eadc34f3c11511d9b5535063032bc150164ecd1a5d5a445547  src/3rdparty/javascriptcore/JavaScriptCore/COPYING.LIB
+sha256  43b007cd3ac7b7ea5284b13e9580334028e6f42e859059605d57558f39374197  src/3rdparty/javascriptcore/JavaScriptCore/pcre/COPYING
-- 
2.29.2
