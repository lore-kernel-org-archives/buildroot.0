From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 2 Feb 2011 22:44:21 +0100
Subject: [Buildroot] [git commit master 1/1] libidn: bump to version 1.19
Message-ID: <20110202214453.DDAE38F34A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cbe7186c8526a79f6a35d17a3f9b1580eaa6fe9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
