From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:25 -0500
Subject: [Buildroot] [PATCH 04/25] package/cmake: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-4-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:cmake_project:cmake:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:cmake_project:cmake

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/cmake/cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1f30736023..a3015fabfd 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -9,6 +9,7 @@ CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).5
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
+CMAKE_CPE_ID_VENDOR = cmake_project
 
 # CMake is a particular package:
 # * CMake can be built using the generic infrastructure or the cmake one.
-- 
2.17.1
