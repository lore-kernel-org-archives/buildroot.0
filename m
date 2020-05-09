From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:56:14 +0200
Subject: [Buildroot] [git commit branch/next] package/umtprd: bump to
 version 1.3.6
Message-ID: <20200509204132.E6BFB912AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5cfe66a963c81311fdada123e54323406365bcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/umtprd/umtprd.hash | 2 +-
 package/umtprd/umtprd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
index 168b19e951..b6520c04e7 100644
--- a/package/umtprd/umtprd.hash
+++ b/package/umtprd/umtprd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	e1301bdd89170cc2c679446c1cc5873feaacd061bf0ab547fc0a11670bae9163	umtprd-1.0.0.tar.gz
+sha256	5f6f9f2882597cd3767b12b0814fdfa27c0cb18ce32e3082176f9658be167a27	umtprd-1.3.6.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE
diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
index 63faae43b3..944d1a621b 100644
--- a/package/umtprd/umtprd.mk
+++ b/package/umtprd/umtprd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UMTPRD_VERSION = 1.0.0
+UMTPRD_VERSION = 1.3.6
 UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
 UMTPRD_LICENSE = GPL-3.0+
 UMTPRD_LICENSE_FILES = LICENSE
