From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Dec 2015 15:40:13 -0300
Subject: [Buildroot] [PATCH] whois: bump to version 5.2.11
Message-ID: <1449859213-20253-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index f04980d..a92e0d8 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.10.dsc
-sha256	8acb42bc693f73f3141b413f7df11b5582b9b738d9bf0d60e9017a8af4cb53b9	whois_5.2.10.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.11.dsc
+sha256	32f7d6be853aa6a6a8ac6dd672bd60ae4f10bc0bedcaa944363ffbef6e57cef7	whois_5.2.11.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 738d464..d32642c 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.10
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20150730T034655Z/pool/main/w/whois
+WHOIS_VERSION = 5.2.11
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20151208T102349Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-- 
2.4.10
