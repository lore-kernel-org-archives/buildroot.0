From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 20 Apr 2019 12:22:21 -0400
Subject: [Buildroot] [PATCH 1/1] package/libcpprestsdk: bump to version
 v2.10.12
Message-ID: <20190420162221.12043-1-aduskett@gmail.com>
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
index 331db664b3..bf8dd7c590 100644
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 55e1521fb7b7c9b2f4f2065c5fb47e249227f15299257ee6f1a0c942a4057f4f	libcpprestsdk-v2.10.10.tar.gz
+sha256 c7c2a5deb4cad036b974e9b7f2ba2e3ae829312894ddfca2fae3a11980fef63e	libcpprestsdk-v2.10.12.tar.gz
 sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index fd1201f287..cd48ca7bed 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCPPRESTSDK_VERSION = v2.10.10
+LIBCPPRESTSDK_VERSION = v2.10.12
 LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
-- 
2.20.1
