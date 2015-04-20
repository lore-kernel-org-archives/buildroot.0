From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 20 Apr 2015 10:22:19 +0200
Subject: [Buildroot] [PATCH 1/1] pppd: fix url
Message-ID: <1429518139-2337-1-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explanation from https://download.samba.org/pub/samba/README.FTP

Due to bandwidth usage, ftp downloads of Samba from samba.org are no
longer allowed. Please use one of our many mirror sites at
http://www.samba.org/ or to directly access the old site via http
please use http://download.samba.org/samba/ftp/

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/pppd/pppd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 31d6e06..b268fbe 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -6,7 +6,7 @@
 
 PPPD_VERSION = 2.4.7
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
-PPPD_SITE = ftp://ftp.samba.org/pub/ppp
+PPPD_SITE = https://download.samba.org/pub/ppp
 PPPD_LICENSE = LGPLv2+ LGPL BSD-4c BSD-3c GPLv2+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
-- 
2.0.5
