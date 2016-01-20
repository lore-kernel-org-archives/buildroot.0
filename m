From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 15:45:58 +0100
Subject: [Buildroot] [git commit] cmake: bump to version 3.4.2
Message-ID: <20160120145035.6AF6E8280E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cfc9b54e7b20bf63808d03ec97018df514fbf49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index be0b464..b0bcf17 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.4/cmake-3.4.1-SHA-256.txt
-sha256	d41462bdd80dc37f0d5608167b354bb3af8c068eee640be04c907154c5c113e2	cmake-3.4.1.tar.gz
+# From http://www.cmake.org/files/v3.4/cmake-3.4.2-SHA-256.txt
+sha256	da7cc34e1ce1d82e67a32ab081c02c2845534cd8bf2e09d88077a1b282e97392	cmake-3.4.2.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 8c3da1e..341ab27 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.4
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
