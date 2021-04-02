From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  2 Apr 2021 19:12:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.10.0
Message-ID: <20210402171224.771383-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.10.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libvpx/libvpx.hash | 2 +-
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index 57ee7179ba..5b9568837c 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d279c10e4b9316bf11a570ba16c3d55791e1ad6faa4404c67422eb631782c80a  libvpx-1.9.0.tar.gz
+sha256  85803ccbdbdd7a3b03d930187cb055f1353596969c1f92ebec2db839fa4f834a  libvpx-1.10.0.tar.gz
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 26d211cf86..d5d202a5da 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.9.0
+LIBVPX_VERSION = 1.10.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
-- 
2.29.2
