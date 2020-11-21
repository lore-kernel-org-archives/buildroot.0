From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Nov 2020 22:12:42 +0100
Subject: [Buildroot] [PATCH v1 15/31] package/qt5scxml: format hash file
 according to two spaces guideline
In-Reply-To: <20201121211258.12068-1-ps.report@gmx.net>
References: <20201121211258.12068-1-ps.report@gmx.net>
Message-ID: <20201121211258.12068-15-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt5/qt5scxml/qt5scxml.hash | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index ffc9fc3f9f..6f816548e6 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -2,7 +2,6 @@
 sha256  60b9590b9a41c60cee7b8a8c8410ee4625f0389c1ff8d79883ec5a985638a7dc  qtscxml-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
-
-sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
-- 
2.29.2
