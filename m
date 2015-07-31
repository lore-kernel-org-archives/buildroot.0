From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 31 Jul 2015 09:12:16 -0300
Subject: [Buildroot] [PATCH 2/2] stunnel: bump to version 5.22
In-Reply-To: <1438344736-11339-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438344736-11339-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438344736-11339-2-git-send-email-gustavo@zacarias.com.ar>
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
index 5e75b2e..9c2bb14 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-users/2015-July/005180.html
-sha256	2aef568b1955f5e233f6a8e17ebce3d30755f1be44c813f5a48e621f785596e3	stunnel-5.21.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-users/2015-July/005183.html
+sha256	8ad628a6948153cdb2044283f6988384a30585ea7e14778c2ee616a6678cb83f	stunnel-5.22.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 5e9cd72..64c60b1 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).21
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).22
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.4.6
