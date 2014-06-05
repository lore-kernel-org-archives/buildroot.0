From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Jun 2014 21:26:30 +0200
Subject: [Buildroot] [git commit] openssl: security bump to version 1.0.1h
Message-ID: <20140605201506.BDC6999C9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e00a5e3a941a462900a7356a64e8a4413f1e364
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-0224, CVE-2014-0221, CVE-2014-0195, CVE-2014-0198 among others.
See https://www.openssl.org/news/secadv_20140605.txt for details.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 87bc2ef..743ca52 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.1g
+OPENSSL_VERSION = 1.0.1h
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
