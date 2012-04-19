From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 20:44:50 +0200
Subject: [Buildroot] [git commit] openssl: security bump to version 1.0.0i
Message-ID: <20120419194555.B99C796B1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=776f0b441d775490dad90350ff0005504968e130
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix for CVE-2012-2110

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index a304747..185522c 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0h
+OPENSSL_VERSION = 1.0.0i
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
