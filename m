From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 19 Jul 2015 22:50:40 +0200
Subject: [Buildroot] [PATCH 2/2] monkey: fix license typos
In-Reply-To: <1437339040-2999-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1437339040-2999-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1437339040-2999-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/monkey/monkey.mk                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 419750e..2f53426 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -8,8 +8,8 @@ MONKEY_VERSION_MAJOR = 1.5
 MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
 MONKEY_SOURCE = monkey-$(MONKEY_VERSION).tar.gz
 MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)/
-MONKEY_LICENCE = Apache-2.0
-MONKEY_LICENCE_FILE = LICENSE
+MONKEY_LICENSE = Apache-2.0
+MONKEY_LICENSE_FILES = LICENSE
 
 # This package has a configure script, but it's not using
 # autoconf/automake, so we're using the generic-package
-- 
1.9.1
