From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Jul 2009 17:10:06 +0200
Subject: [Buildroot] [git commit] Bump to bind-9.5.1-P3 security fix for
	CVE-2009-0696
Message-ID: <20090730151031.CA82F77804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ff69aeea406c8ad8f35dc3af7a93c431a15e09a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #495.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    1 +
 package/bind/bind.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index c1bfe38..0a3f0a0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -46,6 +46,7 @@
 	#451: Upgrade from unmaintained dosfstools-2.11 to dosfstools-3.0.3
 	#467: DirectFB 1.4.1
 	#473: memstat_0.5.tar.gz has install with -D and that fails "make"
+	#495: Bump bind package to 9.5.1-P3 (security)
 	#497: OpenSSL RSA key generation hangs on x86_64
 
 2009.05, Released June 1st, 2009:
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 1bf1627..c6d77e5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -3,7 +3,7 @@
 # bind
 #
 #############################################################
-BIND_VERSION = 9.5.1-P2
+BIND_VERSION = 9.5.1-P3
 BIND_SOURCE = bind-$(BIND_VERSION).tar.gz
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_LIBTOOL_PATCH = NO
-- 
1.6.3.3
