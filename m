From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:13 -0000
Subject: [Buildroot] [git commit branch/next] package/libgsasl: fix typo in
	variable name
Message-ID: <20150808105601.333517FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdbe1b0a0ff679c1f605197caefb144168d90447
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgsasl/libgsasl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index ea634bc..f2660ca 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -9,6 +9,6 @@ LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPLv2.1+ (library), GPLv3+ (programs)
 LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
 LIBGSASL_INSTALL_STAGING = YES
-LIBGSAS_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
+LIBGSASL_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBIDN),libidn)
 
 $(eval $(autotools-package))
