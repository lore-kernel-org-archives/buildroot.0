From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Feb 2021 13:47:18 +0100
Subject: [Buildroot] [git commit] package/cryptodev-linux: set
 CRYPTODEV_LINUX_CPE_ID_VENDOR
Message-ID: <20210205122651.C42F07FE04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66acd81108e054828f2e768840defa1237982601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cryptodev-linux:cryptodev-linux is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acryptodev-linux%3Acryptodev-linux

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptodev-linux/cryptodev-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 5b882b284e..2a65755aa2 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -9,6 +9,7 @@ CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
+CRYPTODEV_LINUX_CPE_ID_VENDOR = cryptodev-linux
 
 CRYPTODEV_LINUX_PROVIDES = cryptodev
 
