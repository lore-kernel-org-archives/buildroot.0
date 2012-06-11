From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Jun 2012 17:40:46 -0300
Subject: [Buildroot] [PATCH 1/2] polarssl: bump to version 1.1.4
Message-ID: <1339447247-7801-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Correctly handle empty SSL/TLS packets (Found by James Yonan)
* Fixed potential heap corruption in x509_name allocation
* Fixed single RSA test that failed on Big Endian systems

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
