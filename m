From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:18 -0300
Subject: [Buildroot] [PATCH 04/25] xmlstarlet: bump to version 1.3.0 and
	style fix
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
