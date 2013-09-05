From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 05 Sep 2013 09:12:15 +0200
Subject: [Buildroot] [PATCH] trivial: remove odd references to 'buildroot2'
Message-ID: <ed18f0f200351fcbb737.1378365135@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the past there may have been a very good reason to refer to 'buildroot2', but
these days it's just odd.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,4 @@
-# Makefile for buildroot2
+# Makefile for buildroot
 #
 # Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
 # Copyright (C) 2006-2013 by the Buildroot developers <buildroot@uclibc.org>
diff --git a/support/kconfig/README.buildroot2 b/support/kconfig/README.buildroot
rename from support/kconfig/README.buildroot2
rename to support/kconfig/README.buildroot
--- a/support/kconfig/README.buildroot2
+++ b/support/kconfig/README.buildroot
@@ -4,7 +4,7 @@ to suit Buildroot.
 To update:
 	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
 	cd support/config.new
-	cp -a ../kconfig/patches ../kconfig/README.buildroot2 .
+	cp -a ../kconfig/patches ../kconfig/README.buildroot .
 	quilt push -a
 	# Fix any conflict
 	cd ..
