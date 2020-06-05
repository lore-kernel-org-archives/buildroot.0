From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  5 Jun 2020 10:53:05 +0300
Subject: [Buildroot] [PATCH] package/msmtp: bump to version 1.8.11
Message-ID: <dcad64108897fa6b795575407184b0608af7de3e.1591343585.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Format hash file with two spaces delimiters.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/msmtp/msmtp.hash | 7 ++++---
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index b2aa47cd8fa5..8fc674bfa57a 100644
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
index 8c260471e6d6..43a9ed1e934a 100644
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
-- 
2.26.2
