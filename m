From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jun 2015 09:38:53 +0200
Subject: [Buildroot] [git commit] whois: bump to version 5.2.9
Message-ID: <20150610073916.70F1681D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc816d4cefd6f7ef1bb6bccbc3d5342f46bed2c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/whois/whois.hash |    4 ++--
 package/whois/whois.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index fc8366f..79c9aca 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.5.dsc
-sha256	1a84fb9c1190dc37df396ea1f24aae56a1beb846257ee692c9d4b44337135d10	whois_5.2.5.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.9.dsc
+sha256	eee5446bf76ca7d38052767d6e2c542297d3a54ce928cada0ff24d2f1749d359	whois_5.2.9.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index fee0425..274349f 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.5
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20150303T100910Z/pool/main/w/whois
+WHOIS_VERSION = 5.2.9
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20150608T042724Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
