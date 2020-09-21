From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 21 Sep 2020 19:40:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.9.0
Message-ID: <20200921174009.347925-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/webmproject/libvpx/blob/master/CHANGELOG

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libvpx/libvpx.hash | 6 +++---
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index b75cd8d474..57ee7179ba 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 8735d9fcd1a781ae6917f28f239a8aa358ce4864ba113ea18af4bb2dc8b474ac  libvpx-1.8.2.tar.gz
-sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
-sha256 cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
+sha256  d279c10e4b9316bf11a570ba16c3d55791e1ad6faa4404c67422eb631782c80a  libvpx-1.9.0.tar.gz
+sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
+sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 689ad6f05f..c7245885d9 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.8.2
+LIBVPX_VERSION = 1.9.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
-- 
2.27.0
