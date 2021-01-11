From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 08:04:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/cereal: add CEREAL_CPE_ID_VENDOR
Message-ID: <20210111070449.1281936-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cereal/cereal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cereal/cereal.mk b/package/cereal/cereal.mk
index 3811fdf32f..c9ce9976bf 100644
--- a/package/cereal/cereal.mk
+++ b/package/cereal/cereal.mk
@@ -9,6 +9,7 @@ CEREAL_SITE = $(call github,USCiLab,cereal,v$(CEREAL_VERSION))
 # For licensing, see also: https://github.com/USCiLab/cereal/issues/609
 CEREAL_LICENSE = BSD-3-Clause (cereal), Zlib (base64.hpp), MIT (rapidjson), BSL-1.0 or MIT (rapidxml)
 CEREAL_LICENSE_FILES = LICENSE include/cereal/external/base64.hpp include/cereal/external/rapidjson/rapidjson.h include/cereal/external/rapidxml/license.txt
+CEREAL_CPE_ID_VENDOR = usc
 CEREAL_INSTALL_STAGING = YES
 CEREAL_INSTALL_TARGET = NO
 CEREAL_CONF_OPTS = \
-- 
2.29.2
