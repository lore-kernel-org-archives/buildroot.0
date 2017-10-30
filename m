From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Oct 2017 22:49:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: bump version to 1.0.47
Message-ID: <20171030214946.19950-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pure-ftpd/pure-ftpd.hash | 3 ++-
 package/pure-ftpd/pure-ftpd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index b66717a028..f01da51a37 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 9e733f366d8d600004bb171cf2ec75dad0da4b922b7102ee4b3e18824966192d  pure-ftpd-1.0.46.tar.bz2
+sha256 cb1b695e779a06e42d62d7a1a428d2f605d621dfd5afe4e192b5f9fc4e343692  pure-ftpd-1.0.47.tar.bz2
+sha256 e724ba991d8efa4c963e84ec31314c532dab00ac455ef77020fe60e78177bf23  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 0bb5f3cd43..815de90f3b 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.46
-PURE_FTPD_SITE = http://download.pureftpd.org/pub/pure-ftpd/releases
+PURE_FTPD_VERSION = 1.0.47
+PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
 PURE_FTPD_LICENSE_FILES = COPYING
-- 
2.11.0
