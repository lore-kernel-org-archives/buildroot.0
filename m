From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Jan 2013 23:21:28 +0100
Subject: [Buildroot] [git commit] distcc: add license information
Message-ID: <20130129223111.EBD739A88E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2b45d31946ae9e1de7cd38dcfd35812604f4647
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/distcc/distcc.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index 1e09f57..006c0aa 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -3,11 +3,13 @@
 # distcc
 #
 #############################################################
+
 DISTCC_VERSION = 2.18.3
 DISTCC_SOURCE = distcc-$(DISTCC_VERSION).tar.bz2
 DISTCC_SITE = http://distcc.googlecode.com/files/
-
 DISTCC_CONF_OPT = --with-included-popt --without-gtk --without-gnome
+DISTCC_LICENSE = GPLv2+
+DISTCC_LICENSE_FILES = COPYING
 
 define DISTCC_INSTALL_TARGET_CMDS
 	install -D $(@D)/distccd $(TARGET_DIR)/usr/bin/distccd
