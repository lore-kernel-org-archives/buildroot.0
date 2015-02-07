From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Feb 2015 18:34:43 +0000
Subject: [Buildroot] [PATCH] cmake: bump version to 3.1.2
Message-ID: <1423334083-60781-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 3.1.2
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/cmake/cmake.hash |    2 ++
 package/cmake/cmake.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 package/cmake/cmake.hash

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
new file mode 100644
index 0000000..1b6b658
--- /dev/null
+++ b/package/cmake/cmake.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2b210f7d867a1e716c1895357ebe63c7b9ae61fdb5f2d300ab2f01795f085b35  cmake-3.1.2.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e09fddf..f283a09 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.0
+CMAKE_VERSION_MAJOR = 3.1
 CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
-- 
1.7.1
