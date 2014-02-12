From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Feb 2014 17:54:57 +0100
Subject: [Buildroot] [PATCH v2] trivial: update buildroot e-mail address to
 buildroot@buildroot.org
Message-ID: <dc1e2107ca0e341b43c4.1392224097@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the e-mail address buildroot at buildroot.org is now enabled, update the
e-mail addresses in the source tree from @uclibc.org and @busybox.net to our
own proper domain.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: keep original address in Makefile

 Makefile                                                 |  1 +
 docs/README                                              |  2 +-
 docs/copyright.txt                                       |  2 +-
 docs/footer.html                                         |  2 +-
 docs/manual/contribute.txt                               |  2 +-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |  2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -2,6 +2,7 @@
 #
 # Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
 # Copyright (C) 2006-2014 by the Buildroot developers <buildroot@uclibc.org>
+# Copyright (C) 2014 by the Buildroot developers <buildroot@buildroot.org>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
diff --git a/docs/README b/docs/README
--- a/docs/README
+++ b/docs/README
@@ -56,4 +56,4 @@ use menuconfig of certain packages. This
 $ make HOSTCC=gcc-4.3 busybox-menuconfig
 
 Please feed suggestions, bug reports, insults, and bribes back to the
-buildroot mailing list: buildroot at uclibc.org
+buildroot mailing list: buildroot at buildroot.org
diff --git a/docs/copyright.txt b/docs/copyright.txt
--- a/docs/copyright.txt
+++ b/docs/copyright.txt
@@ -25,6 +25,6 @@ HAS BEEN ADVISED OF THE POSSIBILITY OF S
 
 You have been warned.
 
-You can contact the webmaster at <buildroot@uclibc.org> if you have some sort
+You can contact the webmaster at <buildroot@buildroot.org> if you have some sort
 of problem with this.
 
diff --git a/docs/footer.html b/docs/footer.html
--- a/docs/footer.html
+++ b/docs/footer.html
@@ -14,7 +14,7 @@
 	<br>
 	Mail all comments, insults, suggestions and bribes to
 	<br>
-	The Buildroot developers <A HREF="mailto:buildroot@uclibc.org">buildroot at uclibc.org</A><BR>
+	The Buildroot developers <A HREF="mailto:buildroot@buildroot.org">buildroot at buildroot.org</A><BR>
     </font>
 
   </body>
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -48,7 +48,7 @@ before submitting them using your favori
 Lastly, send/submit your patch set to the Buildroot mailing list:
 
 ---------------------
-$ git send-email --to buildroot at busybox.net outgoing/*
+$ git send-email --to buildroot at buildroot.org outgoing/*
 ---------------------
 
 Note that +git+ should be configured to use your mail account.
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -57,7 +57,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-dmx \
-		--with-builder-addr=buildroot at uclibc.org \
+		--with-builder-addr=buildroot at buildroot.org \
 		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
 		--with-fontdir=/usr/share/fonts/X11/ --localstatedir=/var \
 		--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
