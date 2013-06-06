From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu,  6 Jun 2013 11:53:28 +0200
Subject: [Buildroot] [PATCH 5/7] Convert headers to lower case when relevant
In-Reply-To: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1370512410-8553-6-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/aircrack-ng/aircrack-ng.mk       | 2 +-
 package/boost/boost.mk                   | 2 +-
 package/cryptodev/cryptodev.mk           | 2 +-
 package/fluxbox/fluxbox.mk               | 2 +-
 package/imlib2/imlib2.mk                 | 2 +-
 package/iozone/iozone.mk                 | 2 +-
 package/jpeg/jpeg.mk                     | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 package/libeXosip2/libeXosip2.mk         | 2 +-
 package/mongrel2/mongrel2.mk             | 2 +-
 package/open2300/open2300.mk             | 2 +-
 package/openntpd/openntpd.mk             | 2 +-
 package/pciutils/pciutils.mk             | 2 +-
 package/pcre/pcre.mk                     | 2 +-
 package/pcsc-lite/pcsc-lite.mk           | 2 +-
 package/prboom/prboom.mk                 | 2 +-
 package/python-pygame/python-pygame.mk   | 2 +-
 package/qtuio/qtuio.mk                   | 2 +-
 package/quota/quota.mk                   | 2 +-
 package/sawman/sawman.mk                 | 2 +-
 package/setserial/setserial.mk           | 2 +-
 package/slirp/slirp.mk                   | 2 +-
 package/spice-protocol/spice-protocol.mk | 2 +-
 package/spice/spice.mk                   | 2 +-
 package/sqlcipher/sqlcipher.mk           | 2 +-
 package/tcl/tcl.mk                       | 2 +-
 package/x11vnc/x11vnc.mk                 | 2 +-
 package/xmlstarlet/xmlstarlet.mk         | 2 +-
 28 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index bac45d1..7543c6c 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Aircrack-ng
+# aircrack-ng
 #
 #############################################################
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index d11f378..b5b5869 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Boost
+# boost
 #
 #############################################################
 
diff --git a/package/cryptodev/cryptodev.mk b/package/cryptodev/cryptodev.mk
index b6f4a42..a367293 100644
--- a/package/cryptodev/cryptodev.mk
+++ b/package/cryptodev/cryptodev.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Virtual cryptodev package
+# virtual cryptodev package
 #
 #############################################################
 
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 52503af..a0728fa 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# FLUXBOX
+# fluxbox
 #
 #############################################################
 
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 6319508..e69503b 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# IMLIB2
+# imlib2
 #
 ##############################################################
 
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 71c6840..a07571b 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# IOZONE
+# iozone
 #
 #############################################################
 
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 962908d..207edc8 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Virtual jpeg package
+# virtual jpeg package
 #
 #############################################################
 
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 10db272..3216ddc 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Atomic_ops library
+# atomic_ops library
 #
 #############################################################
 
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 7fef1a6..c500da7 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# libeXosip2
+# libexosip2
 #
 #############################################################
 
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index c135437..06ec6cd 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Mongrel2
+# mongrel2
 #
 #############################################################
 
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 85e2451..5a129ec 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -1,6 +1,6 @@
 ############################################################
 #
-# Open2300
+# open2300
 #
 ############################################################
 
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index fab68b6..7419359 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# OpenNTPD
+# openntpd
 #
 #############################################################
 
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index c1ae094..d9265a3 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# PCIUTILS
+# pciutils
 #
 #############################################################
 
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 066da69..62f2210 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# PCRE
+# pcre
 #
 #############################################################
 
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index e1def7c..b3bd342 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -1,6 +1,6 @@
 ##########################################################
 #
-# PCSC-Lite
+# pcsc-lite
 #
 #########################################################
 
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 48fe018..027e982 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# PrBoom
+# prboom
 #
 #############################################################
 
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 06159cc..61af1af 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Pygame
+# pygame
 #
 #############################################################
 
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 8a9c7cb..38644dd 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# qTUIO
+# qtuio
 #
 #############################################################
 
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 9afc9e3..3087940 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# QUOTA
+# quota
 #
 #############################################################
 
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 4bf3052..e6439d5 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# SAWMAN
+# sawman
 #
 #############################################################
 
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index ed52245..215b5ee 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Setserial
+# setserial
 #
 #############################################################
 
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index b3f4bcd..5b608e0 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Spice-slirp
+# spice-slirp
 #
 #############################################################
 
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index dcfe50d..0404377 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Spice-protocol
+# spice-protocol
 #
 #############################################################
 
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 78ca202..291386a 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Spice
+# spice
 #
 #############################################################
 
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index f33528f..510d4af 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Sqlcipher extension of sqlite
+# sqlcipher extension of sqlite
 # http://sqlcipher.net
 #
 #############################################################
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index eb7c7f2..c4a1c3d 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# TCL8.4
+# tcl8.4
 #
 #############################################################
 
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index d1ddf48..635b670 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# X11VNC
+# x11vnc
 #
 #############################################################
 
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 5919619..2d22091 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# XMLstarlet
+# xmlstarlet
 #
 #############################################################
 
-- 
1.8.1.2
