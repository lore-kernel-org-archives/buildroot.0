From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Aug 2015 10:37:32 -0300
Subject: [Buildroot] [PATCH next 3/5] whois: bump to version 5.2.10
In-Reply-To: <1438954654-11777-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438954654-11777-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438954654-11777-3-git-send-email-gustavo@zacarias.com.ar>
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
index 79c9aca..f04980d 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.9.dsc
-sha256	eee5446bf76ca7d38052767d6e2c542297d3a54ce928cada0ff24d2f1749d359	whois_5.2.9.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.10.dsc
+sha256	8acb42bc693f73f3141b413f7df11b5582b9b738d9bf0d60e9017a8af4cb53b9	whois_5.2.10.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 274349f..738d464 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.9
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20150608T042724Z/pool/main/w/whois
+WHOIS_VERSION = 5.2.10
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20150730T034655Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-- 
2.4.6
