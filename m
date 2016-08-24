From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 18:52:33 +0200
Subject: [Buildroot] [git commit branch/next] nfacct: remove autoreconf
Message-ID: <20160824165238.B5ECF822DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f02e6b1e81e826a88968780243925ec895926ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit ae0e8950540f (nfacct: bump to version 1.0.2, 2016-08-23) we no
longer patch configure.ac.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfacct/nfacct.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
index d19d02f..a4e2045 100644
--- a/package/nfacct/nfacct.mk
+++ b/package/nfacct/nfacct.mk
@@ -9,7 +9,6 @@ NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
 NFACCT_SITE = http://www.netfilter.org/projects/nfacct/files
 NFACCT_DEPENDENCIES = host-pkgconf \
 	libnetfilter_acct
-NFACCT_AUTORECONF = YES
 NFACCT_LICENSE = GPLv2
 NFACCT_LICENSE_FILES = COPYING
 
