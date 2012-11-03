From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 18:35:58 +0100
Subject: [Buildroot] [git commit] cmake: bump version to 2.8.9
Message-ID: <20121103182338.8DB6599A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc77d6437d9a25de746596e127e230fac8f99286
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
