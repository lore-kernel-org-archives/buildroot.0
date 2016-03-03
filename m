From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Mar 2016 10:57:26 -0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.31
Message-ID: <1457013446-28001-1-git-send-email-gustavo@zacarias.com.ar>
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
index 1801e61..3f0d6e5 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-announce/2016-January/000117.html
-sha256	43909625403ea634fa7cb8399d58faf8e7f11c1b7b29097491469951f56df551	stunnel-5.29.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-announce/2016-March/000120.html
+sha256	a746b71ab3dc6c23eacb0daf7342467870e43ac933430905eb1b1d050bbae0b7	stunnel-5.31.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 8ea71b8..a222a1c 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).29
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).31
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.4.10
