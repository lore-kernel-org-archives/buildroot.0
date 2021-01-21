From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 21 Jan 2021 14:36:38 +0100
Subject: [Buildroot] [PATCH 07/15] package/cifs-utils: add
 CIFS_UTILS_CPE_ID_VENDOR
In-Reply-To: <20210121133639.7332-1-heiko.thiery@gmail.com>
References: <20210121133639.7332-1-heiko.thiery@gmail.com>
Message-ID: <20210121133639.7332-7-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:samba:cifs-utils is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asamba%3Acifs-utils

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/cifs-utils/cifs-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index b06ce7dddf..63b454413c 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -9,6 +9,7 @@ CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
 CIFS_UTILS_LICENSE_FILES = COPYING
+CIFS_UTILS_CPE_ID_VENDOR = samba
 # Missing install-sh in release tarball and patching Makefile.am
 CIFS_UTILS_AUTORECONF = YES
 CIFS_UTILS_DEPENDENCIES = host-pkgconf
-- 
2.30.0
