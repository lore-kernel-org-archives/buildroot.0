From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon, 30 Sep 2019 13:39:31 +0200
Subject: [Buildroot] [PATCH] package/libkrb5: Bumb to 1.17
Message-ID: <20190930113931.9654-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/libkrb5/libkrb5.hash | 4 ++--
 package/libkrb5/libkrb5.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 733c6c9d6f..aa7c3a3778 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	9f721e1fe593c219174740c71de514c7228a97d23eb7be7597b2ae14e487f027	krb5-1.16.2.tar.gz
+sha256	5a6e2284a53de5702d3dc2be3b9339c963f9b5397d3fbbc53beb249380a781f5	krb5-1.17.tar.gz
 
 # Hash for license file:
-sha256	58534f00ed877fd32936fcab094f49d399aeef7716393204d8028c4b89050c82	NOTICE
+sha256	5149ea464bde245388d313309539e142156d371788ae57bbd4feb223757f6da1	NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 56345416aa..7c199129a3 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION_MAJOR = 1.16
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).2
+LIBKRB5_VERSION_MAJOR = 1.17
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
-- 
2.17.1
