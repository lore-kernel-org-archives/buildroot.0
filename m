From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 22:02:26 +0100
Subject: [Buildroot] [git commit] whois: bump to version 5.2.5
Message-ID: <20150303212044.2F18680DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9f39b2b389754bb53294311b938310283fda638
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.hash |    4 ++--
 package/whois/whois.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index b52a8b9..fc8366f 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.4.dsc
-sha256	f1827e3b61e6f647b6093e6dcf52d3b44775fdbd6bf0cf7413aff26825f0bc43	whois_5.2.4.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.5.dsc
+sha256	1a84fb9c1190dc37df396ea1f24aae56a1beb846257ee692c9d4b44337135d10	whois_5.2.5.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index e4f8184..fee0425 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.4
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20150125T100758Z/pool/main/w/whois
+WHOIS_VERSION = 5.2.5
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20150303T100910Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
