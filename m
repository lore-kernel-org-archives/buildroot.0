From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 18:52:32 +0200
Subject: [Buildroot] [git commit branch/next] libnetfilter_acct: remove
	autoreconf
Message-ID: <20160824165238.A8EA682297@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15c0de8b3544f67bc61e5f9ce149b70bbf297c69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit b8d446cd56dc (libnetfilter_acct: bump to version 1.0.3,
2016-08-23) we no longer patch configure.ac.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnetfilter_acct/libnetfilter_acct.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libnetfilter_acct/libnetfilter_acct.mk b/package/libnetfilter_acct/libnetfilter_acct.mk
index 3870ef8..c2fa234 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.mk
+++ b/package/libnetfilter_acct/libnetfilter_acct.mk
@@ -9,7 +9,6 @@ LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz
 LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
 LIBNETFILTER_ACCT_INSTALL_STAGING = YES
 LIBNETFILTER_ACCT_DEPENDENCIES = host-pkgconf libmnl
-LIBNETFILTER_ACCT_AUTORECONF = YES
 LIBNETFILTER_ACCT_LICENSE = LGPLv2.1+
 LIBNETFILTER_ACCT_LICENSE_FILES = COPYING
 
