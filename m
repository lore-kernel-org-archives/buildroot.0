From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Jun 2013 23:16:46 +0200
Subject: [Buildroot] [git commit] intltool: bump version
Message-ID: <20130602212119.A62369A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e87a062e19d65d52af7f5b547e0068f09d7d33b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/intltool/intltool.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 1a32a79..0bed315 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-INTLTOOL_VERSION = 0.40.6
-INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.bz2
-INTLTOOL_SITE = http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
+INTLTOOL_VERSION = 0.50.2
+INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.gz
+INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+download/
+INTLTOOL_LICENSE = GPLv2+
+INTLTOOL_LICENSE_FILES = COPYING
 
 HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
 HOST_INTLTOOL_CONF_OPT = \
