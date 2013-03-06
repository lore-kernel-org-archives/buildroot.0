From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Mar 2013 18:14:24 +0100
Subject: [Buildroot] [PATCH 3/5] cmake: bump to 2.8.10.2
In-Reply-To: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1362590066-5448-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/cmake/cmake.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index cfe8ab4..8e3e751 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-CMAKE_VERSION = 2.8.9
+CMAKE_VERSION = 2.8.10.2
 CMAKE_SITE = http://www.cmake.org/files/v2.8/
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
1.7.10.4
