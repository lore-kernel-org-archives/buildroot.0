From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:22:29 +0200
Subject: [Buildroot] [git commit] package/cmake: add _CPE_ID_VENDOR
Message-ID: <20210420205902.E014D84378@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12bd42734015226701d001f2575edc8b843ea35f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cmake_project:cmake:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:cmake_project:cmake

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
