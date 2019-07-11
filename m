From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Thu, 11 Jul 2019 22:43:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/stunnel: security bump to version
 5.55
Message-ID: <1562877806-10215-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://www.stunnel.org/ChangeLog.md.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 999a450..7dde175 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.53.tar.gz.sha256
-sha256	80439896ee14269eb70bc8bc669433c7d619018a62c9f9c5c760a24515302585	stunnel-5.53.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.55.tar.gz.sha256
+sha256	90de69f41c58342549e74c82503555a6426961b29af3ed92f878192727074c62	stunnel-5.55.tar.gz
 # Locally calculated
 sha256	81d0b7244f44ef81dd0b299cf681037c5a42d468b8533e53aff6d1ac84c97dc8	COPYING
 sha256	1ee2b290e92c211b08df10e9fcaf32596cdb22b8eae731b18c2c074a4a83eebe	COPYRIGHT.GPL
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index adfa074..261e331 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).53
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).55
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.7.4
