From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 21:45:09 +0100
Subject: [Buildroot] [git commit] openssl: security bump to version 1.0.0g
Message-ID: <20120122215542.E119590358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d8abaf9f13d9ec9358ca6be2fc9986d2d13d251
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 0354f58..cb29fe4 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0f
+OPENSSL_VERSION = 1.0.0g
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
