From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:40:55 +0200
Subject: [Buildroot] [git commit branch/next] liblog4c-localtime: remove
	whitespace at beginning of lines
Message-ID: <20130511204539.E0BE19A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5058411423de4e250253809549e54151fdb6667
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liblog4c-localtime/liblog4c-localtime.mk |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index 3b1642c..492c6ef 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -1,13 +1,13 @@
- #############################################################
- #
- # liblog4c
- #
- #############################################################
- LIBLOG4C_LOCALTIME_VERSION = 1.0
- LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION)
- LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
- LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
- LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
+#############################################################
+#
+# liblog4c
+#
+#############################################################
+LIBLOG4C_LOCALTIME_VERSION = 1.0
+LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION)
+LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
+LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
+LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
 
 define LIBLOG4C_LOCALTIME_FIX_CONFIGURE_PERMS
 	chmod +x $(@D)/configure
