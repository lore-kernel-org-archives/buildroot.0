From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 19 Jul 2015 22:50:39 +0200
Subject: [Buildroot] [PATCH 1/2] monkey: remove the default value of the
	MONKEY_SOURCE variable
Message-ID: <1437339040-2999-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/monkey/monkey.mk   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 419750e..31e8846 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -6,7 +6,6 @@
 
 MONKEY_VERSION_MAJOR = 1.5
 MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
-MONKEY_SOURCE = monkey-$(MONKEY_VERSION).tar.gz
 MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)/
 MONKEY_LICENCE = Apache-2.0
 MONKEY_LICENCE_FILE = LICENSE
-- 
1.9.1
