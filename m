From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 17:16:51 +0100
Subject: [Buildroot] [git commit] whois: bump to version 5.2.4
Message-ID: <20150127162248.32A2C7FE19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f1fc3f238dac4878361154a214a83f6adccf103
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.hash |    4 ++--
 package/whois/whois.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index ec5dbcd..b52a8b9 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.3.dsc
-sha256	b1c9a4005bd41036a9e82dd4830005f33ffa5255ab764f4dbe3300715c15e803	whois_5.2.3.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.4.dsc
+sha256	f1827e3b61e6f647b6093e6dcf52d3b44775fdbd6bf0cf7413aff26825f0bc43	whois_5.2.4.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 8b8a796..e4f8184 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.3
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20141227T042107Z/pool/main/w/whois
+WHOIS_VERSION = 5.2.4
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20150125T100758Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
