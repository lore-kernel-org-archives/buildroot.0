From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 20:20:28 +0100
Subject: [Buildroot] [git commit branch/next] package/stunnel: bump to
 version 5.58
Message-ID: <20210225185830.BF00081468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38b58a0d65b3dd28f1585036d83a5257b8479d8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update COPYING hash; copyright year update:

-_Copyright (C) 1998-2020 Michal Trojnara_
+_Copyright (C) 1998-2021 Michal Trojnara_

See full changelog https://www.stunnel.org/NEWS.html

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.hash | 6 +++---
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 67d06a4d7c..a62fa07607 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.57.tar.gz.sha256
-sha256  af5ab973dde11807c38735b87bdd87563a47d2fa1c72a07929fcfce80a600fe1  stunnel-5.57.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.58.tar.gz.sha256
+sha256  d4c14cc096577edca3f6a2a59c2f51869e35350b3988018ddf808c88e5973b79  stunnel-5.58.tar.gz
 # Locally calculated
-sha256  d3055d327fd4daa5895fcf8fc4ebe993d06f40f2841ac995c6a69988d19bac4b  COPYING.md
+sha256  28b55d0157efd5ceb63640faeebb50fda13b1f49aec0b9c1240b9a3ea9f0eb4c  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index e0cc5630e4..f163b2bc1a 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).57
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).58
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
