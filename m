From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  1 Mar 2014 16:52:36 +0100
Subject: [Buildroot] [PATCH] php: fix typo
Message-ID: <1393689156-2590-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index f01e131..c5da9e7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -126,7 +126,7 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
 	# The intl module is implemented in C++, but PHP fails to use
 	# g++ as the compiler for the final link. As a workaround,
 	# tell it to link libstdc++.
-	PHP_EXTRA_LIBS + = -lstdc++
+	PHP_EXTRA_LIBS += -lstdc++
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
-- 
1.9.0
