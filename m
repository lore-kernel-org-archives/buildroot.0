From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 08:46:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/links: add LINKS_CPE_ID_VENDOR
Message-ID: <20210111074659.1283018-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/links/links.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 815b4dd733..5213e02bd5 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -10,6 +10,7 @@ LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
 LINKS_LICENSE = GPL-2.0+
 LINKS_LICENSE_FILES = COPYING
+LINKS_CPE_ID_VENDOR = twibright
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPTS += --enable-graphics
-- 
2.29.2
