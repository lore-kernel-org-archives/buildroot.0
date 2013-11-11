From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 22:00:07 +0100
Subject: [Buildroot] [PATCH 1/7] cmake: bump to version 2.8.12.1
In-Reply-To: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1384203613-17871-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/cmake/cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index fd1cdd2..cd98ed3 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMAKE_VERSION = 2.8.10.2
+CMAKE_VERSION = 2.8.12.1
 CMAKE_SITE = http://www.cmake.org/files/v2.8/
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
1.8.4.2
