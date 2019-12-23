From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:31:42 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/cups: security
 bump to version 2.3.1
Message-ID: <20191223085211.BCEEB8DF59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f087ae8e2981a1f0cfeaaae1b7eb3b8f4983e7d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fix CVE-2019-2228: The ippSetValuetag function did not validate the
default language value.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 27627120f1e0f5e2023014628530ba175183feb7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 5cc758f519..8f037c6420 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256 acaf0229cf008ea8f06353ffd1bbd62d71dbe88990dd3330650ef87edb95a1a5  cups-2.3.0-source.tar.gz
+sha256 1bca9d89507e3f68cbc84482fe46ae8d5333af5bc2b9061347b2007182ac77ce  cups-2.3.1-source.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256 a5d616e6322a9cb1a971e18765025edfca4f3cd9c0eafc32d6d2eb4b8c8787b5  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index bc2913b428..8ac28b0f14 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.3.0
+CUPS_VERSION = 2.3.1
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
