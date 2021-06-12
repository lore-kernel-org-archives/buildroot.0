From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 15:11:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/thrift: drop unrecognized option
Message-ID: <20210612131129.413827-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WITH_QT4 has been dropped since version 0.13.0 and
https://github.com/apache/thrift/commit/17355425429274e7971fff39d7e45279cdf550fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/thrift/thrift.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 0f2a8eb071..544eb97323 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -20,7 +20,6 @@ THRIFT_COMMON_CONF_OPTS = -DBUILD_TUTORIALS=OFF \
 	-DBUILD_TESTING=OFF \
 	-DWITH_PYTHON=OFF \
 	-DWITH_JAVA=OFF \
-	-DWITH_QT4=OFF \
 	-DWITH_QT5=OFF
 
 THRIFT_CONF_OPTS = $(THRIFT_COMMON_CONF_OPTS) -DBUILD_COMPILER=OFF
-- 
2.30.2
