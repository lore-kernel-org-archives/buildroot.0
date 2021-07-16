From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:32:14 +0200
Subject: [Buildroot] [git commit] package/libhtp: bump to version 0.5.38
Message-ID: <20210716205839.11BC991217@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=48c9adbe70846388bb20aa7a481cfb53fea9d0d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/OISF/libhtp/releases/tag/0.5.38

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index 805cd4f1f3..91c20697df 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0f8296ce9db815bbedc1c8a0b738dd25146fdaf910995a8c5f8e147799902b7e  libhtp-0.5.37.tar.gz
+sha256  8365f338fdf5ef0f3b37f3cb4e2670d218c843eccc42aa87119819c0f018ef39  libhtp-0.5.38.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 7520346031..982ffe81cb 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.37
+LIBHTP_VERSION = 0.5.38
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
