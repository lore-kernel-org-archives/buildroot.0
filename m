From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  1 Nov 2017 21:11:36 +0100
Subject: [Buildroot] [PATCH 3/4] package/opencv: add hashes for patch and
 license files
In-Reply-To: <20171101201137.29939-1-s.martin49@gmail.com>
References: <20171101201137.29939-1-s.martin49@gmail.com>
Message-ID: <20171101201137.29939-3-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/opencv.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
index 85a3e0b8f4..31bbaf6777 100644
--- a/package/opencv/opencv.hash
+++ b/package/opencv/opencv.hash
@@ -1,2 +1,6 @@
 # Locally calculated
 sha256 fb4769d0119c35426c3754b7fb079b407911e863958db53bdec83c7794582e41  opencv-2.4.13.3.tar.gz
+sha256 934825dcbd68ec46936d5b12f4734d07fffc864226a9122e46a23c55d0e5bb5c  0001-atomic.patch
+sha256 f211b79c126021de2f553e894bb5d0896be542289e8f55f5289eba45c86f5d6e  0002-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
+sha256 78622658634e0297588037e26e54ee37754f739e30336184921f42f4888cda7f  0003-Update-OpenCVCompilerOptions.cmake.patch
+sha256 46e42877dfc3ac65769292cb4dc1a04b204ad9e40859a390f4c035d6179fbcc4  LICENSE
-- 
2.15.0
