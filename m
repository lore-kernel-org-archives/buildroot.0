From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2014 20:39:15 +0100
Subject: [Buildroot] [git commit] trivial: update buildroot e-mail address
	to buildroot@buildroot.org
Message-ID: <20140212194407.93BBC9C9BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f78767bb84a5c536a7fc3129b9460acada7426e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the e-mail address buildroot at buildroot.org is now enabled, update the
e-mail addresses in the source tree from @uclibc.org and @busybox.net to our
own proper domain.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                                           |    1 +
 docs/README                                        |    2 +-
 docs/copyright.txt                                 |    2 +-
 docs/footer.html                                   |    2 +-
 docs/manual/contribute.txt                         |    2 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 9929e7e..8226111 100644
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
index 974adeb..944347d 100644
--- a/docs/README
+++ b/docs/README
@@ -56,4 +56,4 @@ $ make HOSTCC=gcc-4.3 uclibc-menuconfig
 $ make HOSTCC=gcc-4.3 busybox-menuconfig
 
 Please feed suggestions, bug reports, insults, and bribes back to the
-buildroot mailing list: buildroot at uclibc.org
+buildroot mailing list: buildroot at buildroot.org
diff --git a/docs/copyright.txt b/docs/copyright.txt
index 4617d8e..0939b74 100644
--- a/docs/copyright.txt
+++ b/docs/copyright.txt
@@ -25,6 +25,6 @@ HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
 
 You have been warned.
 
-You can contact the webmaster at <buildroot@uclibc.org> if you have some sort
+You can contact the webmaster at <buildroot@buildroot.org> if you have some sort
 of problem with this.
 
diff --git a/docs/footer.html b/docs/footer.html
index 9cc1e19..d3b239b 100644
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
index 201685c..5602335 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -48,7 +48,7 @@ before submitting them using your favorite text editor.
 Lastly, send/submit your patch set to the Buildroot mailing list:
 
 ---------------------
-$ git send-email --to buildroot at busybox.net outgoing/*
+$ git send-email --to buildroot at buildroot.org outgoing/*
 ---------------------
 
 Note that +git+ should be configured to use your mail account.
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 4089aab..7d13702 100644
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
