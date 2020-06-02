From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:26:43 +0200
Subject: [Buildroot] [git commit] package/hwdata: bump version to 0.335
Message-ID: <20200602212835.16D9E7FD2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b06b7dde13a9e0b1c3cb5821284dc05bf227496a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hwdata/hwdata.hash | 6 +++---
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 80e61e212d..79f7b4ea32 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 d90de6eb0937ad4c667e5f0edcc4ab3d6d91d2d2dbc08f70b5b99be3800ed836  hwdata-0.326.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
+sha256  1fb83c015ae9da1ee2a176041ca3e949ac2b71f23356a43c9c958b551ea57662  hwdata-0.335.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index f32a0ef939..b6a79a44b7 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.326
+HWDATA_VERSION = 0.335
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
