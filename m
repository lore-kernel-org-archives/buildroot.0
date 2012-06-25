From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jun 2012 10:06:50 +0200
Subject: [Buildroot] [git commit] tcpdump: bump to version 4.3.0
Message-ID: <20120625081956.C7D778B627@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac2a58c5c3627d39e2e7f77119dea2da6fa0b355
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcpdump/tcpdump.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

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
