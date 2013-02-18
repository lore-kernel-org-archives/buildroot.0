From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Feb 2013 13:48:23 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.1.8
Message-ID: <20130218124813.B618C9AB66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6f0a3bd5ff4bcbb5cc24a0c79f7669055a16a75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a regression in 3.1.7 regarding the priority string NORMAL.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index cadc147..ff9cffa 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 3.1.7
+GNUTLS_VERSION = 3.1.8
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.1
 GNUTLS_LICENSE = GPLv3+ LGPLv3
