From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Dec 2014 09:49:07 -0300
Subject: [Buildroot] [PATCH] whois: bump to version 5.2.3
Message-ID: <1419770947-27017-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With support for new gTLDs and updated TLDs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 858eb94..ec5dbcd 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.2.dsc
-sha256	cba874b457a6b7c4659245780d3d7321d129ab47da86103e07578ec7430fec09	whois_5.2.2.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.3.dsc
+sha256	b1c9a4005bd41036a9e82dd4830005f33ffa5255ab764f4dbe3300715c15e803	whois_5.2.3.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 63268c6..8b8a796 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.2
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20141112T101048Z/pool/main/w/whois
+WHOIS_VERSION = 5.2.3
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20141227T042107Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-- 
2.0.5
