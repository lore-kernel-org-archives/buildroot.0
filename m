From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 21:37:09 +0200
Subject: [Buildroot] [git commit] package/poco: add POCO_CPE_ID_VENDOR
Message-ID: <20210520191405.95EC3885B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51c24ded8a0df846f9448de913282699225c74dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pocoproject:poco is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apocoproject%3Apoco

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poco/poco.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index c605044ba3..857f215e3a 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -8,6 +8,7 @@ POCO_VERSION = 1.10.1
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
+POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
 POCO_DEPENDENCIES = zlib pcre \
