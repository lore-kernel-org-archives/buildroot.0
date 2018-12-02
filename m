From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:26 -0000
Subject: [Buildroot] [git commit] libkrb5: bump to version 1.16.2
Message-ID: <20181202071554.773EA80FDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4392779eac138bf2ed8fcd37b7f88d639c1329d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.hash | 2 +-
 package/libkrb5/libkrb5.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 2980947faa..733c6c9d6f 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	214ffe394e3ad0c730564074ec44f1da119159d94281bbec541dc29168d21117	krb5-1.16.1.tar.gz
+sha256	9f721e1fe593c219174740c71de514c7228a97d23eb7be7597b2ae14e487f027	krb5-1.16.2.tar.gz
 
 # Hash for license file:
 sha256	58534f00ed877fd32936fcab094f49d399aeef7716393204d8028c4b89050c82	NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index d9d7160ae8..5ba0ab1806 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBKRB5_VERSION_MAJOR = 1.16
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).2
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
