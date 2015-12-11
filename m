From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Dec 2015 15:36:30 -0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.28
Message-ID: <1449858990-18503-1-git-send-email-gustavo@zacarias.com.ar>
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
index eab2035..ee9d94b 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From https://www.stunnel.org/pipermail/stunnel-announce/2015-December/000113.html
-sha256	7474e986710e88a5cc3330b6b1762f9449f01eccf826fa0f97e56d064c05ead3	stunnel-5.27.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-announce/2015-December/000115.html
+sha256	9a25b87b1ef0c08fa3d796edce07b4408e6a8acece23de2eb7ee9285b78852b5	stunnel-5.28.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 20a0c95..ae187a6 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).27
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).28
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.4.10
