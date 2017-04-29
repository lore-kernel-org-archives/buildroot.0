From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:23:55 +0200
Subject: [Buildroot] [git commit] package/pure-ftpd: bump version to 1.0.46
Message-ID: <20170429092416.7C4CD8260E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9f87e86d97334ebef752a3f56bc38935f245042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pure-ftpd/pure-ftpd.hash | 2 +-
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index 6996290..b66717a 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	efd11295998453e31dbeef9159624beabbac2643a338134ae8c2ef529aa2ec10	pure-ftpd-1.0.42.tar.bz2
+sha256 9e733f366d8d600004bb171cf2ec75dad0da4b922b7102ee4b3e18824966192d  pure-ftpd-1.0.46.tar.bz2
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 95e7065..0bb5f3c 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.42
+PURE_FTPD_VERSION = 1.0.46
 PURE_FTPD_SITE = http://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
