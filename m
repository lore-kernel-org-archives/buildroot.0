From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Jun 2012 07:00:29 +0300
Subject: [Buildroot] [PATCH 2/2] tcpdump: bump to version 4.3.0
In-Reply-To: <b62717db24356f9761c48c7439ab757f0d32f3b7.1340596768.git.baruch@tkos.co.il>
References: <b62717db24356f9761c48c7439ab757f0d32f3b7.1340596768.git.baruch@tkos.co.il>
Message-ID: <eb7d88b440f2ba3e3bdbbeca10fcc2f1f07e8d4c.1340596769.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tcpdump/tcpdump.mk |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index ab9d4f1..0febf60 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -6,9 +6,8 @@
 # Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
 # Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
 
-TCPDUMP_VERSION = 4.2.1
+TCPDUMP_VERSION = 4.3.0
 TCPDUMP_SITE = http://www.tcpdump.org/release
-TCPDUMP_SOURCE = tcpdump-$(TCPDUMP_VERSION).tar.gz
 TCPDUMP_CONF_ENV = ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no
 TCPDUMP_CONF_OPT = --without-crypto \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
-- 
1.7.10
