From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 21 Jan 2021 14:36:40 +0100
Subject: [Buildroot] [PATCH 08/15] package/samba4: add SAMBA4_CPE_ID_VENDOR
 and SAMBA4_CPE_ID_NAME
In-Reply-To: <20210121133639.7332-1-heiko.thiery@gmail.com>
References: <20210121133639.7332-1-heiko.thiery@gmail.com>
Message-ID: <20210121133639.7332-8-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:samba:samba is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asamba%3Asamba

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/samba4/samba4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index bdf6a30093..4b4611d3e1 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -10,6 +10,8 @@ SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
+SAMBA4_CPE_ID_VENDOR = samba
+SAMBA4_CPE_ID_NAME = samba
 SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-heimdal host-nfs-utils host-python3 \
 	cmocka e2fsprogs gnutls popt zlib \
-- 
2.30.0
