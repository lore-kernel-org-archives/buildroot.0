From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 Jun 2018 20:16:24 +0200
Subject: [Buildroot] [PATCH 1/1] json-for-modern-cpp: bump to version 3.1.2
Message-ID: <20180618181624.12748-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index 04a520d7d7..4b9adf73ca 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	b20be343922f73504baf8a01543c2a42d16e01f18bb231b324a8959416ccf4f8	json-v3.1.0.tar.gz
+sha256	e8fffa6cbdb3c15ecdff32eebf958b6c686bc188da8ad5c6489462d16f83ae54	json-v3.1.2.tar.gz
 sha256	7b875bb7a4e28abb7956ea821b4b7d88ff6a2a4fabf261c3993730a365ec56dd	LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 406f8ad1f4..4bcfd46910 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = v3.1.0
+JSON_FOR_MODERN_CPP_VERSION = v3.1.2
 JSON_FOR_MODERN_CPP_SOURCE = json-${JSON_FOR_MODERN_CPP_VERSION}.tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
-- 
2.14.1
