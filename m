From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 09:32:37 +0200
Subject: [Buildroot] [git commit] intltool: style/white space cleanup
Message-ID: <20111025074136.443AE8F144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9dd51dce953818f050d55a6cf6e53ad2806df5f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/intltool/intltool.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 1ee0497..6d13cc1 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -3,9 +3,10 @@
 # intltool
 #
 #############################################################
-INTLTOOL_VERSION:=0.40.6
-INTLTOOL_SOURCE:=intltool-$(INTLTOOL_VERSION).tar.bz2
-INTLTOOL_SITE:=http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
+
+INTLTOOL_VERSION = 0.40.6
+INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.bz2
+INTLTOOL_SITE = http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
 
 HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
 HOST_INTLTOOL_CONF_OPT = \
