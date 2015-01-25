From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 25 Jan 2015 22:13:54 +0100
Subject: [Buildroot] [PATCH 7/8] package/cmake: bump to version 3.1.1
In-Reply-To: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1422220435-18689-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add *.hash.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/cmake/cmake.hash | 2 ++
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/cmake/cmake.hash

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
new file mode 100644
index 0000000..e13b6e9
--- /dev/null
+++ b/package/cmake/cmake.hash
@@ -0,0 +1,2 @@
+# Locally computed
+# sha256  b58694e545d51cde5756a894f53107e3d9e469360e1d92e7f6892b55ebc0bebf  cmake-3.1.1.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e09fddf..14d5a4e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.0
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION_MAJOR = 3.1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.2.2
