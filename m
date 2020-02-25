From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Feb 2020 23:26:18 +0100
Subject: [Buildroot] [git commit] package/libcpprestsdk: bump to version
 2.10.15
Message-ID: <20200309140905.0266681298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=151484ec47da884fe2665a5037949dc8d6834f40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcpprestsdk/libcpprestsdk.hash | 4 ++--
 package/libcpprestsdk/libcpprestsdk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
index e226a581be..1f79a4ad95 100644
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f2628b248f714d7bbd6a536553bc3782602c68ca1b129017985dd70cc3515278	libcpprestsdk-2.10.14.tar.gz
-sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt
+sha256  1c027a53457e87b0b3a475e5c8045b94400c475898c8bd51b0fbd218b99a7f7b  libcpprestsdk-2.10.15.tar.gz
+sha256  5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97  license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 8b9c7d4da7..8404b5096c 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCPPRESTSDK_VERSION = 2.10.14
+LIBCPPRESTSDK_VERSION = 2.10.15
 LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,v$(LIBCPPRESTSDK_VERSION))
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
