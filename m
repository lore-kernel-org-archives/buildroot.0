From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Jul 2015 18:22:04 -0300
Subject: [Buildroot] [PATCH] qextserialport: change license file
Message-ID: <1438032124-14639-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's now LICENSE.md, fixes:
http://autobuild.buildroot.net/results/3e0/3e0f954df9196e89043f4aaad154dfdece08480a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/qextserialport/qextserialport.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 6f82b39..39e0407 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -7,7 +7,7 @@
 QEXTSERIALPORT_VERSION = ada321a9ee463f628e7b781b8ed00ff219152158
 QEXTSERIALPORT_SITE = $(call github,qextserialport,qextserialport,$(QEXTSERIALPORT_VERSION))
 QEXTSERIALPORT_LICENSE = MIT
-QEXTSERIALPORT_LICENSE_FILES = LICENSE
+QEXTSERIALPORT_LICENSE_FILES = LICENSE.md
 QEXTSERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT),y)
-- 
2.3.6
