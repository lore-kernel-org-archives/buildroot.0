From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Aug 2016 16:58:59 +0300
Subject: [Buildroot] [PATCH next 1/2] libnetfilter_acct: remove autoreconf
Message-ID: <36a051f83d3380121beda455824b9f7564d075de.1472047140.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit b8d446cd56dc (libnetfilter_acct: bump to version 1.0.3,
2016-08-23) we no longer patch configure.ac.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnetfilter_acct/libnetfilter_acct.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libnetfilter_acct/libnetfilter_acct.mk b/package/libnetfilter_acct/libnetfilter_acct.mk
index 3870ef84edb4..c2fa23477852 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.mk
+++ b/package/libnetfilter_acct/libnetfilter_acct.mk
@@ -9,7 +9,6 @@ LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz
 LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
 LIBNETFILTER_ACCT_INSTALL_STAGING = YES
 LIBNETFILTER_ACCT_DEPENDENCIES = host-pkgconf libmnl
-LIBNETFILTER_ACCT_AUTORECONF = YES
 LIBNETFILTER_ACCT_LICENSE = LGPLv2.1+
 LIBNETFILTER_ACCT_LICENSE_FILES = COPYING
 
-- 
2.9.3
