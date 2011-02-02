From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Feb 2011 09:22:23 -0300
Subject: [Buildroot] [PATCH 4/5] libidn: bump to version 1.19
In-Reply-To: <1296649344-12456-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296649344-12456-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1296649344-12456-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libidn/libidn.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 1627c96..cc8c08f 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,13 +4,11 @@
 #
 #############################################################
 
-LIBIDN_VERSION = 1.15
+LIBIDN_VERSION = 1.19
 LIBIDN_SITE = http://ftp.gnu.org/gnu/libidn/
 LIBIDN_INSTALL_STAGING = YES
-LIBIDN_INSTALL_TARGET = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPT = --enable-shared --disable-java --enable-csharp=no
-LIBIDN_LIBTOOL_PATCH = NO
 LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 define LIBIDN_REMOVE_BINARY
-- 
1.7.3.4
