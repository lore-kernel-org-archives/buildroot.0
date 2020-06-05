From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:40:29 +0200
Subject: [Buildroot] [git commit] package/msmtp: bump to version 1.8.11
Message-ID: <20200605204004.9134B82983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31afaaf870fd8c1781281522abb29427daf1fdf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Format hash file with two spaces delimiters.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/msmtp/msmtp.hash | 7 ++++---
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index b2aa47cd8f..8fc674bfa5 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,6 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.7.tar.xz.sig
-sha256	9a53bcdc244ec5b1a806934ecc7746d9d09db581f587bedf597e9da2f48c51f1	msmtp-1.8.7.tar.xz
+# https://marlam.de/msmtp/releases/msmtp-1.8.11.tar.xz.sig
+# with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
+sha256  f25f0fa177ce9e0ad65c127e790a37f35fb64fee9e33d90345844c5c86780e60  msmtp-1.8.11.tar.xz
 
 # Hash for license file:
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 8c260471e6..43a9ed1e93 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.7
+MSMTP_VERSION = 1.8.11
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
