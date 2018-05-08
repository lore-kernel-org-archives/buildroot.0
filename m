From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:28:22 +0200
Subject: [Buildroot] [git commit] libkrb5: bump to version 1.16.1
Message-ID: <20180508132848.DFE098BE97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69de630d097116b95884275b0eccefc46493ac3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash for license file (update to year)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.hash | 4 ++--
 package/libkrb5/libkrb5.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index e9fb0a2ace..2980947faa 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	faeb125f83b0fb4cdb2f99f088140631bb47d975982de0956d18c85842969e08	krb5-1.16.tar.gz
+sha256	214ffe394e3ad0c730564074ec44f1da119159d94281bbec541dc29168d21117	krb5-1.16.1.tar.gz
 
 # Hash for license file:
-sha256	0b10e357b1adb953b2865dddfab73f95591b3f7c90aa39a8a087c558b1427e51	NOTICE
+sha256	58534f00ed877fd32936fcab094f49d399aeef7716393204d8028c4b89050c82	NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 0b4ba6be65..c40be63278 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION = 1.16
-LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION)
+LIBKRB5_VERSION_MAJOR = 1.16
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
+LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
 LIBKRB5_LICENSE = MIT
