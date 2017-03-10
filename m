From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Mar 2017 10:54:44 +0200
Subject: [Buildroot] [PATCH 2/2] libnl: bump to version 3.2.29
In-Reply-To: <e21edac8997da04d86a420d580120f5311734191.1489136084.git.baruch@tkos.co.il>
References: <e21edac8997da04d86a420d580120f5311734191.1489136084.git.baruch@tkos.co.il>
Message-ID: <4ebba581b256855a7e36993f044ef2b6a6cdfd72.1489136084.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnl/libnl.hash | 4 ++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 2f1a3cb1b322..9761a9580cc9 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,2 +1,2 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_2_27/libnl-3.2.27.tar.gz.sha256sum
-sha256	4bbbf92b3c78a90f423cf96260bf419a28b75db8cced47051217a56795f58ec6	libnl-3.2.27.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_2_29/libnl-3.2.29.tar.gz.sha256sum
+sha256	0beb593dc6abfffa18a5c787b27884979c1b7e7f1fd468c801e3cc938a685922	libnl-3.2.29.tar.gz
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 85c0db86f6cd..d168885560d9 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.2.27
+LIBNL_VERSION = 3.2.29
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
2.11.0
