From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Feb 2021 19:43:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libabseil-cpp: bump version to
 20200923.3
Message-ID: <20210206184345.2944471-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://github.com/abseil/abseil-cpp/releases/tag/20200923.3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index 63c4b86d3e..b176043566 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf3f13b13a0095d926b25640e060f7e13881bd8a792705dd9e161f3c2b9aa976  libabseil-cpp-20200923.2.tar.gz
+sha256  ebe2ad1480d27383e4bf4211e2ca2ef312d5e6a09eba869fd2e8a5c5d553ded2  libabseil-cpp-20200923.3.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 9cff8f0ff4..d614a5e5fc 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20200923.2
+LIBABSEIL_CPP_VERSION = 20200923.3
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
-- 
2.29.2
