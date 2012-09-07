From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Sep 2012 11:48:52 -0300
Subject: [Buildroot] [PATCH 05/10] gnutls: bump to 2.12.20
In-Reply-To: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347029337-12494-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 1ec10b9..18e33fc 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 2.12.19
+GNUTLS_VERSION = 2.12.20
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
+GNUTLS_LICENSE = GPLv3 LGPLv2.1
+GNUTLS_LICENSE_FILES = COPYING lib/COPYING
 GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt $(if $(BR2_PACKAGE_ZLIB),zlib)
 GNUTLS_CONF_OPT = --with-libgcrypt --without-libgcrypt-prefix \
 		--without-p11-kit
-- 
1.7.8.6
