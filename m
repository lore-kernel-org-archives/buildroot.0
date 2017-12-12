From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 06:50:07 +0100
Subject: [Buildroot] [git commit] package/cmake: bump version to 3.10.0 and
 add license hash
Message-ID: <20171212055106.E025F82AE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65205c2425bccb7039ca0e2caffb7c64c26805f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mario Lang <mlang@blind.guru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.hash | 5 +++--
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index f138ac7..b095d72 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,3 @@
-# From http://www.cmake.org/files/v3.8/cmake-3.8.2-SHA-256.txt
-sha256 da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d  cmake-3.8.2.tar.gz
+# From http://www.cmake.org/files/v3.10/cmake-3.10.0-SHA-256.txt
+sha256 b3345c17609ea0f039960ef470aa099de9942135990930a57c14575aae884987  cmake-3.10.0.tar.gz
+sha256 ccf2c6d4468919c8c26a764b9ed8fde349f0d298335524568b346b9bdcf56e1f  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index a00691a..601bb43 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.8
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION_MAJOR = 3.10
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
