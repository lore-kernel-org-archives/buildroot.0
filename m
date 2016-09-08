From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Sep 2016 19:47:05 +0200
Subject: [Buildroot] [git commit] gnutls: bump to version 3.4.15
Message-ID: <20160908174926.E355C817F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc56a9ea3f4c4f468e4a7a25253afc01a885d820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index e2c5fa1..89b0f4c 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	35deddf2779b76ac11057de38bf380b8066c05de21b94263ad5b6dfa75dfbb23	gnutls-3.4.14.tar.xz
+sha256	eb2a013905f5f2a0cbf7bcc1d20c85a50065063ee87bd33b496c4e19815e3498	gnutls-3.4.15.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 429c1b2..4e9a83d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).15
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 # README says that the core library is under LGPLv2.1+, but a few
