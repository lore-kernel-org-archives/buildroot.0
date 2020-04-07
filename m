From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 Apr 2020 23:12:03 +0200
Subject: [Buildroot] [PATCH v1] package/ddrescue: bump version to 1.25
Message-ID: <20200407211203.11761-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2020-03/msg00002.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ddrescue/ddrescue.hash | 6 +++---
 package/ddrescue/ddrescue.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index ae370acbc9..6877b7008d 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2019-02/msg00012.html
-sha256 4b5d3feede70e3657ca6b3c7844f23131851cbb6af0cecc9721500f7d7021087 ddrescue-1.24.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2020-03/msg00002.html
+sha256  ce538ebd26a09f45da67d3ad3f7431932428231ceec7a2d255f716fa231a1063  ddrescue-1.25.tar.lz
 # Locally computed
-sha256 3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
+sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 4e03179133..f113681fa1 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.24
+DDRESCUE_VERSION = 1.25
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
-- 
2.26.0
