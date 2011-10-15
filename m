From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:03:38 +0200
Subject: [Buildroot] [git commit] xmlstarlet: bump to version 1.3.0 and
	style fix
Message-ID: <20111015213655.0E3668D9EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c57141228fbc7ae6642f4f6d3309da15466cbe8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xmlstarlet/xmlstarlet.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index bb42f5d..24637ec 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -4,11 +4,8 @@
 #
 #############################################################
 
-XMLSTARLET_VERSION:=1.0.4
-XMLSTARLET_SOURCE:=xmlstarlet-$(XMLSTARLET_VERSION).tar.gz
-XMLSTARLET_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
-XMLSTARLET_INSTALL_STAGING:=NO
-XMLSTARLET_INSTALL_TARGET:=YES
+XMLSTARLET_VERSION = 1.3.0
+XMLSTARLET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
 
 XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
