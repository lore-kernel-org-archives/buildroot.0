From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Aug 2016 16:59:00 +0300
Subject: [Buildroot] [PATCH next 2/2] nfacct: remove autoreconf
In-Reply-To: <36a051f83d3380121beda455824b9f7564d075de.1472047140.git.baruch@tkos.co.il>
References: <36a051f83d3380121beda455824b9f7564d075de.1472047140.git.baruch@tkos.co.il>
Message-ID: <158a7c3fafa2f33b4bfc4971c48dd73d08d76a84.1472047140.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit ae0e8950540f (nfacct: bump to version 1.0.2, 2016-08-23) we no
longer patch configure.ac.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nfacct/nfacct.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
index d19d02fbfe79..a4e20452bfdc 100644
--- a/package/nfacct/nfacct.mk
+++ b/package/nfacct/nfacct.mk
@@ -9,7 +9,6 @@ NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
 NFACCT_SITE = http://www.netfilter.org/projects/nfacct/files
 NFACCT_DEPENDENCIES = host-pkgconf \
 	libnetfilter_acct
-NFACCT_AUTORECONF = YES
 NFACCT_LICENSE = GPLv2
 NFACCT_LICENSE_FILES = COPYING
 
-- 
2.9.3
