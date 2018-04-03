From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Tue,  3 Apr 2018 20:30:07 +0200
Subject: [Buildroot] [PATCH] openal: Bump to version 1.18.2
Message-ID: <1522780207-2069-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index aead6e1..cb41dc4 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2d51a6529526ef22484f51567e31a5c346a599767991a3dc9d4dcd9d9cec71dd  openal-soft-1.18.1.tar.bz2
+sha256 9f8ac1e27fba15a59758a13f0c7f6540a0605b6c3a691def9d420570506d7e82  openal-soft-1.18.2.tar.bz2
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 439f5f1..c687c08 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.18.1
+OPENAL_VERSION = 1.18.2
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_LICENSE = LGPL-2.0+
-- 
2.7.4
