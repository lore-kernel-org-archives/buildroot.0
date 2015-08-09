From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:42:50 +0200
Subject: [Buildroot] [git commit branch/next] whois: bump to version 5.2.10
Message-ID: <20150809094323.913FB8042C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=208fc3075247e2f2226af706278d1e13f3746942
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/whois/whois.hash |    4 ++--
 package/whois/whois.mk   |    4 ++--
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
