From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:53:42 +0100
Subject: [Buildroot] [git commit] package/pure-ftpd: bump version to 1.0.47
Message-ID: <20171101094623.6AC027FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a202e24ed2e6cb585008bbbff72cfc9d13649b72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pure-ftpd/pure-ftpd.hash | 3 ++-
 package/pure-ftpd/pure-ftpd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index b66717a..f01da51 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 9e733f366d8d600004bb171cf2ec75dad0da4b922b7102ee4b3e18824966192d  pure-ftpd-1.0.46.tar.bz2
+sha256 cb1b695e779a06e42d62d7a1a428d2f605d621dfd5afe4e192b5f9fc4e343692  pure-ftpd-1.0.47.tar.bz2
+sha256 e724ba991d8efa4c963e84ec31314c532dab00ac455ef77020fe60e78177bf23  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 0bb5f3c..815de90 100644
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
