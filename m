From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 15:11:57 +0100
Subject: [Buildroot] [PATCH 1/1] webp: add mandatory host-pkgconf dependency
Message-ID: <20171202141157.12840-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/webp/webp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index e86e798d9..cb2ec5b15 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -9,6 +9,7 @@ WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
 WEBP_LICENSE_FILES = COPYING
+WEBP_DEPENDENCIES = host-pkgconf
 WEBP_INSTALL_STAGING = YES
 
 WEBP_CONF_OPTS += \
-- 
2.14.1
