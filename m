From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Jul 2015 19:53:22 -0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.21
Message-ID: <1438037602-19484-1-git-send-email-gustavo@zacarias.com.ar>
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
index 91b297c..5e75b2e 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-users/2015-June/005094.html
-sha256	0532c0a2f8de3da1ab625e384146501ce5936fac63d01561c3a9bf652b692317	stunnel-5.18.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-users/2015-July/005180.html
+sha256	2aef568b1955f5e233f6a8e17ebce3d30755f1be44c813f5a48e621f785596e3	stunnel-5.21.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 4674694..5e9cd72 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).18
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).21
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.3.6
