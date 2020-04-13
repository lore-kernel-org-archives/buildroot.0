From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 21:55:59 +0200
Subject: [Buildroot] [git commit] package/libkrb5: bump to 1.18.1
Message-ID: <20200413194154.053AC8EA8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6a4ab3d4018577230fe74be9612627cbea3a003
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the NOTICE file has changed due to update in copyright year

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.hash | 4 ++--
 package/libkrb5/libkrb5.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index aa7c3a3778..658c4539f6 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	5a6e2284a53de5702d3dc2be3b9339c963f9b5397d3fbbc53beb249380a781f5	krb5-1.17.tar.gz
+sha256	02a4e700f10936f937cd1a4c303cab8687a11abecc6107bd4b706b9329cd5400	krb5-1.18.1.tar.gz
 
 # Hash for license file:
-sha256	5149ea464bde245388d313309539e142156d371788ae57bbd4feb223757f6da1	NOTICE
+sha256	b7a5f14a8719bce5e49a761998aa55438fc890fb40f71228d6a49546f6d5690d	NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 44a20b3707..f7cd677def 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION_MAJOR = 1.17
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR)
+LIBKRB5_VERSION_MAJOR = 1.18
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
