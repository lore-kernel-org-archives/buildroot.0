From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 Nov 2016 20:52:25 +0100
Subject: [Buildroot] [PATCH/next 1/2] package/libva: bump version to 1.7.3
Message-ID: <20161111195226.3359-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index c2e5ea4..e63f4db 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/libva/2016-September/004379.html
-sha1 a89680d34236fdc63adeec25cf431c005644b8c6  libva-1.7.2.tar.bz2
+# From https://lists.freedesktop.org/archives/libva/2016-November/004730.html
+sha1 18e46f3d5a0e971eb0ec9fe14bc021e69eb13fb8  libva-1.7.3.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index df1758e..cf42b70 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.7.2
+LIBVA_VERSION = 1.7.3
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
-- 
2.10.2
