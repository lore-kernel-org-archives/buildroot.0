From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Feb 2011 15:44:22 +0100
Subject: [Buildroot] [git commit master 1/1] cmake: bump to 2.8.3
Message-ID: <20110208144444.7AA8D8F3B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=33eac4b511cd5f24b6bb393d32260aaec1651e1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cmake/cmake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index b388874..efff5a5 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -1,4 +1,4 @@
-CMAKE_VERSION=2.8.0
+CMAKE_VERSION=2.8.3
 CMAKE_SOURCE=cmake-$(CMAKE_VERSION).tar.gz
 CMAKE_SITE=http://www.cmake.org/files/v2.8/
 
-- 
1.7.3.4
