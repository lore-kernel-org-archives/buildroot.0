From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 3 Feb 2010 17:30:38 +0100
Subject: [Buildroot] [git commit master] Bump bind to 9.5.1-P2
Message-ID: <20100203163109.41FC2776BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=49d92ebea75f518e2d3047f27da836ac6fb41e22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1015.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    1 +
 package/bind/bind.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 27915dd..0a37be7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -45,6 +45,7 @@
 	#973: Bump iw to 0.9.19
 	#1003: DHCP options disabled with busybox-1.16.0
 	#1009: [SECURITY] Bump php to 5.2.12
+	#1015: [SECURITY] Bump bind to 9.5.1-P2
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 4661eeb..e1baef7 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BIND_VERSION = 9.5.2-P1
+BIND_VERSION = 9.5.2-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_LIBTOOL_PATCH = NO
 BIND_INSTALL_STAGING = NO
-- 
1.6.3.3
