From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 14:17:48 +0200
Subject: [Buildroot] [git commit] whois: bump to version 5.2.1
Message-ID: <20141017121828.DFB26B328C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20cff9643c603c11ee3f0247b26c184b56ca3228
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.hash |    4 ++--
 package/whois/whois.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 368beea..13efa14 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.0.dsc
-sha256	f487bba00fc506b18b519d913509d9e050cba0b6f025e26a50b29b3e6322530b	whois_5.2.0.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.1.dsc
+sha256	54e6b64f16e10bfaf14ac40025b4272090298f0d9d3e62cbadabf946051515e6	whois_5.2.1.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index a9f74d1..193aafe 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.0
+WHOIS_VERSION = 5.2.1
 WHOIS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
