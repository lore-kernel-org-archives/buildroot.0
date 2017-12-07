From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  7 Dec 2017 22:33:52 +0200
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.44
Message-ID: <cf7fd7b1d0f8fcaf984f9905b19cfb9d2fe5ec4c.1512678832.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license files hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/stunnel/stunnel.hash | 7 +++++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index c4e70a7f9aaf..d3b9451ce9b8 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,5 @@
-# From http://www.stunnel.org/pipermail/stunnel-announce/2016-September/000125.html
-sha256	eb8952fcfdfcdf5056a1f1a78e1ec5014b819c5f5f7599b924dc4490ffe4b5ea	stunnel-5.36.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.44.tar.gz.sha256
+sha256	990a325dbb47d77d88772dd02fbbd27d91b1fea3ece76c9ff4461eca93f12299	stunnel-5.44.tar.gz
+# Locally calculated
+sha256	c43821865591e4d893906e2801b5ec4de58e51978f5563a61475cd0adc0bec4d	COPYING
+sha256	1ee2b290e92c211b08df10e9fcaf32596cdb22b8eae731b18c2c074a4a83eebe	COPYRIGHT.GPL
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 99e5381a7c70..4a5d2a0335ca 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).36
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).44
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.15.0
