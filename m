From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:14 -0000
Subject: [Buildroot] [git commit] json-for-modern-cpp: bump to v3.1.0
Message-ID: <20180305200711.EE9D8810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b3b757307a23f2d3a2eeea75c1411025c6cacac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index 7f394aaee7..b2abe49700 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	402464cd6d50c81bb6a683d07c537e5a8c4684fd1186826d3aa1385ce6adac13	json-v3.0.1.tar.gz
+sha256	b20be343922f73504baf8a01543c2a42d16e01f18bb231b324a8959416ccf4f8	json-v3.1.0.tar.gz
 sha256	6a6115fc4a7239a135f2dce8d33f94cb8a936b8f608ac0f6699fbac278b0dd5b	LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 6413d6255f..406f8ad1f4 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = v3.0.1
+JSON_FOR_MODERN_CPP_VERSION = v3.1.0
 JSON_FOR_MODERN_CPP_SOURCE = json-${JSON_FOR_MODERN_CPP_VERSION}.tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
