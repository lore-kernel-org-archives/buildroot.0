From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Nov 2020 22:12:30 +0100
Subject: [Buildroot] [PATCH v1 03/31] package/qt5base: format hash file
 according to two spaces guideline
In-Reply-To: <20201121211258.12068-1-ps.report@gmx.net>
References: <20201121211258.12068-1-ps.report@gmx.net>
Message-ID: <20201121211258.12068-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt5/qt5base/qt5base.hash | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 03336e63e6..a824890e3c 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -2,9 +2,9 @@
 sha256  909fad2591ee367993a75d7e2ea50ad4db332f05e1c38dd7a5a274e156a4e0f8  qtbase-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
-sha256 88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558 LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216 src/3rdparty/harfbuzz-ng/COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+sha256  88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558  LICENSE.LGPLv3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+sha256  2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/harfbuzz-ng/COPYING
-- 
2.29.2
