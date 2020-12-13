From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 11:20:58 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/mbedtls: security
 bump to version 2.16.9
Message-ID: <20201213101008.15BAB81640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cf6ab205cd8452e646d70611e73501d03bff45e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 455387fa3a8c075c10cd87f44e88fcbdee9fff50)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 0082eee4a2..39df050609 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8:
-sha256  fe9e3b15c3375943bdfebbbb20dd6b4f1147b3b5d926248bd835d73247407430  mbedtls-2.16.8.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.9:
+sha256  fc17ff7d8c11d08f23ae2800a18269408ad2c24ea6bb8b9363e41a01c2425697  mbedtls-2.16.9.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 5094434e6c..77373d8b34 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.16.8
+MBEDTLS_VERSION = 2.16.9
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
