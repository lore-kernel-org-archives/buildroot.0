From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Jun 2012 22:22:11 +0200
Subject: [Buildroot] [git commit] polarssl: bump to version 1.1.4
Message-ID: <20120612203626.A981D96EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b7a7a028c47b546390b5f591e560a1f0f586e1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Correctly handle empty SSL/TLS packets (Found by James Yonan)
* Fixed potential heap corruption in x509_name allocation
* Fixed single RSA test that failed on Big Endian systems

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/polarssl/polarssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index d07cdc6..e12f08d 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -1,5 +1,5 @@
 POLARSSL_SITE = http://polarssl.org/code/releases/
-POLARSSL_VERSION = 1.1.3
+POLARSSL_VERSION = 1.1.4
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
 	-DUSE_SHARED_POLARSSL_LIBRARY=ON \
