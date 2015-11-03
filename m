From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Nov 2015 07:52:29 -0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.25
Message-ID: <1446547949-23637-1-git-send-email-gustavo@zacarias.com.ar>
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
index 7edf51a..bae02ac 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-users/2015-October/005238.html
-sha256	ab2e5a1034d422951ddad21b572eb7fa8efb4c4ce04bc86536c6845f3d02b07e	stunnel-5.24.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-users/2015-November/005281.html
+sha256	1fb2209f1e006cc01813e1688599c4d0fb0adde4434c31ab95745b1db97484b7	stunnel-5.25.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 32ed0db..f43a7cb 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).24
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).25
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.4.10
