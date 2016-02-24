From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Wed, 24 Feb 2016 18:04:04 +0100
Subject: [Buildroot] [PATCH] eudev: Fix configure options for
	BR2_PACKAGE_EUDEV_RULES_DEV.
Message-ID: <20160224170404.GA22979@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/eudev/eudev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index fecd37c..942770c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -30,7 +30,7 @@ EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
 endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
-EUDEV_CONF_OPTS += --enable-rule_generator
+EUDEV_CONF_OPTS += --enable-rule-generator
 endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
-- 
2.5.0
