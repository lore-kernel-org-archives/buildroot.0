From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Jun 2016 20:43:12 -0300
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.4.13
Message-ID: <1465256592-14317-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 41e0ccb..85254d1 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e3370a3bf60f2ca4a6204461ea99e7d7047ee46f96bc2fb7c63f103312d3c9c7	gnutls-3.4.12.tar.xz
+sha256	fd3386e8e72725980bcd7f40949aa0121dcb7650b5147c6490e794555ed25859	gnutls-3.4.13.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index d19f443..76d2ca2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
-- 
2.7.3
