From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Sep 2015 16:19:34 -0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.23
Message-ID: <1441826374-27827-1-git-send-email-gustavo@zacarias.com.ar>
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
index 9c2bb14..1ac8350 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-users/2015-July/005183.html
-sha256	8ad628a6948153cdb2044283f6988384a30585ea7e14778c2ee616a6678cb83f	stunnel-5.22.tar.gz
+# From https://www.stunnel.org/pipermail/stunnel-announce/2015-September/000108.html
+sha256	0fc4a702afd2e857bae8ad1f39c51546eb282c3d0ff4f4d55d62aece7328ddea	stunnel-5.23.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 64c60b1..c44518f 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).22
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).23
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.4.6
