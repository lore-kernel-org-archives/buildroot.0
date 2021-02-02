From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Feb 2021 08:03:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcpprestsdk: bump to version
 2.0.18
Message-ID: <20210202070331.1276691-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/microsoft/cpprestsdk/releases/tag/2.10.18
https://github.com/microsoft/cpprestsdk/releases/tag/2.10.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcpprestsdk/libcpprestsdk.hash | 2 +-
 package/libcpprestsdk/libcpprestsdk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
index e76522f6ee..8e398d0c54 100644
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3d75e17c7d79131320438f2a15331f7ca6281c38c0e2daa27f051e290eeb8681  libcpprestsdk-2.10.16.tar.gz
+sha256  6bd74a637ff182144b6a4271227ea8b6b3ea92389f88b25b215e6f94fd4d41cb  libcpprestsdk-2.10.18.tar.gz
 sha256  5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97  license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index d8525cfe1b..68d4cf68c1 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCPPRESTSDK_VERSION = 2.10.16
-LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,v$(LIBCPPRESTSDK_VERSION))
+LIBCPPRESTSDK_VERSION = 2.10.18
+LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
-- 
2.29.2
