From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 11:52:42 +0200
Subject: [Buildroot] [git commit] trivial: remove odd references to
	'buildroot2'
Message-ID: <20130905134646.6D8108B6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cbdfb649f8d016ead6be1d03ba5d1bf81c63e26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the past there may have been a very good reason to refer to 'buildroot2', but
these days it's just odd.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                                           |    2 +-
 .../{README.buildroot2 => README.buildroot}        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 09faeba..0d7476a 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,4 @@
-# Makefile for buildroot2
+# Makefile for buildroot
 #
 # Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
 # Copyright (C) 2006-2013 by the Buildroot developers <buildroot@uclibc.org>
diff --git a/support/kconfig/README.buildroot2 b/support/kconfig/README.buildroot
similarity index 86%
rename from support/kconfig/README.buildroot2
rename to support/kconfig/README.buildroot
index 7de485c..d3d8613 100644
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
