From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 18:11:24 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.4.17
Message-ID: <20161209171846.31E0980102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=455487dbd1e6d616c1d82bafd4c6be6191d0c7b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index f9725df..897562b 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d99abb1b320771b58c949bab85e4b654dd1e3e9d92e2572204b7dc479d923927	gnutls-3.4.16.tar.xz
+sha256	9b50e8a670d5e950425d96935c7ddd415eb6f8079615a36df425f09a3143172e	gnutls-3.4.17.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index d359a61..af7621c 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).16
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).17
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 # README says that the core library is under LGPLv2.1+, but a few
