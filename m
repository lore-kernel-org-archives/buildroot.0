From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed,  7 Aug 2019 12:14:07 -0400
Subject: [Buildroot] [PATCH 1/1] package/libcpprestsdk: bump to version
 2.10.14
Message-ID: <20190807161407.53236-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libcpprestsdk/libcpprestsdk.hash | 2 +-
 package/libcpprestsdk/libcpprestsdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
index b7a9de10e8..e226a581be 100644
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c7c2a5deb4cad036b974e9b7f2ba2e3ae829312894ddfca2fae3a11980fef63e	libcpprestsdk-2.10.12.tar.gz
+sha256 f2628b248f714d7bbd6a536553bc3782602c68ca1b129017985dd70cc3515278	libcpprestsdk-2.10.14.tar.gz
 sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 877f7c4e73..81a8bf71f4 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCPPRESTSDK_VERSION = 2.10.12
+LIBCPPRESTSDK_VERSION = 2.10.14
 LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,v$(LIBCPPRESTSDK_VERSION))
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
-- 
2.21.0
