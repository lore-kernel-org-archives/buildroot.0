From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Wed,  5 Aug 2015 07:58:40 +0300
Subject: [Buildroot] [PATCH 1/1] rapidjson: Add comment for "_INSTALL_TARGET
	= NO"
Message-ID: <1438750720-26979-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

It is Buildroot convention to comment when "_INSTALL_TARGET = NO".

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/rapidjson/rapidjson.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 1ad9314..5da407b 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -8,6 +8,8 @@ RAPIDJSON_VERSION = v1.0.2
 RAPIDJSON_SITE = $(call github,miloyip,rapidjson,$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
+
+# rapidjson is a header-only C++ library
 RAPIDJSON_INSTALL_TARGET = NO
 RAPIDJSON_INSTALL_STAGING = YES
 
-- 
1.7.9.5
