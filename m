From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  7 Mar 2014 22:57:05 +0100
Subject: [Buildroot] [PATCH 1/1] cmake: bump to version 2.8.12.2
Message-ID: <1394229426-27093-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/cmake/cmake.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 9913a82..d45c642 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 2.8
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).12.1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).12.2
 CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)/
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
1.7.9.5
