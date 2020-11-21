From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Nov 2020 22:12:29 +0100
Subject: [Buildroot] [PATCH v1 02/31] package/qt53d: format hash file
 according to two spaces guideline
In-Reply-To: <20201121211258.12068-1-ps.report@gmx.net>
References: <20201121211258.12068-1-ps.report@gmx.net>
Message-ID: <20201121211258.12068-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt53d/qt53d.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index c726daec61..43b2132cc7 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -2,6 +2,6 @@
 sha256  03ed6a48c813c75296c19f5d721184ab168280b69d2656cf16f877d3d4c55c1d  qt3d-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 9ae1959e86bd49b9680f78e0b49d4e52ae88a3f234d497e175e42a7e8ed59216 LICENSE.LGPLv3
+sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
+sha256  245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+sha256  9ae1959e86bd49b9680f78e0b49d4e52ae88a3f234d497e175e42a7e8ed59216  LICENSE.LGPLv3
-- 
2.29.2
