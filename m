From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Date: Wed, 18 Nov 2020 18:50:40 +0100
Subject: [Buildroot] [PATCH] package/json-for-modern-cpp: bump to version
 3.9.0
Message-ID: <20201118175040.dn5umfkagovvuac5@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index 4d540f2404..eb9270b311 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7d0edf65f2ac7390af5e5a0b323b31202a6c11d744a74b588dc30f5a8c9865ba  json-3.8.0.tar.gz
+sha256  9943db11eeaa5b23e58a88fbc26c453faccef7b546e55063ad00e7caaaf76d0b  json-3.9.0.tar.gz
 sha256  50be9457e5c9faaba5e60d9c73f8eabe9e0737a2d9c3e58357d856661862c18e  LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index afc900b7dd..6e21723fd4 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = 3.8.0
+JSON_FOR_MODERN_CPP_VERSION = 3.9.0
 JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
-- 
2.25.1
