From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Jul 2020 07:18:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/libva: bump version to 2.8.0
Message-ID: <20200701051851.26560-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://github.com/intel/libva/blob/v2.8-branch/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 6251876036..083c949147 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.7.1/libva-2.7.1.tar.bz2.sha1sum
-sha1  75010bde98182c707e20910253b735cea43e068d  libva-2.7.1.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.8.0/libva-2.8.0.tar.bz2.sha1sum
+sha1  9fb5df0e511c4aa918f9e8cd2be072cb3bb5040c  libva-2.8.0.tar.bz2
 # Locally computed
-sha256  a00ff19d9f969259b9784172adad7788dbf3de827d985c5d27c230efd5d98a04  libva-2.7.1.tar.bz2
+sha256  adbb1244d278908f89ccfcf254a442de6d71934565a492cb6f03caf2ed4d1ec3  libva-2.8.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index b0c0b9b3cc..c4778e9d73 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.7.1
+LIBVA_VERSION = 2.8.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
-- 
2.26.2
