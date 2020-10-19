From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 19 Oct 2020 20:27:56 +0200
Subject: [Buildroot] [PATCH] package/stunnel: bump to version 5.57
Message-ID: <1603132076-2071-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update COPYING hash; copyright year update:

-_Copyright (C) 1998-2019 Michal Trojnara_
+_Copyright (C) 1998-2020 Michal Trojnara_

Also update hash file formatting (2 spaces)

See changelog https://www.stunnel.org/NEWS.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/stunnel/stunnel.hash | 8 ++++----
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index b741b0e..67d06a4 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.56.tar.gz.sha256
-sha256	7384bfb356b9a89ddfee70b5ca494d187605bb516b4fff597e167f97e2236b22	stunnel-5.56.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.57.tar.gz.sha256
+sha256  af5ab973dde11807c38735b87bdd87563a47d2fa1c72a07929fcfce80a600fe1  stunnel-5.57.tar.gz
 # Locally calculated
-sha256	f46e2613769e23e23348b6eb667dc85309da2252c8cc2016db92ad93d743aea4	COPYING.md
-sha256	62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d	COPYRIGHT.md
+sha256  d3055d327fd4daa5895fcf8fc4ebe993d06f40f2841ac995c6a69988d19bac4b  COPYING.md
+sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index f8265c4..e0cc563 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).56
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).57
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.7.4
