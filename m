From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  8 Jul 2018 02:16:58 -0300
Subject: [Buildroot] [PATCH 2/5] json-for-modern-cpp: use $() to reference
 make variables instead of ${}
In-Reply-To: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
References: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
Message-ID: <20180708051701.3153-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 4bcfd46910..e547c07875 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSON_FOR_MODERN_CPP_VERSION = v3.1.2
-JSON_FOR_MODERN_CPP_SOURCE = json-${JSON_FOR_MODERN_CPP_VERSION}.tar.gz
+JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
 JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
-- 
2.17.1
