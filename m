From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Dec 2016 10:27:24 -0300
Subject: [Buildroot] [PATCH] whois: bump to version 5.2.14
Message-ID: <20161230132724.8899-1-gustavo@zacarias.com.ar>
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
index 15a12f7..6f65074 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.12.dsc
-sha256	b26d4027b8987d9911466aa06ce2c167a50017cd59a622a429bd506222f6cdf1	whois_5.2.12.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.14.dsc
+sha256	a41daf41abed0fbfa8c9c4b0e4a3f5f22d9876dd6feb9091aac12f8f4c38b0d2	whois_5.2.14.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 423b214..29a18e3 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.12
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20160329T095754Z/pool/main/w/whois
+WHOIS_VERSION = 5.2.14
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20161230T032015Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-- 
2.10.2
