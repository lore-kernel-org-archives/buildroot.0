From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 19:47:36 +0200
Subject: [Buildroot] [git commit] pppd: fix url
Message-ID: <20150420174941.EA21381D41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a9041ab763e1e0a9f0fc727be22e13f38e40413
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explanation from https://download.samba.org/pub/samba/README.FTP

Due to bandwidth usage, ftp downloads of Samba from samba.org are no
longer allowed. Please use one of our many mirror sites at
http://www.samba.org/ or to directly access the old site via http
please use http://download.samba.org/samba/ftp/

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pppd/pppd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
