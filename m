From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Apr 2015 07:00:16 -0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.17
Message-ID: <1430388016-8389-1-git-send-email-gustavo@zacarias.com.ar>
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
index 8545341..e45e691 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From https://www.stunnel.org/pipermail/stunnel-announce/2015-April/000098.html
-sha256	b6b7e93fb2626eaabae1c8474e1dfa23962cfde8fa35c8602289fcaa4f53608d	stunnel-5.16.tar.gz
+# From https://www.stunnel.org/pipermail/stunnel-announce/2015-April/000100.html
+sha256	c3e79e582621a0827125e35e1c00450190104fc02dc3c5274cb02b05859fd472	stunnel-5.17.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 7a6bb46..2d35e75 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.16
+STUNNEL_VERSION = 5.17
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/5.x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.0.5
