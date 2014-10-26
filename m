From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:17 +0100
Subject: [Buildroot] [PATCH 11/51] jsmin: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-11-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/jsmin/jsmin.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 957b686..a66ba71 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSMIN_VERSION = a9b47554d5684a55301a2eb7ca8480b7ee7630d4
+JSMIN_VERSION = 1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b
 JSMIN_SITE = $(call github,douglascrockford,JSMin,$(JSMIN_VERSION))
 JSMIN_LICENSE = MIT
 JSMIN_LICENSE_FILES = jsmin.c
-- 
2.1.1
