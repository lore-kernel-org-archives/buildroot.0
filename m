From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 21 Jan 2021 14:36:42 +0100
Subject: [Buildroot] [PATCH 09/15] package/cjson: set CJSON_CPE_ID_VALID
In-Reply-To: <20210121133639.7332-1-heiko.thiery@gmail.com>
References: <20210121133639.7332-1-heiko.thiery@gmail.com>
Message-ID: <20210121133639.7332-9-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:cjson_project:cjson is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cjson

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/cjson/cjson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 31fef74d9b..4bfab3b646 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -9,6 +9,7 @@ CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
+CJSON_CPE_ID_VALID = YES
 # Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF in particular to disable
 # -fstack-protector-strong which depends on BR2_TOOLCHAIN_HAS_SSP
 CJSON_CONF_OPTS += \
-- 
2.30.0
