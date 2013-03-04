From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 20:57:01 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.1.9
Message-ID: <20130304200436.56CC79AEAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcfb3946743bfa2db871031ccaed884eb36c5395
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index ff9cffa..21ace1c 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 3.1.8
+GNUTLS_VERSION = 3.1.9
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.1
 GNUTLS_LICENSE = GPLv3+ LGPLv3
