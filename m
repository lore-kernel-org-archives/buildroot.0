From: Thiago A. Correa <thiago.correa@gmail.com>
Date: Mon, 29 Oct 2012 13:53:19 -0200
Subject: [Buildroot] [PATCH] cmake: bump version to 2.8.9 Signed-off-by:
 Thiago A. Correa <thiago.correa@gmail.com>
Message-ID: <20121029155319.GA15056@localhost.comm5.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/cmake/cmake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 2406e5c..e2bc31f 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -1,4 +1,4 @@
-CMAKE_VERSION = 2.8.5
+CMAKE_VERSION = 2.8.9
 CMAKE_SITE = http://www.cmake.org/files/v2.8/
 
 define HOST_CMAKE_CONFIGURE_CMDS
-- 
1.7.3.4
