From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Feb 2011 08:45:16 +0100
Subject: [Buildroot] [PATCH 1/2] cmake: bump to 2.8.3
In-Reply-To: <cover.1297151107.git.thomas.petazzoni@free-electrons.com>
References: <cover.1297151107.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9bb7e274076f2c80eb24386e276a7fd71075eaac.1297151107.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
