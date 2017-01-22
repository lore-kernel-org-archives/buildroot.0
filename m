From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 Jan 2017 15:50:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <20170122145046.13964-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index ca10dc38bf..d34dbf1f4e 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 71dd3d8efa32d592342ff6955cc2cd317f07e74d2d546977eb9bc45136dd5de6  tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657.tar.gz
+sha256 ac3c088654864781f2b2a2797e3a8b03a1b2e86db731c08cb5f296a04069560d  tvheadend-e5f5a4278949afc96e26d6cd50cf968e0e92d7b6.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index a3afec8c03..42c6767f60 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
+TVHEADEND_VERSION = e5f5a4278949afc96e26d6cd50cf968e0e92d7b6
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.11.0
