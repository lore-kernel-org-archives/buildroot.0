From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:29 -0500
Subject: [Buildroot] [PATCH 08/25] package/json-for-modern-cpp: add
 _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-8-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:json-for-modern-cpp_project:json-for-modern-cpp:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:json-for-modern-cpp_project:json-for-modern-cpp

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 94cdc909f3..f07322a70f 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -13,5 +13,6 @@ JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES
 # header only library
 JSON_FOR_MODERN_CPP_INSTALL_TARGET = NO
 JSON_FOR_MODERN_CPP_CONF_OPTS = -DJSON_BuildTests=OFF -DJSON_MultipleHeaders=ON
+JSON_FOR_MODERN_CPP_CPE_ID_VENDOR = json-for-modern-cpp_project
 
 $(eval $(cmake-package))
-- 
2.17.1
