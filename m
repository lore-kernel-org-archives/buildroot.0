From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:24:54 +0200
Subject: [Buildroot] [git commit] package/libhtp: bump to version 0.5.31
Message-ID: <20190928192252.D92C18F85E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c0c23f630e4c389ab1222e68736fc58e7b66cf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index be68547be2..cd21641f59 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	7384f8461ad0431e9247c49b37a73929b284f39408d1f11b80949b188069b638	libhtp-0.5.30.tar.gz
+sha256	ce16a3e57c7d1f1e8255a4f698e22ddd33c15fb4e737ab90b04c9a1f07e48780	libhtp-0.5.31.tar.gz
 sha256	87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15	LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 3f7cecb277..9a3cda6162 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.30
+LIBHTP_VERSION = 0.5.31
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
