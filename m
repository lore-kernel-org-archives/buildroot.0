From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu,  9 Jan 2020 10:16:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/json-for-modern-cpp: bump to
 version 3.7.3
In-Reply-To: <20200109081650.28912-1-asafka7@gmail.com>
References: <20200109081650.28912-1-asafka7@gmail.com>
Message-ID: <20200109081650.28912-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index 039edc8e92..c67cd37558 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	d51a3a8d3efbb1139d7608e28782ea9efea7e7933157e8ff8184901efd8ee760	json-3.7.0.tar.gz
+sha256	249548f4867417d66ae46b338dfe0a2805f3323e81c9e9b83c89f3adbfde6f31	json-3.7.3.tar.gz
 sha256	7400586ce89c6a2cc65f6ca46997da5d356a230673d3a211e040b783f23578a1	LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 04a8d4eb3c..e6f1df96f6 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = 3.7.0
+JSON_FOR_MODERN_CPP_VERSION = 3.7.3
 JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
-- 
2.20.1
