From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:17:45 +0100
Subject: [Buildroot] [git commit] package/libcpprestsdk: disable samples
Message-ID: <20190215212924.BA8538A6BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3105754bc38246976a86ffe5e046c439881c6519
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcpprestsdk/libcpprestsdk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index be9ca292c5..74c8eec46f 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -10,6 +10,6 @@ LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
 LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl zlib
-LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DCPPREST_EXCLUDE_WEBSOCKETS=ON
+LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DCPPREST_EXCLUDE_WEBSOCKETS=ON -DBUILD_SAMPLES=OFF
 
 $(eval $(cmake-package))
