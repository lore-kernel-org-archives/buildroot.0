From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:38 -0500
Subject: [Buildroot] [PATCH 17/25] package/pkgconf: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-17-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pkgconf:pkgconf:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:pkgconf:pkgconf

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/pkgconf/pkgconf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 3d51258d65..5d65f69c10 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -9,6 +9,7 @@ PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
+PKGCONF_CPE_ID_VENDOR = pkgconf
 
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
 
-- 
2.17.1
