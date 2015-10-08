From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Oct 2015 16:00:26 -0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.24
Message-ID: <1444330826-31555-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 1ac8350..7edf51a 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From https://www.stunnel.org/pipermail/stunnel-announce/2015-September/000108.html
-sha256	0fc4a702afd2e857bae8ad1f39c51546eb282c3d0ff4f4d55d62aece7328ddea	stunnel-5.23.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-users/2015-October/005238.html
+sha256	ab2e5a1034d422951ddad21b572eb7fa8efb4c4ce04bc86536c6845f3d02b07e	stunnel-5.24.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index c44518f..32ed0db 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).23
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).24
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.4.9
