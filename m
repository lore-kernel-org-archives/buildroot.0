From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:10 -0300
Subject: [Buildroot] [PATCH 31/45] libidn: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-32-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libidn/libidn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 9ac2600..ab43949 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -10,7 +10,7 @@ LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-LIBIDN_LICENSE = GPLv2+ GPLv3+ LGPLv3+
+LIBIDN_LICENSE = GPLv2+, GPLv3+, LGPLv3+
 LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
 
 define LIBIDN_REMOVE_BINARY
-- 
2.4.10
