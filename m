From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:17 -0000
Subject: [Buildroot] [git commit] cmake: bump version to 3.1.2
Message-ID: <20150302222715.D71CF8057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d09ad2620dac14bff88cba460d0487dcdfb0d3e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 3.1.2
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.hash |    2 ++
 package/cmake/cmake.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
